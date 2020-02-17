From: Andreas Naumann <anaumann@ultratronik.de>
Date: Mon, 17 Feb 2020 22:23:24 +0100
Subject: [Buildroot] [PATCH v6 02/28] core/pkg-infra: Add generic qmake
 package infrastructure
In-Reply-To: <20200217212350.29750-1-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
Message-ID: <20200217212350.29750-3-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This provides generic functions for Qt5 qmake based packages. It will make it
possible to remove lots of redefinition of QT5_xxx_{CONFIGURE|BUILD|
INSTALL_STATGING}_CMDS. Additionally it provides a generic target install
method which will make most of the package specific commands obsolete.

This is done by re-running the install step of the qmake generated Makefile
with the package build directory prepended (to the staging/host path). Even
though this does create lengthy pathes it allows for easy separation of the
staging files from the host destined files by just omitting the resulting
BUILD_DIR+HOST_DIR path from the following rsync call to the real target folder.
The cleanup of many files we dont want in target is deferred to the
target-finalize step. In addition to what's being removed already, we also have
to cleanup some Qt5 specific files (prl) and the documentation directory.

This approach was chosen over copying all files recorded in the pkg-files-list
after some discussion which Thomas Petazzoni summed up:
"We don't yet use pkg-files-list really as part of the build
process anywhere, I feel a bit more comfortable at this point with what
Andreas is proposing."

Getting rid of the many conditional install commands is possible because qmake
already takes care of this when generating the Makefile install targets with the
given or autodetected configure options of each package.

However, custom install steps may have to remain in cases where a particular
buildroot option has no corresponding setting in the packages configuration
options.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 Makefile                              |   5 +-
 docs/manual/adding-packages-qmake.txt |  85 +++++++++++++++++++++
 docs/manual/adding-packages.txt       |   2 +
 package/Makefile.in                   |   1 +
 package/pkg-qmake.mk                  | 105 ++++++++++++++++++++++++++
 5 files changed, 196 insertions(+), 2 deletions(-)
 create mode 100644 docs/manual/adding-packages-qmake.txt
 create mode 100644 package/pkg-qmake.mk

diff --git a/Makefile b/Makefile
index a52f1c75fd..4cd3d2ba79 100644
--- a/Makefile
+++ b/Makefile
@@ -737,10 +737,11 @@ target-finalize: $(PACKAGES) $(TARGET_DIR) host-finalize
 	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
-		$(TARGET_DIR)/usr/lib/cmake $(TARGET_DIR)/usr/share/cmake
+		$(TARGET_DIR)/usr/lib/cmake $(TARGET_DIR)/usr/share/cmake \
+		$(TARGET_DIR)/usr/doc
 	find $(TARGET_DIR)/usr/{lib,share}/ -name '*.cmake' -print0 | xargs -0 rm -f
 	find $(TARGET_DIR)/lib/ $(TARGET_DIR)/usr/lib/ $(TARGET_DIR)/usr/libexec/ \
-		\( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
+		\( -name '*.a' -o -name '*.la' -o -name '*.prl' \) -print0 | xargs -0 rm -f
 ifneq ($(BR2_PACKAGE_GDB),y)
 	rm -rf $(TARGET_DIR)/usr/share/gdb
 endif
diff --git a/docs/manual/adding-packages-qmake.txt b/docs/manual/adding-packages-qmake.txt
new file mode 100644
index 0000000000..9b5193d67f
--- /dev/null
+++ b/docs/manual/adding-packages-qmake.txt
@@ -0,0 +1,85 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+=== Infrastructure for QMake-based packages
+
+[[qmake-package-tutorial]]
+
+==== +qmake-package+ tutorial
+
+First, let's see how to write a +.mk+ file for a QMake-based package, with
+an example :
+
+------------------------
+01: ################################################################################
+02: #
+03: # libfoo
+04: #
+05: ################################################################################
+06:
+07: LIBFOO_VERSION = 1.0
+08: LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
+09: LIBFOO_SITE = http://www.foosoftware.org/download
+10: LIBFOO_CONF_OPTS = QT_CONFIG+=bar QT_CONFIG-=baz
+11: LIBFOO_DEPENDENCIES = bar
+12:
+13: $(eval $(qmake-package))
+------------------------
+
+On line 7, we declare the version of the package.
+
+On line 8 and 9, we declare the name of the tarball (xz-ed tarball
+recommended) and the location of the tarball on the Web. Buildroot
+will automatically download the tarball from this location.
+
+On line 10, we tell Buildroot what options to enable for libfoo.
+
+On line 11, we tell Buildroot the depednencies of libfoo.
+
+Finally, on line line 13, we invoke the +qmake-package+
+macro that generates all the Makefile rules that actually allows the
+package to be built.
+
+[[qmake-package-reference]]
+
+==== +qmake-package+ reference
+
+The main macro of the QMake package infrastructure is +qmake-package+.
+It is similar to the +generic-package+ macro.
+
+Just like the generic infrastructure, the QMake infrastructure works
+by defining a number of variables before calling the +qmake-package+
+macro.
+
+First, all the package metadata information variables that exist in
+the generic infrastructure also exist in the QMake infrastructure:
++LIBFOO_VERSION+, +LIBFOO_SOURCE+, +LIBFOO_PATCH+, +LIBFOO_SITE+,
++LIBFOO_SUBDIR+, +LIBFOO_DEPENDENCIES+, +LIBFOO_INSTALL_STAGING+,
++LIBFOO_INSTALL_TARGET+.
+
+An additional variable, specific to the QMake infrastructure, can
+also be defined.
+
+* +LIBFOO_QMAKE_OPTS+, to specify additional options to pass to the
+  +qmake+ script at every step of the package build process: configure,
+  build and installation. By default, empty.
+
+* +LIBFOO_CONF_ENV+, to specify additional environment variables to 
+  pass to the +qmake+ script for the configuration step. By default, empty.
+
+* +LIBFOO_CONF_OPTS+, to specify additional options to pass to the
+  +qmake+ script for the configuration step. By default, empty.
+
+* +LIBFOO_MAKE_ENV+, to specify additional environment variables to the
+  +make+ command during the build and install steps. By default, empty.
+
+* +LIBFOO_MAKE_OPTS+, to specify additional targets to pass to the
+  +make+ command during the build step. By default, empty.
+
+* +LIBFOO_INSTALL_STAGING_OPTS+, to specify additional targets to pass
+  to the +make+ command during the staging installation step. By default,
+  +install+.
+
+* +LIBFOO_INSTALL_TARGET_OPTS+, to specify additional targets to pass
+  to the +make+ command during the target installation step. By default,
+  +install+.
diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
index 4a4a17e879..814355cd76 100644
--- a/docs/manual/adding-packages.txt
+++ b/docs/manual/adding-packages.txt
@@ -41,6 +41,8 @@ include::adding-packages-cargo.txt[]
 
 include::adding-packages-golang.txt[]
 
+include::adding-packages-qmake.txt[]
+
 include::adding-packages-kernel-module.txt[]
 
 include::adding-packages-asciidoc.txt[]
diff --git a/package/Makefile.in b/package/Makefile.in
index 285e2837ef..51f5cbce4f 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -426,3 +426,4 @@ include package/pkg-kernel-module.mk
 include package/pkg-waf.mk
 include package/pkg-golang.mk
 include package/pkg-meson.mk
+include package/pkg-qmake.mk
diff --git a/package/pkg-qmake.mk b/package/pkg-qmake.mk
new file mode 100644
index 0000000000..53ac3e4a1c
--- /dev/null
+++ b/package/pkg-qmake.mk
@@ -0,0 +1,105 @@
+################################################################################
+# QMake package infrastructure
+#
+# This file implements an infrastructure that eases development of package
+# .mk files for QMake packages. It should be used for all packages that use
+# Qmake as their build system.
+#
+# See the Buildroot documentation for details on the usage of this
+# infrastructure
+#
+# In terms of implementation, this QMake infrastructure requires the .mk file
+# to only specify metadata information about the package: name, version,
+# download URL, etc.
+#
+# We still allow the package .mk file to override what the different steps
+# are doing, if needed. For example, if <PKG>_BUILD_CMDS is already defined,
+# it is used as the list of commands to perform to build the package,
+# instead of the default QMake behaviour. The package can also define some
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
+################################################################################
+
+define inner-qmake-package
+
+$(2)_CONF_ENV			?=
+$(2)_CONF_OPTS			?=
+$(2)_MAKE_ENV			?=
+$(2)_MAKE_OPTS			?=
+$(2)_INSTALL_STAGING_OPTS	?= install
+$(2)_INSTALL_TARGET_OPTS	?= $$($(2)_INSTALL_STAGING_OPTS)
+
+#
+# Configure step. Only define it if not already defined by the package
+# .mk file.
+#
+ifndef $(2)_CONFIGURE_CMDS
+define $(2)_CONFIGURE_CMDS
+	cd $$($(2)_BUILDDIR) && \
+	$$(TARGET_MAKE_ENV) $$($(2)_CONF_ENV) $$(QT5_QMAKE) $$($(2)_CONF_OPTS)
+endef
+endif
+
+#
+# Build step. Only define it if not already defined by the package .mk
+# file.
+#
+ifndef $(2)_BUILD_CMDS
+define $(2)_BUILD_CMDS
+	$$(TARGET_MAKE_ENV) $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_BUILDDIR) $$($(2)_MAKE_OPTS)
+endef
+endif
+
+#
+# Staging installation step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_INSTALL_STAGING_CMDS
+define $(2)_INSTALL_STAGING_CMDS
+	$$(TARGET_MAKE_ENV) $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_BUILDDIR) $$($(2)_INSTALL_STAGING_OPTS)
+endef
+endif
+
+#
+# Target installation step. Only define it if not already defined by
+# the package .mk file.
+#
+# Unfortunately we can't use INSTALL_ROOT to directly install to TARGET_DIR
+# because in a crosscompile setup, the qmake generated install destinations
+# are prefixed with the hardcoded sysroot (=STAGING_DIR) and hostprefix
+# (=HOST_DIR).
+# Instead we set INSTALL_ROOT, which comes before the install path, to a
+# temporary folder inside the build directory and effectively install to
+# $(@D)/tmp-target-install/$(STAGING_DIR) and $(@D)/tmp-target-install/$(HOST_DIR).
+# We subsequently rsync only the files from the temporary staging dir and that
+# way exclude files for the build host from target.
+#
+ifndef $(2)_INSTALL_TARGET_CMDS
+define $(2)_INSTALL_TARGET_CMDS
+	$$(TARGET_MAKE_ENV) $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_BUILDDIR) INSTALL_ROOT=$$($(2)_BUILDDIR)tmp-target-install $$($(2)_INSTALL_TARGET_OPTS)
+	rsync -arv $$($(2)_BUILDDIR)tmp-target-install$$(STAGING_DIR)/ $$(TARGET_DIR)/
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
+# qmake-package -- the target generator macro for QMake packages
+################################################################################
+
+qmake-package = $(call inner-qmake-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
-- 
2.25.0
