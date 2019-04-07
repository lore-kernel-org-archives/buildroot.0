From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Apr 2019 11:54:48 +0200
Subject: [Buildroot] [git commit] boot/syslinux: fix build with binutils
 note gnu property section
Message-ID: <20190407095114.5839C81F74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ca17cdc925124d1b309788518e9d4834b9b2557
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes #11756

This fixes the following build error with newer binutils:

  objcopy -O binary mbr.elf mbr.bin
  perl /build/syslinux/src/syslinux/mbr/checksize.pl mbr.bin
  mbr.bin: too big (452 > 440)

Corresponding bug reports:

 - https://bugs.archlinux.org/task/60405
 - https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=906414

Strip the .note.gnu.property in the linker scripts for the MBRs.

Signed-off-by: Christian Stewart <christian@paral.in>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...d-with-binutils-note-gnu-property-section.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/boot/syslinux/0014-Fix-build-with-binutils-note-gnu-property-section.patch b/boot/syslinux/0014-Fix-build-with-binutils-note-gnu-property-section.patch
new file mode 100644
index 0000000000..fedd815691
--- /dev/null
+++ b/boot/syslinux/0014-Fix-build-with-binutils-note-gnu-property-section.patch
@@ -0,0 +1,47 @@
+From beb526ca925983c7da229043790ecd552d910650 Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Thu, 4 Apr 2019 23:24:31 -0700
+Subject: [PATCH] Fix build with binutils note gnu property section
+
+This fixes the following build error with newer binutils:
+
+  objcopy -O binary mbr.elf mbr.bin
+  perl /build/syslinux/src/syslinux/mbr/checksize.pl mbr.bin
+  mbr.bin: too big (452 > 440)
+
+Corresponding bug reports:
+
+ - https://bugs.archlinux.org/task/60405
+ - https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=906414
+
+Strips the .note.gnu.property in the linker scripts for the MBRs.
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ mbr/i386/mbr.ld   | 1 +
+ mbr/x86_64/mbr.ld | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/mbr/i386/mbr.ld b/mbr/i386/mbr.ld
+index d14ba802..53683461 100644
+--- a/mbr/i386/mbr.ld
++++ b/mbr/i386/mbr.ld
+@@ -70,4 +70,5 @@ SECTIONS
+   .debug_typenames 0 : { *(.debug_typenames) }
+   .debug_varnames  0 : { *(.debug_varnames) }
+   /DISCARD/ : { *(.note.GNU-stack) }
++  /DISCARD/ : { *(.note.gnu.property) }
+ }
+diff --git a/mbr/x86_64/mbr.ld b/mbr/x86_64/mbr.ld
+index ae27d49a..b8c0d895 100644
+--- a/mbr/x86_64/mbr.ld
++++ b/mbr/x86_64/mbr.ld
+@@ -69,4 +69,5 @@ SECTIONS
+   .debug_typenames 0 : { *(.debug_typenames) }
+   .debug_varnames  0 : { *(.debug_varnames) }
+   /DISCARD/ : { *(.note.GNU-stack) }
++  /DISCARD/ : { *(.note.gnu.property) }
+ }
+-- 
+2.21.0
+
