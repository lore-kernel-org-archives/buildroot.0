From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 09:18:11 +0200
Subject: [Buildroot] [git commit] package/gnu-efi: fix efilink for
 systemd-boot
Message-ID: <20191026071216.1154388074@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3affa8253406def96b448285076e08639abd50c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes a compilation error when building with systemd with systemd-boot
enabled.

Fixes:
>>> systemd 241 Building
PATH="/home/buildroot/buildroot/output/host/bin:/home/buildroot/buildroot/output/host/sbin:/home/buildroot/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin" LC_ALL=en_US.UTF-8 PYTHONNOUSERSITE=y /home/buildroot/buildroot/output/host/bin/ninja  -j33  -C /home/buildroot/buildroot/output/build/systemd-241//build
ninja: Entering directory `/home/buildroot/buildroot/output/build/systemd-241//build'
[458/805] Generating disk.c.o with a custom command.
FAILED: src/boot/efi/disk.c.o
/home/buildroot/buildroot/output/host/bin/i686-buildroot-linux-gnu-gcc -c ../src/boot/efi/disk.c -o src/boot/efi/disk.c.o -Wall -Wextra -std=gnu90 -nostdinc -ggdb -O0 -fpic -fshort-wchar -ffreestanding -fno-strict-aliasing -fno-stack-protector -Wsign-compare -Wno-missing-field-initializers -isystem /home/buildroot/buildroot/output/host/i686-buildroot-linux-gnu/sysroot/usr/include/efi -isystem /home/buildroot/buildroot/output/host/i686-buildroot-linux-gnu/sysroot/usr/include/efi/ia32 -include src/boot/efi/efi_config.h -include version.h
In file included from /home/buildroot/buildroot/output/host/i686-buildroot-linux-gnu/sysroot/usr/include/efi/efilib.h:25,
                 from ../src/boot/efi/disk.c:4:
/home/buildroot/buildroot/output/host/i686-buildroot-linux-gnu/sysroot/usr/include/efi/efilink.h:5:10: fatal error: stdint.h: No such file or directory
 #include <stdint.h>
          ^~~~~~~~~~
compilation terminated.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...002-Revert-efilink-fix-build-with-gcc-4.8.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/gnu-efi/0002-Revert-efilink-fix-build-with-gcc-4.8.patch b/package/gnu-efi/0002-Revert-efilink-fix-build-with-gcc-4.8.patch
new file mode 100644
index 0000000000..5a08c24254
--- /dev/null
+++ b/package/gnu-efi/0002-Revert-efilink-fix-build-with-gcc-4.8.patch
@@ -0,0 +1,38 @@
+From 1f7b2e5bd6603b30202a66b6317a41e2be85742b Mon Sep 17 00:00:00 2001
+From: Esben Haabendal <esben@haabendal.dk>
+Date: Tue, 26 Mar 2019 13:37:02 +0100
+Subject: [PATCH] Revert "efilink: fix build with gcc 4.8"
+
+This reverts commit 6335e5c697c57d8b5854b8202de3733bcb151ca6, as it breaks
+gcc builds with '-nostdinc' flag.
+
+The fix in 1a53d8f88a452847b25f9689f9a08dbcf82c86e4
+(Fix for problem with undeclared intptr_t type), which is also merged
+fixes the same problem, without causing breakage.
+
+Signed-off-by: Esben Haabendal <esben@haabendal.dk>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://sourceforge.net/p/gnu-efi/code/merge-requests/6/]
+---
+ inc/efilink.h | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/inc/efilink.h b/inc/efilink.h
+index b69a6fd..cc5aa2d 100644
+--- a/inc/efilink.h
++++ b/inc/efilink.h
+@@ -1,10 +1,6 @@
+ #ifndef _EFI_LINK_H
+ #define _EFI_LINK_H
+ 
+-#if defined(__GNUC__)
+-#include <stdint.h>
+-#endif
+-
+ /*++
+ 
+ Copyright (c) 1998  Intel Corporation
+-- 
+2.20.1
+
