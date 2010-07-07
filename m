From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Jul 2010 08:20:59 +0200
Subject: [Buildroot] [PATCH 06/20] fontconfig: fix cross-compilation patch
In-Reply-To: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
References: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
Message-ID: <daa537c3349b54e59a3e06a4ecb0d086add7f5de.1278483657.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The existing cross-compilation patch works with our not completely
correct TARGET_CONFIGURE_OPTS. With the correct variables (CFLAGS,
LDFLAGS) being passed, fontconfig was trying to use target
CFLAGS/LDFLAGS when building tools for the host.

This updated patch fixes that problem by correctly using the
CC_FOR_BUILD, CFLAGS_FOR_BUILD variables.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../fontconfig-2.6.0-use_for_build.patch           |   93 ++++++++++++--------
 1 files changed, 57 insertions(+), 36 deletions(-)

diff --git a/package/fontconfig/fontconfig-2.6.0-use_for_build.patch b/package/fontconfig/fontconfig-2.6.0-use_for_build.patch
index cdf9056..334cbba 100644
--- a/package/fontconfig/fontconfig-2.6.0-use_for_build.patch
+++ b/package/fontconfig/fontconfig-2.6.0-use_for_build.patch
@@ -1,59 +1,80 @@
----
- fc-arch/Makefile.am      |    2 +-
- fc-case/Makefile.am      |    2 +-
- fc-glyphname/Makefile.am |    2 +-
- fc-lang/Makefile.am      |    2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
-
-Index: fontconfig-2.6.0/fc-arch/Makefile.am
-===================================================================
---- fontconfig-2.6.0.orig/fc-arch/Makefile.am
-+++ fontconfig-2.6.0/fc-arch/Makefile.am
-@@ -24,7 +24,7 @@
- 
- CC = @CC_FOR_BUILD@
+diff -Naur fontconfig-2.6.0.orig/doc/Makefile.am fontconfig-2.6.0/doc/Makefile.am
+--- fontconfig-2.6.0.orig/doc/Makefile.am	2007-11-06 01:05:37.000000000 +0100
++++ fontconfig-2.6.0/doc/Makefile.am	2010-05-22 00:03:00.000000000 +0200
+@@ -21,9 +21,10 @@
+ # TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
+ # PERFORMANCE OF THIS SOFTWARE.
+ 
+-CC = @CC_FOR_BUILD@
+ EXEEXT = @EXEEXT_FOR_BUILD@
+-LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
++COMPILE = $(CC_FOR_BUILD) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
++		      $(CPPFLAGS_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD)
++LINK = $(CC_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
+ 
+ DOC_SRC = $(srcdir)
+ DOC_MODULE = fontconfig
+diff -Naur fontconfig-2.6.0.orig/fc-arch/Makefile.am fontconfig-2.6.0/fc-arch/Makefile.am
+--- fontconfig-2.6.0.orig/fc-arch/Makefile.am	2008-01-02 17:44:39.000000000 +0100
++++ fontconfig-2.6.0/fc-arch/Makefile.am	2010-05-21 23:59:18.000000000 +0200
+@@ -22,9 +22,10 @@
+ # PERFORMANCE OF THIS SOFTWARE.
+ #
+ 
+-CC = @CC_FOR_BUILD@
  EXEEXT = @EXEEXT_FOR_BUILD@
 -LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
-+LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
++COMPILE = $(CC_FOR_BUILD) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
++	$(CPPFLAGS_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD)
++LINK = $(CC_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
  
  INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(WARN_CFLAGS)
  
-Index: fontconfig-2.6.0/fc-case/Makefile.am
-===================================================================
---- fontconfig-2.6.0.orig/fc-case/Makefile.am
-+++ fontconfig-2.6.0/fc-case/Makefile.am
-@@ -24,7 +24,7 @@
+diff -Naur fontconfig-2.6.0.orig/fc-case/Makefile.am fontconfig-2.6.0/fc-case/Makefile.am
+--- fontconfig-2.6.0.orig/fc-case/Makefile.am	2010-05-21 23:55:02.000000000 +0200
++++ fontconfig-2.6.0/fc-case/Makefile.am	2010-05-22 00:04:09.000000000 +0200
+@@ -22,9 +22,10 @@
+ # PERFORMANCE OF THIS SOFTWARE.
+ #
  
- CC = @CC_FOR_BUILD@
+-CC = @CC_FOR_BUILD@
  EXEEXT = @EXEEXT_FOR_BUILD@
 -LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
-+LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
++COMPILE = $(CC_FOR_BUILD) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
++		      $(CPPFLAGS_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD)
++LINK = $(CC_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
  
  INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(WARN_CFLAGS)
  
-Index: fontconfig-2.6.0/fc-glyphname/Makefile.am
-===================================================================
---- fontconfig-2.6.0.orig/fc-glyphname/Makefile.am
-+++ fontconfig-2.6.0/fc-glyphname/Makefile.am
-@@ -24,7 +24,7 @@
+diff -Naur fontconfig-2.6.0.orig/fc-glyphname/Makefile.am fontconfig-2.6.0/fc-glyphname/Makefile.am
+--- fontconfig-2.6.0.orig/fc-glyphname/Makefile.am	2008-01-02 17:44:39.000000000 +0100
++++ fontconfig-2.6.0/fc-glyphname/Makefile.am	2010-05-22 00:04:54.000000000 +0200
+@@ -22,9 +22,10 @@
+ # PERFORMANCE OF THIS SOFTWARE.
+ #
  
- CC = @CC_FOR_BUILD@
+-CC = @CC_FOR_BUILD@
  EXEEXT = @EXEEXT_FOR_BUILD@
 -LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
-+LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
++COMPILE = $(CC_FOR_BUILD) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
++		      $(CPPFLAGS_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD)
++LINK = $(CC_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
  
  INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(WARN_CFLAGS)
  
-Index: fontconfig-2.6.0/fc-lang/Makefile.am
-===================================================================
---- fontconfig-2.6.0.orig/fc-lang/Makefile.am
-+++ fontconfig-2.6.0/fc-lang/Makefile.am
-@@ -24,7 +24,7 @@
+diff -Naur fontconfig-2.6.0.orig/fc-lang/Makefile.am fontconfig-2.6.0/fc-lang/Makefile.am
+--- fontconfig-2.6.0.orig/fc-lang/Makefile.am	2008-01-02 17:44:39.000000000 +0100
++++ fontconfig-2.6.0/fc-lang/Makefile.am	2010-05-22 00:05:44.000000000 +0200
+@@ -22,9 +22,10 @@
+ # PERFORMANCE OF THIS SOFTWARE.
+ #
  
- CC = @CC_FOR_BUILD@
+-CC = @CC_FOR_BUILD@
  EXEEXT = @EXEEXT_FOR_BUILD@
 -LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
-+LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
++COMPILE = $(CC_FOR_BUILD) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
++		      $(CPPFLAGS_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD)
++LINK = $(CC_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@
  
  INCLUDES=-I${top_srcdir}/src -I${top_srcdir} $(WARN_CFLAGS)
  
-- 
1.7.0.4
