From: Justin Maggard <jmaggard10@gmail.com>
Date: Wed, 13 Jun 2012 15:20:43 -0700
Subject: [Buildroot] [PATCH v2] Update gdisk (gptfdisk) to version 0.8.5.
Message-ID: <1339626043-11946-1-git-send-email-jmaggard10@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update GPT fdisk utility to upstream version 0.8.5.

Signed-off-by: Justin Maggard <jmaggard10@gmail.com>
---
 package/gdisk/gdisk-0.6.14-uuid.h.patch  |   22 ------------------
 package/gdisk/gdisk-0.8.5-no-utf16.patch |   43 ++++++++++++++++++++++++++++++++++++
 package/gdisk/gdisk.mk                   |    4 ++--
 3 files changed, 45 insertions(+), 24 deletions(-)
 delete mode 100644 package/gdisk/gdisk-0.6.14-uuid.h.patch
 create mode 100644 package/gdisk/gdisk-0.8.5-no-utf16.patch

diff --git a/package/gdisk/gdisk-0.6.14-uuid.h.patch b/package/gdisk/gdisk-0.6.14-uuid.h.patch
deleted file mode 100644
index ba447a1..0000000
--- a/package/gdisk/gdisk-0.6.14-uuid.h.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-[PATCH] Don't hardcode uuid.h location
-
-Breaks cross compilation.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- guid.h |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: gdisk-0.6.14/guid.h
-===================================================================
---- gdisk-0.6.14.orig/guid.h
-+++ gdisk-0.6.14/guid.h
-@@ -22,7 +22,7 @@
- #ifdef _WIN32
- typedef unsigned char my_uuid_t[16];
- #else
--#include </usr/include/uuid/uuid.h>
-+#include <uuid/uuid.h>
- typedef uuid_t my_uuid_t;
- #endif
- 
diff --git a/package/gdisk/gdisk-0.8.5-no-utf16.patch b/package/gdisk/gdisk-0.8.5-no-utf16.patch
new file mode 100644
index 0000000..54e55f6
--- /dev/null
+++ b/package/gdisk/gdisk-0.8.5-no-utf16.patch
@@ -0,0 +1,43 @@
+[PATCH] Disable UTF16 support
+
+libicu is quite large, and unicode partition names are uncommon.
+
+Signed-off-by: Justin Maggard <jmaggard10@gmail.com>
+---
+diff -ur gdisk-0.8.5/Makefile gptfdisk-0.8.5/Makefile
+--- gdisk-0.8.5/Makefile	2012-05-30 08:38:43.000000000 -0700
++++ gptfdisk-0.8.5/Makefile	2012-06-05 11:38:23.710597974 -0700
+@@ -1,8 +1,8 @@
+ CC=gcc
+ CXX=g++
+ CFLAGS+=-D_FILE_OFFSET_BITS=64
+-CXXFLAGS+=-Wall -D_FILE_OFFSET_BITS=64 -D USE_UTF16
+-#CXXFLAGS+=-Wall -D_FILE_OFFSET_BITS=64
++#CXXFLAGS+=-Wall -D_FILE_OFFSET_BITS=64 -D USE_UTF16
++CXXFLAGS+=-Wall -D_FILE_OFFSET_BITS=64
+ LDFLAGS+=
+ LIB_NAMES=crc32 support guid gptpart mbrpart basicmbr mbr gpt bsd parttypes attributes diskio diskio-unix
+ MBR_LIBS=support diskio diskio-unix basicmbr mbrpart
+@@ -14,16 +14,16 @@
+ all:	cgdisk gdisk sgdisk fixparts
+ 
+ gdisk:	$(LIB_OBJS) gdisk.o gpttext.o
+-#	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) -luuid -o gdisk
+-	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) -licuio -licuuc -luuid -o gdisk
++	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) -luuid -o gdisk
++#	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) -licuio -licuuc -luuid -o gdisk
+ 
+ cgdisk: $(LIB_OBJS) cgdisk.o gptcurses.o
+-#	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -luuid -lncurses -o cgdisk
+-	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -licuio -licuuc -luuid -lncurses -o cgdisk
++	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -luuid -lncurses -o cgdisk
++#	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -licuio -licuuc -luuid -lncurses -o cgdisk
+ 
+ sgdisk: $(LIB_OBJS) sgdisk.o gptcl.o
+-#	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) -luuid -lpopt -o sgdisk
+-	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) -licuio -licuuc -luuid -lpopt -o sgdisk
++	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) -luuid -lpopt -o sgdisk
++#	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) -licuio -licuuc -luuid -lpopt -o sgdisk
+ 
+ fixparts: $(MBR_LIB_OBJS) fixparts.o
+ 	$(CXX) $(MBR_LIB_OBJS) fixparts.o $(LDFLAGS) -o fixparts
diff --git a/package/gdisk/gdisk.mk b/package/gdisk/gdisk.mk
index a53ee83..619a32d 100644
--- a/package/gdisk/gdisk.mk
+++ b/package/gdisk/gdisk.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-GDISK_VERSION = 0.6.14
+GDISK_VERSION = 0.8.5
 GDISK_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/gptfdisk
-GDISK_SOURCE = gdisk-$(GDISK_VERSION).tgz
+GDISK_SOURCE = gptfdisk-$(GDISK_VERSION).tar.gz
 
 GDISK_TARGETS_$(BR2_PACKAGE_GDISK_GDISK) += gdisk
 GDISK_TARGETS_$(BR2_PACKAGE_GDISK_SGDISK) += sgdisk
-- 
1.7.9.5
