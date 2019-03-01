From: =?UTF-8?q?DUPONCHEEL=20S=C3=A9bastien?= <sebastien.duponcheel@corp.ovh.com>
Date: Fri,  1 Mar 2019 12:30:23 +0100
Subject: [Buildroot] [PATCH 1/1] shadowsocks-libev: bump to version 3.2.4
Message-ID: <1551439823-17797-1-git-send-email-sebastien.duponcheel@corp.ovh.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: DUPONCHEEL S?bastien <sebastien.duponcheel@corp.ovh.com>
---
 ...c-fix-static-build-with-netfilter_conntra.patch | 31 ----------------------
 package/shadowsocks-libev/shadowsocks-libev.hash   |  2 +-
 package/shadowsocks-libev/shadowsocks-libev.mk     |  4 +--
 3 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 package/shadowsocks-libev/0001-configure.ac-fix-static-build-with-netfilter_conntra.patch

diff --git a/package/shadowsocks-libev/0001-configure.ac-fix-static-build-with-netfilter_conntra.patch b/package/shadowsocks-libev/0001-configure.ac-fix-static-build-with-netfilter_conntra.patch
deleted file mode 100644
index 7ddb140..0000000
--- a/package/shadowsocks-libev/0001-configure.ac-fix-static-build-with-netfilter_conntra.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 9b4aebc840f444e5aa83633838e3890cec523017 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 18 Jan 2019 21:05:34 +0100
-Subject: [PATCH] configure.ac: fix static build with netfilter_conntrack
-
-Fixes:
- - http://autobuild.buildroot.org/results/22a28e8fd8182e1c908541dbc5b0ee087c3803e6
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://github.com/shadowsocks/shadowsocks-libev/pull/2270]
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index a706591..c6dab8b 100755
---- a/configure.ac
-+++ b/configure.ac
-@@ -256,7 +256,7 @@ if test x"$enable_connmarktos" = "xyes" ; then
- 	        if test x"$enable_connmarktos" = "xyes"; then
- 	            AC_MSG_ERROR([--enable-connmarktos specified but libnetfilter-conntrack library not found])
- 	        fi
--	        with_netfilter_conntrack=no])
-+	        with_netfilter_conntrack=no], [-lnfnetlink])
- 	    AC_CHECK_HEADERS([libnetfilter_conntrack/libnetfilter_conntrack.h \
- 	        libnetfilter_conntrack/libnetfilter_conntrack_tcp.h],,[
- 	        if test x"$enable_connmarktos" = "xyes"; then
--- 
-2.14.1
-
diff --git a/package/shadowsocks-libev/shadowsocks-libev.hash b/package/shadowsocks-libev/shadowsocks-libev.hash
index a7c0dc0..b8bc437 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.hash
+++ b/package/shadowsocks-libev/shadowsocks-libev.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 2befc27b1cc62af0450702343d17e347936f0d4e3d4b04ba9246c4f9b409b742 shadowsocks-libev-3.2.3.tar.gz
+sha256 65a67c355df1794dc0ef94d80d2d596fd590b13fdcd0a21bda28859c88924ce5 shadowsocks-libev-3.2.4.tar.gz
 
 # License files, locally calculated
 sha256 736883f97d44dbec288bb82819f18f4f86d02ae3192f6a9abefa00db76bace41  COPYING
diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
index c2c33b7..fcebe34 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.mk
+++ b/package/shadowsocks-libev/shadowsocks-libev.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-SHADOWSOCKS_LIBEV_VERSION = 3.2.3
+SHADOWSOCKS_LIBEV_VERSION = 3.2.4
 SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$(SHADOWSOCKS_LIBEV_VERSION)
 SHADOWSOCKS_LIBEV_LICENSE = GPL-3.0+, BSD-2-Clause (libbloom), BSD-3-Clause (libcork, libipset)
 SHADOWSOCKS_LIBEV_LICENSE_FILES = COPYING libbloom/LICENSE libcork/COPYING
 SHADOWSOCKS_LIBEV_DEPENDENCIES = host-pkgconf c-ares libev libsodium mbedtls pcre
 SHADOWSOCKS_LIBEV_INSTALL_STAGING = YES
-# We're patching configure.ac
-SHADOWSOCKS_LIBEV_AUTORECONF = YES
 SHADOWSOCKS_LIBEV_CONF_OPTS = \
 	--with-pcre=$(STAGING_DIR)/usr \
 	--disable-ssp
-- 
2.7.4
