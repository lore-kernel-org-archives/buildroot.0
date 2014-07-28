From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 28 Jul 2014 15:35:56 +0200
Subject: [Buildroot] [PATCH] qemu/sparc-ss10: update defconfig to Linux
	3.15.x
Message-ID: <20140728133556.GA5135@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update defconfig to 3.15, tested with Qemu 2.0.0.
While updating the default config I recognized that
networking is broken. The reason is a uClibc backport patch
from master. Adding a fix on top of it.
Removed hint about framebuffer, as -display none is used.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 board/qemu/sparc-ss10/readme.txt                   |  3 +-
 configs/qemu_sparc_ss10_defconfig                  |  8 ++---
 .../uclibc-0061-fix-sparc-networking.patch         | 38 ++++++++++++++++++++++
 3 files changed, 43 insertions(+), 6 deletions(-)
 create mode 100644 package/uclibc/0.9.33.2/uclibc-0061-fix-sparc-networking.patch

diff --git a/board/qemu/sparc-ss10/readme.txt b/board/qemu/sparc-ss10/readme.txt
index a126a55..b18bb40 100644
--- a/board/qemu/sparc-ss10/readme.txt
+++ b/board/qemu/sparc-ss10/readme.txt
@@ -3,6 +3,5 @@ Run the emulation with:
   qemu-system-sparc -M SS-10 -kernel output/images/zImage -drive file=output/images/rootfs.ext2 -append "root=/dev/sda console=ttyS0,115200" -serial stdio -net nic,model=lance -net user -display none
 
 The login prompt will appear in the terminal that started Qemu.
-The graphical window is the framebuffer.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 2.0.0
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 3b56d98..afc0789 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -6,14 +6,14 @@ BR2_sparc_v8=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.12 headers to avoid breaking with newer kernels
+# Lock to 3.15 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.5"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
+BR2_DEFAULT_KERNEL_VERSION="3.15.6"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.15.6"
 BR2_LINUX_KERNEL_DEFCONFIG="sparc32"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/package/uclibc/0.9.33.2/uclibc-0061-fix-sparc-networking.patch b/package/uclibc/0.9.33.2/uclibc-0061-fix-sparc-networking.patch
new file mode 100644
index 0000000..0ec1c00
--- /dev/null
+++ b/package/uclibc/0.9.33.2/uclibc-0061-fix-sparc-networking.patch
@@ -0,0 +1,38 @@
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+Bug introduced by uclibc-0035-socket.h-pull-socket_type.h-from-eglibc.patch
+
+diff -Nur uClibc-0.9.33.2.orig/libc/inet/socketcalls.c uClibc-0.9.33.2/libc/inet/socketcalls.c
+--- uClibc-0.9.33.2.orig/libc/inet/socketcalls.c	2012-05-15 09:20:09.000000000 +0200
++++ uClibc-0.9.33.2/libc/inet/socketcalls.c	2014-07-28 14:50:52.477479493 +0200
+@@ -34,6 +34,30 @@
+ #define SYS_ACCEPT4     18
+ #endif
+ 
++/* for sparc: __NR_socket and others are defined, but syscalls are not implemen
++/* see http://lists.busybox.net/pipermail/uclibc/2004-March/029424.html */
++#ifdef __sparc__
++#undef __NR_accept
++#undef __NR_accept4
++#undef __NR_bind
++#undef __NR_connect
++#undef __NR_getpeername
++#undef __NR_getsockname
++#undef __NR_getsockopt
++#undef __NR_listen
++#undef __NR_recv
++#undef __NR_recvfrom
++#undef __NR_recvmsg
++#undef __NR_send
++#undef __NR_sendmsg
++#undef __NR_sendto
++#undef __NR_setsockopt
++#undef __NR_shutdown
++#undef __NR_socket
++#undef __NR_socketpair
++#endif
++
++
+ #ifdef __UCLIBC_HAS_THREADS_NATIVE__
+ #include <sysdep-cancel.h>
+ #include <pthreadP.h>
-- 
2.0.0
