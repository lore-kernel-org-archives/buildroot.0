From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 12 Feb 2016 22:39:39 -0200
Subject: [Buildroot]  [PATCH] fio: Add patch to import stdint.h explicitly
Message-ID: <1455323979-340-1-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is upstream and it can be removed in the next version bump.

Fixes:
http://autobuild.buildroot.net/results/dc7/dc75b1f5ca4db5fb4658f19fde56b18cb7170fe9/
http://autobuild.buildroot.net/results/44d/44dd45e0f693ea84fc072ab28f038bf04a9226ec/

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Adding to CC the 2 most recent committers.
As you recent changed this package, you probably can spot problems on my
patch more easily than others ;-)

Unfortunately I was not able to understand why in some conditions the
build works.
Could it be an implicit search path added by the toolchain?

minimal config that triggers the error
BR2_microblazeel=y
BR2_PACKAGE_FIO=y

minimal config that triggers the error
BR2_powerpc=y
BR2_PACKAGE_FIO=y

minimal config that DOES NOT trigger the error
BR2_microblazeel=y
BR2_TOOLCHAIN_BUILDROOT_MUSL=y
BR2_PACKAGE_FIO=y

minimal config that DOES NOT trigger the error
BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_FIO=y
---
 ...0001-compile_fix_for_linux_header_changes.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/fio/0001-compile_fix_for_linux_header_changes.patch

diff --git a/package/fio/0001-compile_fix_for_linux_header_changes.patch b/package/fio/0001-compile_fix_for_linux_header_changes.patch
new file mode 100644
index 0000000..4a37e9d
--- /dev/null
+++ b/package/fio/0001-compile_fix_for_linux_header_changes.patch
@@ -0,0 +1,42 @@
+From d7bb6180f831091c468e5aa749b142efd5eddda4 Mon Sep 17 00:00:00 2001
+From: "Robin H. Johnson" <robbat2@gentoo.org>
+Date: Wed, 3 Feb 2016 08:32:19 -0800
+Subject: [PATCH] libmtd: compile fix for linux header changes.
+
+In the Linux kernel source, mtd/mtd-user.h had a change
+'mtd: mtd-user: remove stdint.h include'
+(137d36af4a53858b8db7ca83c8480247118b8bdf)
+
+This causes the uint8_t/uint64_t types to be undefined in libmtd.h
+now, as they were implicitly coming from it before.
+
+Import stdint.h explicitly into libmtd.h to resolve this.
+
+X-URL: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=137d36af4a53858b8db7ca83c8480247118b8bdf
+Signed-off-by: Robin H. Johnson <robbat2@gentoo.org>
+---
+Patch downloaded from upstream repo:
+http://git.kernel.dk/?p=fio.git;a=patch;h=d7bb6180f831091c468e5aa749b142efd5eddda4
+
+Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
+---
+ oslib/libmtd.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/oslib/libmtd.h b/oslib/libmtd.h
+index 3625de5..b5fd3f3 100644
+--- a/oslib/libmtd.h
++++ b/oslib/libmtd.h
+@@ -29,6 +29,9 @@
+ extern "C" {
+ #endif
+ 
++// Needed for uint8_t, uint64_t
++#include <stdint.h>
++
+ /* Maximum MTD device name length */
+ #define MTD_NAME_MAX 127
+ /* Maximum MTD device type string length */
+-- 
+2.5.0
+
-- 
1.9.1
