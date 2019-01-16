From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 16 Jan 2019 22:02:28 +0100
Subject: [Buildroot] [PATCH 1/2] package/libupnpp: bump to version 0.17.0
Message-ID: <20190116210229.4992-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libupnpp 0.17.0 adds compatibility for libupnp 1.8. Therefore, we prefer
selecting libupnp 1.8 and falling back to libupnp 1.6.

Drop patch 0001, which has been merged upstream.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...-compilation-with-uclibc-on-arm-m68k.patch | 36 -------------------
 package/libupnpp/Config.in                    |  2 +-
 package/libupnpp/libupnpp.hash                |  4 +--
 package/libupnpp/libupnpp.mk                  |  2 +-
 4 files changed, 4 insertions(+), 40 deletions(-)
 delete mode 100644 package/libupnpp/0001-Fix-cross-compilation-with-uclibc-on-arm-m68k.patch

diff --git a/package/libupnpp/0001-Fix-cross-compilation-with-uclibc-on-arm-m68k.patch b/package/libupnpp/0001-Fix-cross-compilation-with-uclibc-on-arm-m68k.patch
deleted file mode 100644
index 2c0a4ec79f..0000000000
--- a/package/libupnpp/0001-Fix-cross-compilation-with-uclibc-on-arm-m68k.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 2828c2535d4380419ec5114cc3a0564d3686aba9 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 4 May 2018 11:45:59 +0200
-Subject: [PATCH] Fix cross-compilation with uclibc on arm/m68k
-
-Commit 3f1132ecd27186fa3f1a87ead6a0389802baccbb breaks cross-compilation
-with uclibc on arm and m68k because host_os is set to
-arm-buildroot-uclinux-uclibc or m68k-buildroot-uclinux-uclibc so add
-uclinux to the linux case
-
-Fixes:
- - http://autobuild.buildroot.net/results/cfb332a169863bcb3e6bc6ee7d6f6199f856b0b8
- - http://autobuild.buildroot.net/results/2f6f464f6360ed9ea4c238f503d2c3b8ab3cbd86
-
-[Sent upstream]: https://opensourceprojects.eu/p/libupnpp/code/merge-requests/3
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 8903b72..3bb354c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -35,7 +35,7 @@ build_linux=no
- build_mac=no
- # Detect the target system
- case "${host_os}" in
--    linux*) build_linux=yes;;
-+    linux*|uclinux*) build_linux=yes;;
-     darwin*) build_mac=yes;;
-     *) AC_MSG_ERROR(["OS $host_os is not supported"]);;
- esac
--- 
-2.14.1
-
diff --git a/package/libupnpp/Config.in b/package/libupnpp/Config.in
index 32877ff56c..a71eff5423 100644
--- a/package/libupnpp/Config.in
+++ b/package/libupnpp/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBUPNPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBCURL
-	select BR2_PACKAGE_LIBUPNP
+	select BR2_PACKAGE_LIBUPNP18 if !BR2_PACKAGE_LIBUPNP
 	help
 	  The libupnpp C++ library wraps libupnp for easier use by
 	  upmpdcli and upplay.
diff --git a/package/libupnpp/libupnpp.hash b/package/libupnpp/libupnpp.hash
index 742a0c7f62..f08c3a4f27 100644
--- a/package/libupnpp/libupnpp.hash
+++ b/package/libupnpp/libupnpp.hash
@@ -1,5 +1,5 @@
-# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.16.1.tar.gz.sha256
-sha256  d2ab5a4bb6df035ddddd11542bd4631ab7031354259145f07fbc3c56a8f50fac  libupnpp-0.16.1.tar.gz
+# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.17.0.tar.gz.sha256
+sha256  7035dda48207c254cbd8cd64e4e679a9e5f085a35d28c19bc2ddeba0deaff58b  libupnpp-0.17.0.tar.gz
 
 # Hash for license file:
 sha256  00a89b0d18aacd4114decf79122db87bf35bddaf2bc50e383c9c9f4c263390b2  COPYING
diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index 852a72e822..69ce0768a9 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNPP_VERSION = 0.16.1
+LIBUPNPP_VERSION = 0.17.0
 LIBUPNPP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 LIBUPNPP_LICENSE = LGPL-2.1+
 LIBUPNPP_LICENSE_FILES = COPYING
-- 
2.20.1
