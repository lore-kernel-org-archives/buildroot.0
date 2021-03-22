From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 22 Mar 2021 08:44:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: fix zkey build
Message-ID: <20210322074442.1112603-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build of zkey fails since bump to version 2.16.0 in commit
b82b58a8ddc3d079aa2976b3dafbc965b6107648

Fixes:
 - http://autobuild.buildroot.org/results/e7f229a98dab188ee9c40e4709fd26bfa67358d3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...en-the-compiler-flags-are-overridden.patch | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 package/s390-tools/0002-zkey-Fix-build-error-when-the-compiler-flags-are-overridden.patch

diff --git a/package/s390-tools/0002-zkey-Fix-build-error-when-the-compiler-flags-are-overridden.patch b/package/s390-tools/0002-zkey-Fix-build-error-when-the-compiler-flags-are-overridden.patch
new file mode 100644
index 0000000000..ee725d396e
--- /dev/null
+++ b/package/s390-tools/0002-zkey-Fix-build-error-when-the-compiler-flags-are-overridden.patch
@@ -0,0 +1,54 @@
+From 3f3f063c98278f53ad3b34e68b70fca62eaea8fb Mon Sep 17 00:00:00 2001
+From: Ingo Franzki <ifranzki@linux.ibm.com>
+Date: Tue, 23 Feb 2021 08:52:26 +0100
+Subject: [PATCH] zkey: Fix build error when the compiler flags are overridden
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When the compiler flags are overridden, the build of zkey may fail with:
+
+kms.c:44:2: error: #error KMS_PLUGIN_LOCATION must be defined
+   44 | #error KMS_PLUGIN_LOCATION must be defined
+      |  ^~~~~
+
+The Makefile uses CFLAGS variable for defining the KMS_PLUGIN_LOCATION,
+but it should rather use ALL_CFLAGS.
+
+Also use ALL_CPPFLAGS for defining HAVE_LUKS2_SUPPORT.
+
+Fixes: https://github.com/ibm-s390-linux/s390-tools/issues/108
+
+Signed-off-by: Ingo Franzki <ifranzki@linux.ibm.com>
+Reviewed-by: Jan Hoeppner <hoeppner@linux.ibm.com>
+Signed-off-by: Jan H?ppner <hoeppner@linux.ibm.com>
+
+[Retrieved from:
+https://github.com/ibm-s390-linux/s390-tools/commit/3f3f063c98278f53ad3b34e68b70fca62eaea8fb]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ zkey/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/zkey/Makefile b/zkey/Makefile
+index 41129bcf..f74e2091 100644
+--- a/zkey/Makefile
++++ b/zkey/Makefile
+@@ -18,7 +18,7 @@ ifneq (${HAVE_CRYPTSETUP2},0)
+ 		ifneq (${HAVE_OPENSSL},0)
+ 			BUILD_TARGETS += zkey-cryptsetup
+ 			INSTALL_TARGETS += install-zkey-cryptsetup
+-			CPPFLAGS += -DHAVE_LUKS2_SUPPORT
++			ALL_CPPFLAGS += -DHAVE_LUKS2_SUPPORT
+ 		else
+ 			BUILD_TARGETS += zkey-cryptsetup-skip-openssl
+ 			INSTALL_TARGETS += zkey-cryptsetup-skip-openssl
+@@ -34,7 +34,7 @@ endif
+ 
+ libs = $(rootdir)/libutil/libutil.a
+ 
+-CFLAGS += -DKMS_PLUGIN_LOCATION=\"$(ZKEYKMSPLUGINDIR)\"
++ALL_CFLAGS += -DKMS_PLUGIN_LOCATION=\"$(ZKEYKMSPLUGINDIR)\"
+ 
+ detect-libcryptsetup.dep:
+ 	echo "#include <libcryptsetup.h>" > detect-libcryptsetup.dep
-- 
2.30.1
