From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 26 Jun 2017 12:25:38 -0400
Subject: [Buildroot] [PATCH v3 3/3] libressl: new package
In-Reply-To: <20170626162538.27101-1-aduskett@codeblue.com>
References: <20170626162538.27101-1-aduskett@codeblue.com>
Message-ID: <20170626162538.27101-3-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libressl is a fork of openssl from OpenSSL in 2014.  Its goal is to
modernize the OpenSSL codebase, improve security, and apply best
practice development processes.

Right now, libressl is API compatible with OpenSSL 1.0.1, but does not
yet include all new APIs from OpenSSL 1.0.2 and later.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
Changes v2 -> v3:
  - Moved this patch to the end of the series. (Thomas)
  - Removed Config.in thanks to the new libssl. (Thomas)
  - Dropped host-autotools-package for now. (Arnout)

Changes v1 -> v2:
  - Changed from github to openbsd ftp. This is a all-in-one tarball
    that negates having to use the POST_PATCH_HOOKS. (Thomas)
  - Added 0001-remove-test-z-DESTDIR-from-ltmain.patch, this allows
    ltmain.sh to be patched with buildroot-libtool-v2.4.patch, which
    removes the need for a call to autogen.sh.
  - Changed sha256sum to reflect new tarball.
  - Changed Locally computed to openbsd ftp hash list in hash file. (Arnout)
  - Added DEVELOPERS changes to this patch. (Thomas)
  - Fixed formatting in commit message. (Thomas)
  - Removed "and scripts" from Config.in (Arnout)

 DEVELOPERS                                         |  1 +
 .../0001-remove-test-z-DESTDIR-from-ltmain.patch   | 28 ++++++++++++++++++++++
 package/libressl/libressl.hash                     |  2 ++
 package/libressl/libressl.mk                       | 22 +++++++++++++++++
 package/libssl/Config.in                           | 23 ++++++++++++++++--
 5 files changed, 74 insertions(+), 2 deletions(-)
 create mode 100644 package/libressl/0001-remove-test-z-DESTDIR-from-ltmain.patch
 create mode 100644 package/libressl/libressl.hash
 create mode 100644 package/libressl/libressl.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e421f4..b9f9d9d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -34,6 +34,7 @@ F:	package/audit/
 F:	package/checkpolicy/
 F:	package/gstreamer1/gst1-vaapi/
 F:	package/janus-gateway/
+F:	package/libressl/
 F:	package/libselinux/
 F:	package/libsemanage/
 F:	package/libsepol/
diff --git a/package/libressl/0001-remove-test-z-DESTDIR-from-ltmain.patch b/package/libressl/0001-remove-test-z-DESTDIR-from-ltmain.patch
new file mode 100644
index 0000000..901a48c
--- /dev/null
+++ b/package/libressl/0001-remove-test-z-DESTDIR-from-ltmain.patch
@@ -0,0 +1,28 @@
+From 4317d43d74996ad7ec3270b1e786e91a19312309 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Adamduskett@outlook.com>
+Date: Sat, 24 Jun 2017 13:08:57 -0400
+Subject: [PATCH] remove test -z "$DESTDIR" from ltmain.sh.
+
+Without this patch, buildroot-libtool-v2.4.patch will fail to apply.
+
+Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+---
+ ltmain.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ltmain.sh b/ltmain.sh
+index 5d29bd6..6c90601 100644
+--- a/ltmain.sh
++++ b/ltmain.sh
+@@ -6658,7 +6658,7 @@ func_mode_link ()
+ 	  *)
+ 	    if test "$installed" = no; then
+ 	      func_append notinst_deplibs " $lib"
+-	      test -z "$DESTDIR" && need_relink=yes
++	      need_relink=yes
+ 	    fi
+ 	    ;;
+ 	  esac
+-- 
+2.9.4
+
diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
new file mode 100644
index 0000000..9ffe964
--- /dev/null
+++ b/package/libressl/libressl.hash
@@ -0,0 +1,2 @@
+# From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
+sha256	107a5b522fbb8318d4c3be668075e5e607296f0a9255d71674caa94571336efa	libressl-2.5.4.tar.gz
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
new file mode 100644
index 0000000..ca8bf34
--- /dev/null
+++ b/package/libressl/libressl.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# libressl
+#
+################################################################################
+
+LIBRESSL_VERSION = 2.5.4
+LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
+LIBRESSL_LICENSE = ISC (New additions), OpenSSL or SSLeay (Original OpenSSL code)
+LIBRESSL_LICENSE_FILES = COPYING
+LIBRESSL_INSTALL_STAGING = YES
+LIBRESSL_PROVIDES = libssl
+
+ifeq ($(BR2_PACKAGE_LIBRESSL_BIN),)
+define LIBRESSL_REMOVE_BIN
+	$(RM) -f $(TARGET_DIR)/usr/bin/openssl
+endef
+LIBRESSL_POST_INSTALL_TARGET_HOOKS += LIBRESSL_REMOVE_BIN
+endif
+
+$(eval $(autotools-package))
diff --git a/package/libssl/Config.in b/package/libssl/Config.in
index 5b912e6..5f81348 100644
--- a/package/libssl/Config.in
+++ b/package/libssl/Config.in
@@ -9,7 +9,7 @@ choice
 	prompt "libssl variant"
 	default BR2_PACKAGE_OPENSSL
 	help
-	  Select OpenSSL
+	  Select OpenSSL or LibreSSL
 
 config BR2_PACKAGE_OPENSSL
 	bool "openssl"
@@ -25,6 +25,16 @@ config BR2_PACKAGE_OPENSSL
 	  http://www.openssl.org/
 	  Note: Some helper scripts need perl.
 
+config BR2_PACKAGE_LIBRESSL
+	bool "libressl"
+	select BR2_PACKAGE_HAS_LIBSSL
+	help
+	  LibreSSL is a version of the TLS/crypto stack forked from
+	  OpenSSL in 2014, with goals of modernizing the codebase,
+	  improving security, and applying best practice development
+	  processes.
+
+	  http://www.libressl.org/
 endchoice
 
 if BR2_PACKAGE_OPENSSL
@@ -43,11 +53,20 @@ config BR2_PACKAGE_OPENSSL_ENGINES
 
 endif
 
+if BR2_PACKAGE_LIBRESSL
+
+config BR2_PACKAGE_LIBRESSL_BIN
+	bool "openssl binary"
+	help
+	  Install the openssl binary to the target file system. This is
+	  a command line tool for doing various cryptographic stuff.
+
+endif
 config BR2_PACKAGE_HAS_LIBSSL
 	bool
 
 config BR2_PACKAGE_PROVIDES_LIBSSL
 	string
 	default "openssl"    if BR2_PACKAGE_OPENSSL
-
+	default "libressl"   if BR2_PACKAGE_LIBRESSL
 endif
-- 
2.9.4
