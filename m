From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 08 Dec 2014 23:52:35 +0100
Subject: [Buildroot] [PATCHv2 07/12] gcc/4.8: add patch to warn about
 unsafe header paths
In-Reply-To: <1417470913-1280-8-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417470913-1280-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417470913-1280-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <54862BB3.1000401@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 01/12/2014 22:55, Thomas Petazzoni a ?crit :
> This commit adds a patch to gcc borrowed from CodeSourcery/Yocto that
> warns about unsafe include paths (i.e /usr/include,
> /usr/local/include, etc.). The patch was adapted to gcc 4.8.3, and
> modified to support the BR_COMPILER_PARANOID_UNSAFE_PATH environment
> variable to error out instead of just warn when unsafe paths are
> used. Even though erroring out can be chosen by passing
> -Werror=poison-system-directories, we are not sure this option in
> CFLAGS will always be passed, so having an environment variable
> guarantees it will always be passed, and also allows to have an
> identical behavior to the external toolchain wrapper.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---

Tested-by: Romain Naour <romain.naour@openwide.fr>

Tested with the following internal toolchain

BR2_i386=y
BR2_ARCH="i686"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_ARCH="i686"
BR2_ARCH_HAS_ATOMICS=y
BR2_x86_i686=y

BR2_COMPILER_PARANOID_UNSAFE_PATH=y

BR2_TOOLCHAIN=y
BR2_TOOLCHAIN_USES_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT=y

BR2_KERNEL_HEADERS_3_17=y
BR2_DEFAULT_KERNEL_HEADERS="3.17.4"

BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_LIBC="glibc"
BR2_PACKAGE_GLIBC=y
BR2_GLIBC_VERSION_2_20=y
BR2_GLIBC_VERSION_STRING="2.20"

BR2_BINUTILS_VERSION_2_23_2=y
BR2_BINUTILS_VERSION="2.23.2"

BR2_GCC_VERSION_4_8_X=y
BR2_GCC_VERSION="4.8.3"

$ make O=test/paranoid-3/ iprutils

/home/naourr/git/buildroot/test/paranoid-3/host/usr/bin/i686-buildroot-linux-gnu-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os
-Wall -DIPR_MAJOR_RELEASE=2 -DIPR_MINOR_RELEASE=4 -DIPR_FIX_LEVEL=2
-DIPR_FIX_DATE='"(June 10, 2014)"' -DIPR_VERSION_STR='"2.4.2 (June 10, 2014)"'
-DIPR_RELEASE=1 -I. -I/usr/include/ncurses -o iprlib.o -c iprlib.c

cc1: erreur: include location "/usr/include/ncurses" is unsafe for
cross-compilation [-Werror=poison-system-directories]

cc1: some warnings being treated as errors
make[1]: *** [iprlib.o] Erreur 1

Thanks


-- 
Romain Naour

OPEN WIDE Ing?nierie - Paris
23/25, rue Daviel| 75013 PARIS
http://ingenierie.openwide.fr

Le blog des technologies libres et embarqu?es :
http://www.linuxembedded.fr
