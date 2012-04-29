From: Daniel Nilsson <daniel@dnil.se>
Date: Sun, 29 Apr 2012 23:13:48 +0200
Subject: [Buildroot] [PATCH 2/3] debug: provide an option to copy the
 gdbserver to the target
In-Reply-To: <87obrxr04x.fsf@macbook.be.48ers.dk>
References: <cover.1331765391.git.thomas.petazzoni@free-electrons.com>
 <cover.1331765391.git.thomas.petazzoni@free-electrons.com>
 <a3beb0b2963c6c7ba6ebf90643537380b117a2f4.1331765391.git.thomas.petazzoni@free-electrons.com>
 <87obrxr04x.fsf@macbook.be.48ers.dk>
Message-ID: <4F9DAF0C.8060900@dnil.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/15/2012 11:05 PM, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni<thomas.petazzoni@free-electrons.com>  writes:
>
>   Thomas>  When an external toolchain is used, it is very likely that it contains
>   Thomas>  a pre-built version of a gdbserver that has the same version as the
>   Thomas>  cross-gdb included in the external toolchain. So, we now provide an
>   Thomas>  option that allows to copy this pre-built gdbserver to the target.
>
> Committed, thanks.
>

Hi Thomas,

I have attempted to build a root filesystem for QEMU/x86 based on the current 
version of buildroot in git (0242ae4c6b7d1daf85a5f0c191394b0a15f95c54). The RFS
is built using an external toolchain (Code Sourcery 2011.09). All seems fine 
except that copying the gdbserver to the target fails, this is since the 
toolchain does not keep the gdbserver where the ext-tool.mk expect to find it,
it is present in these two locations:

host/usr/i686-unknown-linux-gnu/sysroot/usr/lib64/bin/gdbserver
host/usr/i686-unknown-linux-gnu/sysroot/usr/lib/bin/gdbserver


The below patch works around this issue in my case, however I'm not so sure this
is a proper "fix" since it will not work when the 64-bit version is requested.
I'm not sure how the framework is setup to determine 32/64bit versions in this case
so I didn't attempt to fix it.

I have attached my config file below for reference, maybe there is a config option I
need to set?

Regards
Daniel Nilsson




 toolchain/toolchain-external/ext-tool.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index a45603a..7101e1f 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -388,9 +388,9 @@ $(STAMP_DIR)/ext-toolchain-installed: $(STAMP_DIR)/ext-toolchain-checked
        fi ; \
        if test x"$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)" == x"y"; then \
                gdbserver_found=0 ; \
-               for d in $${ARCH_SYSROOT_DIR} $${ARCH_SYSROOT_DIR}/../debug-root/ ; do \
-                       if test -f $${d}/usr/bin/gdbserver ; then \
-                               install -m 0755 -D $${d}/usr/bin/gdbserver $(TARGET_DIR)/usr/bin/gdbserver ; \
+               for d in $${ARCH_SYSROOT_DIR}/usr $${ARCH_SYSROOT_DIR}/../debug-root/usr $${ARCH_SYSROOT_DIR}/usr/lib ; do \
+                       if test -f $${d}/bin/gdbserver ; then \
+                               install -m 0755 -D $${d}/bin/gdbserver $(TARGET_DIR)/usr/bin/gdbserver ; \
                                gdbserver_found=1 ; \
                                break ; \
                        fi ; \


egrep -v '^#|^$' .config

BR2_HAVE_DOT_CONFIG=y
BR2_i386=y
BR2_x86_pentiumpro=y
BR2_ARCH="i686"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="pentiumpro"
BR2_GCC_TARGET_ARCH="pentiumpro"
BR2_WGET="wget --passive-ftp -nd -t 3"
BR2_SVN="svn"
BR2_BZR="bzr"
BR2_GIT="git"
BR2_LOCALFILES="cp"
BR2_SCP="scp"
BR2_SSH="ssh"
BR2_HG="hg"
BR2_ZCAT="gzip -d -c"
BR2_BZCAT="bzcat"
BR2_XZCAT="xzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(TOPDIR)/dl"
BR2_HOST_DIR="$(BASE_DIR)/host"
BR2_PRIMARY_SITE=""
BR2_BACKUP_SITE="http://sources.buildroot.net/"
BR2_SOURCEFORGE_MIRROR="kent"
BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
BR2_DEBIAN_MIRROR="http://ftp.debian.org"
BR2_JLEVEL=4
BR2_STRIP_strip=y
BR2_OPTIMIZE_S=y
BR2_PACKAGE_OVERRIDE_FILE="$(TOPDIR)/local.mk"
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_PREFIX="i686-pc-linux-gnu"
BR2_TOOLCHAIN_EXTERNAL_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY=y
BR2_LARGEFILE=y
BR2_INET_IPV6=y
BR2_INET_RPC=y
BR2_USE_WCHAR=y
BR2_ENABLE_LOCALE=y
BR2_INSTALL_LIBSTDCPP=y
BR2_TOOLCHAIN_HAS_THREADS=y
BR2_TOOLCHAIN_HAS_THREADS_DEBUG=y
BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED=y
BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS=y
BR2_ENABLE_LOCALE_PURGE=y
BR2_ENABLE_LOCALE_WHITELIST="C en_US"
BR2_USE_MMU=y
BR2_TARGET_OPTIMIZATION="-pipe"
BR2_TARGET_LDFLAGS=""
BR2_TARGET_GENERIC_HOSTNAME="br-x86-glibc"
BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot"
BR2_ROOTFS_DEVICE_CREATION_STATIC=y
BR2_ROOTFS_DEVICE_TABLE="target/generic/device_table.txt"
BR2_ROOTFS_STATIC_DEVICE_TABLE="target/generic/device_table_dev.txt"
BR2_ROOTFS_SKELETON_DEFAULT=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
BR2_TARGET_GENERIC_GETTY_BAUDRATE="115200"
BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y
BR2_ROOTFS_POST_BUILD_SCRIPT=""
BR2_PACKAGE_BUSYBOX=y
BR2_BUSYBOX_VERSION_1_19_X=y
BR2_BUSYBOX_VERSION="1.19.4"
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.19.x.config"
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
BR2_TARGET_ROOTFS_EXT2_INODES=0
BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
BR2_TARGET_ROOTFS_EXT2_NONE=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.3"
BR2_LINUX_KERNEL_VERSION="3.3"
BR2_LINUX_KERNEL_PATCH=""
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.3.config"
BR2_LINUX_KERNEL_BZIMAGE=y
