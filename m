From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Nov 2018 22:34:25 +0100
Subject: [Buildroot] [git commit] package/libnfs: bump to version 3.0.0
Message-ID: <20181202071601.1976D803E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6bd004a0b518d5e49cc65e71eb33e9235b6458a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add an patch from upstream to fix building libnfs with the musl C
library. This issue was introduced upstream between version 2.0.0 and
version 3.0.0.

Note, that upstreams commit message says it fixes a warning. However, as
musl is more strictly regarding missing headers it actually fixes the
build with musl.

Furthermore, the COPYING license file was changed in the way that it now
includes a clarification about the .x files being distributed under the
simplified BSD license. We already note in LIBNFS_LICENSE that the .x
files are BSD-2-Clause. So, updating the hash for this license file is
enough.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-libnfs.c-include-time.h-in-libnfs.c.patch | 35 ++++++++++++++++++++++
 package/libnfs/libnfs.hash                         |  4 +--
 package/libnfs/libnfs.mk                           |  2 +-
 3 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/package/libnfs/0002-libnfs.c-include-time.h-in-libnfs.c.patch b/package/libnfs/0002-libnfs.c-include-time.h-in-libnfs.c.patch
new file mode 100644
index 0000000000..34e584017e
--- /dev/null
+++ b/package/libnfs/0002-libnfs.c-include-time.h-in-libnfs.c.patch
@@ -0,0 +1,35 @@
+From b56bd3d99f67a3273fec3c0c5d9560413465a1db Mon Sep 17 00:00:00 2001
+From: Anna Lyons <Anna.Lyons@data61.csiro.au>
+Date: Thu, 12 Jul 2018 17:45:23 +1000
+Subject: [PATCH] libnfs.c: include <time.h> in libnfs.c
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+time() is used in this file, which is from time.h. Fixes a warning.
+
+Note, that building with musl breaks otherwise, as it is more strict regarding
+missing header inclusions.
+
+Backported from: 794a29f01f8e5961adc5c79d5ba5ac1062877e6c
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ lib/libnfs.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/libnfs.c b/lib/libnfs.c
+index d89d84d..43c17b9 100755
+--- a/lib/libnfs.c
++++ b/lib/libnfs.c
+@@ -70,6 +70,7 @@
+ #include <stdarg.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <time.h>
+ #include "slist.h"
+ #include "libnfs.h"
+ #include "libnfs-raw.h"
+-- 
+2.19.1
+
diff --git a/package/libnfs/libnfs.hash b/package/libnfs/libnfs.hash
index 2bd8caf255..0e4dc6fbc9 100644
--- a/package/libnfs/libnfs.hash
+++ b/package/libnfs/libnfs.hash
@@ -1,6 +1,6 @@
 # Locally calculated
-sha256 7ea6cd8fa6c461d01091e584d424d28e137d23ff4b65b95d01a3fd0ef95d120e  libnfs-libnfs-2.0.0.tar.gz
-sha256 2d152e3a2f31ef0fe14d4908377277f8215fb5c82ec9329d1eed081c845fc85f  COPYING
+sha256 445d92c5fc55e4a5b115e358e60486cf8f87ee50e0103d46a02e7fb4618566a5  libnfs-libnfs-3.0.0.tar.gz
+sha256 edd960c0142b8ada98b43b6396b78f4e557b0bc70ac601a51e397ad04070e2c5  COPYING
 sha256 d9406ced95457941032aa11d04623b8ab71f2827a3395ebef137aec475be35b1  LICENCE-BSD.txt
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENCE-LGPL-2.1.txt
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENCE-GPL-3.txt
diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
index 0cf07d2143..3a84e0aafa 100644
--- a/package/libnfs/libnfs.mk
+++ b/package/libnfs/libnfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFS_VERSION = libnfs-2.0.0
+LIBNFS_VERSION = libnfs-3.0.0
 LIBNFS_SITE = $(call github,sahlberg,libnfs,$(LIBNFS_VERSION))
 LIBNFS_INSTALL_STAGING = YES
 LIBNFS_AUTORECONF = YES
