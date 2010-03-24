From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 24 Mar 2010 09:00:57 +0100
Subject: [Buildroot] [git commit master] New package squid 3.0.STABLE21
Message-ID: <20100324082326.2D1DC776F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ffe25f05ef5b5d4928fc11eeeead837fbc6b4c66
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #513

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                 |    3 +-
 package/Config.in                       |    1 +
 package/squid/Config.in                 |   10 ++++++++
 package/squid/squid-cross-compile.patch |   31 +++++++++++++++++++++++++++
 package/squid/squid.mk                  |   35 +++++++++++++++++++++++++++++++
 5 files changed, 79 insertions(+), 1 deletions(-)
 create mode 100644 package/squid/Config.in
 create mode 100644 package/squid/squid-cross-compile.patch
 create mode 100644 package/squid/squid.mk

diff --git a/CHANGES b/CHANGES
index 7cf730d..da17e0d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,7 +5,7 @@
 
 	X.org updated to 7.5.
 
-	New packages: librsync, lmbench
+	New packages: librsync, lmbench, squid
 
 	Updated/fixed packages: busybox, dosfstools, e2fsprogs,
 	freetype, iperf, libglib2, libpng, mdadm, memstat, mtd-utils,
@@ -13,6 +13,7 @@
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#513: Add new squid package
 	#661: lmbench: new package
 	#800: [PATCH] iperf update to 2.0.4
 	#805: [PATCH] mdadm - version update
diff --git a/package/Config.in b/package/Config.in
index 8504f23..3070264 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -201,6 +201,7 @@ source "package/samba/Config.in"
 source "package/ser2net/Config.in"
 source "package/socat/Config.in"
 source "package/spawn-fcgi/Config.in"
+source "package/squid/Config.in"
 source "package/stunnel/Config.in"
 source "package/tcpdump/Config.in"
 source "package/tcpreplay/Config.in"
diff --git a/package/squid/Config.in b/package/squid/Config.in
new file mode 100644
index 0000000..587ddbe
--- /dev/null
+++ b/package/squid/Config.in
@@ -0,0 +1,10 @@
+comment "Squid requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_SQUID
+	bool "squid"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Caching proxy for the Web supporting HTTP, HTTPS, FTP, and more.
+
+	  http://www.squid-cache.org/
diff --git a/package/squid/squid-cross-compile.patch b/package/squid/squid-cross-compile.patch
new file mode 100644
index 0000000..efd2301
--- /dev/null
+++ b/package/squid/squid-cross-compile.patch
@@ -0,0 +1,31 @@
+diff -Nura squid-3.0.STABLE17/configure.in squid-3.0.STABLE17.cross/configure.in
+--- squid-3.0.STABLE17/configure.in	2009-07-26 09:24:48.000000000 -0300
++++ squid-3.0.STABLE17.cross/configure.in	2009-07-30 11:54:28.000000000 -0300
+@@ -1895,6 +1895,10 @@
+ 	;;
+ esac
+ 
++dnl Define CXX_FOR_BUILD
++CXX_FOR_BUILD="$CXX_FOR_BUILD"
++AC_SUBST(CXX_FOR_BUILD)
++
+ dnl Check for programs
+ AC_PROG_CPP
+ AC_PROG_INSTALL
+diff -Nura squid-3.0.STABLE17/src/Makefile.am squid-3.0.STABLE17.cross/src/Makefile.am
+--- squid-3.0.STABLE17/src/Makefile.am	2009-07-26 09:24:46.000000000 -0300
++++ squid-3.0.STABLE17.cross/src/Makefile.am	2009-07-30 11:55:08.000000000 -0300
+@@ -1034,6 +1034,13 @@
+ squid.conf.default: cf_parser.h
+ 	true
+ 
++CXX_FOR_BUILD ?= @CXX_FOR_BUILD@
++
++cf_gen$(EXEEXT): $(cf_gen_SOURCES) $(cf_gen_DEPENDENCIES)
++	$(CXX_FOR_BUILD) -o $@ $(srcdir)/cf_gen.cc \
++		$(top_srcdir)/lib/util.c $(top_srcdir)/lib/assert.c \
++		-DNDEBUG -DBUILD_HOST_TOOL ${INCLUDES}
++
+ cf_parser.h: cf.data cf_gen$(EXEEXT)
+ 	./cf_gen cf.data $(srcdir)/cf.data.depend
+ 
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
new file mode 100644
index 0000000..6e94d50
--- /dev/null
+++ b/package/squid/squid.mk
@@ -0,0 +1,35 @@
+#############################################################
+#
+# squid
+#
+#############################################################
+
+SQUID_VERSION = 3.0.STABLE21
+SQUID_SOURCE = squid-$(SQUID_VERSION).tar.bz2
+SQUID_SITE = http://www.squid-cache.org/Versions/v3/3.0
+SQUID_AUTORECONF = YES
+SQUID_LIBTOOL_PATCH = NO
+SQUID_CONF_ENV =	ac_cv_epoll_works=yes ac_cv_func_setresuid=yes \
+			ac_cv_func_va_copy=yes ac_cv_func___va_copy=yes \
+			ac_cv_func_strnstr=no
+SQUID_CONF_OPT =	--disable-wccp --disable-wccp2 \
+			--disable-htcp --disable-snmp \
+			--enable-linux-netfilter \
+			--enable-storeio=ufs,diskd,aufs,null \
+			--enable-removal-policies="lru,heap" \
+			--with-aufs-threads=24 --with-filedescriptors=1024
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+	SQUID_CONF_OPT += --enable-ssl
+	SQUID_DEPENDENCIES += openssl
+endif
+
+$(eval $(call AUTOTARGETS,package,squid))
+
+$(SQUID_HOOK_POST_INSTALL):
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, \
+		RunCache RunAccel)
+	rm -f $(addprefix $(TARGET_DIR)/etc/, \
+		cachemgr.conf mime.conf.default squid.conf.default)
+	rm -f $(TARGET_DIR)/usr/libexec/cachemgr.cgi
+	rm -f $(TARGET_DIR)/usr/share/mib.txt
+	touch $@
-- 
1.6.3.3
