From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 13 Mar 2015 18:33:04 -0300
Subject: [Buildroot] [PATCH] gptfdisk: bump to version 0.8.10
Message-ID: <1426282384-16194-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop the ICU patch and ICU support since it's no longer necessary.
Use original hashes from sourceforge.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../gptfdisk/0001-configurable-utf16-support.patch | 50 ----------------------
 package/gptfdisk/Config.in                         |  1 +
 package/gptfdisk/gptfdisk.hash                     |  5 ++-
 package/gptfdisk/gptfdisk.mk                       |  7 +--
 4 files changed, 5 insertions(+), 58 deletions(-)
 delete mode 100644 package/gptfdisk/0001-configurable-utf16-support.patch

diff --git a/package/gptfdisk/0001-configurable-utf16-support.patch b/package/gptfdisk/0001-configurable-utf16-support.patch
deleted file mode 100644
index 6d54cea..0000000
--- a/package/gptfdisk/0001-configurable-utf16-support.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-[PATCH] Make the UTF16 support configurable
-
-libicu is quite large, and unicode partition names are uncommon, so we
-may not necessarily want to have UTF16 support unconditionnally. This
-patch adds a USE_UTF16 environment variable to tell whether we want
-the UTF16 support or not.
-
-Signed-off-by: Justin Maggard <jmaggard10@gmail.com>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[baruch: add $(LDLIBS)]
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Index: b/Makefile
-===================================================================
---- a/Makefile
-+++ b/Makefile
-@@ -1,8 +1,11 @@
- CC=gcc
- CXX=g++
- CFLAGS+=-D_FILE_OFFSET_BITS=64
--CXXFLAGS+=-Wall -D_FILE_OFFSET_BITS=64 -D USE_UTF16
--#CXXFLAGS+=-Wall -D_FILE_OFFSET_BITS=64
-+CXXFLAGS+=-Wall -D_FILE_OFFSET_BITS=64
-+ifeq ($(USE_UTF16),y)
-+CXXFLAGS+=-D USE_UTF16
-+UTF16_LIBS=-licuio -licuuc
-+endif
- LDFLAGS+=
- LIB_NAMES=crc32 support guid gptpart mbrpart basicmbr mbr gpt bsd parttypes attributes diskio diskio-unix
- MBR_LIBS=support diskio diskio-unix basicmbr mbrpart
-@@ -14,16 +17,13 @@
- all:	cgdisk gdisk sgdisk fixparts
- 
- gdisk:	$(LIB_OBJS) gdisk.o gpttext.o
--#	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) -luuid -o gdisk
--	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) -licuio -licuuc -luuid -o gdisk
-+	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) $(UTF16_LIBS) -luuid $(LDLIBS) -o gdisk
- 
- cgdisk: $(LIB_OBJS) cgdisk.o gptcurses.o
--#	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -luuid -lncurses -o cgdisk
--	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -licuio -licuuc -luuid -lncurses -o cgdisk
-+	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) $(UTF16_LIBS) -luuid -lncurses $(LDLIBS) -o cgdisk
- 
- sgdisk: $(LIB_OBJS) sgdisk.o gptcl.o
--#	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) -luuid -lpopt -o sgdisk
--	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) -licuio -licuuc -luuid -lpopt -o sgdisk
-+	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) $(UTF16_LIBS) -luuid -lpopt $(LDLIBS) -o sgdisk
- 
- fixparts: $(MBR_LIB_OBJS) fixparts.o
- 	$(CXX) $(MBR_LIB_OBJS) fixparts.o $(LDFLAGS) -o fixparts
diff --git a/package/gptfdisk/Config.in b/package/gptfdisk/Config.in
index 264b4d7..61692f6 100644
--- a/package/gptfdisk/Config.in
+++ b/package/gptfdisk/Config.in
@@ -37,6 +37,7 @@ config BR2_PACKAGE_GPTFDISK_SGDISK
 config BR2_PACKAGE_GPTFDISK_CGDISK
 	bool "ncurses cgdisk"
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_WCHAR # needed because of UTF-16
 	help
 	  Install the ncurses-based GUID partition table (GPT)
 	  manipulator /usr/sbin/cgdisk.
diff --git a/package/gptfdisk/gptfdisk.hash b/package/gptfdisk/gptfdisk.hash
index d254263..93f7b36 100644
--- a/package/gptfdisk/gptfdisk.hash
+++ b/package/gptfdisk/gptfdisk.hash
@@ -1,2 +1,3 @@
-# Locally computed:
-sha256  4579cd54842459699970e24720dda7fb0aa217027818623089c321bc62a647b2  gptfdisk-0.8.6.tar.gz
+# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/0.8.10/
+md5	9cf4246c181c324bdbd553fe9b348373	gptfdisk-0.8.10.tar.gz
+sha1	1708e232220236b6bdf299b315e9bc2205c01ba5	gptfdisk-0.8.10.tar.gz
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index 075af57..c11b1d9 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPTFDISK_VERSION = 0.8.6
+GPTFDISK_VERSION = 0.8.10
 GPTFDISK_SITE = http://downloads.sourceforge.net/sourceforge/gptfdisk
 GPTFDISK_LICENSE = GPLv2+
 GPTFDISK_LICENSE_FILES = COPYING
@@ -21,11 +21,6 @@ ifeq ($(BR2_PACKAGE_GPTFDISK_CGDISK),y)
 GPTFDISK_DEPENDENCIES += ncurses
 endif
 
-ifeq ($(BR2_PACKAGE_ICU),y)
-GPTFDISK_DEPENDENCIES += icu
-GPTFDISK_MAKE_OPTS += USE_UTF16=y
-endif
-
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE)$(BR2_STATIC_LIBS),yy)
 GPTFDISK_MAKE_OPTS += LDLIBS=-lintl
 endif
-- 
2.0.5
