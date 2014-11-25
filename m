From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Nov 2014 13:42:06 +0100
Subject: [Buildroot] [git commit] gptfdisk: fix static build
Message-ID: <20141125124247.4D5FE7FEF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=73d7bc535e5c40d6112ae04e95a44a67810d7bc7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libuuid may need -lintl. Augment the existing Makefile patch to support adding
link dependencies at build time.

Fixes:
http://autobuild.buildroot.net/results/24b/24b3f707424e2dcf0158ffe93d728be98ff66701/
http://autobuild.buildroot.net/results/f33/f3359fab166cf3627f15e59fa44cff36ee213102/
http://autobuild.buildroot.net/results/ef7/ef783e3776f25c28ea0de0c082c93f7ab97db56d/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gptfdisk-001-configurable-utf16-support.patch  |    8 +++++---
 package/gptfdisk/gptfdisk.mk                       |    4 ++++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/gptfdisk/gptfdisk-001-configurable-utf16-support.patch b/package/gptfdisk/gptfdisk-001-configurable-utf16-support.patch
index 2d51e6f..6d54cea 100644
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
index 9828d4c..897dc77 100644
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
