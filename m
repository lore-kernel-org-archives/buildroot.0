From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Mar 2014 23:30:14 +0100
Subject: [Buildroot] [git commit] newt: bump to 0.52.17
Message-ID: <20140318224229.CD1479C110@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5bf4a4fe928b7cfafd36ac779ae182cc1896fefb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changed download location, added popt dependency and
updated the Makefile.in patch.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/newt/Config.in               |    6 ++++++
 package/newt/newt-fix-makefile.patch |   29 +++++++++++------------------
 package/newt/newt.mk                 |   26 +++++---------------------
 3 files changed, 22 insertions(+), 39 deletions(-)

diff --git a/package/newt/Config.in b/package/newt/Config.in
index ae6b69c..1737f31 100644
--- a/package/newt/Config.in
+++ b/package/newt/Config.in
@@ -1,7 +1,13 @@
 config BR2_PACKAGE_NEWT
 	bool "newt"
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_SLANG
+	select BR2_PACKAGE_POPT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Programming library for color text mode, widget based user interfaces.
 
 	  http://www.redhat.com/
+
+comment "newt needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/newt/newt-fix-makefile.patch b/package/newt/newt-fix-makefile.patch
index 227b0f3..84152fb 100644
--- a/package/newt/newt-fix-makefile.patch
+++ b/package/newt/newt-fix-makefile.patch
@@ -1,6 +1,5 @@
 Fix Makefile.in
 
-* Remove -Os from the CFLAGS (already handled by Buildroot)
 * Use $(CC) instead of $(CPP) to generate .depend file because
   '$(CPP) -M' call does not support multiple input files.
   This avoid the following error:
@@ -14,29 +13,23 @@ make[1]: Leaving directory
 make: *** 
 [/opt/br/output/build/newt-0.51.0/.stamp_built] Error 2
 
-
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 
 ---
-Index: newt-0.51.0/Makefile.in
+ Makefile.in |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: b/Makefile.in
 ===================================================================
---- newt-0.51.0.orig/Makefile.in	2012-10-10 22:43:42.042318041 +0200
-+++ newt-0.51.0/Makefile.in	2012-10-11 21:25:44.063873277 +0200
-@@ -3,7 +3,7 @@ SHLIBS = -lslang -lm -lc
- 
- GPM_SUPPORT=@gpm_support@
- 
--CFLAGS = -Wall -Os -D_GNU_SOURCE
-+CFLAGS += -D_GNU_SOURCE
- 
- VERSION = @VERSION@
- CVSTAG = r$(subst .,-,$(VERSION))
-@@ -86,7 +86,7 @@ clean:
- 		$(SHAREDOBJS) *.so*
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -121,7 +121,7 @@
+ 		$(SHAREDDIR)/*.o *.$(SOEXT)*
  
  depend:
--	$(CPP) $(CFLAGS) -M $(SOURCES) > .depend
-+	$(CC) $(CFLAGS) -M $(SOURCES) > .depend
+-	$(CPP) $(CFLAGS) $(CPPFLAGS) -M $(SOURCES) > .depend
++	$(CC) $(CFLAGS) $(CPPFLAGS) -M $(SOURCES) > .depend
  
  $(SHAREDDIR):
  	mkdir -p $(SHAREDDIR)
diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index 1d5e7d5..b567156 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -4,32 +4,16 @@
 #
 ################################################################################
 
-NEWT_VERSION         = 0.51.0
-NEWT_SITE            = http://www.uclibc.org/
-NEWT_SOURCE          = newt-$(NEWT_VERSION).tar.bz2
+NEWT_VERSION         = 0.52.17
+NEWT_SITE            = https://fedorahosted.org/releases/n/e/newt/
 NEWT_LICENSE         = GPLv2
 NEWT_LICENSE_FILES   = COPYING
 NEWT_INSTALL_STAGING = YES
 
-NEWT_DEPENDENCIES = slang
+NEWT_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) slang popt
 
-NEWT_MAKE_ENV += $(TARGET_CONFIGURE_OPTS)
-NEWT_MAKE = $(MAKE1)
-
-define NEWT_INSTALL_STAGING_CMDS
-	$(INSTALL) -D -m644 $(@D)/newt.h    $(STAGING_DIR)/usr/include/newt.h
-	$(INSTALL) -D -m644 $(@D)/libnewt.a $(STAGING_DIR)/usr/lib/libnewt.a
-	$(INSTALL) -m755 $(@D)/libnewt.so*  $(STAGING_DIR)/usr/lib/
-	ln -fs libnewt.so.$(NEWT_VERSION)   $(STAGING_DIR)/usr/lib/libnewt.so
-	ln -fs libnewt.so.$(NEWT_VERSION)   $(STAGING_DIR)/usr/lib/libnewt.so.0.51
-endef
+NEWT_CONF_OPT = --without-python --without-tcl
 
-define NEWT_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m644 $(@D)/newt.h    $(TARGET_DIR)/usr/include/newt.h
-	$(INSTALL) -D -m644 $(@D)/libnewt.a $(TARGET_DIR)/usr/lib/libnewt.a
-	$(INSTALL) -m755 $(@D)/libnewt.so*  $(TARGET_DIR)/usr/lib/
-	ln -fs libnewt.so.$(NEWT_VERSION)   $(TARGET_DIR)/usr/lib/libnewt.so
-	ln -fs libnewt.so.$(NEWT_VERSION)   $(TARGET_DIR)/usr/lib/libnewt.so.0.51
-endef
+NEWT_MAKE = $(MAKE1)
 
 $(eval $(autotools-package))
