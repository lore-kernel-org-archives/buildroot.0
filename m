From: Matt Johnson <mj1856@hotmail.com>
Date: Thu, 13 Jan 2011 21:12:09 -0700
Subject: [Buildroot] fontconfig: bump to version 2.8.0
Message-ID: <BAY145-w55783B9ED56A589ABC3816C2F30@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Matt Johnson <mj1856@hotmail.com>
---
 ...fontconfig-2.6.0-parallel-compilation-fix.patch |   26 -------
 .../fontconfig-2.6.0-use_for_build.patch           |   80 --------------------
 .../fontconfig-2.8.0-use_for_build.patch           |   80 ++++++++++++++++++++
 package/fontconfig/fontconfig.mk                   |    4 +-
 4 files changed, 81 insertions(+), 109 deletions(-)
 delete mode 100644 package/fontconfig/fontconfig-2.6.0-parallel-compilation-fix.patch
 delete mode 100644 package/fontconfig/fontconfig-2.6.0-use_for_build.patch
 create mode 100644 package/fontconfig/fontconfig-2.8.0-use_for_build.patch
diff --git a/package/fontconfig/fontconfig-2.6.0-parallel-compilation-fix.patch b/package/fontconfig/fontconfig-2.6.0-parallel-compilation-fix.patch
deleted file mode 100644
index 56623cf..0000000
--- a/package/fontconfig/fontconfig-2.6.0-parallel-compilation-fix.patch
+++ /dev/null
@@ -1,26 +0,0 @@
----
- fc-case/Makefile.am |    4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-Index: fontconfig-2.6.0/fc-case/Makefile.am
-===================================================================
---- fontconfig-2.6.0.orig/fc-case/Makefile.am
-+++ fontconfig-2.6.0/fc-case/Makefile.am
-@@ -36,6 +36,8 @@
- 
- noinst_MANS=fc-case.man
- 
-+noinst_HEADERS=$(TARG)
-+
- fc_case_SRCS= \
-  fc-case.c \
-  fccaseint.h \
-@@ -52,7 +54,7 @@
- 
- ALIAS_FILES = fcalias.h fcaliastail.h
- 
--BUILT_SOURCES = $(ALIAS_FILES) $(TARG)
-+BUILT_SOURCES = $(ALIAS_FILES)
- 
- $(ALIAS_FILES): 
-  touch $(ALIAS_FILES)
diff --git a/package/fontconfig/fontconfig-2.6.0-use_for_build.patch b/package/fontconfig/fontconfig-2.6.0-use_for_build.patch
deleted file mode 100644
index 334cbba..0000000
--- a/package/fontconfig/fontconfig-2.6.0-use_for_build.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-diff -Naur fontconfig-2.6.0.orig/doc/Makefile.am fontconfig-2.6.0/doc/Makefile.am
---- fontconfig-2.6.0.orig/doc/Makefile.am 2007-11-06 01:05:37.000000000 +0100
-+++ fontconfig-2.6.0/doc/Makefile.am 2010-05-22 00:03:00.000000000 +0200
-@@ -21,9 +21,10 @@
- # TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
- # PERFORMANCE OF THIS SOFTWARE.
- 
--CC = @CC_FOR_BUILD@
- EXEEXT = @EXEEXT_FOR_BUILD@
--LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
-+COMPILE = $(CC_FOR_BUILD) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
-+        $(CPPFLAGS_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD)
-+LINK = $(CC_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
- 
- DOC_SRC = $(srcdir)
- DOC_MODULE = fontconfig
-diff -Naur fontconfig-2.6.0.orig/fc-arch/Makefile.am fontconfig-2.6.0/fc-arch/Makefile.am
---- fontconfig-2.6.0.orig/fc-arch/Makefile.am 2008-01-02 17:44:39.000000000 +0100
-+++ fontconfig-2.6.0/fc-arch/Makefile.am 2010-05-21 23:59:18.000000000 +0200
-@@ -22,9 +22,10 @@
- # PERFORMANCE OF THIS SOFTWARE.
- #
- 
--CC = @CC_FOR_BUILD@
- EXEEXT = @EXEEXT_FOR_BUILD@
--LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
-+COMPILE = $(CC_FOR_BUILD) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
-+ $(CPPFLAGS_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD)
-+LINK = $(CC_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
- 
- INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(WARN_CFLAGS)
- 
-diff -Naur fontconfig-2.6.0.orig/fc-case/Makefile.am fontconfig-2.6.0/fc-case/Makefile.am
---- fontconfig-2.6.0.orig/fc-case/Makefile.am 2010-05-21 23:55:02.000000000 +0200
-+++ fontconfig-2.6.0/fc-case/Makefile.am 2010-05-22 00:04:09.000000000 +0200
-@@ -22,9 +22,10 @@
- # PERFORMANCE OF THIS SOFTWARE.
- #
- 
--CC = @CC_FOR_BUILD@
- EXEEXT = @EXEEXT_FOR_BUILD@
--LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
-+COMPILE = $(CC_FOR_BUILD) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
-+        $(CPPFLAGS_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD)
-+LINK = $(CC_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
- 
- INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(WARN_CFLAGS)
- 
-diff -Naur fontconfig-2.6.0.orig/fc-glyphname/Makefile.am fontconfig-2.6.0/fc-glyphname/Makefile.am
---- fontconfig-2.6.0.orig/fc-glyphname/Makefile.am 2008-01-02 17:44:39.000000000 +0100
-+++ fontconfig-2.6.0/fc-glyphname/Makefile.am 2010-05-22 00:04:54.000000000 +0200
-@@ -22,9 +22,10 @@
- # PERFORMANCE OF THIS SOFTWARE.
- #
- 
--CC = @CC_FOR_BUILD@
- EXEEXT = @EXEEXT_FOR_BUILD@
--LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
-+COMPILE = $(CC_FOR_BUILD) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
-+        $(CPPFLAGS_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD)
-+LINK = $(CC_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
- 
- INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(WARN_CFLAGS)
- 
-diff -Naur fontconfig-2.6.0.orig/fc-lang/Makefile.am fontconfig-2.6.0/fc-lang/Makefile.am
---- fontconfig-2.6.0.orig/fc-lang/Makefile.am 2008-01-02 17:44:39.000000000 +0100
-+++ fontconfig-2.6.0/fc-lang/Makefile.am 2010-05-22 00:05:44.000000000 +0200
-@@ -22,9 +22,10 @@
- # PERFORMANCE OF THIS SOFTWARE.
- #
- 
--CC = @CC_FOR_BUILD@
- EXEEXT = @EXEEXT_FOR_BUILD@
--LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
-+COMPILE = $(CC_FOR_BUILD) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
-+        $(CPPFLAGS_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD)
-+LINK = $(CC_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
- 
- INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(WARN_CFLAGS)
- 
diff --git a/package/fontconfig/fontconfig-2.8.0-use_for_build.patch b/package/fontconfig/fontconfig-2.8.0-use_for_build.patch
new file mode 100644
index 0000000..489355e
--- /dev/null
+++ b/package/fontconfig/fontconfig-2.8.0-use_for_build.patch
@@ -0,0 +1,80 @@
+diff -Naur fontconfig-2.8.0.orig/doc/Makefile.am fontconfig-2.8.0/doc/Makefile.am
+--- fontconfig-2.8.0.orig/doc/Makefile.am 2007-11-06 01:05:37.000000000 +0100
++++ fontconfig-2.8.0/doc/Makefile.am 2010-05-22 00:03:00.000000000 +0200
+@@ -21,9 +21,10 @@
+ # TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
+ # PERFORMANCE OF THIS SOFTWARE.
+ 
+-CC = @CC_FOR_BUILD@
+ EXEEXT = @EXEEXT_FOR_BUILD@
+-LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++COMPILE = $(CC_FOR_BUILD) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
++        $(CPPFLAGS_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD)
++LINK = $(CC_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
+ 
+ DOC_SRC = $(srcdir)
+ DOC_MODULE = fontconfig
+diff -Naur fontconfig-2.8.0.orig/fc-arch/Makefile.am fontconfig-2.8.0/fc-arch/Makefile.am
+--- fontconfig-2.8.0.orig/fc-arch/Makefile.am 2008-01-02 17:44:39.000000000 +0100
++++ fontconfig-2.8.0/fc-arch/Makefile.am 2010-05-21 23:59:18.000000000 +0200
+@@ -22,9 +22,10 @@
+ # PERFORMANCE OF THIS SOFTWARE.
+ #
+ 
+-CC = @CC_FOR_BUILD@
+ EXEEXT = @EXEEXT_FOR_BUILD@
+-LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++COMPILE = $(CC_FOR_BUILD) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
++ $(CPPFLAGS_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD)
++LINK = $(CC_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
+ 
+ INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(WARN_CFLAGS)
+ 
+diff -Naur fontconfig-2.8.0.orig/fc-case/Makefile.am fontconfig-2.8.0/fc-case/Makefile.am
+--- fontconfig-2.8.0.orig/fc-case/Makefile.am 2010-05-21 23:55:02.000000000 +0200
++++ fontconfig-2.8.0/fc-case/Makefile.am 2010-05-22 00:04:09.000000000 +0200
+@@ -22,9 +22,10 @@
+ # PERFORMANCE OF THIS SOFTWARE.
+ #
+ 
+-CC = @CC_FOR_BUILD@
+ EXEEXT = @EXEEXT_FOR_BUILD@
+-LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++COMPILE = $(CC_FOR_BUILD) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
++        $(CPPFLAGS_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD)
++LINK = $(CC_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
+ 
+ INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(WARN_CFLAGS)
+ 
+diff -Naur fontconfig-2.8.0.orig/fc-glyphname/Makefile.am fontconfig-2.8.0/fc-glyphname/Makefile.am
+--- fontconfig-2.8.0.orig/fc-glyphname/Makefile.am 2008-01-02 17:44:39.000000000 +0100
++++ fontconfig-2.8.0/fc-glyphname/Makefile.am 2010-05-22 00:04:54.000000000 +0200
+@@ -22,9 +22,10 @@
+ # PERFORMANCE OF THIS SOFTWARE.
+ #
+ 
+-CC = @CC_FOR_BUILD@
+ EXEEXT = @EXEEXT_FOR_BUILD@
+-LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++COMPILE = $(CC_FOR_BUILD) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
++        $(CPPFLAGS_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD)
++LINK = $(CC_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
+ 
+ INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(WARN_CFLAGS)
+ 
+diff -Naur fontconfig-2.8.0.orig/fc-lang/Makefile.am fontconfig-2.8.0/fc-lang/Makefile.am
+--- fontconfig-2.8.0.orig/fc-lang/Makefile.am 2008-01-02 17:44:39.000000000 +0100
++++ fontconfig-2.8.0/fc-lang/Makefile.am 2010-05-22 00:05:44.000000000 +0200
+@@ -22,9 +22,10 @@
+ # PERFORMANCE OF THIS SOFTWARE.
+ #
+ 
+-CC = @CC_FOR_BUILD@
+ EXEEXT = @EXEEXT_FOR_BUILD@
+-LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++COMPILE = $(CC_FOR_BUILD) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
++        $(CPPFLAGS_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD)
++LINK = $(CC_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
+ 
+ INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(WARN_CFLAGS)
+ 
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index a875e74..6c0111e 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -3,14 +3,12 @@
 # fontconfig
 #
 #############################################################
-FONTCONFIG_VERSION = 2.6.0
+FONTCONFIG_VERSION = 2.8.0
 FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.gz
 FONTCONFIG_SITE = http://fontconfig.org/release
 FONTCONFIG_AUTORECONF = YES
 FONTCONFIG_INSTALL_STAGING = YES
 FONTCONFIG_INSTALL_TARGET = YES
-# This package does not like using the target cflags for some reason.
-FONTCONFIG_CONF_ENV = CFLAGS="-I$(STAGING_DIR)/usr/include/freetype2"
 
 FONTCONFIG_CONF_OPT = --with-arch=$(GNU_TARGET_NAME) \
   --with-freetype-config="$(STAGING_DIR)/usr/bin/freetype-config" \
-- 
1.7.1 		 	   		  
