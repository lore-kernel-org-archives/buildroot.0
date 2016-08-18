From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Aug 2016 22:22:17 +0200
Subject: [Buildroot] [PATCH] package/axel: fix link order
In-Reply-To: <1471182669-4429-1-git-send-email-yann.morin.1998@free.fr>
References: <1471182669-4429-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160818222217.57bf7ed0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 14 Aug 2016 15:51:09 +0200, Yann E. MORIN wrote:
> libintl may use thread-related functions, so -lpthread must come after
> -lintl.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/e9d/e9d89fd5b24a76a3c5ab9dc8f01f4643f7c13396/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

I am not really happy with this patch. Indeed, when we're doing dynamic
linking, libintl.so is *not* linked with libpthread, so I don't see why
it should be when statically linking. See:

$ readelf -aW output/target/usr/lib/libintl.so.8.1.5 |grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

I am wondering if this is not simply yet another case where the libc is
supposed to provide those symbols, so that linking with libpthread is
not necessary if the application doesn't use threads.

Indeed, build the following configuration:

BR2_microblazeel=y
BR2_STATIC_LIBS=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-microblaze-full-2016.08-rc1-4-g07e8d1c.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_18=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_AXEL=y
# BR2_TARGET_ROOTFS_TAR is not set

(which will reproduce the build issue, provided that Yann's patch is
not applied).

Then, build the following program:

#include <libintl.h>

int main(void) { dgettext(NULL, NULL); return 0; }

This program does not use threads, so there is no reason to link it
with libpthread. But it anyway fails to link with:

$ ./output/host/usr/bin/microblazeel-linux-gcc -o toto toto.c -lintl
/home/thomas/projets/buildroot2/output/host/usr/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libintl.a(dcigettext.o): In function `_nl_find_msg':
(.text+0xaa4): undefined reference to `pthread_rwlock_rdlock'
/home/thomas/projets/buildroot2/output/host/usr/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libintl.a(dcigettext.o): In function `_nl_find_msg':
(.text+0xb20): undefined reference to `pthread_rwlock_unlock'
/home/thomas/projets/buildroot2/output/host/usr/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libintl.a(dcigettext.o): In function `_nl_find_msg':
(.text+0xb34): undefined reference to `pthread_rwlock_wrlock'
/home/thomas/projets/buildroot2/output/host/usr/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libintl.a(dcigettext.o): In function `_nl_find_msg':
(.text+0xbd4): undefined reference to `pthread_rwlock_unlock'
/home/thomas/projets/buildroot2/output/host/usr/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libintl.a(dcigettext.o): In function `_nl_find_msg':
(.text+0xce0): undefined reference to `pthread_rwlock_unlock'
/home/thomas/projets/buildroot2/output/host/usr/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libintl.a(dcigettext.o): In function `libintl_dcigettext':
(.text+0x1020): undefined reference to `pthread_rwlock_rdlock'
/home/thomas/projets/buildroot2/output/host/usr/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libintl.a(dcigettext.o): In function `libintl_dcigettext':
(.text+0x10b0): undefined reference to `pthread_rwlock_rdlock'
/home/thomas/projets/buildroot2/output/host/usr/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libintl.a(dcigettext.o): In function `libintl_dcigettext':
(.text+0x10e4): undefined reference to `pthread_rwlock_unlock'
/home/thomas/projets/buildroot2/output/host/usr/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libintl.a(dcigettext.o): In function `libintl_dcigettext':
(.text+0x1140): undefined reference to `pthread_rwlock_unlock'
/home/thomas/projets/buildroot2/output/host/usr/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libintl.a(dcigettext.o): In function `libintl_dcigettext':
(.text+0x15a4): undefined reference to `pthread_rwlock_wrlock'
/home/thomas/projets/buildroot2/output/host/usr/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libintl.a(dcigettext.o): In function `libintl_dcigettext':
(.text+0x15d8): undefined reference to `pthread_rwlock_unlock'
/home/thomas/projets/buildroot2/output/host/usr/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libintl.a(dcigettext.o): In function `libintl_dcigettext':
(.text+0x1664): undefined reference to `pthread_rwlock_unlock'
/home/thomas/projets/buildroot2/output/host/usr/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libintl.a(dcigettext.o): In function `libintl_dcigettext':
(.text+0x1688): undefined reference to `pthread_rwlock_unlock'
/home/thomas/projets/buildroot2/output/host/usr/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libintl.a(finddomain.o): In function `_nl_find_domain':
(.text+0x38): undefined reference to `pthread_rwlock_rdlock'
/home/thomas/projets/buildroot2/output/host/usr/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libintl.a(finddomain.o): In function `_nl_find_domain':
(.text+0xa4): undefined reference to `pthread_rwlock_unlock'
/home/thomas/projets/buildroot2/output/host/usr/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libintl.a(finddomain.o): In function `_nl_find_domain':
(.text+0x180): undefined reference to `pthread_rwlock_wrlock'
/home/thomas/projets/buildroot2/output/host/usr/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libintl.a(finddomain.o): In function `_nl_find_domain':
(.text+0x1ec): undefined reference to `pthread_rwlock_unlock'
/home/thomas/projets/buildroot2/output/host/usr/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libintl.a(loadmsgcat.o): In function `_nl_load_domain':
(.text+0x1a54): undefined reference to `pthread_rwlock_init'
collect2: error: ld returned 1 exit status

Note however how only the pthread_rwlock_*() symbols are missing: the
pthread_mutex_*() symbols are not causing any problem, because they are
apparently provided by libc.a.

I still believe there's something wrong going on here, and blindly
linking everything with libpthread is not the right thing to do. In the
case of axel, it is OK because axel itself uses threads, but it is not
a generally correct solution.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
