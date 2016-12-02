From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Dec 2016 22:11:38 +0100
Subject: [Buildroot] [git commit] core: add waf-package infra
Message-ID: <20161202225223.0E06981E7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24d23bbce7e23e03c5071a335ce61e9064924645
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new waf-package infrastructure simplifies writing waf-based
packages. It can be used by our six current such packages, plus a
later-incoming one by Romain.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Tested-by: Romain Naour <romain.naour@gmail.com>
[Thomas:
 - rename <pkg>_BUNDLED_WAF to <pkg>_NEEDS_EXTERNAL_WAF, which
   involves inverting the meaning of the boolean.
 - always add the host-python dependency
 - add a default value for <pkg>_NEEDS_EXTERNAL_WAF (defaults to NO)
 - remove the unneeded <pkg>_MAKE related definitions.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |   1 +
 package/pkg-waf.mk  | 113 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 114 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index bd73219..4b3368f 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -398,3 +398,4 @@ include package/pkg-generic.mk
 include package/pkg-kconfig.mk
 include package/pkg-rebar.mk
 include package/pkg-kernel-module.mk
+include package/pkg-waf.mk
diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
new file mode 100644
index 0000000..908ac03
--- /dev/null
+++ b/package/pkg-waf.mk
@@ -0,0 +1,113 @@
+################################################################################
+# WAF package infrastructure
+#
+# This file implements an infrastructure that eases development of package
+# .mk files for WAF packages. It should be used for all packages that use
+# WAF as their build system.
+#
+# See the Buildroot documentation for details on the usage of this
+# infrastructure
+#
+# In terms of implementation, this WAF infrastructure requires the .mk file
+# to only specify metadata information about the package: name, version,
+# download URL, etc.
+#
+# We still allow the package .mk file to override what the different steps
+# are doing, if needed. For example, if <PKG>_BUILD_CMDS is already defined,
+# it is used as the list of commands to perform to build the package,
+# instead of the default WAF behaviour. The package can also define some
+# post operation hooks.
+#
+################################################################################
+
+################################################################################
+# inner-waf-package -- defines how the configuration, compilation and
+# installation of a waf package should be done, implements a few hooks
+# to tune the build process for waf specifities and calls the generic
+# package infrastructure to generate the necessary make targets
+#
+#  argument 1 is the lowercase package name
+#  argument 2 is the uppercase package name, including a HOST_ prefix
+#             for host packages
+#  argument 3 is the uppercase package name, without the HOST_ prefix
+#             for host packages
+#  argument 4 is the type (target or host)
+################################################################################
+
+define inner-waf-package
+
+# We need host-python to run waf
+$(2)_DEPENDENCIES += host-python
+
+$(2)_NEEDS_EXTERNAL_WAF ?= NO
+
+# If the package does not have its own waf, use our own.
+ifeq ($$($(2)_NEEDS_EXTERNAL_WAF),YES)
+$(2)_DEPENDENCIES += host-waf
+$(2)_WAF = $(HOST_DIR)/usr/bin/waf
+else
+$(2)_WAF = ./waf
+endif
+
+#
+# Configure step. Only define it if not already defined by the package
+# .mk file.
+#
+ifndef $(2)_CONFIGURE_CMDS
+define $(2)_CONFIGURE_CMDS
+	cd $$(@D) && \
+	$$(TARGET_CONFIGURE_OPTS) \
+	$$($(2)_CONF_ENV) \
+	$$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) configure \
+		--prefix=/usr \
+		--libdir=/usr/lib \
+		$$($(2)_CONF_OPTS)
+endef
+endif
+
+#
+# Build step. Only define it if not already defined by the package .mk
+# file.
+#
+ifndef $(2)_BUILD_CMDS
+define $(2)_BUILD_CMDS
+	cd $$(@D) && \
+	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) build -j $$(PARALLEL_JOBS)
+endef
+endif
+
+#
+# Staging installation step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_INSTALL_STAGING_CMDS
+define $(2)_INSTALL_STAGING_CMDS
+	cd $$(@D) && \
+	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) \
+		install --destdir=$$(STAGING_DIR)
+endef
+endif
+
+#
+# Target installation step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_INSTALL_TARGET_CMDS
+define $(2)_INSTALL_TARGET_CMDS
+	cd $$(@D) && \
+	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) \
+		install --destdir=$$(TARGET_DIR)
+endef
+endif
+
+# Call the generic package infrastructure to generate the necessary
+# make targets
+$(call inner-generic-package,$(1),$(2),$(3),$(4))
+
+endef
+
+################################################################################
+# waf-package -- the target generator macro for WAF packages
+################################################################################
+
+waf-package = $(call inner-waf-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
