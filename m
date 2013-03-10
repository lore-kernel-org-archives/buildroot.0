From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Mar 2013 22:25:29 +0100
Subject: [Buildroot] [git commit] gptfdisk: make utf16 support configurable
Message-ID: <20130310213208.25B4A9AFA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6c83b40a1b2d1eb46de50d49572db13a4ce59f03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of always disabling the UTF16 support, make it
configurable. When ICU is available, enable UTF16 support, otherwise
disable it.

[Peter: wrap long line]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ... gptfdisk-001-configurable-utf16-support.patch} |   33 +++++++++++--------
 package/gptfdisk/gptfdisk.mk                       |    7 +++-
 2 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/package/gptfdisk/gptfdisk-001-no-utf16.patch b/package/gptfdisk/gptfdisk-001-configurable-utf16-support.patch
similarity index 57%
rename from package/gptfdisk/gptfdisk-001-no-utf16.patch
rename to package/gptfdisk/gptfdisk-001-configurable-utf16-support.patch
index 540e741..2d51e6f 100644
--- a/package/gptfdisk/gptfdisk-001-no-utf16.patch
+++ b/package/gptfdisk/gptfdisk-001-configurable-utf16-support.patch
@@ -1,43 +1,48 @@
-[PATCH] Disable UTF16 support
+[PATCH] Make the UTF16 support configurable
 
-libicu is quite large, and unicode partition names are uncommon.
+libicu is quite large, and unicode partition names are uncommon, so we
+may not necessarily want to have UTF16 support unconditionnally. This
+patch adds a USE_UTF16 environment variable to tell whether we want
+the UTF16 support or not.
 
 Signed-off-by: Justin Maggard <jmaggard10@gmail.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
-diff -ur gdisk-0.8.5/Makefile gptfdisk-0.8.5/Makefile
---- gdisk-0.8.5/Makefile	2012-05-30 08:38:43.000000000 -0700
-+++ gptfdisk-0.8.5/Makefile	2012-06-05 11:38:23.710597974 -0700
-@@ -1,8 +1,8 @@
+Index: b/Makefile
+===================================================================
+--- a/Makefile
++++ b/Makefile
+@@ -1,8 +1,11 @@
  CC=gcc
  CXX=g++
  CFLAGS+=-D_FILE_OFFSET_BITS=64
 -CXXFLAGS+=-Wall -D_FILE_OFFSET_BITS=64 -D USE_UTF16
 -#CXXFLAGS+=-Wall -D_FILE_OFFSET_BITS=64
-+#CXXFLAGS+=-Wall -D_FILE_OFFSET_BITS=64 -D USE_UTF16
 +CXXFLAGS+=-Wall -D_FILE_OFFSET_BITS=64
++ifeq ($(USE_UTF16),y)
++CXXFLAGS+=-D USE_UTF16
++UTF16_LIBS=-licuio -licuuc
++endif
  LDFLAGS+=
  LIB_NAMES=crc32 support guid gptpart mbrpart basicmbr mbr gpt bsd parttypes attributes diskio diskio-unix
  MBR_LIBS=support diskio diskio-unix basicmbr mbrpart
-@@ -14,16 +14,16 @@
+@@ -14,16 +17,13 @@
  all:	cgdisk gdisk sgdisk fixparts
  
  gdisk:	$(LIB_OBJS) gdisk.o gpttext.o
 -#	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) -luuid -o gdisk
 -	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) -licuio -licuuc -luuid -o gdisk
-+	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) -luuid -o gdisk
-+#	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) -licuio -licuuc -luuid -o gdisk
++	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) $(UTF16_LIBS) -luuid -o gdisk
  
  cgdisk: $(LIB_OBJS) cgdisk.o gptcurses.o
 -#	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -luuid -lncurses -o cgdisk
 -	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -licuio -licuuc -luuid -lncurses -o cgdisk
-+	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -luuid -lncurses -o cgdisk
-+#	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -licuio -licuuc -luuid -lncurses -o cgdisk
++	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) $(UTF16_LIBS) -luuid -lncurses -o cgdisk
  
  sgdisk: $(LIB_OBJS) sgdisk.o gptcl.o
 -#	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) -luuid -lpopt -o sgdisk
 -	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) -licuio -licuuc -luuid -lpopt -o sgdisk
-+	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) -luuid -lpopt -o sgdisk
-+#	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) -licuio -licuuc -luuid -lpopt -o sgdisk
++	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) $(UTF16_LIBS) -luuid -lpopt -o sgdisk
  
  fixparts: $(MBR_LIB_OBJS) fixparts.o
  	$(CXX) $(MBR_LIB_OBJS) fixparts.o $(LDFLAGS) -o fixparts
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index 988eecf..0478041 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -15,9 +15,14 @@ ifeq ($(BR2_PACKAGE_GPTFDISK_SGDISK),y)
     GPTFDISK_DEPENDENCIES += popt
 endif
 
+ifeq ($(BR2_PACKAGE_ICU),y)
+    GPTFDISK_DEPENDENCIES += icu
+    GPTFDISK_MAKE_OPTS += USE_UTF16=y
+endif
+
 define GPTFDISK_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		$(GPTFDISK_TARGETS_y)
+		$(GPTFDISK_MAKE_OPTS) $(GPTFDISK_TARGETS_y)
 endef
 
 define GPTFDISK_INSTALL_TARGET_CMDS
