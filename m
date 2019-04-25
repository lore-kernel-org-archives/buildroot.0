From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu, 25 Apr 2019 12:46:19 -0400
Subject: [Buildroot] [PATCH 1/1] package/libressl: bump to version 2.9.1
Message-ID: <20190425164619.29273-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

LibreSSL 2.9.1 now has a test that requires libtls.a, however, when building a
shared library only build, the --disable-static flag is passed to libressl,
which prevents the building of libtls.a.

With libtls.a not being built, the following error occurs:
libressl-2.9.1/tls/.libs/libtls.a', needed by 'handshake_table'.  Stop.

There are three options to fix this:
1) Stick with autotools, and provide a patch that removes building anything in
   the tests folder.
2) Pass --enable-static to LIBRESSL_CONF_OPTS
3) Change the package type to cmake, as a cmake build does not have this issue.

Changing the package type to cmake is the least impactful, it also has the added
benefit of being able to remove the 0001-remove-test-z-DESTDIR-from-ltmain.patch
file.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 ...01-remove-test-z-DESTDIR-from-ltmain.patch | 28 -------------------
 package/libressl/libressl.hash                |  2 +-
 package/libressl/libressl.mk                  |  4 +--
 3 files changed, 3 insertions(+), 31 deletions(-)
 delete mode 100644 package/libressl/0001-remove-test-z-DESTDIR-from-ltmain.patch

diff --git a/package/libressl/0001-remove-test-z-DESTDIR-from-ltmain.patch b/package/libressl/0001-remove-test-z-DESTDIR-from-ltmain.patch
deleted file mode 100644
index 901a48ca93..0000000000
--- a/package/libressl/0001-remove-test-z-DESTDIR-from-ltmain.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 4317d43d74996ad7ec3270b1e786e91a19312309 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <Adamduskett@outlook.com>
-Date: Sat, 24 Jun 2017 13:08:57 -0400
-Subject: [PATCH] remove test -z "$DESTDIR" from ltmain.sh.
-
-Without this patch, buildroot-libtool-v2.4.patch will fail to apply.
-
-Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
----
- ltmain.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ltmain.sh b/ltmain.sh
-index 5d29bd6..6c90601 100644
---- a/ltmain.sh
-+++ b/ltmain.sh
-@@ -6658,7 +6658,7 @@ func_mode_link ()
- 	  *)
- 	    if test "$installed" = no; then
- 	      func_append notinst_deplibs " $lib"
--	      test -z "$DESTDIR" && need_relink=yes
-+	      need_relink=yes
- 	    fi
- 	    ;;
- 	  esac
--- 
-2.9.4
-
diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index a98f344677..9e5cbf22e9 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256 9b640b13047182761a99ce3e4f000be9687566e0828b4a72709e9e6a3ef98477  libressl-2.8.3.tar.gz
+sha256 39e4dd856694dc10d564201e4549c46d2431601a2b10f3422507e24ccc8f62f8  libressl-2.9.1.tar.gz
 # Locally computed
 sha256 5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index e02ab90269..4e9796d3ab 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 2.8.3
+LIBRESSL_VERSION = 2.9.1
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
@@ -17,4 +17,4 @@ endef
 LIBRESSL_POST_INSTALL_TARGET_HOOKS += LIBRESSL_REMOVE_BIN
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.20.1
