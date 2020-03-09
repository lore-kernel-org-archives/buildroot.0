From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Mar 2020 22:26:42 +0100
Subject: [Buildroot] [git commit] package/pkg-qmake: new qmake package
 infrastructure
Message-ID: <20200309215540.8C01481222@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f08a7f3fc5d7b010b3fbe7d7d25227d0ae705822
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This provides generic functions for Qt5 qmake based packages. It will
make it possible to remove lots of redefinition of
QT5_xxx_{CONFIGURE|BUILD|INSTALL_STAGING}_CMDS. Additionally it
provides a generic target install method which will make most of the
package specific commands obsolete.

This is done by re-running the install step of the qmake generated
Makefile with the package build directory prepended (to the
staging/host path). Even though this does create lengthy pathes it
allows for easy separation of the staging files from the host destined
files by just omitting the resulting BUILD_DIR+HOST_DIR path from the
following rsync call to the real target folder.  The cleanup of many
files we dont want in target is deferred to the target-finalize
step. In addition to what's being removed already, we also have to
cleanup some Qt5 specific files (prl) and the documentation directory.

This approach was chosen over copying all files recorded in the pkg-files-list
after some discussion which Thomas Petazzoni summed up:
"We don't yet use pkg-files-list really as part of the build
process anywhere, I feel a bit more comfortable at this point with what
Andreas is proposing."

Thanks to this infrastructure, it will be possible to get rid of the
many conditional install commands because qmake already takes care of
this when generating the Makefile install targets with the given or
autodetected configure options of each package.

However, custom install steps may have to remain in cases where a
particular Buildroot option has no corresponding setting in the
packages configuration options.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile                              |   5 +-
 docs/manual/adding-packages-qmake.txt |  81 +++++++++++++++++++++++++
 docs/manual/adding-packages.txt       |   2 +
 package/Makefile.in                   |   1 +
 package/pkg-qmake.mk                  | 107 ++++++++++++++++++++++++++++++++++
 5 files changed, 194 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 9819ae6f36..074d08c04a 100644
--- a/Makefile
+++ b/Makefile
@@ -742,10 +742,11 @@ target-finalize: $(PACKAGES) $(TARGET_DIR) host-finalize
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
index 0000000000..8d26023904
--- /dev/null
+++ b/docs/manual/adding-packages-qmake.txt
@@ -0,0 +1,81 @@
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
index 0000000000..ed48819d1b
--- /dev/null
+++ b/package/pkg-qmake.mk
@@ -0,0 +1,107 @@
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
+$(2)_DEPENDENCIES 		+= qt5base
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
