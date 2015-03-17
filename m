From: Steve Kenton <skenton@ou.edu>
Date: Tue, 17 Mar 2015 10:07:33 -0500
Subject: [Buildroot] [PATCH 1/1] dvdrw-tools: new package
Message-ID: <1426604853-29678-1-git-send-email-skenton@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The dvd+rw-tools are used to master Blu-ray Disc
and DVD Disc media, both +RW/+R and -RW/-R. Note:
The +RW in the name is a historical artifact. This
package contains the widely used growisofs program.

Signed-off-by: Steve Kenton <skenton@ou.edu>
---
One more time. I was confusing the submission patch
with the patch to the package - Doh! But I think
I got it right this time. At least 'file' shows this
after cross compiling on an x86 system.

genisoimage: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), dynamically linked (uses shared libs), stripped

 package/Config.in                       |  1 +
 package/dvdrw-tools/0001-limits.h.patch | 23 ++++++++++++++
 package/dvdrw-tools/Config.in           | 56 +++++++++++++++++++++++++++++++++
 package/dvdrw-tools/dvdrw-tools.hash    |  3 ++
 package/dvdrw-tools/dvdrw-tools.mk      | 32 +++++++++++++++++++
 5 files changed, 115 insertions(+)
 create mode 100644 package/dvdrw-tools/0001-limits.h.patch
 create mode 100644 package/dvdrw-tools/Config.in
 create mode 100644 package/dvdrw-tools/dvdrw-tools.hash
 create mode 100644 package/dvdrw-tools/dvdrw-tools.mk

diff --git a/package/Config.in b/package/Config.in
index c183748..96e373a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -7,6 +7,7 @@ menu "Audio and video applications"
 	source "package/aumix/Config.in"
 	source "package/bellagio/Config.in"
 	source "package/dvdauthor/Config.in"
+	source "package/dvdrw-tools/Config.in"
 	source "package/espeak/Config.in"
 	source "package/faad2/Config.in"
 	source "package/ffmpeg/Config.in"
diff --git a/package/dvdrw-tools/0001-limits.h.patch b/package/dvdrw-tools/0001-limits.h.patch
new file mode 100644
index 0000000..ccda8ee
--- /dev/null
+++ b/package/dvdrw-tools/0001-limits.h.patch
@@ -0,0 +1,23 @@
+transport.hxx: add limits.h include now needed because of kernel changes
+
+Signed-off-by: Steve Kenton <skenton@ou.edu>
+
+diff -pruN dvd+rw-tools-7.1.ori/transport.hxx dvd+rw-tools-7.1/transport.hxx
+--- dvd+rw-tools-7.1.ori/transport.hxx	2008-03-01 04:34:43.000000000 -0600
++++ dvd+rw-tools-7.1/transport.hxx	2015-01-18 15:47:24.245863631 -0600
+@@ -9,6 +9,7 @@
+ #if defined(__unix) || defined(__unix__)
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <limits.h>
+ #include <unistd.h>
+ #include <string.h>
+ #include <sys/types.h>
+@@ -40,6 +41,7 @@ inline long getmsecs()
+ #include <stddef.h>
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <limits.h>
+ #define ssize_t		LONG_PTR
+ #define off64_t		__int64
+ 
diff --git a/package/dvdrw-tools/Config.in b/package/dvdrw-tools/Config.in
new file mode 100644
index 0000000..cdcdaa3
--- /dev/null
+++ b/package/dvdrw-tools/Config.in
@@ -0,0 +1,56 @@
+config BR2_PACKAGE_DVDRW_TOOLS
+	bool "dvdrw-tools"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	depends on BR2_LARGEFILE
+	help
+	  The dvd+rw-tools are used to master Blu-ray Disc
+	  and DVD Disc media, both +RW/+R and -RW/-R. The
+	  +RW in the name is a historical artifact. This
+	  package contains the widely used growisofs program.
+
+	  Buildroot does not support packages with a '+' sign
+	  in their name, which explains why it is named
+	  dvdrw-tools and not dvd+rw-tools.
+
+	  Because dvd+rw-tools does not directly interact with
+	  disc media it uses a separate media backend program.
+	  The usual backend is mkisofs from the cdrtools package.
+	  However, cdrtools is not currently part of buildroot.
+
+	  The Linux From Scratch project uses uses xorriso for the
+	  media backend and Ubuntu uses cdrkit for the backend.
+	  Choose the one which seems most appropriate for your use.
+	  NOTE: xorriso does not currently support UDF.
+	  
+	  http://fy.chalmers.se/~appro/linux/DVD+RW/tools
+
+comment "dvdrw-tools needs a toolchain w/threads, C++, wchar, largefile"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
+		|| !BR2_LARGEFILE
+
+if BR2_PACKAGE_DVDRW_TOOLS
+choice
+	prompt "Media Backend"
+	default BR2_PACKAGE_DVDRW_CDRKIT_BACKEND
+	help
+	  Choose which media backend program to use.
+
+config BR2_PACKAGE_DVDRW_TOOLS_CDRKIT_BACKEND
+	bool "cdrkit"
+	select BR2_PACKAGE_CDRKIT
+	help
+	  Symlink mkisofs to genisoimage from the cdrkit package.
+
+config BR2_PACKAGE_DVDRW_TOOLS_XORRISO_BACKEND
+	bool "xorriso"
+	select BR2_PACKAGE_XORRISO
+	help
+	  Symlink mkisofs to xorrisofs from the xorriso package.
+
+endchoice
+endif
diff --git a/package/dvdrw-tools/dvdrw-tools.hash b/package/dvdrw-tools/dvdrw-tools.hash
new file mode 100644
index 0000000..5d79709
--- /dev/null
+++ b/package/dvdrw-tools/dvdrw-tools.hash
@@ -0,0 +1,3 @@
+# Locally computed using sha256sum
+sha256	f8d60f822e914128bcbc5f64fbe3ed131cbff9045dca7e12c5b77b26edde72ca	dvd+rw-tools-7.1.tar.gz
+
diff --git a/package/dvdrw-tools/dvdrw-tools.mk b/package/dvdrw-tools/dvdrw-tools.mk
new file mode 100644
index 0000000..af6105d
--- /dev/null
+++ b/package/dvdrw-tools/dvdrw-tools.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# dvdrw-tools
+#
+################################################################################
+
+DVDRW_TOOLS_VERSION = 7.1
+DVDRW_TOOLS_SOURCE = dvd+rw-tools-$(DVDRW_TOOLS_VERSION).tar.gz
+DVDRW_TOOLS_SITE = http://fy.chalmers.se/~appro/linux/DVD+RW/tools
+DVDRW_TOOLS_LICENSE = GPLv2
+DVDRW_TOOLS_LICENSE_FILES = LICENSE
+
+define DVDRW_TOOLS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+ifeq ($(BR2_PACKAGE_DVDRW_TOOLS_CDRKIT_BACKEND),y)
+DVDRW_TOOLS_BACKEND = genisoimage
+else ifeq ($(BR2_PACKAGE_DVDRW_TOOLS_XORRISO_BACKEND),y)
+DVDRW_TOOLS_BACKEND = xorrisofs
+endif
+
+define DVDRW_TOOLS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/dvd-ram-control $(TARGET_DIR)/usr/bin/dvd-ram-control
+	$(INSTALL) -m 0755 -D $(@D)/dvd+rw-booktype $(TARGET_DIR)/usr/bin/dvd+rw-booktype
+	$(INSTALL) -m 0755 -D $(@D)/dvd+rw-format $(TARGET_DIR)/usr/bin/dvd+rw-format
+	$(INSTALL) -m 0755 -D $(@D)/dvd+rw-mediainfo $(TARGET_DIR)/usr/bin/dvd+rw-mediainfo
+	$(INSTALL) -m 0755 -D $(@D)/growisofs $(TARGET_DIR)/usr/bin/growisofs
+	ln -s -f /usr/bin/$(DVDRW_TOOLS_BACKEND) $(TARGET_DIR)/usr/bin/mkisofs
+endef
+
+$(eval $(generic-package))
-- 
2.1.0
