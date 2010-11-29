From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 29 Nov 2010 21:15:53 +0100
Subject: [Buildroot] [git commit master 1/1] squid: bump to version 3.1.9
Message-ID: <20101129201621.9EC958CA48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5cafae4f1a9b6f63a1b51d468035eff912ff4a16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2773

Fixes several security issues and host-openssl dependency for cf_gen.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                 |    3 +-
 package/squid/Config.in                 |    6 ++-
 package/squid/squid-cross-compile.patch |   56 ++++++++++++++++++++++--------
 package/squid/squid-susv3-legacy.patch  |   49 ---------------------------
 package/squid/squid.mk                  |   21 +++++------
 5 files changed, 57 insertions(+), 78 deletions(-)
 delete mode 100644 package/squid/squid-susv3-legacy.patch

diff --git a/CHANGES b/CHANGES
index fc15f3f..ea4bfce 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,11 +2,12 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: libgcrypt, qt, sysstat, tcpdump,
+	Updated/fixed packages: libgcrypt, qt, squid, sysstat, tcpdump,
 	xserver-xorg
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#2773: squid with openssl support needs openssl on the host
 	#2857: OBJDUMP definition is missing from TARGET_CONFIGURE_OPTS
 
 2010.11-rc2, Released November 25th, 2010:
diff --git a/package/squid/Config.in b/package/squid/Config.in
index 587ddbe..4ec7fa4 100644
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -1,9 +1,11 @@
-comment "Squid requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "Squid requires a toolchain with C++ and IPv6 support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_INET_IPV6
 
 config BR2_PACKAGE_SQUID
 	bool "squid"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_INET_IPV6
+	select BR2_PACKAGE_LIBCAP
 	help
 	  Caching proxy for the Web supporting HTTP, HTTPS, FTP, and more.
 
diff --git a/package/squid/squid-cross-compile.patch b/package/squid/squid-cross-compile.patch
index efd2301..6643b4d 100644
--- a/package/squid/squid-cross-compile.patch
+++ b/package/squid/squid-cross-compile.patch
@@ -1,7 +1,25 @@
-diff -Nura squid-3.0.STABLE17/configure.in squid-3.0.STABLE17.cross/configure.in
---- squid-3.0.STABLE17/configure.in	2009-07-26 09:24:48.000000000 -0300
-+++ squid-3.0.STABLE17.cross/configure.in	2009-07-30 11:54:28.000000000 -0300
-@@ -1895,6 +1895,10 @@
+diff -Nura squid-3.1.8.orig/configure.in squid-3.1.8/configure.in
+--- squid-3.1.8.orig/configure.in	2010-09-04 00:26:52.000000000 -0300
++++ squid-3.1.8/configure.in	2010-09-06 10:12:09.036622139 -0300
+@@ -366,7 +366,7 @@
+ 
+ dnl Nasty hack to get autoconf 2.64 on Linux to run.
+ dnl all other uses of RUN_IFELSE are wrapped inside CACHE_CHECK which breaks on 2.64
+-AC_RUN_IFELSE([AC_LANG_SOURCE([[ int main(int argc, char **argv) { return 0; } ]])],[],[],[:])
++dnl AC_RUN_IFELSE([AC_LANG_SOURCE([[ int main(int argc, char **argv) { return 0; } ]])],[],[],[:])
+ 
+ dnl This is a developer only option.. developers know how to set defines
+ dnl
+@@ -1802,7 +1802,7 @@
+     AC_MSG_NOTICE([Negotiate auth helpers built: $NEGOTIATE_AUTH_HELPERS])
+ fi
+ AC_SUBST(NEGOTIATE_AUTH_HELPERS)
+-AC_CONFIG_SUBDIRS(helpers/negotiate_auth/squid_kerb_auth)
++dnl AC_CONFIG_SUBDIRS(helpers/negotiate_auth/squid_kerb_auth)
+ 
+ dnl Select digest auth scheme helpers to build
+ if test -n "$AUTH_MODULE_digest"; then
+@@ -2115,6 +2115,10 @@
  	;;
  esac
  
@@ -12,20 +30,28 @@ diff -Nura squid-3.0.STABLE17/configure.in squid-3.0.STABLE17.cross/configure.in
  dnl Check for programs
  AC_PROG_CPP
  AC_PROG_INSTALL
-diff -Nura squid-3.0.STABLE17/src/Makefile.am squid-3.0.STABLE17.cross/src/Makefile.am
---- squid-3.0.STABLE17/src/Makefile.am	2009-07-26 09:24:46.000000000 -0300
-+++ squid-3.0.STABLE17.cross/src/Makefile.am	2009-07-30 11:55:08.000000000 -0300
-@@ -1034,6 +1034,13 @@
- squid.conf.default: cf_parser.h
+diff -Nura squid-3.1.8.orig/src/Makefile.am squid-3.1.8/src/Makefile.am
+--- squid-3.1.8.orig/src/Makefile.am	2010-09-04 00:25:57.000000000 -0300
++++ squid-3.1.8/src/Makefile.am	2010-09-06 10:11:27.319774138 -0300
+@@ -195,8 +195,6 @@
+ cf_gen_SOURCES = cf_gen.cc
+ nodist_cf_gen_HEADER = cf_gen_defines.cci
+ cf_gen_LDADD= \
+-	../compat/libcompat.la \
+-	-L../lib -lmiscutil \
+ 	$(EPOLL_LIBS) \
+ 	$(MINGW_LIBS) \
+ 	$(XTRA_LIBS)
+@@ -752,6 +750,12 @@
+ squid.conf.default squid.conf.documented: cf_parser.cci
  	true
  
-+CXX_FOR_BUILD ?= @CXX_FOR_BUILD@
-+
-+cf_gen$(EXEEXT): $(cf_gen_SOURCES) $(cf_gen_DEPENDENCIES)
++cf_gen$(EXEEXT): $(cf_gen_OBJECTS) $(cf_gen_DEPENDENCIES)
 +	$(CXX_FOR_BUILD) -o $@ $(srcdir)/cf_gen.cc \
-+		$(top_srcdir)/lib/util.c $(top_srcdir)/lib/assert.c \
-+		-DNDEBUG -DBUILD_HOST_TOOL ${INCLUDES}
++		$(top_srcdir)/lib/util.c \
++		$(top_srcdir)/compat/assert.cc \
++		$(cf_gen_LDADD) $(LIBS) ${INCLUDES}
 +
- cf_parser.h: cf.data cf_gen$(EXEEXT)
+ cf_parser.cci: cf.data cf_gen$(EXEEXT)
  	./cf_gen cf.data $(srcdir)/cf.data.depend
  
diff --git a/package/squid/squid-susv3-legacy.patch b/package/squid/squid-susv3-legacy.patch
deleted file mode 100644
index c3343bd..0000000
--- a/package/squid/squid-susv3-legacy.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-[PATCH]  replace susv3 legacy functions with modern equivalents
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- src/ESIVarState.cc     |    6 +++---
- src/HttpHeaderTools.cc |    2 +-
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-Index: squid-3.0.STABLE21/src/ESIVarState.cc
-===================================================================
---- squid-3.0.STABLE21.orig/src/ESIVarState.cc
-+++ squid-3.0.STABLE21/src/ESIVarState.cc
-@@ -207,7 +207,7 @@ ESIVariableUserAgent::getProductVersion 
- {
-     char const *t;
-     int len;
--    t = index (s,'/');
-+    t = strchr (s,'/');
- 
-     if (!t || !*(++t))
-         return xstrdup ("");
-@@ -382,12 +382,12 @@ ESIVariableUserAgent::ESIVariableUserAge
- 
-         if ((t = strstr (s, "MSIE"))) {
-             browser = ESI_BROWSER_MSIE;
--            t = index (t, ' ');
-+            t = strchr (t, ' ');
- 
-             if (!t)
-                 browserversion = xstrdup ("");
-             else {
--                t1 = index (t, ';');
-+                t1 = strchr (t, ';');
- 
-                 if (!t1)
-                     browserversion = xstrdup (t + 1);
-Index: squid-3.0.STABLE21/src/HttpHeaderTools.cc
-===================================================================
---- squid-3.0.STABLE21.orig/src/HttpHeaderTools.cc
-+++ squid-3.0.STABLE21/src/HttpHeaderTools.cc
-@@ -357,7 +357,7 @@ httpHeaderParseQuotedString (const char 
-     pos = start + 1;
- 
-     while (1) {
--        if (!(end = index (pos,'"'))) {
-+        if (!(end = strchr (pos,'"'))) {
-             debugs(66, 2, "failed to parse a quoted-string header field near '" << start << "'");
-             return 0;
-         }
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 6254b84..d45a473 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,20 +4,21 @@
 #
 #############################################################
 
-SQUID_VERSION = 3.0.STABLE21
-SQUID_SOURCE = squid-$(SQUID_VERSION).tar.bz2
-SQUID_SITE = http://www.squid-cache.org/Versions/v3/3.0
+SQUID_VERSION = 3.1.9
+SQUID_SITE = http://www.squid-cache.org/Versions/v3/3.1
+SQUID_DEPENDENCIES = libcap
 SQUID_AUTORECONF = YES
-SQUID_LIBTOOL_PATCH = NO
 SQUID_CONF_ENV =	ac_cv_epoll_works=yes ac_cv_func_setresuid=yes \
 			ac_cv_func_va_copy=yes ac_cv_func___va_copy=yes \
 			ac_cv_func_strnstr=no
-SQUID_CONF_OPT =	--disable-wccp --disable-wccp2 \
-			--disable-htcp --disable-snmp \
-			--enable-linux-netfilter \
-			--enable-storeio=ufs,diskd,aufs,null \
+SQUID_CONF_OPT =	--enable-wccp --enable-wccpv2 --enable-async-io=8 \
+			--enable-htcp --enable-snmp --enable-linux-netfilter \
 			--enable-removal-policies="lru,heap" \
-			--with-aufs-threads=24 --with-filedescriptors=1024
+			--with-filedescriptors=1024 --disable-ident-lookups \
+			--enable-auth="digest" \
+			--enable-digest-auth-helpers="password" \
+			--enable-external-acl-helpers="ip_user"
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	SQUID_CONF_OPT += --enable-ssl
 	SQUID_DEPENDENCIES += openssl
@@ -28,8 +29,6 @@ define SQUID_CLEANUP_TARGET
 		RunCache RunAccel)
 	rm -f $(addprefix $(TARGET_DIR)/etc/, \
 		cachemgr.conf mime.conf.default squid.conf.default)
-	rm -f $(TARGET_DIR)/usr/libexec/cachemgr.cgi
-	rm -f $(TARGET_DIR)/usr/share/mib.txt
 endef
 
 SQUID_POST_INSTALL_TARGET_HOOKS += SQUID_CLEANUP_TARGET
-- 
1.7.2.2
