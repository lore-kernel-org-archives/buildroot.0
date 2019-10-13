From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 13 Oct 2019 14:45:50 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/brltty: fix build with expat
Message-ID: <20191013124550.18413-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tbl2hex is a host command line that is built with:

$(CC_FOR_BUILD) $(LDFLAGS_FOR_BUILD) -o $@ $(TBL2HEX_OBJECTS) $(EXPAT_LIBS_FOR_BUILD) $(LDLIBS_FOR_BUILD)

It needs cldr.o which can depends on expat and is built through:

%.$B: $(SRC_DIR)/%.c
       $(CC_FOR_BUILD) -DFOR_BUILD $(CFLAGS_FOR_BUILD) -o $@ -c $<

When cross-compiling, build fails because expat is not found on host:

gcc -DFOR_BUILD -I. -I. -I./../Programs -I../Programs -I../Headers -I./.. -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -D_DEFAULT_SOURCE -D_POSIX_C_SOURCE=2 -D_BSD_SOURCE -D_XOPEN_SOURCE=500 -D_XOPEN_SOURCE_EXTENDED -D_GNU_SOURCE  -D_DEFAULT_SOURCE -D_POSIX_C_SOURCE=2 -D_BSD_SOURCE -D_XOPEN_SOURCE=500 -D_XOPEN_SOURCE_EXTENDED -D_GNU_SOURCE -DHAVE_CONFIG_H -g -O2 -std=gnu99 -Wall -Werror=format-security -o cldr.build.o -c cldr.c
cldr.c:31:10: fatal error: expat.h: No such file or directory
 #include <expat.h>
          ^~~~~~~~~

To fix this issue, add host-expat dependency as well as patch to add
$(EXPAT_INCLUDES_FOR_BUILD) and set CC_FOR_BUILD, LD_FOR_BUILD,
EXPAT_INCLUDES_FOR_BUILD and LDFLAGS_FOR_BUILD in brltty.mk
CFLAGS_FOR_BUILD can't be overriden as it's used to set internal paths
such as Headers

Fixes:
 - http://autobuild.buildroot.org/results/362cfb57e4a91a066493269d8078d931529ddf69

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Really fix the issue by adding a patch and setting xxx_FOR_BUILD
   variables

 ...ix-cross-build-of-tbl2hex-with-expat.patch | 50 +++++++++++++++++++
 package/brltty/brltty.mk                      | 12 ++++-
 2 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 package/brltty/0002-common.mk-fix-cross-build-of-tbl2hex-with-expat.patch

diff --git a/package/brltty/0002-common.mk-fix-cross-build-of-tbl2hex-with-expat.patch b/package/brltty/0002-common.mk-fix-cross-build-of-tbl2hex-with-expat.patch
new file mode 100644
index 0000000000..f598d1dcdd
--- /dev/null
+++ b/package/brltty/0002-common.mk-fix-cross-build-of-tbl2hex-with-expat.patch
@@ -0,0 +1,50 @@
+From 93b4cec3652e82313fc093f3050cec56243ed60b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 13 Oct 2019 10:32:42 +0200
+Subject: [PATCH] common.mk: fix cross-build of tbl2hex with expat
+
+tbl2hex is a host command line that is built with:
+
+$(CC_FOR_BUILD) $(LDFLAGS_FOR_BUILD) -o $@ $(TBL2HEX_OBJECTS) $(EXPAT_LIBS_FOR_BUILD) $(LDLIBS_FOR_BUILD)
+
+It needs cldr.o which can depends on expat and is built through:
+
+%.$B: $(SRC_DIR)/%.c
+       $(CC_FOR_BUILD) -DFOR_BUILD $(CFLAGS_FOR_BUILD) -o $@ -c $<
+
+When cross-compiling, build fails because expat is not found on host:
+
+gcc -DFOR_BUILD -I. -I. -I./../Programs -I../Programs -I../Headers -I./.. -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -D_DEFAULT_SOURCE -D_POSIX_C_SOURCE=2 -D_BSD_SOURCE -D_XOPEN_SOURCE=500 -D_XOPEN_SOURCE_EXTENDED -D_GNU_SOURCE  -D_DEFAULT_SOURCE -D_POSIX_C_SOURCE=2 -D_BSD_SOURCE -D_XOPEN_SOURCE=500 -D_XOPEN_SOURCE_EXTENDED -D_GNU_SOURCE -DHAVE_CONFIG_H -g -O2 -std=gnu99 -Wall -Werror=format-security -o cldr.build.o -c cldr.c
+cldr.c:31:10: fatal error: expat.h: No such file or directory
+ #include <expat.h>
+          ^~~~~~~~~
+
+To fix this issue, add $(EXPAT_INCLUDES_FOR_BUILD) to allow the user to
+give the path of his host expat package.
+CFLAGS_FOR_BUILD can't be overriden by the user as brltty uses it to set
+his own internal paths
+
+Fixes:
+ - http://autobuild.buildroot.org/results/362cfb57e4a91a066493269d8078d931529ddf69
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ common.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/common.mk b/common.mk
+index e0721d178..1484680d5 100644
+--- a/common.mk
++++ b/common.mk
+@@ -27,7 +27,7 @@ include $(SRC_TOP)absdeps.mk
+ include $(SRC_DIR)/reldeps.mk
+ 
+ %.$B: $(SRC_DIR)/%.c
+-	$(CC_FOR_BUILD) -DFOR_BUILD $(CFLAGS_FOR_BUILD) -o $@ -c $<
++	$(CC_FOR_BUILD) -DFOR_BUILD $(EXPAT_INCLUDES_FOR_BUILD) $(CFLAGS_FOR_BUILD) -o $@ -c $<
+ 
+ API_NAME = brlapi
+ API_ARC = $(ARC_PFX)$(API_NAME).$(ARC_EXT)
+-- 
+2.23.0
+
diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index b9d608b9f5..c8a109747a 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -27,6 +27,14 @@ BRLTTY_CONF_OPTS = \
 	--without-mikropuhe --without-speechd --without-swift \
 	--without-theta
 
+# Our package uses autoconf, but not automake, so we need to pass
+# those variables@compile time as well.
+# CFLAGS_FOR_BUILD can't be passed as it's used to set internal paths
+BRLTTY_MAKE_OPTS = \
+	CC_FOR_BUILD="$(HOSTCC)" \
+	LD_FOR_BUILD="$(HOSTLD)" \
+	LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)"
+
 # Autoreconf is needed because we're patching configure.ac in
 # 0001-Fix-linking-error-on-mips64el. However, a plain autoreconf doesn't work,
 # because this package is only autoconf-based.
@@ -51,8 +59,10 @@ BRLTTY_CONF_OPTS += --without-espeak
 endif
 
 ifeq ($(BR2_PACKAGE_EXPAT),y)
-BRLTTY_DEPENDENCIES += expat
+# host-expat is needed by tbl2hex's host program
+BRLTTY_DEPENDENCIES += host-expat expat
 BRLTTY_CONF_OPTS += --enable-expat
+BRLTTY_MAKE_OPTS += EXPAT_INCLUDES_FOR_BUILD="$(HOST_CFLAGS)"
 else
 BRLTTY_CONF_OPTS += --disable-expat
 endif
-- 
2.23.0
