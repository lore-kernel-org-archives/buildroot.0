From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 10 Sep 2018 16:04:20 +0200
Subject: [Buildroot] [PATCH v2] parted: fix minor()/major() build failure
 due to glibc 2.28
Message-ID: <20180910140420.125870-1-giulio.benetti@micronovasrl.com>
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

Patch has been taken from parted upstream commit:
http://git.savannah.gnu.org/cgit/parted.git/commit/?id=ba5e0451b51c983e40afd123b6e0d3eddb55e610

Fixes:
http://autobuild.buildroot.net/results/323/3230abaf78b8df8d23310b37b4099050fdc76eb0//
http://autobuild.buildroot.net/results/d3a/d3a3cd9963e5a2be1cec8fb553f5b20fc2e3c85c//
http://autobuild.buildroot.net/results/ecf/ecfb634b5e6dac2c88b399fc1f1adc68ca42504c//

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
Changes V1->V2:
* use upstream patch instead of creating new one
* add entry into Fixes: list

 ...lude-sys-sysmacros.h-for-major-macro.patch | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/parted/0005-linux-Include-sys-sysmacros.h-for-major-macro.patch

diff --git a/package/parted/0005-linux-Include-sys-sysmacros.h-for-major-macro.patch b/package/parted/0005-linux-Include-sys-sysmacros.h-for-major-macro.patch
new file mode 100644
index 0000000000..e0b4c2acba
--- /dev/null
+++ b/package/parted/0005-linux-Include-sys-sysmacros.h-for-major-macro.patch
@@ -0,0 +1,27 @@
+From ba5e0451b51c983e40afd123b6e0d3eddb55e610 Mon Sep 17 00:00:00 2001
+From: "Richard W.M. Jones" <rjones@redhat.com>
+Date: Sat, 24 Mar 2018 17:37:02 +0000
+Subject: [PATCH] linux: Include <sys/sysmacros.h> for major() macro.
+
+Since glibc 2.27 this header is required.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ libparted/arch/linux.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libparted/arch/linux.c b/libparted/arch/linux.c
+index 31b98ab..7e86b51 100644
+--- a/libparted/arch/linux.c
++++ b/libparted/arch/linux.c
+@@ -41,6 +41,7 @@
+ #include <sys/utsname.h>        /* for uname() */
+ #include <scsi/scsi.h>
+ #include <assert.h>
++#include <sys/sysmacros.h>
+ #ifdef ENABLE_DEVICE_MAPPER
+ #include <libdevmapper.h>
+ #endif
+-- 
+2.17.1
+
-- 
2.17.1
