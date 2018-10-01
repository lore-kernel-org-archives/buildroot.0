From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Oct 2018 20:33:56 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] parted: fix
 minor()/major() build failure due to glibc 2.28
Message-ID: <20181001183321.E1D4B8A8F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b3c1fa4823d45ed2b171c4fbee9d00a8911a92d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b1bc14626e01bbf28b156798f70bdf786c668846)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...x-Include-sys-sysmacros.h-for-major-macro.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

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
