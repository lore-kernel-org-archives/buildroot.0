From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Dec 2014 13:31:39 +0100
Subject: [Buildroot] [PATCH 2/2] bluez5_utils: fix missing link against librt
In-Reply-To: <1419856299-30204-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1419856299-30204-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1419856299-30204-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch to bluez5_utils to make sure that the mcaptest tool gets
linked against librt, since it uses clock_getres().

Fixes:

  http://autobuild.buildroot.org/results/2b1/2b1e521422d9af2b13133323c6534c49fbb0e177/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../bluez5_utils/0001-Link-mcaptest-with-lrt.patch | 37 ++++++++++++++++++++++
 package/bluez5_utils/bluez5_utils.mk               |  3 ++
 2 files changed, 40 insertions(+)
 create mode 100644 package/bluez5_utils/0001-Link-mcaptest-with-lrt.patch

diff --git a/package/bluez5_utils/0001-Link-mcaptest-with-lrt.patch b/package/bluez5_utils/0001-Link-mcaptest-with-lrt.patch
new file mode 100644
index 0000000..9933a08
--- /dev/null
+++ b/package/bluez5_utils/0001-Link-mcaptest-with-lrt.patch
@@ -0,0 +1,37 @@
+From 2d965dce71df18221e625efbfe380b54e6441d64 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 29 Dec 2014 12:23:41 +0100
+Subject: [PATCH] Link mcaptest with -lrt
+
+The mcaptest tool uses the profiles/health/mcap.c source file, which
+calls clock_getres(). This function is defined in librt, so mcaptest
+should be linked against librt, otherwise one gets link failures such
+as:
+
+ld: profiles/health/mcap.o: undefined reference to symbol 'clock_getres@@GLIBC_2.2.5'
+ld: note: 'clock_getres@@GLIBC_2.2.5' is defined in DSO [...]/sysroot/lib64/librt.so.1 so try adding it to the linker command line
+[...]/sysroot/lib64/librt.so.1: could not read symbols: Invalid operation
+collect2: error: ld returned 1 exit status
+Makefile:4184: recipe for target 'tools/mcaptest' failed
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.tools | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.tools b/Makefile.tools
+index bc827fe..178b773 100644
+--- a/Makefile.tools
++++ b/Makefile.tools
+@@ -195,7 +195,7 @@ tools_mcaptest_SOURCES = tools/mcaptest.c \
+ 				btio/btio.h btio/btio.c \
+ 				src/log.c src/log.h \
+ 				profiles/health/mcap.h profiles/health/mcap.c
+-tools_mcaptest_LDADD = lib/libbluetooth-internal.la @GLIB_LIBS@
++tools_mcaptest_LDADD = lib/libbluetooth-internal.la @GLIB_LIBS@ -lrt
+ 
+ dist_man_MANS += tools/hciattach.1 tools/hciconfig.1 \
+ 			tools/hcitool.1 tools/hcidump.1 \
+-- 
+2.1.0
+
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index b1a1724..a1adbe1 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -12,6 +12,9 @@ BLUEZ5_UTILS_DEPENDENCIES = dbus libglib2
 BLUEZ5_UTILS_LICENSE = GPLv2+ LGPLv2.1+
 BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
 
+# 0001-Link-mcaptest-with-lrt.patch
+BLUEZ5_UTILS_AUTORECONF = YES
+
 BLUEZ5_UTILS_CONF_OPTS = 	\
 	--enable-tools 		\
 	--enable-library 	\
-- 
2.1.0
