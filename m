From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 25 Nov 2014 13:57:06 +0200
Subject: [Buildroot] [PATCH] gptfdisk: fix static build
Message-ID: <e6d964131043e682bac06c3e59dddbfd2d0e5de0.1416916626.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libuuid may need -lintl. Augment the existing Makefile patch to support adding
link dependencies at build time.

Fixes:
http://autobuild.buildroot.net/results/24b/24b3f707424e2dcf0158ffe93d728be98ff66701/
http://autobuild.buildroot.net/results/f33/f3359fab166cf3627f15e59fa44cff36ee213102/
http://autobuild.buildroot.net/results/ef7/ef783e3776f25c28ea0de0c082c93f7ab97db56d/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/gptfdisk/gptfdisk-001-configurable-utf16-support.patch | 8 +++++---
 package/gptfdisk/gptfdisk.mk                                   | 4 ++++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/gptfdisk/gptfdisk-001-configurable-utf16-support.patch b/package/gptfdisk/gptfdisk-001-configurable-utf16-support.patch
index 2d51e6f7bf68..6d54ceae0955 100644
--- a/package/gptfdisk/gptfdisk-001-configurable-utf16-support.patch
+++ b/package/gptfdisk/gptfdisk-001-configurable-utf16-support.patch
@@ -7,6 +7,8 @@ the UTF16 support or not.
 
 Signed-off-by: Justin Maggard <jmaggard10@gmail.com>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[baruch: add $(LDLIBS)]
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 ---
 Index: b/Makefile
 ===================================================================
@@ -32,17 +34,17 @@ Index: b/Makefile
  gdisk:	$(LIB_OBJS) gdisk.o gpttext.o
 -#	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) -luuid -o gdisk
 -	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) -licuio -licuuc -luuid -o gdisk
-+	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) $(UTF16_LIBS) -luuid -o gdisk
++	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) $(UTF16_LIBS) -luuid $(LDLIBS) -o gdisk
  
  cgdisk: $(LIB_OBJS) cgdisk.o gptcurses.o
 -#	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -luuid -lncurses -o cgdisk
 -	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -licuio -licuuc -luuid -lncurses -o cgdisk
-+	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) $(UTF16_LIBS) -luuid -lncurses -o cgdisk
++	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) $(UTF16_LIBS) -luuid -lncurses $(LDLIBS) -o cgdisk
  
  sgdisk: $(LIB_OBJS) sgdisk.o gptcl.o
 -#	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) -luuid -lpopt -o sgdisk
 -	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) -licuio -licuuc -luuid -lpopt -o sgdisk
-+	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) $(UTF16_LIBS) -luuid -lpopt -o sgdisk
++	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) $(UTF16_LIBS) -luuid -lpopt $(LDLIBS) -o sgdisk
  
  fixparts: $(MBR_LIB_OBJS) fixparts.o
  	$(CXX) $(MBR_LIB_OBJS) fixparts.o $(LDFLAGS) -o fixparts
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index 9828d4c79851..897dc77ac6eb 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -26,6 +26,10 @@ GPTFDISK_DEPENDENCIES += icu
 GPTFDISK_MAKE_OPTS += USE_UTF16=y
 endif
 
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE)$(BR2_PREFER_STATIC_LIB),yy)
+GPTFDISK_MAKE_OPTS += LDLIBS=-lintl
+endif
+
 define GPTFDISK_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
 		$(GPTFDISK_MAKE_OPTS) $(GPTFDISK_TARGETS_y)
-- 
2.1.3
