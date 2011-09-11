From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] squid: bump to version 3.1.15
Message-ID: <20110912052630.53F7D8D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f9fe656ca4c07940df260c7d340832675be7c5c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/squid/squid-cross-compile.patch |   65 -------------------------------
 package/squid/squid.mk                  |    5 +-
 2 files changed, 2 insertions(+), 68 deletions(-)
 delete mode 100644 package/squid/squid-cross-compile.patch

diff --git a/package/squid/squid-cross-compile.patch b/package/squid/squid-cross-compile.patch
deleted file mode 100644
index 98424ae..0000000
--- a/package/squid/squid-cross-compile.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-diff -Nura squid-3.1.10.orig/configure.ac squid-3.1.10/configure.ac
---- squid-3.1.10.orig/configure.ac	2010-12-22 02:48:27.000000000 -0300
-+++ squid-3.1.10/configure.ac	2010-12-22 11:31:08.420533635 -0300
-@@ -384,7 +384,7 @@
- 
- dnl Nasty hack to get autoconf 2.64 on Linux to run.
- dnl all other uses of RUN_IFELSE are wrapped inside CACHE_CHECK which breaks on 2.64
--AC_RUN_IFELSE([AC_LANG_SOURCE([[ int main(int argc, char **argv) { return 0; } ]])],[],[],[:])
-+dnl AC_RUN_IFELSE([AC_LANG_SOURCE([[ int main(int argc, char **argv) { return 0; } ]])],[],[],[:])
- 
- dnl This is a developer only option.. developers know how to set defines
- dnl
-@@ -1889,7 +1889,7 @@
-     AC_MSG_NOTICE([Negotiate auth helpers built: $NEGOTIATE_AUTH_HELPERS])
- fi
- AC_SUBST(NEGOTIATE_AUTH_HELPERS)
--AC_CONFIG_SUBDIRS(helpers/negotiate_auth/squid_kerb_auth)
-+dnl AC_CONFIG_SUBDIRS(helpers/negotiate_auth/squid_kerb_auth)
- 
- dnl Select digest auth scheme helpers to build
- if test -n "$AUTH_MODULE_digest"; then
-@@ -2202,6 +2202,18 @@
- 	;;
- esac
- 
-+dnl Define CXX_FOR_BUILD
-+CXX_FOR_BUILD="$CXX_FOR_BUILD"
-+AC_SUBST(CXX_FOR_BUILD)
-+
-+dnl Define CXXFLAGS_FOR_BUILD
-+CXXFLAGS_FOR_BUILD="$CXXFLAGS_FOR_BUILD"
-+AC_SUBST(CXXFLAGS_FOR_BUILD)
-+
-+dnl Define LDFLAGS_FOR_BUILD
-+LDFLAGS_FOR_BUILD="$LDFLAGS_FOR_BUILD"
-+AC_SUBST(LDFLAGS_FOR_BUILD)
-+
- dnl Check for programs
- AC_PROG_CPP
- AC_PROG_INSTALL
-diff -Nura squid-3.1.10.orig/src/Makefile.am squid-3.1.10/src/Makefile.am
---- squid-3.1.10.orig/src/Makefile.am	2010-12-22 02:46:56.000000000 -0300
-+++ squid-3.1.10/src/Makefile.am	2010-12-22 11:31:08.422533643 -0300
-@@ -195,8 +195,6 @@
- cf_gen_SOURCES = cf_gen.cc
- nodist_cf_gen_HEADER = cf_gen_defines.cci
- cf_gen_LDADD= \
--	../compat/libcompat.la \
--	-L../lib -lmiscutil \
- 	$(EPOLL_LIBS) \
- 	$(MINGW_LIBS) \
- 	$(XTRA_LIBS)
-@@ -753,6 +751,12 @@
- squid.conf.default squid.conf.documented: cf_parser.cci
- 	true
- 
-+cf_gen$(EXEEXT): $(cf_gen_OBJECTS) $(cf_gen_DEPENDENCIES)
-+	$(CXX_FOR_BUILD) $(CXXFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD) -o $@ $(srcdir)/cf_gen.cc \
-+		$(top_srcdir)/lib/util.c \
-+		$(top_srcdir)/compat/assert.cc \
-+		$(cf_gen_LDADD) $(LIBS) ${INCLUDES}
-+
- cf_parser.cci: cf.data cf_gen$(EXEEXT)
- 	./cf_gen cf.data $(srcdir)/cf.data.depend
- 
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 2184f1a..fbcdc48 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,13 +4,12 @@
 #
 #############################################################
 
-SQUID_VERSION = 3.1.14
+SQUID_VERSION = 3.1.15
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/3.1
 SQUID_DEPENDENCIES = libcap host-libcap
-SQUID_AUTORECONF = YES
 SQUID_CONF_ENV =	ac_cv_epoll_works=yes ac_cv_func_setresuid=yes \
 			ac_cv_func_va_copy=yes ac_cv_func___va_copy=yes \
-			ac_cv_func_strnstr=no
+			ac_cv_func_strnstr=no ac_cv_have_squid=yes
 SQUID_CONF_OPT =	--enable-wccp --enable-wccpv2 --enable-async-io=8 \
 			--enable-htcp --enable-snmp --enable-linux-netfilter \
 			--enable-removal-policies="lru,heap" \
-- 
1.7.3.4
