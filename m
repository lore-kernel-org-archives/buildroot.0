From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Mar 2013 21:45:24 +0100
Subject: [Buildroot] [PATCH v2 2/8] gdisk: rename to gptfdisk
In-Reply-To: <1362689131-1479-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362689131-1479-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362689131-1479-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to match the new upstream name, rename the gdisk package to
gptfdisk. We add the relevant legacy configuration options to ensure a
smooth transition for users.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                             |   26 ++++++++++++++++
 package/Config.in                            |    2 +-
 package/gdisk/Config.in                      |   36 ---------------------
 package/gdisk/gdisk-001-no-utf16.patch       |   43 --------------------------
 package/gdisk/gdisk.mk                       |   39 -----------------------
 package/gptfdisk/Config.in                   |   36 +++++++++++++++++++++
 package/gptfdisk/gptfdisk-001-no-utf16.patch |   43 ++++++++++++++++++++++++++
 package/gptfdisk/gptfdisk.mk                 |   38 +++++++++++++++++++++++
 8 files changed, 144 insertions(+), 119 deletions(-)
 delete mode 100644 package/gdisk/Config.in
 delete mode 100644 package/gdisk/gdisk-001-no-utf16.patch
 delete mode 100644 package/gdisk/gdisk.mk
 create mode 100644 package/gptfdisk/Config.in
 create mode 100644 package/gptfdisk/gptfdisk-001-no-utf16.patch
 create mode 100644 package/gptfdisk/gptfdisk.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index d90132c..5be142a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -40,6 +40,32 @@ comment "As long as these options stay selected, the build   "
 comment "will fail.                                          "
 endif
 
+#
+# Legacy options since 2013.02
+#
+
+config BR2_PACKAGE_GDISK
+        bool "gdisk has been replaced by gptfdisk"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GPTFDISK
+	help
+	  The option has been renamed BR2_PACKAGE_GPTFDISK.
+
+config BR2_PACKAGE_GDISK_GDISK
+        bool "gdisk tool from gdisk has been replaced by gdisk in gptfdisk"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GPTFDISK
+	select BR2_PACKAGE_GPTFDISK_GDISK
+	help
+	  The option has been renamed BR2_PACKAGE_GPTFDISK_GDISK.
+
+config BR2_PACKAGE_GDISK_SGDISK
+        bool "sgdisk tool from gdisk has been replaced by sgdisk in gptfdisk"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GPTFDISK
+	select BR2_PACKAGE_GPTFDISK_SGDISK
+	help
+	  The option has been renamed BR2_PACKAGE_GPTFDISK_SGDISK.
 
 #
 # Legacy options since 2012.11
diff --git a/package/Config.in b/package/Config.in
index 22e64f8..6458b6e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -235,8 +235,8 @@ source "package/fis/Config.in"
 source "package/fmtools/Config.in"
 source "package/fxload/Config.in"
 source "package/gadgetfs-test/Config.in"
-source "package/gdisk/Config.in"
 source "package/gpsd/Config.in"
+source "package/gptfdisk/Config.in"
 source "package/gvfs/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/hdparm/Config.in"
diff --git a/package/gdisk/Config.in b/package/gdisk/Config.in
deleted file mode 100644
index 24d305d..0000000
--- a/package/gdisk/Config.in
+++ /dev/null
@@ -1,36 +0,0 @@
-config BR2_PACKAGE_GDISK
-	bool "gdisk"
-	depends on BR2_LARGEFILE
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR # util-linux
-	help
-	  GPT fdisk (consisting of the gdisk and sgdisk programs) is a
-	  text-mode partitioning tool that works on Globally Unique Identifier
-	  (GUID) Partition Table (GPT) disks, rather than on the more common
-	  (through 2010) Master Boot Record (MBR) partition tables.
-
-	  http://www.rodsbooks.com/gdisk/
-
-config BR2_PACKAGE_GDISK_GDISK
-	bool "interactive gdisk"
-	depends on BR2_PACKAGE_GDISK
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	help
-	  Install the interactive GUID partition table (GPT) manipulator
-	  /usr/sbin/gdisk which is modelled after and quite similar in use
-	  to the traditional MBR based fdisk tool.
-
-config BR2_PACKAGE_GDISK_SGDISK
-	bool "command line sgdisk"
-	depends on BR2_PACKAGE_GDISK
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	select BR2_PACKAGE_POPT
-	help
-	  Install the command-line GUID partition table (GPT) manipulator
-	  /usr/sbin/sgdisk which is named after the traditional MBR based
-	  sfdisk tool albeit with an entirely different option syntax.
-
-comment "gdisk requires a toolchain with LARGEFILE/WCHAR/C++ support enabled"
-	depends on !(BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
diff --git a/package/gdisk/gdisk-001-no-utf16.patch b/package/gdisk/gdisk-001-no-utf16.patch
deleted file mode 100644
index 540e741..0000000
--- a/package/gdisk/gdisk-001-no-utf16.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-[PATCH] Disable UTF16 support
-
-libicu is quite large, and unicode partition names are uncommon.
-
-Signed-off-by: Justin Maggard <jmaggard10@gmail.com>
----
-diff -ur gdisk-0.8.5/Makefile gptfdisk-0.8.5/Makefile
---- gdisk-0.8.5/Makefile	2012-05-30 08:38:43.000000000 -0700
-+++ gptfdisk-0.8.5/Makefile	2012-06-05 11:38:23.710597974 -0700
-@@ -1,8 +1,8 @@
- CC=gcc
- CXX=g++
- CFLAGS+=-D_FILE_OFFSET_BITS=64
--CXXFLAGS+=-Wall -D_FILE_OFFSET_BITS=64 -D USE_UTF16
--#CXXFLAGS+=-Wall -D_FILE_OFFSET_BITS=64
-+#CXXFLAGS+=-Wall -D_FILE_OFFSET_BITS=64 -D USE_UTF16
-+CXXFLAGS+=-Wall -D_FILE_OFFSET_BITS=64
- LDFLAGS+=
- LIB_NAMES=crc32 support guid gptpart mbrpart basicmbr mbr gpt bsd parttypes attributes diskio diskio-unix
- MBR_LIBS=support diskio diskio-unix basicmbr mbrpart
-@@ -14,16 +14,16 @@
- all:	cgdisk gdisk sgdisk fixparts
- 
- gdisk:	$(LIB_OBJS) gdisk.o gpttext.o
--#	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) -luuid -o gdisk
--	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) -licuio -licuuc -luuid -o gdisk
-+	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) -luuid -o gdisk
-+#	$(CXX) $(LIB_OBJS) gdisk.o gpttext.o $(LDFLAGS) -licuio -licuuc -luuid -o gdisk
- 
- cgdisk: $(LIB_OBJS) cgdisk.o gptcurses.o
--#	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -luuid -lncurses -o cgdisk
--	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -licuio -licuuc -luuid -lncurses -o cgdisk
-+	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -luuid -lncurses -o cgdisk
-+#	$(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -licuio -licuuc -luuid -lncurses -o cgdisk
- 
- sgdisk: $(LIB_OBJS) sgdisk.o gptcl.o
--#	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) -luuid -lpopt -o sgdisk
--	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) -licuio -licuuc -luuid -lpopt -o sgdisk
-+	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) -luuid -lpopt -o sgdisk
-+#	$(CXX) $(LIB_OBJS) sgdisk.o gptcl.o $(LDFLAGS) -licuio -licuuc -luuid -lpopt -o sgdisk
- 
- fixparts: $(MBR_LIB_OBJS) fixparts.o
- 	$(CXX) $(MBR_LIB_OBJS) fixparts.o $(LDFLAGS) -o fixparts
diff --git a/package/gdisk/gdisk.mk b/package/gdisk/gdisk.mk
deleted file mode 100644
index cda369e..0000000
--- a/package/gdisk/gdisk.mk
+++ /dev/null
@@ -1,39 +0,0 @@
-#############################################################
-#
-# gdisk
-#
-#############################################################
-
-GDISK_VERSION = 0.8.6
-GDISK_SITE = http://downloads.sourceforge.net/sourceforge/gptfdisk
-GDISK_SOURCE = gptfdisk-$(GDISK_VERSION).tar.gz
-
-GDISK_TARGETS_$(BR2_PACKAGE_GDISK_GDISK) += gdisk
-GDISK_TARGETS_$(BR2_PACKAGE_GDISK_SGDISK) += sgdisk
-
-ifneq ($(GDISK_TARGETS_y),)
-
-GDISK_DEPENDENCIES += util-linux
-ifeq ($(BR2_PACKAGE_GDISK_SGDISK),y)
-    GDISK_DEPENDENCIES += popt
-endif
-
-
-define GDISK_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" \
-		-C $(@D) $(GDISK_TARGETS_y)
-endef
-
-define GDISK_INSTALL_TARGET_CMDS
-	for i in $(GDISK_TARGETS_y); do \
-	    $(INSTALL) -D $(@D)/$$i $(TARGET_DIR)/usr/sbin/; \
-	done
-endef
-
-define GDISK_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,$(GDISK_TARGETS_y))
-endef
-
-endif
-
-$(eval $(generic-package))
diff --git a/package/gptfdisk/Config.in b/package/gptfdisk/Config.in
new file mode 100644
index 0000000..7851dc3
--- /dev/null
+++ b/package/gptfdisk/Config.in
@@ -0,0 +1,36 @@
+config BR2_PACKAGE_GPTFDISK
+	bool "gptfdisk"
+	depends on BR2_LARGEFILE
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR # util-linux
+	help
+	  GPT fdisk (consisting of the gdisk and sgdisk programs) is a
+	  text-mode partitioning tool that works on Globally Unique Identifier
+	  (GUID) Partition Table (GPT) disks, rather than on the more common
+	  (through 2010) Master Boot Record (MBR) partition tables.
+
+	  http://www.rodsbooks.com/gdisk/
+
+config BR2_PACKAGE_GPTFDISK_GDISK
+	bool "interactive gdisk"
+	depends on BR2_PACKAGE_GPTFDISK
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  Install the interactive GUID partition table (GPT) manipulator
+	  /usr/sbin/gdisk which is modelled after and quite similar in use
+	  to the traditional MBR based fdisk tool.
+
+config BR2_PACKAGE_GPTFDISK_SGDISK
+	bool "command line sgdisk"
+	depends on BR2_PACKAGE_GPTFDISK
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_POPT
+	help
+	  Install the command-line GUID partition table (GPT) manipulator
+	  /usr/sbin/sgdisk which is named after the traditional MBR based
+	  sfdisk tool albeit with an entirely different option syntax.
+
+comment "gptfdisk requires a toolchain with LARGEFILE/WCHAR/C++ support enabled"
+	depends on !(BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
diff --git a/package/gptfdisk/gptfdisk-001-no-utf16.patch b/package/gptfdisk/gptfdisk-001-no-utf16.patch
new file mode 100644
index 0000000..540e741
--- /dev/null
+++ b/package/gptfdisk/gptfdisk-001-no-utf16.patch
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
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
new file mode 100644
index 0000000..7755a30
--- /dev/null
+++ b/package/gptfdisk/gptfdisk.mk
@@ -0,0 +1,38 @@
+#############################################################
+#
+# gptfdisk
+#
+#############################################################
+
+GPTFDISK_VERSION = 0.8.6
+GPTFDISK_SITE = http://downloads.sourceforge.net/sourceforge/gptfdisk
+
+GPTFDISK_TARGETS_$(BR2_PACKAGE_GPTFDISK_GDISK) += gdisk
+GPTFDISK_TARGETS_$(BR2_PACKAGE_GPTFDISK_SGDISK) += sgdisk
+
+ifneq ($(GPTFDISK_TARGETS_y),)
+
+GPTFDISK_DEPENDENCIES += util-linux
+ifeq ($(BR2_PACKAGE_GPTFDISK_SGDISK),y)
+    GPTFDISK_DEPENDENCIES += popt
+endif
+
+
+define GPTFDISK_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" \
+		-C $(@D) $(GPTFDISK_TARGETS_y)
+endef
+
+define GPTFDISK_INSTALL_TARGET_CMDS
+	for i in $(GPTFDISK_TARGETS_y); do \
+	    $(INSTALL) -D $(@D)/$$i $(TARGET_DIR)/usr/sbin/; \
+	done
+endef
+
+define GPTFDISK_UNINSTALL_TARGET_CMDS
+	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,$(GPTFDISK_TARGETS_y))
+endef
+
+endif
+
+$(eval $(generic-package))
-- 
1.7.9.5
