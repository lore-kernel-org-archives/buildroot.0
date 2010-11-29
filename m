From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Nov 2010 21:15:53 +0100
Subject: [Buildroot] [git commit master 1/1] squid: needs host-libcap for
	cf_gen
Message-ID: <20101129201622.52E178CA48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b32c8f23e541eb42674104ba305bb64283ea2f0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/squid/squid-cross-compile.patch |   12 ++++++++++--
 package/squid/squid.mk                  |    2 +-
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/squid/squid-cross-compile.patch b/package/squid/squid-cross-compile.patch
index 6643b4d..f2ce705 100644
--- a/package/squid/squid-cross-compile.patch
+++ b/package/squid/squid-cross-compile.patch
@@ -19,7 +19,7 @@ diff -Nura squid-3.1.8.orig/configure.in squid-3.1.8/configure.in
  
  dnl Select digest auth scheme helpers to build
  if test -n "$AUTH_MODULE_digest"; then
-@@ -2115,6 +2115,10 @@
+@@ -2115,6 +2115,18 @@
  	;;
  esac
  
@@ -27,6 +27,14 @@ diff -Nura squid-3.1.8.orig/configure.in squid-3.1.8/configure.in
 +CXX_FOR_BUILD="$CXX_FOR_BUILD"
 +AC_SUBST(CXX_FOR_BUILD)
 +
++dnl Define CXXFLAGS_FOR_BUILD
++CXXFLAGS_FOR_BUILD="$CXXFLAGS_FOR_BUILD"
++AC_SUBST(CXXFLAGS_FOR_BUILD)
++
++dnl Define LDFLAGS_FOR_BUILD
++LDFLAGS_FOR_BUILD="$LDFLAGS_FOR_BUILD"
++AC_SUBST(LDFLAGS_FOR_BUILD)
++
  dnl Check for programs
  AC_PROG_CPP
  AC_PROG_INSTALL
@@ -47,7 +55,7 @@ diff -Nura squid-3.1.8.orig/src/Makefile.am squid-3.1.8/src/Makefile.am
  	true
  
 +cf_gen$(EXEEXT): $(cf_gen_OBJECTS) $(cf_gen_DEPENDENCIES)
-+	$(CXX_FOR_BUILD) -o $@ $(srcdir)/cf_gen.cc \
++	$(CXX_FOR_BUILD) $(CXXFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD) -o $@ $(srcdir)/cf_gen.cc \
 +		$(top_srcdir)/lib/util.c \
 +		$(top_srcdir)/compat/assert.cc \
 +		$(cf_gen_LDADD) $(LIBS) ${INCLUDES}
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index d45a473..313659f 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -6,7 +6,7 @@
 
 SQUID_VERSION = 3.1.9
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/3.1
-SQUID_DEPENDENCIES = libcap
+SQUID_DEPENDENCIES = libcap host-libcap
 SQUID_AUTORECONF = YES
 SQUID_CONF_ENV =	ac_cv_epoll_works=yes ac_cv_func_setresuid=yes \
 			ac_cv_func_va_copy=yes ac_cv_func___va_copy=yes \
-- 
1.7.2.2
