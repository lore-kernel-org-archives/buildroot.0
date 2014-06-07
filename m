From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 7 Jun 2014 23:58:58 +0200
Subject: [Buildroot] xserver_xorg-server-1.15.1 crash on RaspberryPi when
 compiled with gcc-4.9
Message-ID: <trinity-e2cf4efe-9b52-4b1c-a42e-28a15bb2f616-1402178338808@3capp-gmx-bs49>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

running xserver (driver fbdev) on RaspberryPi crashes when compiled with gcc-4.9 (-Os).

Steps to reproduce (with buildroot-2014.05 release and additonal dillo package):

$ cd buildroot-2014.05

Get Patch 'dillo: new package'
$ wget http://git.buildroot.net/buildroot/patch/?id=65b47530229b1ebaa4e2d40ff765614bbd6423ca
$ patch -p 1 < ../index.html\?id\=65b47530229b1ebaa4e2d40ff765614bbd6423ca
$ cd ..
$ mkdir build_gcc_4_9
$ make O=$PWD -C ../buildroot-2014.05 raspberrypi_defconfig

Change to use gcc-4.9, glibc add dillo, xserver (and gdb/gdbserver):

diff -u ../buildroot-2014.05/configs/raspberrypi_defconfig defconfig 
--- ../buildroot-2014.05/configs/raspberrypi_defconfig  2014-05-31 09:52:49.000000000 +0200
+++ defconfig   2014-06-07 23:34:23.070203324 +0200
@@ -1,22 +1,32 @@
 BR2_arm=y
 BR2_arm1176jzf_s=y
-
-BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
-
-BR2_TARGET_GENERIC_GETTY_PORT="tty1"
-
-BR2_PACKAGE_RPI_FIRMWARE=y
-
-# Lock to 3.12 headers as the RPi kernel is based off the 3.12 branch
+BR2_ENABLE_DEBUG=y
+BR2_STRIP_none=y
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.12.18"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
-
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_GCC_VERSION_4_9_X=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_PACKAGE_HOST_GDB=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="b09a27249d61475e4423607f7632a5aa6e7b3a53"
-BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
 BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_PACKAGE_GDB=y
+BR2_PACKAGE_GDB_SERVER=y
+BR2_PACKAGE_GDB_DEBUGGER=y
+BR2_PACKAGE_STRACE=y
+BR2_PACKAGE_XORG7=y
+BR2_PACKAGE_XSERVER_XORG_SERVER=y
+BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR=y
+BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD=y
+BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE=y
+BR2_PACKAGE_XDRIVER_XF86_VIDEO_FBDEV=y
+BR2_PACKAGE_DILLO=y
+BR2_PACKAGE_XTERM=y
+BR2_PACKAGE_RPI_FIRMWARE=y

Run the following on RaspberryPi:

        (rpi)$ X&

# _XSERVTransSocketOpenCOTSServer: Unable to open socket for inet6
_XSERVTransOpen: transport open failed for inet6/buildroot:0
_XSERVTransMakeAllCOTSServerListeners: failed to open listener for inet6

X.Org X Server 1.15.1
Release Date: 2014-04-13
X Protocol Version 11, Revision 0
Build Operating System: Linux 3.7.10-1.32-desktop x86_64
Current Operating System: Linux buildroot 3.12.18-quick #1 PREEMPT Thu May 15 17:08:58 CEST 2014 armv6l
Kernel command line: dma.dmachans=0x7f35 bcm2708_fb.fbwidth=1920 bcm2708_fb.fbheight=1200 bcm2708.boardrev=0xf bcm2708.serial=0xd9096898 smsc95xx.macaddr=B8:27:EB:09:68:98 sdhci-bcm2708.emmc_clock_freq=250000000 vc_mem.mem_base=0x1ec00000 vc_mem.mem_size=0x20000000  dwc_otg.fiq_fix_enable=1 sdhci-bcm2708.sync_after_dma=0 dwc_otg.lpm_enable=0 console=ttyAMA0,115200 root=/dev/nfs nfsroot=172.16.0.1:/srv/nfs/rpi_gcc_001 ip=172.16.0.2 rootwait
Build Date: 06 June 2014  12:09:00AM

Current version of pixman: 0.32.4
        Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Thu Jan  1 00:08:24 1970
(==) Using default built-in configuration (21 lines)
Initializing built-in extension Generic Event Extension
Initializing built-in extension SHAPE
Initializing built-in extension MIT-SHM
Initializing built-in extension XInputExtension
Initializing built-in extension XTEST
Initializing built-in extension BIG-REQUESTS
Initializing built-in extension SYNC
Initializing built-in extension XKEYBOARD
Initializing built-in extension XC-MISC
Initializing built-in extension XINERAMA
Initializing built-in extension XFIXES
Initializing built-in extension RENDER
Initializing built-in extension RANDR
Initializing built-in extension DAMAGE
Initializing built-in extension DOUBLE-BUFFER
Initializing built-in extension DPMS
Initializing built-in extension Present
Initializing built-in extension X-Resource
Initializing built-in extension XVideo
Initializing built-in extension XVideo-MotionCompensation
Initializing built-in extension XFree86-VidModeExtension
Initializing built-in extension XFree86-DGA

        (rpi)$ export DISPLAY=localhost:0

        (pri)$ dillo
paths: Cannot open file '/root/.dillo/dillorc': No such file or directory
paths: Using /etc/dillo/dillorc
paths: Cannot open file '/root/.dillo/keysrc': No such file or directory
paths: Using /etc/dillo/keysrc
paths: Cannot open file '/root/.dillo/domainrc': No such file or directory
paths: Using /etc/dillo/domainrc
Domain: Default accept.
dillo_dns_init: Here we go! (threaded)
Disabling cookies.
** WARNING **: preferred sans-serif font "DejaVu Sans" not found.
** WARNING **: preferred serif font "DejaVu Serif" not found.
** WARNING **: preferred monospace font "DejaVu Sans Mono" not found.
** WARNING **: preferred cursive font "URW Chancery L" not found.
** WARNING **: preferred fantasy font "DejaVu Sans" not found.
Nav_open_url: new url='about:splash'
(EE)
(EE) Backtrace:
(EE)
(EE) Segmentation fault at address 0xffffffff
(EE)
Fatal server error:
(EE) Caught signal 11 (Segmentation fault). Server aborting
(EE)
(EE)
Please consult the The X.Org Foundation support
         at http://wiki.x.org
 for help.
(EE) Please also check the log file@"/var/log/Xorg.0.log" for additional information.
(EE)
(EE) Server terminated with error (1). Closing log file.
X I/O error


Lets debug it:

        (rpi)$ gdbserver :2500 /usr/bin/X&

        (host)$ host/usr/bin/arm-buildroot-linux-gnueabi-gdb  target/usr/bin/X
GNU gdb (GDB) 7.5.1
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "--host=x86_64-unknown-linux-gnu --target=arm-buildroot-linux-gnueabi".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /home/seiderer/Work/RaspberryPi/build_gcc_4_9/target/usr/bin/X...done.
(gdb) set sysroot /home/seiderer/Work/RaspberryPi/build_gcc_4_9/target
(gdb) target remote 172.16.0.2:2500
Remote debugging using 172.16.0.2:2500
Reading symbols from /home/seiderer/Work/RaspberryPi/build_gcc_4_9/target/lib/ld-linux.so.3...done.
Loaded symbols for /home/seiderer/Work/RaspberryPi/build_gcc_4_9/target/lib/ld-linux.so.3
0xb6fd8af0 in _start () from /home/seiderer/Work/RaspberryPi/build_gcc_4_9/target/lib/ld-linux.so.3
(gdb) cont
Continuing.

Program received signal SIGSEGV, Segmentation fault.
fbGlyphs (op=<optimized out>, pSrc=0x1, pDst=0x4, maskFormat=0x3b9d90, xSrc=0, ySrc=0, nlist=6, list=0xbefff490, glyphs=0x1)
    at fbpict.c:140
140                 glyph = *glyphs++;
(gdb) p glyphs
$1 = (GlyphPtr *) 0x1

===>> strange value for glyphs pointer...

(gdb) info reg
r0             0xb4381008       3023573000
r1             0x0      0
r2             0xffffffff       4294967295
r3             0x4      4
r4             0xbefff49c       3204445340
r5             0x4      4
r6             0xbeffdba0       3204438944
r7             0x1      1
r8             0x14     20
r9             0x0      0
r10            0x4      4
r11            0x3      3
r12            0xb6f4abc4       3069488068
sp             0xbeffdb10       0xbeffdb10
lr             0xb6b9ce0c       -1229337076
pc             0xb6b9ce8c       0xb6b9ce8c <fbGlyphs+320>
cpsr           0x20000010       536870928


Next try, debug with simple printf-like output:

diff -u xserver_xorg-server-1.15.1/fb/fbpict.c_orig xserver_xorg-server-1.15.1/fb/fbpict.c
--- xserver_xorg-server-1.15.1/fb/fbpict.c_orig 2014-06-07 22:28:27.053713080 +0200
+++ xserver_xorg-server-1.15.1/fb/fbpict.c      2014-06-07 23:18:32.451252299 +0200
@@ -90,6 +90,16 @@
        pixman_glyph_cache_remove (glyphCache, pGlyph, NULL);
 }
 
+static FILE* f;
+static void my_printf(const char* s, ...) {
+    va_list ap;
+    if (!f) { f = fopen("/root/my.log", "w+"); }
+    va_start(ap, s);
+    vfprintf(f, s, ap);
+    va_end(ap);
+    fflush(f);
+}
+
 static void
 fbGlyphs(CARD8 op,
         PicturePtr pSrc,
@@ -112,6 +122,8 @@
     int i, n;
     int xDst = list->xOff, yDst = list->yOff;
 
+    my_printf("fbGlyphs() pSrc = %p pDst = %p glyphs = %p\n", pSrc, pDst, glyphs);
+
     miCompositeSourceValidate(pSrc);
     
     n_glyphs = 0;
@@ -136,8 +148,17 @@
         n = list->len;
         while (n--) {
            const void *g;
-
+            my_printf("glyphs = %p - 1\n", glyphs);
+#if 1
+            /* case A: original crashing version */
             glyph = *glyphs++;
+#else
+            /* case B: call something in between, no crashing version */
+            glyph = *glyphs;
+            my_printf("glyphs = %p - 2\n", glyphs);
+            glyphs++;
+#endif
+            my_printf("glyphs = %p - 3\n", glyphs);
 
            if (!(g = pixman_glyph_cache_lookup (glyphCache, glyph, NULL))) {


        (host)$ host/usr/bin/arm-buildroot-linux-gnueabi-gdb  target/usr/bin/X
GNU gdb (GDB) 7.5.1
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "--host=x86_64-unknown-linux-gnu --target=arm-buildroot-linux-gnueabi".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /home/seiderer/Work/RaspberryPi/build_gcc_4_9/target/usr/bin/X...done.
(gdb) set sysroot /home/seiderer/Work/RaspberryPi/build_gcc_4_9/target
(gdb) target remote 172.16.0.2:2500
Remote debugging using 172.16.0.2:2500
Reading symbols from /home/seiderer/Work/RaspberryPi/build_gcc_4_9/target/lib/ld-linux.so.3...done.
Loaded symbols for /home/seiderer/Work/RaspberryPi/build_gcc_4_9/target/lib/ld-linux.so.3
0xb6fd8af0 in _start () from /home/seiderer/Work/RaspberryPi/build_gcc_4_9/target/lib/ld-linux.so.3
(gdb) cont
Continuing.

Program received signal SIGSEGV, Segmentation fault.
fbGlyphs (op=<optimized out>, pSrc=0x1, pDst=0x4, maskFormat=0x3b9d90, xSrc=0, ySrc=0, nlist=-1, list=0xbefff490, glyphs=0x1)
    at fbpict.c:154
154                 glyph = *glyphs++;
(gdb) p glyphs
$1 = (GlyphPtr *) 0x1
(gdb) info reg
r0             0x0      0
r1             0x0      0
r2             0x1      1
r3             0x1      1
r4             0xbefff49c       3204445340
r5             0x4      4
r6             0xbeffdba0       3204438944
r7             0x1      1
r8             0x0      0
r9             0x20     32
r10            0x3      3
r11            0x14     20
r12            0x0      0
sp             0xbeffdb08       0xbeffdb08
lr             0xb6b9cfc4       -1229336636
pc             0xb6b9cfc4       0xb6b9cfc4 <fbGlyphs+364>
cpsr           0x60000010       1610612752


        (rpi)$ cat my.log
fbGlyphs() pSrc = 0x3b9d90 pDst = 0x3b9d00 glyphs = 0xbefff790
glyphs = 0xbefff790 - 1

===>> only first my_printf is reached, printed glyphs pointer seems o.k., but is different from
the one shown in gdb...


Next try, more debugging (in between the assignement and the increment), this time no xserver crash:

        (rpi)$ # head -20 my.log
fbGlyphs() pSrc = 0x1171d90 pDst = 0x1171d00 glyphs = 0xbeae67a0
glyphs = 0xbeae67a0 - 1
glyphs = 0xbeae67a0 - 2
glyphs = 0xbeae67a4 - 3
glyphs = 0xbeae67a4 - 1
glyphs = 0xbeae67a4 - 2
glyphs = 0xbeae67a8 - 3
glyphs = 0xbeae67a8 - 1
glyphs = 0xbeae67a8 - 2
glyphs = 0xbeae67ac - 3
glyphs = 0xbeae67ac - 1
glyphs = 0xbeae67ac - 2
glyphs = 0xbeae67b0 - 3
fbGlyphs() pSrc = 0x1171d90 pDst = 0x1171d00 glyphs = 0xbeae67a0
glyphs = 0xbeae67a0 - 1
glyphs = 0xbeae67a0 - 2
glyphs = 0xbeae67a4 - 3
fbGlyphs() pSrc = 0x1171d90 pDst = 0x1171d00 glyphs = 0xbeae67a0
glyphs = 0xbeae67a0 - 1
glyphs = 0xbeae67a0 - 2


Assambler output for fbpict.c compiled for case A (crash), and case B (no crash):

        (host)$ diff -u fbpict_case_A.s fbpict_case_B.s

--- fbpict_case_A.s     2014-06-07 23:18:37.454249170 +0200
+++ fbpict_case_B.s     2014-06-07 23:17:49.425274229 +0200
@@ -1156,47 +1156,65 @@
        ldr     r0, [sp, #108]
        bl      my_printf(PLT)
 .LVL128:
-       .loc 1 154 0
-       ldr     r3, [r2]
-       add     r2, sp, #6336
-       ldr     r7, [r3], #4
-       add     r2, r2, #16
-       .loc 1 161 0
+       .loc 1 157 0
+       add     r3, sp, #6336
+       add     r3, r3, #16
+       ldr     r3, [r3]
+       .loc 1 158 0
        ldr     r0, .L159+16
-       .loc 1 154 0
-       str     r3, [r2]
+       .loc 1 157 0
+       ldr     r7, [r3]
 .LVL129:
-       .loc 1 161 0
-       ldr     r1, [r2]
+       .loc 1 158 0
+       add     r3, sp, #6336
+       add     r3, r3, #16
+       ldr     r1, [r3]
 .LPIC42:
        add     r0, pc, r0
        bl      my_printf(PLT)
 .LVL130:
+       .loc 1 159 0
+       add     r3, sp, #6336
+       add     r3, r3, #16
+       ldr     r2, [r3]
+       .loc 1 161 0
+       ldr     r0, .L159+20
+       .loc 1 159 0
+       add     r2, r2, #4
+       .loc 1 161 0
+       mov     r1, r2
+.LPIC43:
+       add     r0, pc, r0
+       .loc 1 159 0
+       str     r2, [r3]
+       .loc 1 161 0
+       bl      my_printf(PLT)
+.LVL131:
        .loc 1 163 0
-       ldr     r3, .L159+20
+       ldr     r3, .L159+24
        mov     r1, r7
-.LPIC43:
+.LPIC44:
        add     r3, pc, r3
        ldr     r0, [r3]
        mov     r2, #0
        str     r3, [sp, #84]
        bl      pixman_glyph_cache_lookup(PLT)
-.LVL131:
+.LVL132:
        subs    r9, r0, #0
        bne     .L129
 .LBB51:
        .loc 1 168 0
        mov     r0, r7
-.LVL132:
+.LVL133:
        ldr     r1, [sp, #92]
        bl      GetGlyphPicture(PLT)
-.LVL133:
+.LVL134:
[...]


No crash when building with gcc-4.8 or when building with gcc-4.9 without optimization (-O0)...

Any help, advise or hints how to proceed further?

Regards,
Peter
