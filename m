From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 16 Sep 2013 16:25:02 +0200
Subject: [Buildroot] uClibc fails to build with stack smash protection
Message-ID: <20130916142501.GA13623@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

I can not build uclibc 0.9.33.2 when stack smashing protection is activated and
GCC 4.7.x is selected. The build fails as follow:

--8<--
[...]
  STRIP -x -R .note -R .comment libc/libc_so.a
  LD libuClibc-0.9.33.2.so
libc/libc_so.a(fnmatch.os):(.text+0xe0): undefined reference to `__stack_chk_guard'
collect2: error: ld returned 1 exit status
-->8--

If GCC 4.6.x is selected, everything is fine.
Commit 2babed4a50fcd050abc4686e05e24d0e374d10a8 introduces the following change
in package/uclibc/uclibc.mk:

--8<--
-# Before uClibc is built, we must have the second stage cross-compiler
-uclibc-build: host-gcc-intermediate
+# Before uClibc is built, we must have the second stage
+# cross-compiler, for some gcc versions, and when NPTL is used.
+uclibc-build: $(if $(BR2_TOOLCHAIN_NEEDS_THREE_STAGE_BUILD),host-gcc-intermediate)
-->8--

So, with GCC 4.6.x BR2_TOOLCHAIN_NEEDS_THREE_STAGE_BUILD is set to 'y' and the
dependency to host-gcc-intermediate is added, but not with GCC 4.7.x. Forcing
the dependency (as it was before) fixes the issue.

I attached my defconfig. Did anyone else experienced this problem?
-------------- next part --------------
BR2_x86_pentiumpro=y
BR2_ENABLE_SSP=y
BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="3.10.7"
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_USE_SSP=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.7"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.10.config"
BR2_TARGET_ROOTFS_EXT2=y
# BR2_TARGET_ROOTFS_TAR is not set
