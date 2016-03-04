From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Fri,  4 Mar 2016 20:00:40 -0300
Subject: [Buildroot] [PATCH] libcap-ng: bump to version 0.7.7
Message-ID: <1457132440-20407-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also disable optimization when compiling for nios2 to prevent a compiler
bug.

Fixes:
http://autobuild.buildroot.net/results/3afc4c006a74fd7512dace90b5f884bf7be4cc58/
http://autobuild.buildroot.net/results/2c53f611a705506ca86fedb0f1129df1d315632c/
http://autobuild.buildroot.net/results/c3d9477688b55987591b5b5efed5ee65499aa0e6/
http://autobuild.buildroot.net/results/052ff24f3985b652c11ac390f342e9ad3d862431/
...

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/libcap-ng/Config.in      | 1 -
 package/libcap-ng/libcap-ng.hash | 2 +-
 package/libcap-ng/libcap-ng.mk   | 7 ++++++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/libcap-ng/Config.in b/package/libcap-ng/Config.in
index 4939e262ac62..d1663cdefc20 100644
--- a/package/libcap-ng/Config.in
+++ b/package/libcap-ng/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBCAP_NG
 	bool "libcap-ng"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII # triggers compiler bug
 	help
 	  The libcap-ng library is intended to make programming with
 	  posix capabilities much easier than the traditional libcap
diff --git a/package/libcap-ng/libcap-ng.hash b/package/libcap-ng/libcap-ng.hash
index d8dde2360e52..ecea6e88416b 100644
--- a/package/libcap-ng/libcap-ng.hash
+++ b/package/libcap-ng/libcap-ng.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	48a2083276f9820cb92dcb05d001b30733bcbf48c14c230303cac3cd08b45b6b	libcap-ng-0.7.4.tar.gz
+sha256	615549ce39b333f6b78baee0c0b4ef18bc726c6bf1cca123dfd89dd963f6d06b  libcap-ng-0.7.7.tar.gz
diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index c2ae25bc5b91..6b84a8cfe566 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_NG_VERSION = 0.7.4
+LIBCAP_NG_VERSION = 0.7.7
 LIBCAP_NG_SITE = http://people.redhat.com/sgrubb/libcap-ng
 LIBCAP_NG_LICENSE = GPLv2+ LGPLv2.1+
 LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
@@ -13,4 +13,9 @@ LIBCAP_NG_INSTALL_STAGING = YES
 LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
 LIBCAP_NG_CONF_OPTS = --without-python
 
+# disable optimization when compiling for nios2 to prevent a compiler bug
+#ifeq ($(BR2_nios2),y)
+#LIBCAP_NG_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O0"
+#endif
+
 $(eval $(autotools-package))
-- 
1.9.1
