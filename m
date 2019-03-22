From: Andreas Naumann <anaumann@ultratronik.de>
Date: Fri, 22 Mar 2019 19:39:00 +0100
Subject: [Buildroot] [PATCH v4 2/6] qt5: Provide generic qmake package
 infrastructure
In-Reply-To: <20190322183904.22401-1-anaumann@ultratronik.de>
References: <20190322183904.22401-1-anaumann@ultratronik.de>
Message-ID: <20190322183904.22401-3-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This provides generic functions for Qt5 qmake based packages. Besides
being able to remove lots of redundant commands, it should make it possible to
eliminate the numerous and complex target install steps.
This is done by re-running the install step of the qmake generated Makefile
with the package build directory prepended (to the staging/host path). Even
though this does create lengthy pathes it allows for easy separation of the
staging files from the host destined files by just omitting the resulting
BUILD_DIR+HOST_DIR path from the following rsync call to the real target folder.
In addition, rsync excludes all header-, documentation- and cmake-pathes as well
as libtool and prl files in order to avoid unnecessary files accumulating in
target.

Getting rid of the many conditional install commands is possible because qmake
already takes care of this when generating the Makefile install targets with the
given or autodetected configure options of each package.

However, custom install steps may have to remain in cases where a particular
buildroot option has no corresponding setting in the packages configuration
options.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/Makefile.in  |   1 +
 package/pkg-qmake.mk | 109 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 110 insertions(+)
 create mode 100644 package/pkg-qmake.mk

diff --git a/package/Makefile.in b/package/Makefile.in
index dc818a2c18..fb0e22114c 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -442,3 +442,4 @@ include package/pkg-kernel-module.mk
 include package/pkg-waf.mk
 include package/pkg-golang.mk
 include package/pkg-meson.mk
+include package/pkg-qmake.mk
diff --git a/package/pkg-qmake.mk b/package/pkg-qmake.mk
new file mode 100644
index 0000000000..11cfb809fc
--- /dev/null
+++ b/package/pkg-qmake.mk
@@ -0,0 +1,109 @@
+################################################################################
+# QMAKE package infrastructure
+#
+# This file implements an infrastructure that eases development of package
+# .mk files for QMAKE packages. It should be used for all packages that use
+# QMAKE as their build system.
+#
+# See the Buildroot documentation for details on the usage of this
+# infrastructure
+#
+# In terms of implementation, this QMAKE infrastructure requires the .mk file
+# to only specify metadata information about the package: name, version,
+# download URL, etc.
+#
+# We still allow the package .mk file to override what the different steps
+# are doing, if needed. For example, if <PKG>_BUILD_CMDS is already defined,
+# it is used as the list of commands to perform to build the package,
+# instead of the default QMAKE behaviour. The package can also define some
+# post operation hooks.
+#
+################################################################################
+
+################################################################################
+# inner-qmake-package -- defines how the configuration, compilation and
+# installation of a qmake package should be done, implements a few hooks
+# to tune the build process for qmake specifities and calls the generic
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
+define inner-qmake-package
+
+$(2)_CONF_ENV			?=
+$(2)_CONF_OPTS			?=
+$(2)_MAKE_ENV			?=
+$(2)_MAKE_OPTS			?=
+$(2)_INSTALL_STAGING_OPTS	?= install
+
+#
+# Configure step. Only define it if not already defined by the package
+# .mk file.
+#
+ifndef $(2)_CONFIGURE_CMDS
+define $(2)_CONFIGURE_CMDS
+	cd $$($$(PKG)_SRCDIR) && \
+	$$(TARGET_MAKE_ENV) \
+	$$($(2)_CONF_ENV) \
+	$$(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++ \
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
+	$$(TARGET_MAKE_ENV) \
+	$$($(2)_MAKE_ENV) \
+	$$(MAKE) -C $$($$(PKG)_SRCDIR) $$($(2)_MAKE_OPTS)
+endef
+endif
+
+#
+# Staging installation step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_INSTALL_STAGING_CMDS
+define $(2)_INSTALL_STAGING_CMDS
+	$$(TARGET_MAKE_ENV) \
+	$$($(2)_MAKE_ENV) \
+	$$(MAKE) -C $$($$(PKG)_SRCDIR) $$($(2)_INSTALL_STAGING_OPTS)
+	$$(QT5_LA_PRL_FILES_FIXUP)
+endef
+endif
+
+#
+# Target installation step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_INSTALL_TARGET_CMDS
+define $(2)_INSTALL_TARGET_CMDS
+	$$(TARGET_MAKE_ENV) \
+	$$($(2)_MAKE_ENV) \
+	$$(MAKE) -C $$($$(PKG)_SRCDIR) INSTALL_ROOT=$$($$(PKG)_SRCDIR)/tmp-target-install $$($(2)_INSTALL_STAGING_OPTS)
+	rsync -arv --exclude usr/include* --exclude usr/lib/cmake* --exclude usr/doc* \
+	           --exclude *.la --exclude *.prl \
+	    $$($$(PKG)_SRCDIR)/tmp-target-install/$$(STAGING_DIR)/ $$(TARGET_DIR)/
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
+# qmake-package -- the target generator macro for QMAKE packages
+################################################################################
+
+qmake-package = $(call inner-qmake-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
-- 
2.21.0
