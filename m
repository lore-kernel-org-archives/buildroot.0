From: Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Wed, 24 Mar 2021 10:00:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: fix build error due to
 undefined KMS_PLUGIN_LOCATION
Message-ID: <20210324090001.179735-1-egorenar@linux.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following build error:
kms.c:44:2: error: #error KMS_PLUGIN_LOCATION must be defined
   44 | #error KMS_PLUGIN_LOCATION must be defined
      |  ^~~~~
/usr/bin/make -C ../..//libutil/ libutil.a
kms.c: In function ?load_kms_plugin?:
kms.c:274:5: error: ?KMS_PLUGIN_LOCATION? undeclared (first use in this function)
  274 |     KMS_PLUGIN_LOCATION, so_name);
      |     ^~~~~~~~~~~~~~~~~~~
kms.c:274:5: note: each undeclared identifier is reported only once for each
function it appears in

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
---
 ...rror-when-the-compiler-flags-are-ove.patch | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/s390-tools/0002-zkey-Fix-build-error-when-the-compiler-flags-are-ove.patch

diff --git a/package/s390-tools/0002-zkey-Fix-build-error-when-the-compiler-flags-are-ove.patch b/package/s390-tools/0002-zkey-Fix-build-error-when-the-compiler-flags-are-ove.patch
new file mode 100644
index 0000000000..dce8a60499
--- /dev/null
+++ b/package/s390-tools/0002-zkey-Fix-build-error-when-the-compiler-flags-are-ove.patch
@@ -0,0 +1,51 @@
+From 80e702cfbaa3001beaa7eff93943883db79a40fe Mon Sep 17 00:00:00 2001
+From: Ingo Franzki <ifranzki@linux.ibm.com>
+Date: Tue, 23 Feb 2021 08:52:26 +0100
+Subject: [PATCH 1/1] zkey: Fix build error when the compiler flags are
+ overridden
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
+Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
+---
+ zkey/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/zkey/Makefile b/zkey/Makefile
+index b2875482..53fd1cf4 100644
+--- a/zkey/Makefile
++++ b/zkey/Makefile
+@@ -20,7 +20,7 @@ ifneq (${HAVE_CRYPTSETUP2},0)
+ 		ifneq (${HAVE_OPENSSL},0)
+ 			BUILD_TARGETS += zkey-cryptsetup
+ 			INSTALL_TARGETS += install-zkey-cryptsetup
+-			CPPFLAGS += -DHAVE_LUKS2_SUPPORT
++			ALL_CPPFLAGS += -DHAVE_LUKS2_SUPPORT
+ 		else
+ 			BUILD_TARGETS += zkey-cryptsetup-skip-openssl
+ 			INSTALL_TARGETS += zkey-cryptsetup-skip-openssl
+@@ -36,7 +36,7 @@ endif
+ 
+ libs = $(rootdir)/libutil/libutil.a
+ 
+-CFLAGS += -DKMS_PLUGIN_LOCATION=\"$(ZKEYKMSPLUGINDIR)\"
++ALL_CFLAGS += -DKMS_PLUGIN_LOCATION=\"$(ZKEYKMSPLUGINDIR)\"
+ 
+ detect-libcryptsetup.dep:
+ 	echo "#include <libcryptsetup.h>" > detect-libcryptsetup.dep
+-- 
+2.26.3
+
-- 
2.26.3
