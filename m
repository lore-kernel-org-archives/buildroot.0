From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sun,  9 Sep 2018 19:29:17 +0200
Subject: [Buildroot] [PATCH] parted: fix minor()/major() build failure due
 to glibc 2.28
Message-ID: <20180909172917.55169-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
and therefore <sys/sysmacros.h> must be included explicitly when
major()/minor() are used.

This commit adds a patch to directly include <sys/sysmacros.h> into
libparted/arch/linux.c files where minor() and major() macros are used.

Fixes:
http://autobuild.buildroot.net/results/d3a/d3a3cd9963e5a2be1cec8fb553f5b20fc2e3c85c//
http://autobuild.buildroot.net/results/ecf/ecfb634b5e6dac2c88b399fc1f1adc68ca42504c//

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 ...e-sys-sysmacros.h-to-compile-with-gl.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/parted/0005-libparted-include-sys-sysmacros.h-to-compile-with-gl.patch

diff --git a/package/parted/0005-libparted-include-sys-sysmacros.h-to-compile-with-gl.patch b/package/parted/0005-libparted-include-sys-sysmacros.h-to-compile-with-gl.patch
new file mode 100644
index 0000000000..63dda4c4ff
--- /dev/null
+++ b/package/parted/0005-libparted-include-sys-sysmacros.h-to-compile-with-gl.patch
@@ -0,0 +1,33 @@
+From 715e3e937536326af272c45a86cc3765f00297f7 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Sun, 9 Sep 2018 19:19:19 +0200
+Subject: [PATCH] libparted: include <sys/sysmacros.h> to compile with
+ glibc-2.28
+
+glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
+and therefore <sys/sysmacros.h> must be included explicitly when
+major()/minor() are used.
+
+Include <sys/sysmacros.h> into libparted/arch/linux.c where minor() and
+major() macros are used.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ libparted/arch/linux.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libparted/arch/linux.c b/libparted/arch/linux.c
+index 0f18904..b302d63 100644
+--- a/libparted/arch/linux.c
++++ b/libparted/arch/linux.c
+@@ -37,6 +37,7 @@
+ #include <dirent.h>
+ #include <sys/ioctl.h>
+ #include <sys/stat.h>
++#include <sys/sysmacros.h>
+ #include <sys/types.h>
+ #include <sys/utsname.h>        /* for uname() */
+ #include <scsi/scsi.h>
+-- 
+2.17.1
+
-- 
2.17.1
