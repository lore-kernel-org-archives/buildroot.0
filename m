From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 23 Apr 2020 12:44:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/linknx: bump to version 0.0.1.38
Message-ID: <20200423104441.1029079-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop first and second patches (already in version)
- Retrieve third patch from upstream
- Retrieve an additionnal patch from upstream
- host-gettext is needed for AM_ICONV since
  https://github.com/linknx/linknx/commit/0512f6d0a07d50df33bfdca22d48360d164922a8
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Link-with-libiconv-if-needed.patch   | 30 ------------
 ...nfigure-ac-tweak-CPPUNIT-conditional.patch | 47 +++++++++++++++++++
 ...2-configure.ac-always-define-CPPUNIT.patch | 34 --------------
 ...akefile.am-fix-linking-with-log4cpp.patch} | 14 +++---
 package/linknx/linknx.hash                    |  4 +-
 package/linknx/linknx.mk                      |  4 +-
 6 files changed, 58 insertions(+), 75 deletions(-)
 delete mode 100644 package/linknx/0001-Link-with-libiconv-if-needed.patch
 create mode 100644 package/linknx/0001-configure-ac-tweak-CPPUNIT-conditional.patch
 delete mode 100644 package/linknx/0002-configure.ac-always-define-CPPUNIT.patch
 rename package/linknx/{0003-src-Makefile.am-fix-linking-with-log4cpp.patch => 0002-src-Makefile.am-fix-linking-with-log4cpp.patch} (85%)

diff --git a/package/linknx/0001-Link-with-libiconv-if-needed.patch b/package/linknx/0001-Link-with-libiconv-if-needed.patch
deleted file mode 100644
index 81b1fb7927..0000000000
--- a/package/linknx/0001-Link-with-libiconv-if-needed.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 87373f6c2b48619bb11e566e5eb16ea49d47beb7 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 19 Apr 2019 17:07:10 +0200
-Subject: [PATCH] Link with libiconv if needed
-
-Commit 2cc3a93dcf2703b3b418e0a99975f556354fb1b1 added an include to
-iconv which can be provided by libiconv so search and link for it if
-needed
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/linknx/linknx/pull/41]
----
- configure.ac | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure.ac b/configure.ac
-index 22f242c..779fd6f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -15,6 +15,7 @@ AC_CHECK_HEADER(argp.h,,[AC_MSG_ERROR([argp_parse not found])])
- AC_SEARCH_LIBS(argp_parse,argp,,[AC_MSG_ERROR([argp_parse not found])])
- 
- # Checks for libraries.
-+AC_SEARCH_LIBS(libiconv_open,iconv)
- LIBCURL_CHECK_CONFIG([yes], [7.14.0])
- 
- # Checks for header files.
--- 
-2.20.1
-
diff --git a/package/linknx/0001-configure-ac-tweak-CPPUNIT-conditional.patch b/package/linknx/0001-configure-ac-tweak-CPPUNIT-conditional.patch
new file mode 100644
index 0000000000..733e2927dd
--- /dev/null
+++ b/package/linknx/0001-configure-ac-tweak-CPPUNIT-conditional.patch
@@ -0,0 +1,47 @@
+From 8e7da14647dada5eee8f583b0814bffb31d1b91e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 21 Apr 2019 23:17:34 +0200
+Subject: [PATCH] configure.ac: tweak CPPUNIT conditional
+
+Following review of buildroot's patch
+(http://patchwork.ozlabs.org/patch/1088520), tweak CPPUNIT to move call
+to AM_CONDITIONAL outside condition
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/linknx/linknx/commit/8e7da14647dada5eee8f583b0814bffb31d1b91e]
+---
+ configure.ac | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 51d8ae66..4d9d8efa 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -135,22 +135,20 @@ if test x"$WITH_CPPUNIT" != xno; then
+       AC_DEFINE([HAVE_CPPUNIT], [1], [cppunit])
+       AC_SUBST(CPPUNIT_CFLAGS)
+       AC_SUBST(CPPUNIT_LIBS)
+-      AM_CONDITIONAL(CPPUNIT, true)
++      found_cppunit=yes
+     ],[
+       AC_MSG_RESULT([no])
+-      AM_CONDITIONAL(CPPUNIT, false)
+     ])
+   else
+     PKG_CHECK_MODULES(CPPUNIT, $CPPUNITPC >= 1.9.6, [
+       AC_DEFINE([HAVE_CPPUNIT], [1], [cppunit])
+       AC_SUBST(CPPUNIT_CFLAGS)
+       AC_SUBST(CPPUNIT_LIBS)
+-      AM_CONDITIONAL([CPPUNIT], true)
+-    ],[AM_CONDITIONAL([CPPUNIT], false)])
++      found_cppunit=yes
++    ])
+   fi
+-else
+-  AM_CONDITIONAL([CPPUNIT], false)
+ fi
++AM_CONDITIONAL([CPPUNIT], [test x"$found_cppunit" = xyes])
+ 
+ dnl #########################################################################
+ dnl Check if using log4cpp
diff --git a/package/linknx/0002-configure.ac-always-define-CPPUNIT.patch b/package/linknx/0002-configure.ac-always-define-CPPUNIT.patch
deleted file mode 100644
index 158bad9e9f..0000000000
--- a/package/linknx/0002-configure.ac-always-define-CPPUNIT.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 1b4a770af42f7d33ad174524b94ea4d2fc7133da Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 21 Apr 2019 19:31:50 +0200
-Subject: [PATCH] configure.ac: always define CPPUNIT
-
-Fixes:
- - http://autobuild.buildroot.org/results/4b042b7e18425690ec26b4977865516bedcb9edb
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/linknx/linknx/pull/42]
----
- configure.ac | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 779fd6f..51d8ae6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -145,8 +145,11 @@ if test x"$WITH_CPPUNIT" != xno; then
-       AC_DEFINE([HAVE_CPPUNIT], [1], [cppunit])
-       AC_SUBST(CPPUNIT_CFLAGS)
-       AC_SUBST(CPPUNIT_LIBS)
--    ])
-+      AM_CONDITIONAL([CPPUNIT], true)
-+    ],[AM_CONDITIONAL([CPPUNIT], false)])
-   fi
-+else
-+  AM_CONDITIONAL([CPPUNIT], false)
- fi
- 
- dnl #########################################################################
--- 
-2.20.1
-
diff --git a/package/linknx/0003-src-Makefile.am-fix-linking-with-log4cpp.patch b/package/linknx/0002-src-Makefile.am-fix-linking-with-log4cpp.patch
similarity index 85%
rename from package/linknx/0003-src-Makefile.am-fix-linking-with-log4cpp.patch
rename to package/linknx/0002-src-Makefile.am-fix-linking-with-log4cpp.patch
index 253c1f6f23..4f1a8e4356 100644
--- a/package/linknx/0003-src-Makefile.am-fix-linking-with-log4cpp.patch
+++ b/package/linknx/0002-src-Makefile.am-fix-linking-with-log4cpp.patch
@@ -1,6 +1,6 @@
-From b4595154e84e21abdc0c89f937c410cf8280991c Mon Sep 17 00:00:00 2001
+From 048b9ae8f3c07be217f1738c35ab995ab6394453 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 13 May 2019 22:14:43 +0200
+Date: Sun, 8 Mar 2020 10:02:07 +0100
 Subject: [PATCH] src/Makefile.am: fix linking with log4cpp
 
 linknx fails to build with log4cpp because LOG4CPP_CFLAGS (which
@@ -16,13 +16,14 @@ Fixes:
  - http://autobuild.buildroot.org/results/1863f8f27041bc15ca68e786ba3b8e4764c40574
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not sent yet]
+[Retrieved from:
+https://github.com/linknx/linknx/commit/048b9ae8f3c07be217f1738c35ab995ab6394453]
 ---
  src/Makefile.am | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 6a4f493..92d147c 100644
+index 6e0dc03b..5065c248 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -6,6 +6,7 @@ else
@@ -32,8 +33,5 @@ index 6a4f493..92d147c 100644
 -AM_CPPFLAGS=-I$(top_srcdir)/include -I$(top_srcdir)/ticpp $(B64_CFLAGS) $(PTH_CPPFLAGS) $(LIBCURL_CPPFLAGS) $(LOG4CPP_CFLAGS) $(LUA_CFLAGS) $(MYSQL_CFLAGS) $(ESMTP_CFLAGS)
 +AM_CPPFLAGS=-I$(top_srcdir)/include -I$(top_srcdir)/ticpp $(B64_CFLAGS) $(PTH_CPPFLAGS) $(LIBCURL_CPPFLAGS) $(LUA_CFLAGS) $(MYSQL_CFLAGS) $(ESMTP_CFLAGS)
 +AM_CXXFLAGS=$(LOG4CPP_CFLAGS)
- linknx_LDADD=$(top_srcdir)/ticpp/libticpp.a $(B64_LIBS) $(PTH_LDFLAGS) $(PTH_LIBS) $(LIBCURL) $(LOG4CPP_LIBS) $(LUA_LIBS) $(MYSQL_LIBS) $(ESMTP_LIBS) -lm
+ linknx_LDADD=$(top_srcdir)/ticpp/libticpp.a $(LIBICONV) $(B64_LIBS) $(PTH_LDFLAGS) $(PTH_LIBS) $(LIBCURL) $(LOG4CPP_LIBS) $(LUA_LIBS) $(MYSQL_LIBS) $(ESMTP_LIBS) -lm
  linknx_SOURCES=linknx.cpp logger.cpp ruleserver.cpp objectcontroller.cpp eibclient.c threads.cpp timermanager.cpp  persistentstorage.cpp xmlserver.cpp smsgateway.cpp emailgateway.cpp knxconnection.cpp services.cpp suncalc.cpp  luacondition.cpp ioport.cpp ruleserver.h objectcontroller.h threads.h timermanager.h persistentstorage.h xmlserver.h smsgateway.h emailgateway.h knxconnection.h services.h suncalc.h luacondition.h ioport.h logger.h
--- 
-2.20.1
-
diff --git a/package/linknx/linknx.hash b/package/linknx/linknx.hash
index 79113e6e70..86ec522809 100644
--- a/package/linknx/linknx.hash
+++ b/package/linknx/linknx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 3c3aaf8c409538153b15f5fb975a4485e58c4820cfea289a3f20777ba69782ab  linknx-0.0.1.37.tar.gz
-sha256 c03cea027b4b40e4402fabd08557736727ec3d5bc54ad64ab6472de432198cad  LICENSE
+sha256  00c53776c2e871295459ede922402d8ad0208367d2364781fdb92ddafad94d3d  linknx-0.0.1.38.tar.gz
+sha256  c03cea027b4b40e4402fabd08557736727ec3d5bc54ad64ab6472de432198cad  LICENSE
diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
index c75f0655d6..dbee0742fe 100644
--- a/package/linknx/linknx.mk
+++ b/package/linknx/linknx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINKNX_VERSION = 0.0.1.37
+LINKNX_VERSION = 0.0.1.38
 LINKNX_SITE = $(call github,linknx,linknx,$(LINKNX_VERSION))
 LINKNX_LICENSE = GPL-2.0+
 LINKNX_LICENSE_FILES = LICENSE
@@ -17,7 +17,9 @@ LINKNX_CONF_OPTS = \
 	--with-pth=$(STAGING_DIR)/usr \
 	--disable-smtp
 
+# add host-gettext for AM_ICONV macro
 LINKNX_DEPENDENCIES = \
+	host-gettext \
 	host-pkgconf \
 	libpthsem \
 	$(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone) \
-- 
2.25.1
