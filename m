From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  2 Jun 2012 18:13:57 +0200
Subject: [Buildroot] [PATCH 07/10] dmidecode: new package
In-Reply-To: <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
References: <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
Message-ID: <774519e24bff943a30688e14d34e6e37bb57ed4e.1338653505.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/dmidecode/Config.in                        |    9 +++++
 .../dmidecode/dmidecode-build-system-fixes.patch   |   35 ++++++++++++++++++++
 package/dmidecode/dmidecode.mk                     |   18 ++++++++++
 4 files changed, 63 insertions(+)
 create mode 100644 package/dmidecode/Config.in
 create mode 100644 package/dmidecode/dmidecode-build-system-fixes.patch
 create mode 100644 package/dmidecode/dmidecode.mk

diff --git a/package/Config.in b/package/Config.in
index 53d6bba..09ca9dd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -173,6 +173,7 @@ source "package/dbus-python/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/devmem2/Config.in"
 endif
+source "package/dmidecode/Config.in"
 source "package/dmraid/Config.in"
 source "package/dosfstools/Config.in"
 source "package/e2fsprogs/Config.in"
diff --git a/package/dmidecode/Config.in b/package/dmidecode/Config.in
new file mode 100644
index 0000000..22272ed
--- /dev/null
+++ b/package/dmidecode/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_DMIDECODE
+	bool "dmidecode"
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  Dmidecode reports information about your system's hardware
+	  as described in your system BIOS according to the SMBIOS/DMI
+	  standard.
+
+	  http://www.nongnu.org/dmidecode/
diff --git a/package/dmidecode/dmidecode-build-system-fixes.patch b/package/dmidecode/dmidecode-build-system-fixes.patch
new file mode 100644
index 0000000..275f9df
--- /dev/null
+++ b/package/dmidecode/dmidecode-build-system-fixes.patch
@@ -0,0 +1,35 @@
+Minor build system fixes
+
+Usual build system fixes to allow CC/CFLAGS/LDFLAGS to be overriden
+from the command line, and completed by additional flags from the
+Makefile.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Makefile
+===================================================================
+--- a/Makefile
++++ b/Makefile
+@@ -12,9 +12,10 @@
+ #   (at your option) any later version.
+ #
+ 
+-CC      = gcc
+-CFLAGS  = -W -Wall -Wshadow -Wstrict-prototypes -Wpointer-arith -Wcast-qual \
+-          -Wcast-align -Wwrite-strings -Wmissing-prototypes -Winline -Wundef
++CC      ?= gcc
++override CFLAGS  += \
++	-W -Wall -Wshadow -Wstrict-prototypes -Wpointer-arith -Wcast-qual \
++        -Wcast-align -Wwrite-strings -Wmissing-prototypes -Winline -Wundef
+ #CFLAGS += -DBIGENDIAN
+ #CFLAGS += -DALIGNMENT_WORKAROUND
+ 
+@@ -23,7 +24,7 @@
+ #CFLAGS += -g
+ 
+ # Pass linker flags here
+-LDFLAGS =
++override LDFLAGS +=
+ 
+ DESTDIR =
+ prefix  = /usr/local
diff --git a/package/dmidecode/dmidecode.mk b/package/dmidecode/dmidecode.mk
new file mode 100644
index 0000000..a036a7a
--- /dev/null
+++ b/package/dmidecode/dmidecode.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# dmidecode
+#
+#############################################################
+
+DMIDECODE_VERSION = 2.11
+DMIDECODE_SITE    = http://download.savannah.gnu.org/releases/dmidecode/
+
+define DMIDECODE_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+endef
+
+define DMIDECODE_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) prefix=/usr DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.9.5
