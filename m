From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 18 Jan 2019 21:20:34 +0100
Subject: [Buildroot] [PATCH 1/1] shadowsocks-libev: fix static build with
 netfilter_conntrack
Message-ID: <20190118202034.1534-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/22a28e8fd8182e1c908541dbc5b0ee087c3803e6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...c-fix-static-build-with-netfilter_conntra.patch | 31 ++++++++++++++++++++++
 package/shadowsocks-libev/shadowsocks-libev.mk     |  2 ++
 2 files changed, 33 insertions(+)
 create mode 100644 package/shadowsocks-libev/0001-configure.ac-fix-static-build-with-netfilter_conntra.patch

diff --git a/package/shadowsocks-libev/0001-configure.ac-fix-static-build-with-netfilter_conntra.patch b/package/shadowsocks-libev/0001-configure.ac-fix-static-build-with-netfilter_conntra.patch
new file mode 100644
index 0000000000..7ddb140e8d
--- /dev/null
+++ b/package/shadowsocks-libev/0001-configure.ac-fix-static-build-with-netfilter_conntra.patch
@@ -0,0 +1,31 @@
+From 9b4aebc840f444e5aa83633838e3890cec523017 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 18 Jan 2019 21:05:34 +0100
+Subject: [PATCH] configure.ac: fix static build with netfilter_conntrack
+
+Fixes:
+ - http://autobuild.buildroot.org/results/22a28e8fd8182e1c908541dbc5b0ee087c3803e6
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://github.com/shadowsocks/shadowsocks-libev/pull/2270]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index a706591..c6dab8b 100755
+--- a/configure.ac
++++ b/configure.ac
+@@ -256,7 +256,7 @@ if test x"$enable_connmarktos" = "xyes" ; then
+ 	        if test x"$enable_connmarktos" = "xyes"; then
+ 	            AC_MSG_ERROR([--enable-connmarktos specified but libnetfilter-conntrack library not found])
+ 	        fi
+-	        with_netfilter_conntrack=no])
++	        with_netfilter_conntrack=no], [-lnfnetlink])
+ 	    AC_CHECK_HEADERS([libnetfilter_conntrack/libnetfilter_conntrack.h \
+ 	        libnetfilter_conntrack/libnetfilter_conntrack_tcp.h],,[
+ 	        if test x"$enable_connmarktos" = "xyes"; then
+-- 
+2.14.1
+
diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
index e8ca161477..c2c33b7aa5 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.mk
+++ b/package/shadowsocks-libev/shadowsocks-libev.mk
@@ -10,6 +10,8 @@ SHADOWSOCKS_LIBEV_LICENSE = GPL-3.0+, BSD-2-Clause (libbloom), BSD-3-Clause (lib
 SHADOWSOCKS_LIBEV_LICENSE_FILES = COPYING libbloom/LICENSE libcork/COPYING
 SHADOWSOCKS_LIBEV_DEPENDENCIES = host-pkgconf c-ares libev libsodium mbedtls pcre
 SHADOWSOCKS_LIBEV_INSTALL_STAGING = YES
+# We're patching configure.ac
+SHADOWSOCKS_LIBEV_AUTORECONF = YES
 SHADOWSOCKS_LIBEV_CONF_OPTS = \
 	--with-pcre=$(STAGING_DIR)/usr \
 	--disable-ssp
-- 
2.14.1
