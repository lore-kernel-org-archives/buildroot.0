From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Thu, 23 Feb 2017 11:54:54 +1100
Subject: [Buildroot] [RFC PATCH 1/2] package/gobject-introspection: add
	package
In-Reply-To: <cover.1487811280.git.sam.bobroff@au1.ibm.com>
References: <cover.1487811280.git.sam.bobroff@au1.ibm.com>
Message-ID: <b5cbc35d4d8e4457563fdf5b8dfd04360c6616a5.1487811280.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add gobject-introspection, built using host-qemu.

Also updates libglib2 to a more recent version to satasify a dependency.
---
 package/Config.in                                  |  1 +
 .../0001-ldd-cross-launcher.patch                  | 22 +++++++++
 package/gobject-introspection/Config.in            | 12 +++++
 package/gobject-introspection/create-ldd-cross.sh  | 46 ++++++++++++++++++
 .../gobject-introspection/gobject-introspection.mk | 55 ++++++++++++++++++++++
 package/libglib2/libglib2.hash                     |  4 +-
 package/libglib2/libglib2.mk                       |  4 +-
 7 files changed, 140 insertions(+), 4 deletions(-)
 create mode 100644 package/gobject-introspection/0001-ldd-cross-launcher.patch
 create mode 100644 package/gobject-introspection/Config.in
 create mode 100755 package/gobject-introspection/create-ldd-cross.sh
 create mode 100644 package/gobject-introspection/gobject-introspection.mk

diff --git a/package/Config.in b/package/Config.in
index deff0fe2c..bde5246e1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1348,6 +1348,7 @@ menu "Other"
 	source "package/libffi/Config.in"
 	source "package/libgee/Config.in"
 	source "package/libglib2/Config.in"
+	source "package/gobject-introspection/Config.in"
 	source "package/libglob/Config.in"
 	source "package/libical/Config.in"
 	source "package/libite/Config.in"
diff --git a/package/gobject-introspection/0001-ldd-cross-launcher.patch b/package/gobject-introspection/0001-ldd-cross-launcher.patch
new file mode 100644
index 000000000..9129431cb
--- /dev/null
+++ b/package/gobject-introspection/0001-ldd-cross-launcher.patch
@@ -0,0 +1,22 @@
+*** a/giscanner/shlibs.py	2016-06-01 13:42:52.559661299 +1000
+--- b/giscanner/shlibs.py	2016-06-01 13:44:43.028025807 +1000
+***************
+*** 103,109 ****
+          if platform_system == 'Darwin':
+              args.extend(['otool', '-L', binary.args[0]])
+          else:
+!             args.extend(['ldd', binary.args[0]])
+          proc = subprocess.Popen(args, stdout=subprocess.PIPE)
+          patterns = {}
+          for library in libraries:
+--- 103,112 ----
+          if platform_system == 'Darwin':
+              args.extend(['otool', '-L', binary.args[0]])
+          else:
+!             ldd = os.getenv('GI_LDD')
+!             if not ldd:
+!                 ldd = 'ldd'
+!             args.extend([ldd, binary.args[0]])
+          proc = subprocess.Popen(args, stdout=subprocess.PIPE)
+          patterns = {}
+          for library in libraries:
diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
new file mode 100644
index 000000000..253c20b30
--- /dev/null
+++ b/package/gobject-introspection/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_GOBJECT_INTROSPECTION
+    bool "gobject-introspection"
+    depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_3 # ldd
+    select BR2_PACKAGE_HOST_QEMU
+    select BR2_PACKAGE_PKGCONF
+    select BR2_PACKAGE_LIBGLIB2
+    select BR2_PACKAGE_PYTHON
+
+    help
+      gobject-introspection
+
+      http://wiki.gnome.org/
diff --git a/package/gobject-introspection/create-ldd-cross.sh b/package/gobject-introspection/create-ldd-cross.sh
new file mode 100755
index 000000000..58d4281e8
--- /dev/null
+++ b/package/gobject-introspection/create-ldd-cross.sh
@@ -0,0 +1,46 @@
+#!/bin/bash
+set -e
+
+if [ $# -ne 2 ]; then
+	echo "Usage: <full qemu path> <staging dir>"
+	exit 2
+fi
+
+QEMU="$1"
+STAGING_DIR="$2"
+OUT="$STAGING_DIR/usr/bin/ldd-cross"
+
+cat > "$OUT"<<'EOF'
+#! /bin/bash
+
+set -e
+
+EOF
+echo "QEMU=\"$QEMU\"" >> "$OUT"
+eval "$(grep ^RTLDLIST= $STAGING_DIR/usr/bin/ldd)"
+
+echo -n 'RTLDLIST="' >> "$OUT"
+for RTLD in $RTLDLIST; do
+	echo -n "$STAGING_DIR$RTLD " >> "$OUT"
+done
+echo '"' >> "$OUT"
+echo >> "$OUT"
+
+cat >> "$OUT"<<'EOF'
+for file do
+  case $file in
+  */*) :
+       ;;
+  *) file=./$file
+     ;;
+  esac
+  for RTLD in ${RTLDLIST}; do
+    if test -x $RTLD; then
+      "$QEMU" "$RTLD" --list "$file"
+    fi
+  done
+done
+EOF
+
+chmod +x "$OUT"
+echo "Wrote: $OUT"
diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
new file mode 100644
index 000000000..2ee8fc8e0
--- /dev/null
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -0,0 +1,55 @@
+################################################################################
+#
+# gobject-introspection
+#
+################################################################################
+
+GOBJECT_INTROSPECTION_VERSION         = 1.51.1
+GOBJECT_INTROSPECTION_SITE            = $(call github,GNOME,gobject-introspection,$(GOBJECT_INTROSPECTION_VERSION))
+GOBJECT_INTROSPECTION_LICENSE         = GPLv2+ LGPLv2.1
+GOBJECT_INTROSPECTION_LICENSE_FILES   = COPYING COPYING.GPL COPYING.LGPL COPYING.lib COPYING.tools
+GOBJECT_INTROSPECTION_INSTALL_STAGING = YES
+GOBJECT_INTROSPECTION_MAKE_OPTS       = GI_CROSS_LAUNCHER="$(HOST_DIR)/usr/bin/qemu-$(HOST_QEMU_ARCH)" GI_LDD=$(STAGING_DIR)/usr/bin/ldd-cross INTROSPECTION_SCANNER=g-ir-scanner INTROSPECTION_COMPILER=g-ir-compiler
+GOBJECT_INTROSPECTION_DEPENDENCIES    = pkgconf python libglib2 host-qemu host-gobject-introspection
+HOST_GOBJECT_INTROSPECTION_DEPENDENCIES = host-pkgconf host-python host-libglib2 toolchain
+
+define GOBJECT_INTROSPECTION_BOOTSTRAP
+	cd $(GOBJECT_INTROSPECTION_DIR) && env NOCONFIGURE=1 ./autogen.sh --host=$(GNU_TARGET_NAME)
+endef
+GOBJECT_INTROSPECTION_POST_EXTRACT_HOOKS += GOBJECT_INTROSPECTION_BOOTSTRAP
+
+define HOST_GOBJECT_INTROSPECTION_BOOTSTRAP
+	cd $(HOST_GOBJECT_INTROSPECTION_DIR) && env NOCONFIGURE=1 ./autogen.sh
+endef
+HOST_GOBJECT_INTROSPECTION_POST_EXTRACT_HOOKS += HOST_GOBJECT_INTROSPECTION_BOOTSTRAP
+
+# We must hack staging twice: once after installing the host version in order to
+# provide the cross-versions that can be used to build the target version
+# and again after the target version has overwritten the staging files as it
+# installs to staging.
+HOST_GOBJECT_INTROSPECTION_POST_INSTALL_HOOKS += GOBJECT_INTROSPECTION_HACK_STAGING
+GOBJECT_INTROSPECTION_POST_INSTALL_STAGING_HOOKS += GOBJECT_INTROSPECTION_HACK_STAGING_PKGCONFIG GOBJECT_INTROSPECTION_HACK_STAGING
+# TODO: Use a better name than ldd-cross? Move it to a separate package?
+define GOBJECT_INTROSPECTION_HACK_STAGING_PKGCONFIG
+	echo "HACKING STAGING PACKAGE CONFIG"
+	sed --in-place -e "s:^prefix=.*:prefix=$(STAGING_DIR)/usr:" $(STAGING_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc
+	sed --in-place -e "s:^exec_prefix=.*:exec_prefix=$(STAGING_DIR)/usr:" $(STAGING_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc
+endef
+
+define GOBJECT_INTROSPECTION_HACK_STAGING
+	echo "CREATING STAGING g-ir-scanner"
+	echo "#!/bin/sh" > $(STAGING_DIR)/usr/bin/g-ir-scanner
+	echo "env GI_CROSS_LAUNCHER=\"$(HOST_DIR)/usr/bin/qemu-$(HOST_QEMU_ARCH)\" GI_LDD=ldd-cross $(HOST_DIR)/usr/bin/g-ir-scanner \""'$$'@"\"" >> $(STAGING_DIR)/usr/bin/g-ir-scanner
+
+	echo "CREATING STAGING g-ir-compiler"
+	echo "#!/bin/sh" > $(STAGING_DIR)/usr/bin/g-ir-compiler
+	echo "env GI_CROSS_LAUNCHER=\"$(HOST_DIR)/usr/bin/qemu-$(HOST_QEMU_ARCH)\" GI_LDD=ldd-cross $(HOST_DIR)/usr/bin/g-ir-compiler \""'$$'"@\"" >> $(STAGING_DIR)/usr/bin/g-ir-compiler
+
+	echo "CREATING STAGING ldd-cross"
+	$(GOBJECT_INTROSPECTION_PKGDIR)/create-ldd-cross.sh $(HOST_DIR)/usr/bin/qemu-$(HOST_QEMU_ARCH) $(STAGING_DIR)
+	echo "Created:"
+	cat $(STAGING_DIR)/usr/bin/ldd-cross
+endef
+
+$(eval $(host-autotools-package))
+$(eval $(autotools-package))
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 94bf8700b..126b051b9 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,2 +1,2 @@
-# https://download.gnome.org/sources/glib/2.50/glib-2.50.2.sha256sum
-sha256  be68737c1f268c05493e503b3b654d2b7f43d7d0b8c5556f7e4651b870acfbf5  glib-2.50.2.tar.xz
+# https://download.gnome.org/sources/glib/2.51/glib-2.51.0.sha256sum
+sha256 f113b7330f4b4a43e3e401fe7849e751831060d574bd936a63e979887137a74a  glib-2.51.0.tar.xz
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index ddd1f3965..0e8c9410a 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.50
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
+LIBGLIB2_VERSION_MAJOR = 2.51
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPLv2+
-- 
2.11.0
