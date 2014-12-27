From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 27 Dec 2014 22:58:26 +0100
Subject: [Buildroot] [PATCH 08/10] package/dvb-apps: rename patches to
	follow the new name convention
In-Reply-To: <1419717508-11627-1-git-send-email-romain.naour@openwide.fr>
References: <1419717508-11627-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1419717508-11627-9-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/dvb-apps/0001-Fix-generate-keynames.patch  | 30 ++++++++++++++++++++++
 .../dvb-apps/0002-Fix-compiler-warning-flags.patch | 25 ++++++++++++++++++
 .../dvb-apps/0003-support-static-only-build.patch  | 20 +++++++++++++++
 .../dvb-apps-0001-Fix-generate-keynames.patch      | 30 ----------------------
 .../dvb-apps-0002-Fix-compiler-warning-flags.patch | 25 ------------------
 .../dvb-apps-0003-support-static-only-build.patch  | 20 ---------------
 6 files changed, 75 insertions(+), 75 deletions(-)
 create mode 100644 package/dvb-apps/0001-Fix-generate-keynames.patch
 create mode 100644 package/dvb-apps/0002-Fix-compiler-warning-flags.patch
 create mode 100644 package/dvb-apps/0003-support-static-only-build.patch
 delete mode 100644 package/dvb-apps/dvb-apps-0001-Fix-generate-keynames.patch
 delete mode 100644 package/dvb-apps/dvb-apps-0002-Fix-compiler-warning-flags.patch
 delete mode 100644 package/dvb-apps/dvb-apps-0003-support-static-only-build.patch

diff --git a/package/dvb-apps/0001-Fix-generate-keynames.patch b/package/dvb-apps/0001-Fix-generate-keynames.patch
new file mode 100644
index 0000000..498607d
--- /dev/null
+++ b/package/dvb-apps/0001-Fix-generate-keynames.patch
@@ -0,0 +1,30 @@
+Fix generate-keynames.sh script for cross-compilation
+
+generate-keynames.sh reads /usr/include/linux to find the keyname
+symbols. However, when cross-compiling, the include path points
+somewhere else. Allow the user to pass CROSS_ROOT to point to the
+root of the cross-compilation environment.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+diff -rup dvb-apps-83c746462ccb.orig/util/av7110_loadkeys/generate-keynames.sh dvb-apps-83c746462ccb/util/av7110_loadkeys/generate-keynames.sh
+--- dvb-apps-83c746462ccb.orig/util/av7110_loadkeys/generate-keynames.sh	2012-12-06 10:38:07.000000000 +0100
++++ dvb-apps-83c746462ccb/util/av7110_loadkeys/generate-keynames.sh	2013-08-29 21:47:09.717991439 +0200
+@@ -18,7 +18,7 @@ echo "};" >> $1
+ echo >> $1
+ echo >> $1
+ echo "static struct input_key_name key_name [] = {" >> $1
+-for x in $(cat /usr/include/linux/input.h input_fake.h | \
++for x in $(cat ${CROSS_ROOT}/usr/include/linux/input.h input_fake.h | \
+            egrep "#define[ \t]+KEY_" | grep -v KEY_MAX | \
+            cut -f 1 | cut -f 2 -d " " | sort -u) ; do
+     echo "        { \"$(echo $x | cut -b 5-)\", $x }," >> $1
+@@ -26,7 +26,7 @@ done
+ echo "};" >> $1
+ echo >> $1
+ echo "static struct input_key_name btn_name [] = {" >> $1
+-for x in $(cat /usr/include/linux/input.h input_fake.h | \
++for x in $(cat ${CROSS_ROOT}/usr/include/linux/input.h input_fake.h | \
+            egrep "#define[ \t]+BTN_" | \
+            cut -f 1 | cut -f 2 -d " " | sort -u) ; do
+      echo "        { \"$(echo $x | cut -b 5-)\", $x }," >> $1
diff --git a/package/dvb-apps/0002-Fix-compiler-warning-flags.patch b/package/dvb-apps/0002-Fix-compiler-warning-flags.patch
new file mode 100644
index 0000000..9da0408
--- /dev/null
+++ b/package/dvb-apps/0002-Fix-compiler-warning-flags.patch
@@ -0,0 +1,25 @@
+When building for avr32, the build fails as follows.
+
+  cc1: error: unrecognized command line option "-Wno-packed-bitfield-compat"
+
+An example of an autobuild failure arising from this is the following.
+
+  http://autobuild.buildroot.net/results/92e/92e472004812a3616f62d766a9ea07a997a66e89/
+
+Clearly, not all toolchains provide a gcc that understands
+the -Wno-packed-bitfield-compat flag; remove usage of this flag.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/util/scan/Makefile b/util/scan/Makefile
+--- a/util/scan/Makefile	2013-11-24 17:04:10.000000000 +0000
++++ b/util/scan/Makefile	2013-12-13 09:37:11.967975173 +0000
+@@ -14,7 +14,7 @@ inst_bin = $(binaries)
+ 
+ removing = atsc_psip_section.c atsc_psip_section.h
+ 
+-CPPFLAGS += -Wno-packed-bitfield-compat -D__KERNEL_STRICT_NAMES
++CPPFLAGS += -D__KERNEL_STRICT_NAMES
+ 
+ .PHONY: all
+ 
diff --git a/package/dvb-apps/0003-support-static-only-build.patch b/package/dvb-apps/0003-support-static-only-build.patch
new file mode 100644
index 0000000..236f1a3
--- /dev/null
+++ b/package/dvb-apps/0003-support-static-only-build.patch
@@ -0,0 +1,20 @@
+Make.rules: don't build .so libraries when static=1
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Make.rules
+===================================================================
+--- a/Make.rules
++++ b/Make.rules
+@@ -9,7 +9,11 @@
+ CFLAGS_LIB ?= -fPIC
+ CFLAGS += $(CFLAGS_LIB)
+ 
++ifeq ($(static),1)
++libraries = $(lib_name).a
++else
+ libraries = $(lib_name).so $(lib_name).a
++endif
+ 
+ .PHONY: library
+ 
diff --git a/package/dvb-apps/dvb-apps-0001-Fix-generate-keynames.patch b/package/dvb-apps/dvb-apps-0001-Fix-generate-keynames.patch
deleted file mode 100644
index 498607d..0000000
--- a/package/dvb-apps/dvb-apps-0001-Fix-generate-keynames.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Fix generate-keynames.sh script for cross-compilation
-
-generate-keynames.sh reads /usr/include/linux to find the keyname
-symbols. However, when cross-compiling, the include path points
-somewhere else. Allow the user to pass CROSS_ROOT to point to the
-root of the cross-compilation environment.
-
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
-diff -rup dvb-apps-83c746462ccb.orig/util/av7110_loadkeys/generate-keynames.sh dvb-apps-83c746462ccb/util/av7110_loadkeys/generate-keynames.sh
---- dvb-apps-83c746462ccb.orig/util/av7110_loadkeys/generate-keynames.sh	2012-12-06 10:38:07.000000000 +0100
-+++ dvb-apps-83c746462ccb/util/av7110_loadkeys/generate-keynames.sh	2013-08-29 21:47:09.717991439 +0200
-@@ -18,7 +18,7 @@ echo "};" >> $1
- echo >> $1
- echo >> $1
- echo "static struct input_key_name key_name [] = {" >> $1
--for x in $(cat /usr/include/linux/input.h input_fake.h | \
-+for x in $(cat ${CROSS_ROOT}/usr/include/linux/input.h input_fake.h | \
-            egrep "#define[ \t]+KEY_" | grep -v KEY_MAX | \
-            cut -f 1 | cut -f 2 -d " " | sort -u) ; do
-     echo "        { \"$(echo $x | cut -b 5-)\", $x }," >> $1
-@@ -26,7 +26,7 @@ done
- echo "};" >> $1
- echo >> $1
- echo "static struct input_key_name btn_name [] = {" >> $1
--for x in $(cat /usr/include/linux/input.h input_fake.h | \
-+for x in $(cat ${CROSS_ROOT}/usr/include/linux/input.h input_fake.h | \
-            egrep "#define[ \t]+BTN_" | \
-            cut -f 1 | cut -f 2 -d " " | sort -u) ; do
-      echo "        { \"$(echo $x | cut -b 5-)\", $x }," >> $1
diff --git a/package/dvb-apps/dvb-apps-0002-Fix-compiler-warning-flags.patch b/package/dvb-apps/dvb-apps-0002-Fix-compiler-warning-flags.patch
deleted file mode 100644
index 9da0408..0000000
--- a/package/dvb-apps/dvb-apps-0002-Fix-compiler-warning-flags.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-When building for avr32, the build fails as follows.
-
-  cc1: error: unrecognized command line option "-Wno-packed-bitfield-compat"
-
-An example of an autobuild failure arising from this is the following.
-
-  http://autobuild.buildroot.net/results/92e/92e472004812a3616f62d766a9ea07a997a66e89/
-
-Clearly, not all toolchains provide a gcc that understands
-the -Wno-packed-bitfield-compat flag; remove usage of this flag.
-
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
-
-diff -Nurp a/util/scan/Makefile b/util/scan/Makefile
---- a/util/scan/Makefile	2013-11-24 17:04:10.000000000 +0000
-+++ b/util/scan/Makefile	2013-12-13 09:37:11.967975173 +0000
-@@ -14,7 +14,7 @@ inst_bin = $(binaries)
- 
- removing = atsc_psip_section.c atsc_psip_section.h
- 
--CPPFLAGS += -Wno-packed-bitfield-compat -D__KERNEL_STRICT_NAMES
-+CPPFLAGS += -D__KERNEL_STRICT_NAMES
- 
- .PHONY: all
- 
diff --git a/package/dvb-apps/dvb-apps-0003-support-static-only-build.patch b/package/dvb-apps/dvb-apps-0003-support-static-only-build.patch
deleted file mode 100644
index 236f1a3..0000000
--- a/package/dvb-apps/dvb-apps-0003-support-static-only-build.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Make.rules: don't build .so libraries when static=1
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/Make.rules
-===================================================================
---- a/Make.rules
-+++ b/Make.rules
-@@ -9,7 +9,11 @@
- CFLAGS_LIB ?= -fPIC
- CFLAGS += $(CFLAGS_LIB)
- 
-+ifeq ($(static),1)
-+libraries = $(lib_name).a
-+else
- libraries = $(lib_name).so $(lib_name).a
-+endif
- 
- .PHONY: library
- 
-- 
1.9.3
