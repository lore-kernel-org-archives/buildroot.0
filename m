From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Jun 2015 21:22:05 +0200
Subject: [Buildroot] [PATCH 01/11 v2] package-infra: add helper to build
	kernel modules
In-Reply-To: <cover.1433964001.git.yann.morin.1998@free.fr>
References: <cover.1433964001.git.yann.morin.1998@free.fr>
Message-ID: <a9355834b4604ad9989556affbddeb9926343abd.1433964001.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Linux kernel offers a nice and easy-to-use infra to build
out-of-tree kernel modules.

Currently, we have quite a few packages that build kernel modules, and
most duplicate (or rewrite) the same code over-and-over again.

Introduce a new infrastructure that provides helpers to build kernel
modules, so packages do not have to duplicate/rewrite that.

The infrastructure, unlike any other package infra, is not standalone.
It needs another package infra to be used. This is so that packages that
provide both userland and kernel modules can be built easily. So, this
infra only defines post-build and post-install hooks, that will build
the kernel modules after the rest of the package.

Also, no host version is provided, since it does not make sense to build
kernel modules for the host.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1 -> v2:
  - drop third and fourth args to inner macro: we're never going to
    build kernel modules for the host  (Baruch, Arnout)
  - add missing LINUX_MAKE_ENV  (Arnout)
  - use $$(@D), not $$($(2)_DIR)  (Arnout)
  - print a single MESSAGE  (Arnout, Thomas)
  - typoes  (Arnout)
---
 package/Makefile.in          |  1 +
 package/pkg-kernel-module.mk | 89 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 90 insertions(+)
 create mode 100644 package/pkg-kernel-module.mk

diff --git a/package/Makefile.in b/package/Makefile.in
index c02d31f..180fd46 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -398,3 +398,4 @@ include package/pkg-virtual.mk
 include package/pkg-generic.mk
 include package/pkg-kconfig.mk
 include package/pkg-rebar.mk
+include package/pkg-kernel-module.mk
diff --git a/package/pkg-kernel-module.mk b/package/pkg-kernel-module.mk
new file mode 100644
index 0000000..608c9e6
--- /dev/null
+++ b/package/pkg-kernel-module.mk
@@ -0,0 +1,89 @@
+################################################################################
+# kernel module infrastructure for building Linux kernel modules
+#
+# This file implements an infrastructure that eases development of package
+# .mk files for out-of-tree Linux kernel modules. It should be used for all
+# packages that build a Linux kernel module using the kernel's out-of-tree
+# buildsystem, unless they use a complex custom build-system.
+#
+# In terms of implementation, this infrastructure relies on another package
+# infrastructure, and only defines post-build and post-install hooks, so that
+# packages can both build user-space (with any of the other *-package infra)
+# and/or build kernel modules.
+#
+# As such, it is to be used in conjunction with another *-package infra,
+# like so:
+#
+#   $(eval $(kernel-module))
+#   $(eval $(generic-package))
+#
+# Note: if the caller needs access to the kernel modules (either after they
+# are built or after they are installed), it will have to define its own
+# post-build/install hooks after calling kernel-module, but before calling
+# the other *-package infra, like so:
+#
+#   $(eval $(kernel-module))
+#   define FOO_MOD_TWEAK
+#   	# do something
+#   endef
+#   FOO_POST_BUILD_HOOKS += FOO_MOD_TWEAK
+#   $(eval $(generic-package))
+#
+# Note: this infra does not check that the kernel is enabled; it is expected
+# to be enforced at the Kconfig level with proper 'depends on'.
+################################################################################
+
+################################################################################
+# inner-kernel-module -- generates the make targets needed to support building
+# a kernel module
+#
+#  argument 1 is the lowercase package name
+#  argument 2 is the uppercase package name
+################################################################################
+
+define inner-kernel-module
+
+# The kernel must be built first.
+$(2)_DEPENDENCIES += linux
+
+# This is only defined in some infrastructures (e.g. autotools, cmake), but
+# not in others (generic). So define it if not already defined.
+$(2)_MAKE ?= $$(MAKE)
+
+# If not specified, consider the source of the kernel module to be at
+# the root of the package.
+$(2)_MODULE_SUBDIRS ?= .
+
+# Build the kernel module(s)
+define $(2)_KERNEL_MODULES_BUILD
+	@$$(call MESSAGE,"Building kernel module(s)")
+	$$(foreach d,$$($(2)_MODULE_SUBDIRS), \
+		$$(LINUX_MAKE_ENV) $$($$(PKG)_MAKE) \
+			-C $$(LINUX_DIR) \
+			$$(LINUX_MAKE_FLAGS) \
+			$$($(2)_MODULE_MAKE_OPTS) \
+			M=$$(@D)/$$(d) \
+			modules$$(sep))
+endef
+$(2)_POST_BUILD_HOOKS += $(2)_KERNEL_MODULES_BUILD
+
+# Install the kernel module(s)
+define $(2)_KERNEL_MODULES_INSTALL
+	@$$(call MESSAGE,"Installing kernel module(s)")
+	$$(foreach d,$$($(2)_MODULE_SUBDIRS), \
+		$$(LINUX_MAKE_ENV) $$($$(PKG)_MAKE) \
+			-C $$(LINUX_DIR) \
+			$$(LINUX_MAKE_FLAGS) \
+			$$($(2)_MODULE_MAKE_OPTS) \
+			M=$$(@D)/$$(d) \
+			modules_install$$(sep))
+endef
+$(2)_POST_INSTALL_TARGET_HOOKS += $(2)_KERNEL_MODULES_INSTALL
+
+endef
+
+################################################################################
+# kernel-module -- the target generator macro for kernel module packages
+################################################################################
+
+kernel-module = $(call inner-kernel-module,$(pkgname),$(call UPPERCASE,$(pkgname)))
-- 
1.9.1
