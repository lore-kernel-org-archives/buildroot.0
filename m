From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 29 Oct 2012 17:57:16 -0300
Subject: [Buildroot] [PATCH] squid: bump to version 3.2.3
Message-ID: <1351544236-23479-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/squid/Config.in |    2 ++
 package/squid/squid.mk  |   24 +++++++++++++++++-------
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/package/squid/Config.in b/package/squid/Config.in
index 4ec7fa4..8a77da8 100644
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_SQUID
 	bool "squid"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_INET_IPV6
+	# needs fork()
+	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBCAP
 	help
 	  Caching proxy for the Web supporting HTTP, HTTPS, FTP, and more.
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 52bfde0..fc58fce 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,20 +4,30 @@
 #
 #############################################################
 
-SQUID_VERSION = 3.1.20
-SQUID_SITE = http://www.squid-cache.org/Versions/v3/3.1
-SQUID_DEPENDENCIES = libcap host-libcap
+SQUID_VERSION = 3.2.3
+SQUID_SITE = http://www.squid-cache.org/Versions/v3/3.2
+SQUID_LICENSE = GPLv2+
+SQUID_LICENSE_FILES = COPYING
+SQUID_DEPENDENCIES = libcap host-libcap host-pkgconf \
+	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
 SQUID_CONF_ENV =	ac_cv_epoll_works=yes ac_cv_func_setresuid=yes \
 			ac_cv_func_va_copy=yes ac_cv_func___va_copy=yes \
 			ac_cv_func_strnstr=no ac_cv_have_squid=yes
-SQUID_CONF_OPT =	--enable-wccp --enable-wccpv2 --enable-async-io=8 \
-			--enable-htcp --enable-snmp --enable-linux-netfilter \
+SQUID_CONF_OPT =	--enable-async-io=8 --enable-linux-netfilter \
 			--enable-removal-policies="lru,heap" \
 			--with-filedescriptors=1024 --disable-ident-lookups \
-			--enable-auth="digest" --disable-strict-error-checking \
-			--enable-digest-auth-helpers="password" \
+			--enable-auth-basic="fake getpwnam" \
+			--enable-auth-digest="file" \
+			--enable-auth-negotiate="wrapper" \
+			--enable-auth-ntlm="fake" \
+			--disable-strict-error-checking \
 			--enable-external-acl-helpers="ip_user"
 
+# On uClibc librt needs libpthread
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)$(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),yy)
+	SQUID_CONF_ENV += ac_cv_search_shm_open="-lrt -lpthread"
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	SQUID_CONF_OPT += --enable-ssl
 	SQUID_DEPENDENCIES += openssl
-- 
1.7.8.6
