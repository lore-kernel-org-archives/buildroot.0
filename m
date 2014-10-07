From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  7 Oct 2014 09:06:03 +0200
Subject: [Buildroot] [PATCH 1/1] .mk files: bulk aligment and whitespace
	cleanup of assignments
Message-ID: <1412665563-5103-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

The Buildroot coding style defines one space around make assignments and
does not align the assignment symbols.

This patch does a bulk fix of offending packages. The package
infrastructures (or more in general assignments to calculated variable
names, like $(2)_FOO) are not touched.

Alignment of line continuation characters (\) is kept as-is.

The sed command used to do this replacement is:
find * -name "*.mk" | xargs sed -i \
    -e 's#^\([A-Z0-9a-z_]\+\)\s*\([?:+]\?=\)\s*$#\1 \2#'
    -e 's#^\([A-Z0-9a-z_]\+\)\s*\([?:+]\?=\)\s*\([^\\]\+\)$#\1 \2 \3#'
    -e 's#^\([A-Z0-9a-z_]\+\)\s*\([?:+]\?=\)\s*\([^\\ \t]\+\s*\\\)\s*$#\1 \2 \3#'
    -e 's#^\([A-Z0-9a-z_]\+\)\s*\([?:+]\?=\)\(\s*\\\)#\1 \2\3#'

Brief explanation of this command:
    ^\([A-Z0-9a-z_]\+\)     a regular variable at the beginning of the line
    \([?:+]\?=\)            any assignment character =, :=, ?=, +=
    \([^\\]\+\)             any string not containing a line continuation
    \([^\\ \t]\+\s*\\\)     string, optional whitespace, followed by a
                            line continuation character
    \(\s*\\\)               optional whitespace, followed by a line
                            continuation character

Hence, the first subexpression handles empty assignments, the second
handles regular assignments, the third handles regular assignments with
line continuation, and the fourth empty assignments with line
continuation.

This expression was tested on following test text: (initial tab not
included)

	FOO     = spaces before
	FOO     =   spaces before and after
	FOO	= tab before
	FOO	  = tab and spaces before
	FOO =	tab after
	FOO =	   tab and spaces after
	FOO =   	spaces and tab after
	FOO =    \
	FOO = bar \
	FOO = bar space    \
	FOO   =		   \
	GENIMAGE_DEPENDENCIES   = host-pkgconf libconfuse
	FOO     += spaces before
	FOO     ?=   spaces before and after
	FOO     :=
	FOO     =
	FOO	=
	FOO	  =
	FOO =
	   $(MAKE1) CROSS_COMPILE=$(TARGET_CROSS) -C
	AT91BOOTSTRAP3_DEFCONFIG = \
	AXEL_DISABLE_I18N=--i18n=0

After this bulk change, following manual fixups were done:
- fix line continuation alignment in cegui06 and spice (the sed
  expression leaves the number of whitespace between the value and line
  continuation character intact, but the whitespace before that could have
  changed, causing misalignment.
- qt5base was reverted, as this package uses extensive alignment which
  actually makes the code more readable.

Finally, the end result was manually reviewed.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Cc: Yann E. Morin <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
 boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk  | 10 +--
 boot/grub/grub.mk                                  |  4 +-
 boot/syslinux/syslinux.mk                          |  4 +-
 boot/uboot/uboot.mk                                | 44 ++++++------
 boot/xloader/xloader.mk                            |  4 +-
 fs/ext2/ext2.mk                                    |  2 +-
 fs/romfs/romfs.mk                                  |  2 +-
 linux/linux.mk                                     |  2 +-
 package/atftp/atftp.mk                             |  2 +-
 package/axel/axel.mk                               |  2 +-
 package/bind/bind.mk                               |  2 +-
 package/ccache/ccache.mk                           |  4 +-
 package/cegui06/cegui06.mk                         | 16 ++---
 package/celt051/celt051.mk                         | 12 ++--
 package/cjson/cjson.mk                             | 10 +--
 package/copas/copas.mk                             |  2 +-
 package/coxpcall/coxpcall.mk                       |  2 +-
 package/dbus/dbus.mk                               |  2 +-
 package/dhcpdump/dhcpdump.mk                       |  2 +-
 package/dmidecode/dmidecode.mk                     |  2 +-
 package/dtc/dtc.mk                                 | 20 +++---
 package/dvbsnoop/dvbsnoop.mk                       |  8 +--
 package/ecryptfs-utils/ecryptfs-utils.mk           | 14 ++--
 package/efl/libedje/libedje.mk                     |  2 +-
 package/eigen/eigen.mk                             |  2 +-
 package/freescale-imx/freescale-imx.mk             |  2 +-
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           |  4 +-
 package/freescale-imx/imx-lib/imx-lib.mk           |  2 +-
 package/freescale-imx/imx-vpu/imx-vpu.mk           |  2 +-
 package/gcc/gcc-final/gcc-final.mk                 |  4 +-
 package/gcc/gcc-initial/gcc-initial.mk             |  4 +-
 package/gdb/gdb.mk                                 |  2 +-
 package/genimage/genimage.mk                       | 10 +--
 package/genpart/genpart.mk                         |  8 +--
 package/git/git.mk                                 | 10 +--
 package/gnu-efi/gnu-efi.mk                         |  4 +-
 package/grantlee/grantlee.mk                       |  2 +-
 package/heirloom-mailx/heirloom-mailx.mk           |  4 +-
 package/igh-ethercat/igh-ethercat.mk               |  6 +-
 package/keyutils/keyutils.mk                       | 10 +--
 package/lbase64/lbase64.mk                         |  2 +-
 package/lftp/lftp.mk                               |  2 +-
 package/libatasmart/libatasmart.mk                 |  2 +-
 package/libffi/libffi.mk                           |  2 +-
 package/libmbim/libmbim.mk                         |  4 +-
 package/libnspr/libnspr.mk                         |  2 +-
 package/libqmi/libqmi.mk                           |  4 +-
 package/libreplaygain/libreplaygain.mk             |  2 +-
 package/libseccomp/libseccomp.mk                   | 16 ++---
 package/libsvg-cairo/libsvg-cairo.mk               | 10 +--
 package/libsvg/libsvg.mk                           | 10 +--
 package/liburcu/liburcu.mk                         |  4 +-
 package/linux-fusion/linux-fusion.mk               |  6 +-
 package/ljlinenoise/ljlinenoise.mk                 |  2 +-
 package/lmbench/lmbench.mk                         |  2 +-
 package/localedef/localedef.mk                     |  4 +-
 package/lpty/lpty.mk                               |  2 +-
 package/lrandom/lrandom.mk                         |  2 +-
 package/lsqlite3/lsqlite3.mk                       |  2 +-
 package/ltp-testsuite/ltp-testsuite.mk             |  4 +-
 package/lttng-babeltrace/lttng-babeltrace.mk       |  4 +-
 package/lttng-libust/lttng-libust.mk               |  8 +--
 package/lttng-modules/lttng-modules.mk             |  4 +-
 package/lttng-tools/lttng-tools.mk                 |  4 +-
 package/lua-coat/lua-coat.mk                       |  2 +-
 package/lua-coatpersistent/lua-coatpersistent.mk   |  2 +-
 package/lua-csnappy/lua-csnappy.mk                 |  2 +-
 package/lua-messagepack/lua-messagepack.mk         |  2 +-
 package/lua-testmore/lua-testmore.mk               |  2 +-
 package/luabitop/luabitop.mk                       |  2 +-
 package/luajit/luajit.mk                           |  8 +--
 package/luajson/luajson.mk                         |  2 +-
 package/lualogging/lualogging.mk                   |  2 +-
 package/luarocks/luarocks.mk                       |  2 +-
 package/luasec/luasec.mk                           |  2 +-
 package/luasocket/luasocket.mk                     |  2 +-
 package/luasql-sqlite3/luasql-sqlite3.mk           |  2 +-
 package/lunit/lunit.mk                             |  2 +-
 package/lzlib/lzlib.mk                             |  2 +-
 package/mii-diag/mii-diag.mk                       |  6 +-
 package/mmc-utils/mmc-utils.mk                     |  2 +-
 package/mplayer/mplayer.mk                         |  4 +-
 package/musepack/musepack.mk                       |  2 +-
 package/nodejs/nodejs.mk                           | 12 ++--
 package/on2-8170-modules/on2-8170-modules.mk       |  2 +-
 package/orbit/orbit.mk                             |  2 +-
 package/pciutils/pciutils.mk                       |  2 +-
 package/perl/perl.mk                               |  4 +-
 package/php/php.mk                                 |  2 +-
 package/picocom/picocom.mk                         |  2 +-
 package/pinentry/pinentry.mk                       |  2 +-
 package/pkg-download.mk                            | 12 ++--
 package/pkg-perl.mk                                |  2 +-
 package/pkg-utils.mk                               | 12 ++--
 package/proftpd/proftpd.mk                         |  2 +-
 package/python-dialog/python-dialog.mk             |  4 +-
 package/python-ipy/python-ipy.mk                   |  2 +-
 package/python-mad/python-mad.mk                   |  4 +-
 package/python-netifaces/python-netifaces.mk       |  4 +-
 package/python-protobuf/python-protobuf.mk         |  4 +-
 package/python-pyparsing/python-pyparsing.mk       | 12 ++--
 package/python-pyro/python-pyro.mk                 |  4 +-
 package/python-serial/python-serial.mk             |  4 +-
 package/python/python.mk                           | 10 +--
 package/python3/python3.mk                         |  2 +-
 package/qemu/qemu.mk                               |  2 +-
 package/qextserialport/qextserialport.mk           |  4 +-
 package/qjson/qjson.mk                             |  2 +-
 package/qt/qt.mk                                   | 80 +++++++++++-----------
 package/qwt/qwt.mk                                 |  2 +-
 package/rings/rings.mk                             |  2 +-
 package/rpcbind/rpcbind.mk                         |  4 +-
 package/rtai/rtai.mk                               |  4 +-
 package/sam-ba/sam-ba.mk                           |  4 +-
 package/sg3_utils/sg3_utils.mk                     |  2 +-
 package/slirp/slirp.mk                             |  8 +--
 package/spice-protocol/spice-protocol.mk           | 10 +--
 package/spice/spice.mk                             | 14 ++--
 package/sysvinit/sysvinit.mk                       |  6 +-
 package/tcllib/tcllib.mk                           | 12 ++--
 package/tftpd/tftpd.mk                             |  6 +-
 package/thttpd/thttpd.mk                           |  2 +-
 package/tstools/tstools.mk                         |  4 +-
 package/tvheadend/tvheadend.mk                     |  2 +-
 package/uboot-tools/uboot-tools.mk                 |  4 +-
 package/udisks/udisks.mk                           |  2 +-
 package/usbredir/usbredir.mk                       | 16 ++---
 package/valgrind/valgrind.mk                       |  4 +-
 package/vde2/vde2.mk                               | 12 ++--
 package/vpnc/vpnc.mk                               | 10 +--
 package/xinetd/xinetd.mk                           |  6 +-
 package/zxing/zxing.mk                             |  2 +-
 support/dependencies/dependencies.mk               |  4 +-
 toolchain/toolchain-external/toolchain-external.mk | 52 +++++++-------
 134 files changed, 396 insertions(+), 396 deletions(-)

diff --git a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
index a9d69a9..c56bdee 100644
--- a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
+++ b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-BOOT_WRAPPER_AARCH64_VERSION        = 4266507a84f8c06452109d38e0350d4759740694
-BOOT_WRAPPER_AARCH64_SITE           = git://git.kernel.org/pub/scm/linux/kernel/git/cmarinas/boot-wrapper-aarch64.git
-BOOT_WRAPPER_AARCH64_LICENSE        = BSD3c
-BOOT_WRAPPER_AARCH64_LICENSE_FILES  = LICENSE.txt
-BOOT_WRAPPER_AARCH64_DEPENDENCIES   = linux
+BOOT_WRAPPER_AARCH64_VERSION = 4266507a84f8c06452109d38e0350d4759740694
+BOOT_WRAPPER_AARCH64_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/cmarinas/boot-wrapper-aarch64.git
+BOOT_WRAPPER_AARCH64_LICENSE = BSD3c
+BOOT_WRAPPER_AARCH64_LICENSE_FILES = LICENSE.txt
+BOOT_WRAPPER_AARCH64_DEPENDENCIES = linux
 BOOT_WRAPPER_AARCH64_INSTALL_IMAGES = YES
 
 # The Git repository does not have the generated configure script and
diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index f01b02d..0331e33 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -6,8 +6,8 @@
 
 GRUB_VERSION = 0.97
 GRUB_SOURCE = grub_$(GRUB_VERSION).orig.tar.gz
-GRUB_PATCH  = grub_$(GRUB_VERSION)-67.diff.gz
-GRUB_SITE   = http://snapshot.debian.org/archive/debian/20130129T225227Z/pool/main/g/grub
+GRUB_PATCH = grub_$(GRUB_VERSION)-67.diff.gz
+GRUB_SITE = http://snapshot.debian.org/archive/debian/20130129T225227Z/pool/main/g/grub
 
 GRUB_LICENSE = GPLv2+
 GRUB_LICENSE_FILES = COPYING
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 18f2243..8ef53f9 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 SYSLINUX_VERSION = 6.02
-SYSLINUX_SOURCE  = syslinux-$(SYSLINUX_VERSION).tar.xz
-SYSLINUX_SITE    = $(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux
+SYSLINUX_SOURCE = syslinux-$(SYSLINUX_VERSION).tar.xz
+SYSLINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux
 
 SYSLINUX_LICENSE = GPLv2+
 SYSLINUX_LICENSE_FILES = COPYING
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 532ac8b..0c6c96c 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_VERSION    = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
+UBOOT_VERSION = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
 UBOOT_BOARD_NAME = $(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
 
 UBOOT_LICENSE = GPLv2+
@@ -15,48 +15,48 @@ UBOOT_INSTALL_IMAGES = YES
 ifeq ($(UBOOT_VERSION),custom)
 # Handle custom U-Boot tarballs as specified by the configuration
 UBOOT_TARBALL = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION))
-UBOOT_SITE    = $(patsubst %/,%,$(dir $(UBOOT_TARBALL)))
-UBOOT_SOURCE  = $(notdir $(UBOOT_TARBALL))
+UBOOT_SITE = $(patsubst %/,%,$(dir $(UBOOT_TARBALL)))
+UBOOT_SOURCE = $(notdir $(UBOOT_TARBALL))
 else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_GIT),y)
-UBOOT_SITE        = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
+UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
 UBOOT_SITE_METHOD = git
 else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_HG),y)
-UBOOT_SITE        = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
+UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
 UBOOT_SITE_METHOD = hg
 else
 # Handle stable official U-Boot versions
-UBOOT_SITE    = ftp://ftp.denx.de/pub/u-boot
-UBOOT_SOURCE  = u-boot-$(UBOOT_VERSION).tar.bz2
+UBOOT_SITE = ftp://ftp.denx.de/pub/u-boot
+UBOOT_SOURCE = u-boot-$(UBOOT_VERSION).tar.bz2
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_ELF),y)
-UBOOT_BIN          = u-boot
+UBOOT_BIN = u-boot
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_KWB),y)
-UBOOT_BIN          = u-boot.kwb
-UBOOT_MAKE_TARGET  = $(UBOOT_BIN)
+UBOOT_BIN = u-boot.kwb
+UBOOT_MAKE_TARGET = $(UBOOT_BIN)
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_AIS),y)
-UBOOT_BIN          = u-boot.ais
-UBOOT_MAKE_TARGET  = $(UBOOT_BIN)
+UBOOT_BIN = u-boot.ais
+UBOOT_MAKE_TARGET = $(UBOOT_BIN)
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_LDR),y)
-UBOOT_BIN          = u-boot.ldr
+UBOOT_BIN = u-boot.ldr
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND_BIN),y)
-UBOOT_BIN          = u-boot-nand.bin
+UBOOT_BIN = u-boot-nand.bin
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMG),y)
-UBOOT_BIN          = u-boot.img
+UBOOT_BIN = u-boot.img
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMX),y)
-UBOOT_BIN          = u-boot.imx
+UBOOT_BIN = u-boot.imx
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_SB),y)
-UBOOT_BIN          = u-boot.sb
-UBOOT_MAKE_TARGET  = $(UBOOT_BIN)
+UBOOT_BIN = u-boot.sb
+UBOOT_MAKE_TARGET = $(UBOOT_BIN)
 UBOOT_DEPENDENCIES += host-elftosb
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_CUSTOM),y)
-UBOOT_BIN          = $(call qstrip,$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME))
+UBOOT_BIN = $(call qstrip,$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME))
 else
-UBOOT_BIN          = u-boot.bin
-UBOOT_BIN_IFT      = $(UBOOT_BIN).ift
+UBOOT_BIN = u-boot.bin
+UBOOT_BIN_IFT = $(UBOOT_BIN).ift
 endif
 
-UBOOT_ARCH=$(KERNEL_ARCH)
+UBOOT_ARCH = $(KERNEL_ARCH)
 
 UBOOT_CONFIGURE_OPTS += CONFIG_NOSOFTFLOAT=1
 UBOOT_MAKE_OPTS += \
diff --git a/boot/xloader/xloader.mk b/boot/xloader/xloader.mk
index 00c63b1..90d5fa2 100644
--- a/boot/xloader/xloader.mk
+++ b/boot/xloader/xloader.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XLOADER_VERSION    = 6f3a26101303051e0f91b6213735b68ce804e94e
-XLOADER_SITE       = git://gitorious.org/x-loader/x-loader.git
+XLOADER_VERSION = 6f3a26101303051e0f91b6213735b68ce804e94e
+XLOADER_SITE = git://gitorious.org/x-loader/x-loader.git
 XLOADER_BOARD_NAME = $(call qstrip,$(BR2_TARGET_XLOADER_BOARDNAME))
 
 XLOADER_LICENSE = GPLv2+
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 1bc49da..425f7bf 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -20,7 +20,7 @@ endif
 
 ROOTFS_EXT2_DEPENDENCIES = host-genext2fs host-e2fsprogs
 
-EXT2_ENV  = GEN=$(BR2_TARGET_ROOTFS_EXT2_GEN)
+EXT2_ENV = GEN=$(BR2_TARGET_ROOTFS_EXT2_GEN)
 EXT2_ENV += REV=$(BR2_TARGET_ROOTFS_EXT2_REV)
 
 define ROOTFS_EXT2_CMD
diff --git a/fs/romfs/romfs.mk b/fs/romfs/romfs.mk
index 63eb994..e0ac65f 100644
--- a/fs/romfs/romfs.mk
+++ b/fs/romfs/romfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ROMFS_TARGET=$(IMAGE).romfs
+ROMFS_TARGET = $(IMAGE).romfs
 
 ROOTFS_ROMFS_DEPENDENCIES = host-genromfs
 
diff --git a/linux/linux.mk b/linux/linux.mk
index 2fb7437..2b862ec 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -113,7 +113,7 @@ ifeq ($(LINUX_IMAGE_NAME),)
 LINUX_IMAGE_NAME = $(LINUX_TARGET_NAME)
 endif
 
-LINUX_KERNEL_UIMAGE_LOADADDR=$(call qstrip,$(BR2_LINUX_KERNEL_UIMAGE_LOADADDR))
+LINUX_KERNEL_UIMAGE_LOADADDR = $(call qstrip,$(BR2_LINUX_KERNEL_UIMAGE_LOADADDR))
 ifneq ($(LINUX_KERNEL_UIMAGE_LOADADDR),)
 LINUX_MAKE_FLAGS += LOADADDR="$(LINUX_KERNEL_UIMAGE_LOADADDR)"
 endif
diff --git a/package/atftp/atftp.mk b/package/atftp/atftp.mk
index 48bf74b..4d9a71b 100644
--- a/package/atftp/atftp.mk
+++ b/package/atftp/atftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATFTP_VERSION  = 0.7.1
+ATFTP_VERSION = 0.7.1
 ATFTP_SITE = http://sourceforge.net/projects/atftp/files
 ATFTP_LICENSE = GPLv2+
 ATFTP_LICENSE_FILES = LICENSE
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 80c5d17..6328d99 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -17,7 +17,7 @@ AXEL_LDFLAGS += -lintl
 endif
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
-AXEL_DISABLE_I18N=--i18n=0
+AXEL_DISABLE_I18N = --i18n=0
 endif
 
 define AXEL_CONFIGURE_CMDS
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index fb7534c..88b6c9f 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -18,7 +18,7 @@ BIND_TARGET_SERVER_SBIN += lwresd named named-checkconf named-checkzone
 BIND_TARGET_SERVER_SBIN += named-compilezone rndc rndc-confgen dnssec-dsfromkey
 BIND_TARGET_SERVER_SBIN += dnssec-keyfromlabel dnssec-signzone
 BIND_TARGET_TOOLS_BIN = dig host nslookup nsupdate
-BIND_CONF_ENV =	BUILD_CC="$(TARGET_CC)" \
+BIND_CONF_ENV = BUILD_CC="$(TARGET_CC)" \
 		BUILD_CFLAGS="$(TARGET_CFLAGS)"
 BIND_CONF_OPTS = --localstatedir=/var \
 		--with-randomdev=/dev/urandom \
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index c26ad3f..270ea4b 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 CCACHE_VERSION = 3.1.8
-CCACHE_SITE    = http://samba.org/ftp/ccache
-CCACHE_SOURCE  = ccache-$(CCACHE_VERSION).tar.xz
+CCACHE_SITE = http://samba.org/ftp/ccache
+CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPLv3+, others
 CCACHE_LICENSE_FILES = LICENSE.txt GPL-3.0.txt
 
diff --git a/package/cegui06/cegui06.mk b/package/cegui06/cegui06.mk
index e26011f..ee74363 100644
--- a/package/cegui06/cegui06.mk
+++ b/package/cegui06/cegui06.mk
@@ -5,20 +5,20 @@
 ################################################################################
 
 # Do not update the version, we need exactly that one for Spice.
-CEGUI06_VERSION_MAJOR   = 0.6.2
-CEGUI06_VERSION         = $(CEGUI06_VERSION_MAJOR)b
-CEGUI06_SOURCE          = CEGUI-$(CEGUI06_VERSION).tar.gz
-CEGUI06_SITE            = http://downloads.sourceforge.net/project/crayzedsgui/CEGUI%20Mk-2/$(CEGUI06_VERSION_MAJOR)
-CEGUI06_LICENSE         = MIT
-CEGUI06_LICENSE_FILES   = COPYING
+CEGUI06_VERSION_MAJOR = 0.6.2
+CEGUI06_VERSION = $(CEGUI06_VERSION_MAJOR)b
+CEGUI06_SOURCE = CEGUI-$(CEGUI06_VERSION).tar.gz
+CEGUI06_SITE = http://downloads.sourceforge.net/project/crayzedsgui/CEGUI%20Mk-2/$(CEGUI06_VERSION_MAJOR)
+CEGUI06_LICENSE = MIT
+CEGUI06_LICENSE_FILES = COPYING
 CEGUI06_INSTALL_STAGING = YES
 
-CEGUI06_DEPENDENCIES    =       \
+CEGUI06_DEPENDENCIES =          \
     expat                       \
     freetype                    \
     pcre                        \
 
-CEGUI06_CONF_OPTS =              \
+CEGUI06_CONF_OPTS =             \
     --enable-expat              \
     --disable-external-tinyxml  \
     --disable-xerces-c          \
diff --git a/package/celt051/celt051.mk b/package/celt051/celt051.mk
index a0ab935..280634d 100644
--- a/package/celt051/celt051.mk
+++ b/package/celt051/celt051.mk
@@ -6,13 +6,13 @@
 
 # Although version newer than 0.5.1.3 exists, we're
 # stuck with 0.5.1.3 for use by Spice (coming later)
-CELT051_VERSION         = 0.5.1.3
-CELT051_SOURCE          = celt-$(CELT051_VERSION).tar.gz
-CELT051_SITE            = http://downloads.xiph.org/releases/celt
-CELT051_LICENSE         = BSD-2c
-CELT051_LICENSE_FILES   = COPYING
+CELT051_VERSION = 0.5.1.3
+CELT051_SOURCE = celt-$(CELT051_VERSION).tar.gz
+CELT051_SITE = http://downloads.xiph.org/releases/celt
+CELT051_LICENSE = BSD-2c
+CELT051_LICENSE_FILES = COPYING
 CELT051_INSTALL_STAGING = YES
-CELT051_DEPENDENCIES    = libogg
+CELT051_DEPENDENCIES = libogg
 
 # Need to specify --with-ogg, otherwise /usr/lib may be searched for
 # if target is the same kind as host (ie. same arch, same bitness,
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 484cb50..8f21ef8 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-CJSON_VERSION         = 58
-CJSON_SITE_METHOD     = svn
-CJSON_SITE            = http://svn.code.sf.net/p/cjson/code
+CJSON_VERSION = 58
+CJSON_SITE_METHOD = svn
+CJSON_SITE = http://svn.code.sf.net/p/cjson/code
 CJSON_INSTALL_STAGING = YES
-CJSON_LICENSE         = MIT
-CJSON_LICENSE_FILES   = LICENSE
+CJSON_LICENSE = MIT
+CJSON_LICENSE_FILES = LICENSE
 
 define CJSON_BUILD_CMDS
 	cd $(@D) && $(TARGET_CC) $(TARGET_CFLAGS) -shared -fPIC -lm \
diff --git a/package/copas/copas.mk b/package/copas/copas.mk
index e24549e..9bc38e4 100644
--- a/package/copas/copas.mk
+++ b/package/copas/copas.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 COPAS_VERSION = 1.2.1-1
-COPAS_SUBDIR  = copas-1_2_1
+COPAS_SUBDIR = copas-1_2_1
 COPAS_LICENSE = MIT
 
 $(eval $(luarocks-package))
diff --git a/package/coxpcall/coxpcall.mk b/package/coxpcall/coxpcall.mk
index ec147db..9c21143 100644
--- a/package/coxpcall/coxpcall.mk
+++ b/package/coxpcall/coxpcall.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 COXPCALL_VERSION = 1.15.0-1
-COXPCALL_SUBDIR  = coxpcall
+COXPCALL_SUBDIR = coxpcall
 COXPCALL_LICENSE = MIT
 
 $(eval $(luarocks-package))
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 6296738..7cb6d43 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -99,7 +99,7 @@ HOST_DBUS_CONF_OPTS = \
 		--with-xml=expat
 
 # dbus for the host
-DBUS_HOST_INTROSPECT=$(HOST_DBUS_DIR)/introspect.xml
+DBUS_HOST_INTROSPECT = $(HOST_DBUS_DIR)/introspect.xml
 
 HOST_DBUS_GEN_INTROSPECT = \
 	$(HOST_DIR)/usr/bin/dbus-daemon --introspect > $(DBUS_HOST_INTROSPECT)
diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
index 64ea532..ce889f4 100644
--- a/package/dhcpdump/dhcpdump.mk
+++ b/package/dhcpdump/dhcpdump.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DHCPDUMP_VERSION = 1.8
-DHCPDUMP_SITE  = http://www.mavetju.org/download
+DHCPDUMP_SITE = http://www.mavetju.org/download
 DHCPDUMP_DEPENDENCIES = libpcap
 DHCPDUMP_LICENSE = BSD-2c
 DHCPDUMP_LICENSE_FILES = LICENSE
diff --git a/package/dmidecode/dmidecode.mk b/package/dmidecode/dmidecode.mk
index d99cb23..06ac19b 100644
--- a/package/dmidecode/dmidecode.mk
+++ b/package/dmidecode/dmidecode.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DMIDECODE_VERSION = 2.12
-DMIDECODE_SITE    = http://download.savannah.gnu.org/releases/dmidecode
+DMIDECODE_SITE = http://download.savannah.gnu.org/releases/dmidecode
 DMIDECODE_LICENSE = GPLv2+
 DMIDECODE_LICENSE_FILES = LICENSE
 
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index a6898f2..51b5b4e 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-DTC_VERSION         = v1.4.0
-DTC_SITE            = git://git.jdl.com/software/dtc.git
-DTC_LICENSE         = GPLv2+/BSD-2c
-DTC_LICENSE_FILES   = README.license GPL
+DTC_VERSION = v1.4.0
+DTC_SITE = git://git.jdl.com/software/dtc.git
+DTC_LICENSE = GPLv2+/BSD-2c
+DTC_LICENSE_FILES = README.license GPL
 DTC_INSTALL_STAGING = YES
-DTC_DEPENDENCIES    = host-bison host-flex
+DTC_DEPENDENCIES = host-bison host-flex
 
 define DTC_POST_INSTALL_TARGET_RM_DTDIFF
 	rm -f $(TARGET_DIR)/usr/bin/dtdiff
@@ -17,19 +17,19 @@ endef
 
 ifeq ($(BR2_PACKAGE_DTC_PROGRAMS),y)
 
-DTC_LICENSE        += (for the library), GPLv2+ (for the executables)
+DTC_LICENSE += (for the library), GPLv2+ (for the executables)
 # Use default goal to build everything
-DTC_BUILD_GOAL      =
-DTC_INSTALL_GOAL    = install
+DTC_BUILD_GOAL =
+DTC_INSTALL_GOAL = install
 ifeq ($(BR2_PACKAGE_BASH),)
 DTC_POST_INSTALL_TARGET_HOOKS += DTC_POST_INSTALL_TARGET_RM_DTDIFF
 endif
 
 else # $(BR2_PACKAGE_DTC_PROGRAMS) != y
 
-DTC_BUILD_GOAL      = libfdt
+DTC_BUILD_GOAL = libfdt
 #?libfdt_install is our own install rule added by our patch
-DTC_INSTALL_GOAL    = libfdt_install
+DTC_INSTALL_GOAL = libfdt_install
 
 endif # $(BR2_PACKAGE_DTC_PROGRAMS) != y
 
diff --git a/package/dvbsnoop/dvbsnoop.mk b/package/dvbsnoop/dvbsnoop.mk
index 0b06128..3bd8f81 100644
--- a/package/dvbsnoop/dvbsnoop.mk
+++ b/package/dvbsnoop/dvbsnoop.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DVBSNOOP_VERSION        = 1.4.50
-DVBSNOOP_SITE           = http://downloads.sourceforge.net/project/dvbsnoop/dvbsnoop/dvbsnoop-$(DVBSNOOP_VERSION)
-DVBSNOOP_LICENSE        = GPLv2
-DVBSNOOP_LICENSE_FILES  = COPYING
+DVBSNOOP_VERSION = 1.4.50
+DVBSNOOP_SITE = http://downloads.sourceforge.net/project/dvbsnoop/dvbsnoop/dvbsnoop-$(DVBSNOOP_VERSION)
+DVBSNOOP_LICENSE = GPLv2
+DVBSNOOP_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index 1fdab29..e58bd8e 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-ECRYPTFS_UTILS_VERSION         = 104
-ECRYPTFS_UTILS_SOURCE          = ecryptfs-utils_$(ECRYPTFS_UTILS_VERSION).orig.tar.gz
-ECRYPTFS_UTILS_SITE            = https://launchpad.net/ecryptfs/trunk/$(ECRYPTFS_UTILS_VERSION)/+download
-ECRYPTFS_UTILS_LICENSE         = GPLv2+
-ECRYPTFS_UTILS_LICENSE_FILES   = COPYING
+ECRYPTFS_UTILS_VERSION = 104
+ECRYPTFS_UTILS_SOURCE = ecryptfs-utils_$(ECRYPTFS_UTILS_VERSION).orig.tar.gz
+ECRYPTFS_UTILS_SITE = https://launchpad.net/ecryptfs/trunk/$(ECRYPTFS_UTILS_VERSION)/+download
+ECRYPTFS_UTILS_LICENSE = GPLv2+
+ECRYPTFS_UTILS_LICENSE_FILES = COPYING
 
-ECRYPTFS_UTILS_DEPENDENCIES    = keyutils libnss host-intltool
-ECRYPTFS_UTILS_CONF_OPTS        = --disable-pywrap --disable-pam
+ECRYPTFS_UTILS_DEPENDENCIES = keyutils libnss host-intltool
+ECRYPTFS_UTILS_CONF_OPTS = --disable-pywrap --disable-pam
 
 #Needed for build system to find pk11func.h and libnss3.so
 ECRYPTFS_UTILS_CONF_ENV = \
diff --git a/package/efl/libedje/libedje.mk b/package/efl/libedje/libedje.mk
index 53c44b2..9054620 100644
--- a/package/efl/libedje/libedje.mk
+++ b/package/efl/libedje/libedje.mk
@@ -6,7 +6,7 @@
 
 LIBEDJE_VERSION = $(EFL_VERSION)
 LIBEDJE_SOURCE = edje-$(LIBEDJE_VERSION).tar.bz2
-LIBEDJE_SITE =  http://download.enlightenment.org/releases
+LIBEDJE_SITE = http://download.enlightenment.org/releases
 LIBEDJE_LICENSE = GPLv2+ (epp binary), BSD-2c (everything else)
 LIBEDJE_LICENSE_FILES = COPYING
 
diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
index 2bb118b..1ac5707 100644
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -6,7 +6,7 @@
 
 # version 3.2
 EIGEN_VERSION = ffa86ffb5570
-EIGEN_SITE    = https://bitbucket.org/eigen/eigen
+EIGEN_SITE = https://bitbucket.org/eigen/eigen
 EIGEN_SITE_METHOD = hg
 EIGEN_LICENSE = MPL2, BSD-3c, LGPLv2.1
 EIGEN_LICENSE_FILES = COPYING.MPL2 COPYING.BSD COPYING.LGPL COPYING.README
diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
index 64ea1f9..c52fc11 100644
--- a/package/freescale-imx/freescale-imx.mk
+++ b/package/freescale-imx/freescale-imx.mk
@@ -5,6 +5,6 @@
 ################################################################################
 
 FREESCALE_IMX_VERSION = 3.10.17-1.0.0
-FREESCALE_IMX_SITE    = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO
+FREESCALE_IMX_SITE = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO
 
 include $(sort $(wildcard package/freescale-imx/*/*.mk))
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
index 49a8287..60060d3 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
@@ -9,8 +9,8 @@ GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)-hfp
 else
 GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)-sfp
 endif
-GPU_VIV_BIN_MX6Q_SITE    = $(FREESCALE_IMX_SITE)
-GPU_VIV_BIN_MX6Q_SOURCE  = gpu-viv-bin-mx6q-$(GPU_VIV_BIN_MX6Q_VERSION).bin
+GPU_VIV_BIN_MX6Q_SITE = $(FREESCALE_IMX_SITE)
+GPU_VIV_BIN_MX6Q_SOURCE = gpu-viv-bin-mx6q-$(GPU_VIV_BIN_MX6Q_VERSION).bin
 
 GPU_VIV_BIN_MX6Q_INSTALL_STAGING = YES
 
diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
index f643b15..92739a8 100644
--- a/package/freescale-imx/imx-lib/imx-lib.mk
+++ b/package/freescale-imx/imx-lib/imx-lib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IMX_LIB_VERSION = $(FREESCALE_IMX_VERSION)
-IMX_LIB_SITE    = $(FREESCALE_IMX_SITE)
+IMX_LIB_SITE = $(FREESCALE_IMX_SITE)
 IMX_LIB_LICENSE = LGPLv2.1+
 IMX_LIB_LICENSE_FILES = EULA
 
diff --git a/package/freescale-imx/imx-vpu/imx-vpu.mk b/package/freescale-imx/imx-vpu/imx-vpu.mk
index f7e7ab6..e0292ed 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.mk
+++ b/package/freescale-imx/imx-vpu/imx-vpu.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IMX_VPU_VERSION = $(FREESCALE_IMX_VERSION)
-IMX_VPU_SITE    = $(FREESCALE_IMX_SITE)
+IMX_VPU_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_LICENSE = Freescale License
 IMX_VPU_LICENSE_FILES = EULA vpu/EULA.txt
 IMX_VPU_SOURCE = imx-vpu-$(IMX_VPU_VERSION).bin
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index f1cd66a..26c2011 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 GCC_FINAL_VERSION = $(GCC_VERSION)
-GCC_FINAL_SITE    = $(GCC_SITE)
-GCC_FINAL_SOURCE  = $(GCC_SOURCE)
+GCC_FINAL_SITE = $(GCC_SITE)
+GCC_FINAL_SOURCE = $(GCC_SOURCE)
 
 HOST_GCC_FINAL_DEPENDENCIES = \
 	$(HOST_GCC_COMMON_DEPENDENCIES) \
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index ef3ad30..74e2d32 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 GCC_INITIAL_VERSION = $(GCC_VERSION)
-GCC_INITIAL_SITE    = $(GCC_SITE)
-GCC_INITIAL_SOURCE  = $(GCC_SOURCE)
+GCC_INITIAL_SITE = $(GCC_SITE)
+GCC_INITIAL_SOURCE = $(GCC_SOURCE)
 
 HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES)
 
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index e8c6588..8d0f76d 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GDB_VERSION = $(call qstrip,$(BR2_GDB_VERSION))
-GDB_SITE    = $(BR2_GNU_MIRROR)/gdb
+GDB_SITE = $(BR2_GNU_MIRROR)/gdb
 
 ifeq ($(BR2_arc),y)
 GDB_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(GDB_VERSION))
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index 0c0c1e5..07d95a4 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-GENIMAGE_VERSION        = 7
-GENIMAGE_SOURCE         = genimage-$(GENIMAGE_VERSION).tar.xz
-GENIMAGE_SITE           = http://www.pengutronix.de/software/genimage/download
-GENIMAGE_DEPENDENCIES   = host-pkgconf libconfuse
-GENIMAGE_LICENSE        = GPLv2
+GENIMAGE_VERSION = 7
+GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
+GENIMAGE_SITE = http://www.pengutronix.de/software/genimage/download
+GENIMAGE_DEPENDENCIES = host-pkgconf libconfuse
+GENIMAGE_LICENSE = GPLv2
 
 $(eval $(host-autotools-package))
diff --git a/package/genpart/genpart.mk b/package/genpart/genpart.mk
index e2208b8..2aa2c71 100644
--- a/package/genpart/genpart.mk
+++ b/package/genpart/genpart.mk
@@ -4,16 +4,16 @@
 #
 ################################################################################
 
-GENPART_VERSION       = 1.0.2
-GENPART_SOURCE        = genpart-$(GENPART_VERSION).tar.bz2
-GENPART_SITE          = http://www.pengutronix.de/software/genpart/download
+GENPART_VERSION = 1.0.2
+GENPART_SOURCE = genpart-$(GENPART_VERSION).tar.bz2
+GENPART_SITE = http://www.pengutronix.de/software/genpart/download
 # genpart has no license embedded in its source release.
 # However, their project page mentions:
 #   > This community portal offers an overview about our own OSS
 #   > projects and projects Pengutronix is or was involved with.
 # We can thus assume genpart is under a FLOSS license.
 # So, until the authors have clarified the licensing terms:
-GENPART_LICENSE       = Unknown (clarification has been asked to the authors)
+GENPART_LICENSE = Unknown (clarification has been asked to the authors)
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/git/git.mk b/package/git/git.mk
index 323b31a..8a69ee5 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-GIT_VERSION         = 1.8.5.4
-GIT_SITE            = http://git-core.googlecode.com/files
-GIT_LICENSE         = GPLv2 LGPLv2.1+
-GIT_LICENSE_FILES   = COPYING LGPL-2.1
-GIT_DEPENDENCIES    = zlib host-gettext
+GIT_VERSION = 1.8.5.4
+GIT_SITE = http://git-core.googlecode.com/files
+GIT_LICENSE = GPLv2 LGPLv2.1+
+GIT_LICENSE_FILES = COPYING LGPL-2.1
+GIT_DEPENDENCIES = zlib host-gettext
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	GIT_DEPENDENCIES += openssl
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index a35a60d..9fbbadd 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -17,9 +17,9 @@ GNU_EFI_LICENSE_FILES = debian/copyright
 GNU_EFI_INSTALL_TARGET = NO
 
 ifeq ($(BR2_i386),y)
-GNU_EFI_PLATFORM=ia32
+GNU_EFI_PLATFORM = ia32
 else ifeq ($(BR2_x86_64),y)
-GNU_EFI_PLATFORM=x86_64
+GNU_EFI_PLATFORM = x86_64
 endif
 
 define GNU_EFI_BUILD_CMDS
diff --git a/package/grantlee/grantlee.mk b/package/grantlee/grantlee.mk
index f5347ae..539578b 100644
--- a/package/grantlee/grantlee.mk
+++ b/package/grantlee/grantlee.mk
@@ -7,7 +7,7 @@
 GRANTLEE_VERSION = 0.2.0
 GRANTLEE_SITE = http://downloads.grantlee.org
 GRANTLEE_INSTALL_STAGING = YES
-GRANTLEE_DEPENDENCIES =  qt
+GRANTLEE_DEPENDENCIES = qt
 GRANTLEE_LICENSE = LGPLv2.1+
 GRANTLEE_LICENSE_FILES = COPYING.LIB
 
diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
index e7a12c7..c1e3ed1 100644
--- a/package/heirloom-mailx/heirloom-mailx.mk
+++ b/package/heirloom-mailx/heirloom-mailx.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 HEIRLOOM_MAILX_VERSION = 12.5
-HEIRLOOM_MAILX_SOURCE  = heirloom-mailx_$(HEIRLOOM_MAILX_VERSION).orig.tar.gz
-HEIRLOOM_MAILX_SITE    = http://snapshot.debian.org/archive/debian/20110427T035506Z/pool/main/h/heirloom-mailx
+HEIRLOOM_MAILX_SOURCE = heirloom-mailx_$(HEIRLOOM_MAILX_VERSION).orig.tar.gz
+HEIRLOOM_MAILX_SITE = http://snapshot.debian.org/archive/debian/20110427T035506Z/pool/main/h/heirloom-mailx
 HEIRLOOM_MAILX_LICENSE = BSD-4c, Bellcore (base64), OpenVision (imap_gssapi), RSA Data Security (md5), Network Working Group (hmac), MPLv1.1 (nss)
 HEIRLOOM_MAILX_LICENSE_FILES = COPYING
 
diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
index e943001..b5221f8 100644
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -5,12 +5,12 @@
 ################################################################################
 
 IGH_ETHERCAT_VERSION = 1.5.2
-IGH_ETHERCAT_SITE    = http://etherlab.org/download/ethercat
-IGH_ETHERCAT_SOURCE  = ethercat-$(IGH_ETHERCAT_VERSION).tar.bz2
+IGH_ETHERCAT_SITE = http://etherlab.org/download/ethercat
+IGH_ETHERCAT_SOURCE = ethercat-$(IGH_ETHERCAT_VERSION).tar.bz2
 IGH_ETHERCAT_LICENSE = GPLv2 (IgH EtherCAT master), LGPLv2.1 (libraries)
 IGH_ETHERCAT_LICENSE_FILES = COPYING COPYING.LESSER
 
-IGH_ETHERCAT_DEPENDENCIES    = linux
+IGH_ETHERCAT_DEPENDENCIES = linux
 IGH_ETHERCAT_INSTALL_STAGING = YES
 
 IGH_ETHERCAT_CONF_OPTS = \
diff --git a/package/keyutils/keyutils.mk b/package/keyutils/keyutils.mk
index ad73016..241536f 100644
--- a/package/keyutils/keyutils.mk
+++ b/package/keyutils/keyutils.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-KEYUTILS_VERSION         = 1.5.9
-KEYUTILS_SOURCE          = keyutils-$(KEYUTILS_VERSION).tar.bz2
-KEYUTILS_SITE            = http://people.redhat.com/~dhowells/keyutils
-KEYUTILS_LICENSE         = GPLv2+ LGPLv2.1+
-KEYUTILS_LICENSE_FILES   = LICENCE.GPL LICENCE.LGPL
+KEYUTILS_VERSION = 1.5.9
+KEYUTILS_SOURCE = keyutils-$(KEYUTILS_VERSION).tar.bz2
+KEYUTILS_SITE = http://people.redhat.com/~dhowells/keyutils
+KEYUTILS_LICENSE = GPLv2+ LGPLv2.1+
+KEYUTILS_LICENSE_FILES = LICENCE.GPL LICENCE.LGPL
 KEYUTILS_INSTALL_STAGING = YES
 
 KEYUTILS_MAKE_PARAMS =                \
diff --git a/package/lbase64/lbase64.mk b/package/lbase64/lbase64.mk
index 4289f58..80e8800 100644
--- a/package/lbase64/lbase64.mk
+++ b/package/lbase64/lbase64.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LBASE64_VERSION = 20120820-1
-LBASE64_SUBDIR  = base64
+LBASE64_SUBDIR = base64
 LBASE64_LICENSE = Public domain
 LBASE64_LICENSE_FILES = $(LBASE64_SUBDIR)/README
 
diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index 22cbb3a..25703f4 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LFTP_VERSION = 4.5.5
-LFTP_SITE    = http://lftp.yar.ru/ftp
+LFTP_SITE = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPLv3+
 LFTP_LICENSE_FILES = COPYING
 LFTP_AUTORECONF = YES
diff --git a/package/libatasmart/libatasmart.mk b/package/libatasmart/libatasmart.mk
index fbfad1c..9e5de97 100644
--- a/package/libatasmart/libatasmart.mk
+++ b/package/libatasmart/libatasmart.mk
@@ -6,7 +6,7 @@
 
 LIBATASMART_VERSION = 0.19
 LIBATASMART_SOURCE = libatasmart-$(LIBATASMART_VERSION).tar.xz
-LIBATASMART_SITE    = http://0pointer.de/public
+LIBATASMART_SITE = http://0pointer.de/public
 LIBATASMART_LICENSE = LGPLv2.1
 LIBATASMART_LICENSE_FILES = LGPL
 LIBATASMART_INSTALL_STAGING = YES
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 69b64e8..5644c1e 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBFFI_VERSION = 3.1
-LIBFFI_SITE    = ftp://sourceware.org/pub/libffi
+LIBFFI_SITE = ftp://sourceware.org/pub/libffi
 LIBFFI_LICENSE = MIT
 LIBFFI_LICENSE_FILES = LICENSE
 LIBFFI_INSTALL_STAGING = YES
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index ff7861b..3613d25 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LIBMBIM_VERSION = 1.10.0
-LIBMBIM_SITE    = http://www.freedesktop.org/software/libmbim
-LIBMBIM_SOURCE  = libmbim-$(LIBMBIM_VERSION).tar.xz
+LIBMBIM_SITE = http://www.freedesktop.org/software/libmbim
+LIBMBIM_SOURCE = libmbim-$(LIBMBIM_VERSION).tar.xz
 LIBMBIM_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
 LIBMBIM_LICENSE_FILES = COPYING
 LIBMBIM_INSTALL_STAGING = YES
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 95fe507..eaa6eb7 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -17,7 +17,7 @@ LIBNSPR_LICENSE_FILES = nspr/LICENSE
 LIBNSPR_CONF_ENV = HOST_CFLAGS="-g -O2" \
 		   HOST_LDFLAGS="-lc"
 # NSPR mixes up --build and --host
-LIBNSPR_CONF_OPTS  = --host=$(GNU_HOST_NAME)
+LIBNSPR_CONF_OPTS = --host=$(GNU_HOST_NAME)
 LIBNSPR_CONF_OPTS += --$(if $(BR2_ARCH_IS_64),en,dis)able-64bit
 LIBNSPR_CONF_OPTS += --$(if $(BR2_INET_IPV6),en,dis)able-ipv6
 
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 5f886d0..ed71972 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LIBQMI_VERSION = 1.10.2
-LIBQMI_SITE    = http://www.freedesktop.org/software/libqmi
-LIBQMI_SOURCE  = libqmi-$(LIBQMI_VERSION).tar.xz
+LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
+LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
 LIBQMI_LICENSE_FILES = COPYING
 LIBQMI_INSTALL_STAGING = YES
diff --git a/package/libreplaygain/libreplaygain.mk b/package/libreplaygain/libreplaygain.mk
index 05074fc..4775999 100644
--- a/package/libreplaygain/libreplaygain.mk
+++ b/package/libreplaygain/libreplaygain.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBREPLAYGAIN_VERSION =  r475
+LIBREPLAYGAIN_VERSION = r475
 LIBREPLAYGAIN_SITE = http://files.musepack.net/source
 LIBREPLAYGAIN_SOURCE = libreplaygain_$(LIBREPLAYGAIN_VERSION).tar.gz
 # upstream doesn't ship configure
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index d696e01..44dec3f 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -4,18 +4,18 @@
 #
 ################################################################################
 
-LIBSECCOMP_VERSION         = 2.1.1
-LIBSECCOMP_SITE            = http://downloads.sourceforge.net/project/libseccomp/libseccomp-$(LIBSECCOMP_VERSION)/
-LIBSECCOMP_LICENSE         = LGPLv2.1
-LIBSECCOMP_LICENSE_FILES   = LICENSE
+LIBSECCOMP_VERSION = 2.1.1
+LIBSECCOMP_SITE = http://downloads.sourceforge.net/project/libseccomp/libseccomp-$(LIBSECCOMP_VERSION)/
+LIBSECCOMP_LICENSE = LGPLv2.1
+LIBSECCOMP_LICENSE_FILES = LICENSE
 LIBSECCOMP_INSTALL_STAGING = YES
 
 # Needed for configure to find our system headers:
-LIBSECCOMP_CONF_ENV            = SYSROOT=$(STAGING_DIR)
-LIBSECCOMP_MAKE_ENV            = $(TARGET_CONFIGURE_OPTS)
-LIBSECCOMP_MAKE_OPTS            = SUBDIRS_BUILD=src
+LIBSECCOMP_CONF_ENV = SYSROOT=$(STAGING_DIR)
+LIBSECCOMP_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
+LIBSECCOMP_MAKE_OPTS = SUBDIRS_BUILD=src
 LIBSECCOMP_INSTALL_STAGING_OPTS = SUBDIRS_BUILD=src SUBDIRS_INSTALL="src include" DESTDIR=$(STAGING_DIR) install
-LIBSECCOMP_INSTALL_TARGET_OPTS  = SUBDIRS_BUILD=src SUBDIRS_INSTALL="src include" DESTDIR=$(TARGET_DIR) install
+LIBSECCOMP_INSTALL_TARGET_OPTS = SUBDIRS_BUILD=src SUBDIRS_INSTALL="src include" DESTDIR=$(TARGET_DIR) install
 
 # Not a real autotools package, but works quite OK nonetheless
 $(eval $(autotools-package))
diff --git a/package/libsvg-cairo/libsvg-cairo.mk b/package/libsvg-cairo/libsvg-cairo.mk
index 0f1451b..28c9141 100644
--- a/package/libsvg-cairo/libsvg-cairo.mk
+++ b/package/libsvg-cairo/libsvg-cairo.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBSVG_CAIRO_VERSION         = 0.1.6
-LIBSVG_CAIRO_SITE            = http://cairographics.org/snapshots
-LIBSVG_CAIRO_DEPENDENCIES    = cairo libsvg
+LIBSVG_CAIRO_VERSION = 0.1.6
+LIBSVG_CAIRO_SITE = http://cairographics.org/snapshots
+LIBSVG_CAIRO_DEPENDENCIES = cairo libsvg
 LIBSVG_CAIRO_INSTALL_STAGING = YES
-LIBSVG_CAIRO_LICENSE         = LGPLv2.1+
-LIBSVG_CAIRO_LICENSE_FILES   = COPYING
+LIBSVG_CAIRO_LICENSE = LGPLv2.1+
+LIBSVG_CAIRO_LICENSE_FILES = COPYING
 
 LIBSVG_CAIRO_CONF_OPTS = --without-x
 
diff --git a/package/libsvg/libsvg.mk b/package/libsvg/libsvg.mk
index 956a652..a876c4e 100644
--- a/package/libsvg/libsvg.mk
+++ b/package/libsvg/libsvg.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBSVG_VERSION         = 0.1.4
-LIBSVG_SITE            = http://cairographics.org/snapshots
-LIBSVG_DEPENDENCIES    = host-pkgconf libpng libjpeg
+LIBSVG_VERSION = 0.1.4
+LIBSVG_SITE = http://cairographics.org/snapshots
+LIBSVG_DEPENDENCIES = host-pkgconf libpng libjpeg
 LIBSVG_INSTALL_STAGING = YES
-LIBSVG_LICENSE         = LGPLv2+
-LIBSVG_LICENSE_FILES   = COPYING
+LIBSVG_LICENSE = LGPLv2+
+LIBSVG_LICENSE_FILES = COPYING
 
 # libsvg needs at last a XML parser
 ifeq ($(BR2_PACKAGE_EXPAT),y)
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index 953393c..c48f659 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LIBURCU_VERSION = 0.8.4
-LIBURCU_SITE    = http://lttng.org/files/urcu
-LIBURCU_SOURCE  = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
+LIBURCU_SITE = http://lttng.org/files/urcu
+LIBURCU_SOURCE = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 LIBURCU_LICENSE = LGPLv2.1+ for the library; MIT-like license for few source files listed in LICENSE; GPLv2+ for test; GPLv3 for few *.m4 files
 LIBURCU_LICENSE_FILES = lgpl-2.1.txt lgpl-relicensing.txt gpl-2.0.txt LICENSE
 
diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index c1b03ef..c5e7976 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -11,10 +11,10 @@ LINUX_FUSION_DEPENDENCIES = linux
 LINUX_FUSION_LICENSE = GPLv2+
 LINUX_FUSION_LICENSE_FILES = debian/copyright
 
-LINUX_FOR_FUSION=$(LINUX_VERSION_PROBED)
-LINUX_FUSION_ETC_DIR=$(TARGET_DIR)/etc/udev/rules.d
+LINUX_FOR_FUSION = $(LINUX_VERSION_PROBED)
+LINUX_FUSION_ETC_DIR = $(TARGET_DIR)/etc/udev/rules.d
 
-LINUX_FUSION_MAKE_OPTS =  KERNEL_VERSION=$(LINUX_FOR_FUSION)
+LINUX_FUSION_MAKE_OPTS = KERNEL_VERSION=$(LINUX_FOR_FUSION)
 LINUX_FUSION_MAKE_OPTS += KERNEL_BUILD=$(LINUX_DIR)
 LINUX_FUSION_MAKE_OPTS += KERNEL_SOURCE=$(LINUX_DIR)
 
diff --git a/package/ljlinenoise/ljlinenoise.mk b/package/ljlinenoise/ljlinenoise.mk
index 69f6130..868f319 100644
--- a/package/ljlinenoise/ljlinenoise.mk
+++ b/package/ljlinenoise/ljlinenoise.mk
@@ -6,7 +6,7 @@
 
 LJLINENOISE_VERSION_UPSTREAM = 0.1.1
 LJLINENOISE_VERSION = $(LJLINENOISE_VERSION_UPSTREAM)-1
-LJLINENOISE_SUBDIR  = ljlinenoise-$(LJLINENOISE_VERSION_UPSTREAM)
+LJLINENOISE_SUBDIR = ljlinenoise-$(LJLINENOISE_VERSION_UPSTREAM)
 LJLINENOISE_LICENSE = MIT
 LJLINENOISE_LICENSE_FILES = $(LJLINENOISE_SUBDIR)/COPYRIGHT
 
diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index f2c7aab..63a83fd 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -7,7 +7,7 @@
 LMBENCH_VERSION = 3.0-a9
 LMBENCH_SOURCE = lmbench-$(LMBENCH_VERSION).tgz
 LMBENCH_SITE = http://downloads.sourceforge.net/project/lmbench/development/lmbench-$(LMBENCH_VERSION)
-LMBENCH_LICENSE =  lmbench license (based on GPLv2)
+LMBENCH_LICENSE = lmbench license (based on GPLv2)
 LMBENCH_LICENSE_FILES = COPYING COPYING-2
 
 LMBENCH_CFLAGS = $(TARGET_CFLAGS)
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index b9accb3..4762e64 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LOCALEDEF_VERSION = 2.14.1-r17443-ptx1
-LOCALEDEF_SOURCE  = localedef-eglibc-$(LOCALEDEF_VERSION).tar.bz2
-LOCALEDEF_SITE    = http://www.pengutronix.de/software/ptxdist/temporary-src
+LOCALEDEF_SOURCE = localedef-eglibc-$(LOCALEDEF_VERSION).tar.bz2
+LOCALEDEF_SITE = http://www.pengutronix.de/software/ptxdist/temporary-src
 
 HOST_LOCALEDEF_CONF_OPTS += \
 	--prefix=/usr \
diff --git a/package/lpty/lpty.mk b/package/lpty/lpty.mk
index 0c3b7f9..963ab61 100644
--- a/package/lpty/lpty.mk
+++ b/package/lpty/lpty.mk
@@ -6,7 +6,7 @@
 
 LPTY_VERSION_UPSTREAM = 1.0.1
 LPTY_VERSION = $(LPTY_VERSION_UPSTREAM)-1
-LPTY_SUBDIR  = lpty-$(LPTY_VERSION)
+LPTY_SUBDIR = lpty-$(LPTY_VERSION)
 LPTY_LICENSE = MIT
 LPTY_LICENSE_FILES = $(LPTY_SUBDIR)/doc/LICENSE
 
diff --git a/package/lrandom/lrandom.mk b/package/lrandom/lrandom.mk
index 0035791..f0ee1e9 100644
--- a/package/lrandom/lrandom.mk
+++ b/package/lrandom/lrandom.mk
@@ -9,7 +9,7 @@ LRANDOM_VERSION = 20120430.52-1
 else
 LRANDOM_VERSION = 20120430.51-1
 endif
-LRANDOM_SUBDIR  = random
+LRANDOM_SUBDIR = random
 LRANDOM_LICENSE = Public domain
 
 $(eval $(luarocks-package))
diff --git a/package/lsqlite3/lsqlite3.mk b/package/lsqlite3/lsqlite3.mk
index f02aa4c..b611d70 100644
--- a/package/lsqlite3/lsqlite3.mk
+++ b/package/lsqlite3/lsqlite3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LSQLITE3_VERSION = 0.9.1-2
-LSQLITE3_SUBDIR  = lsqlite3_fsl09t
+LSQLITE3_SUBDIR = lsqlite3_fsl09t
 LSQLITE3_DEPENDENCIES = sqlite
 LSQLITE3_LICENSE = MIT
 
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 6294c5e..2d4f286 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LTP_TESTSUITE_VERSION = 20140115
-LTP_TESTSUITE_SOURCE  = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
-LTP_TESTSUITE_SITE    = http://downloads.sourceforge.net/project/ltp/LTP%20Source/ltp-$(LTP_TESTSUITE_VERSION)
+LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
+LTP_TESTSUITE_SITE = http://downloads.sourceforge.net/project/ltp/LTP%20Source/ltp-$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPLv2 GPLv2+
 LTP_TESTSUITE_LICENSE_FILES = COPYING
 
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index 8183510..3785812 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LTTNG_BABELTRACE_SITE    = http://lttng.org/files/babeltrace
+LTTNG_BABELTRACE_SITE = http://lttng.org/files/babeltrace
 LTTNG_BABELTRACE_VERSION = 1.2.2
-LTTNG_BABELTRACE_SOURCE  = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
+LTTNG_BABELTRACE_SOURCE = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
 LTTNG_BABELTRACE_LICENSE = MIT; LGPLv2.1 for include/babeltrace/list.h; GPLv2 for test code
 LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt gpl-2.0.txt LICENSE
 
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 544b7e9..a84cbc6 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -4,21 +4,21 @@
 #
 ################################################################################
 
-LTTNG_LIBUST_SITE    = http://lttng.org/files/lttng-ust
+LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
 LTTNG_LIBUST_VERSION = 2.5.0
-LTTNG_LIBUST_SOURCE  = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
+LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPLv2.1; MIT for system headers; GPLv2 for liblttng-ust-ctl/ustctl.c (used by lttng-sessiond)
 LTTNG_LIBUST_LICENSE_FILES = COPYING
 
 LTTNG_LIBUST_INSTALL_STAGING = YES
-LTTNG_LIBUST_DEPENDENCIES    = liburcu util-linux
+LTTNG_LIBUST_DEPENDENCIES = liburcu util-linux
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 LTTNG_LIBUST_DEPENDENCIES += python
 else ifeq ($(BR2_PACKAGE_PYTHON3),y)
 LTTNG_LIBUST_DEPENDENCIES += python3
 else
-LTTNG_LIBUST_CONF_ENV=am_cv_pathless_PYTHON="none"
+LTTNG_LIBUST_CONF_ENV = am_cv_pathless_PYTHON="none"
 endif
 
 $(eval $(autotools-package))
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index 72d2eb7..089fa62 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LTTNG_MODULES_VERSION = 2.5.0
-LTTNG_MODULES_SITE    = http://lttng.org/files/lttng-modules
-LTTNG_MODULES_SOURCE  = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
+LTTNG_MODULES_SITE = http://lttng.org/files/lttng-modules
+LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPLv2.1/GPLv2 for kernel modules; MIT for lib/bitfield.h and lib/prio_heap/*
 LTTNG_MODULES_LICENSE_FILES = lgpl-2.1.txt gpl-2.0.txt mit-license.txt LICENSE
 
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index e04ce22..f42fb16 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LTTNG_TOOLS_VERSION = 2.5.0
-LTTNG_TOOLS_SITE    = http://lttng.org/files/lttng-tools
-LTTNG_TOOLS_SOURCE  = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
+LTTNG_TOOLS_SITE = http://lttng.org/files/lttng-tools
+LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_LICENSE = GPLv2+; LGPLv2.1+ for include/lttng/* and src/lib/lttng-ctl/*
 LTTNG_TOOLS_LICENSE_FILES = gpl-2.0.txt lgpl-2.1.txt LICENSE
 LTTNG_TOOLS_CONF_OPTS += --with-xml-prefix=$(STAGING_DIR)/usr
diff --git a/package/lua-coat/lua-coat.mk b/package/lua-coat/lua-coat.mk
index a9d9143..e5a09b0 100644
--- a/package/lua-coat/lua-coat.mk
+++ b/package/lua-coat/lua-coat.mk
@@ -6,7 +6,7 @@
 
 LUA_COAT_VERSION_UPSTREAM = 0.9.0
 LUA_COAT_VERSION = $(LUA_COAT_VERSION_UPSTREAM)-1
-LUA_COAT_SUBDIR  = lua-Coat-$(LUA_COAT_VERSION_UPSTREAM)
+LUA_COAT_SUBDIR = lua-Coat-$(LUA_COAT_VERSION_UPSTREAM)
 LUA_COAT_LICENSE = MIT
 LUA_COAT_LICENSE_FILES = $(LUA_COAT_SUBDIR)/COPYRIGHT
 
diff --git a/package/lua-coatpersistent/lua-coatpersistent.mk b/package/lua-coatpersistent/lua-coatpersistent.mk
index 3dc9861..35035e9 100644
--- a/package/lua-coatpersistent/lua-coatpersistent.mk
+++ b/package/lua-coatpersistent/lua-coatpersistent.mk
@@ -6,7 +6,7 @@
 
 LUA_COATPERSISTENT_VERSION_UPSTREAM = 0.2.0
 LUA_COATPERSISTENT_VERSION = $(LUA_COATPERSISTENT_VERSION_UPSTREAM)-1
-LUA_COATPERSISTENT_SUBDIR  = lua-CoatPersistent-$(LUA_COATPERSISTENT_VERSION_UPSTREAM)
+LUA_COATPERSISTENT_SUBDIR = lua-CoatPersistent-$(LUA_COATPERSISTENT_VERSION_UPSTREAM)
 LUA_COATPERSISTENT_LICENSE = MIT
 LUA_COATPERSISTENT_LICENSE_FILES = $(LUA_COATPERSISTENT_SUBDIR)/COPYRIGHT
 
diff --git a/package/lua-csnappy/lua-csnappy.mk b/package/lua-csnappy/lua-csnappy.mk
index 07aaf77..b956c38 100644
--- a/package/lua-csnappy/lua-csnappy.mk
+++ b/package/lua-csnappy/lua-csnappy.mk
@@ -6,7 +6,7 @@
 
 LUA_CSNAPPY_VERSION_UPSTREAM = 0.1.1
 LUA_CSNAPPY_VERSION = $(LUA_CSNAPPY_VERSION_UPSTREAM)-1
-LUA_CSNAPPY_SUBDIR  = lua-csnappy-$(LUA_CSNAPPY_VERSION_UPSTREAM)
+LUA_CSNAPPY_SUBDIR = lua-csnappy-$(LUA_CSNAPPY_VERSION_UPSTREAM)
 LUA_CSNAPPY_LICENSE = BSD-3c
 LUA_CSNAPPY_LICENSE_FILES = $(LUA_CSNAPPY_SUBDIR)/COPYRIGHT
 
diff --git a/package/lua-messagepack/lua-messagepack.mk b/package/lua-messagepack/lua-messagepack.mk
index d314429..c367d75 100644
--- a/package/lua-messagepack/lua-messagepack.mk
+++ b/package/lua-messagepack/lua-messagepack.mk
@@ -6,7 +6,7 @@
 
 LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.3.1
 LUA_MESSAGEPACK_VERSION = $(LUA_MESSAGEPACK_VERSION_UPSTREAM)-1
-LUA_MESSAGEPACK_SUBDIR  = lua-MessagePack-$(LUA_MESSAGEPACK_VERSION_UPSTREAM)
+LUA_MESSAGEPACK_SUBDIR = lua-MessagePack-$(LUA_MESSAGEPACK_VERSION_UPSTREAM)
 LUA_MESSAGEPACK_LICENSE = MIT
 LUA_MESSAGEPACK_LICENSE_FILES = $(LUA_MESSAGEPACK_SUBDIR)/COPYRIGHT
 
diff --git a/package/lua-testmore/lua-testmore.mk b/package/lua-testmore/lua-testmore.mk
index fcbb170..c8c8d1f 100644
--- a/package/lua-testmore/lua-testmore.mk
+++ b/package/lua-testmore/lua-testmore.mk
@@ -6,7 +6,7 @@
 
 LUA_TESTMORE_VERSION_UPSTREAM = 0.3.1
 LUA_TESTMORE_VERSION = $(LUA_TESTMORE_VERSION_UPSTREAM)-1
-LUA_TESTMORE_SUBDIR  = lua-TestMore-$(LUA_TESTMORE_VERSION_UPSTREAM)
+LUA_TESTMORE_SUBDIR = lua-TestMore-$(LUA_TESTMORE_VERSION_UPSTREAM)
 LUA_TESTMORE_LICENSE = MIT
 LUA_TESTMORE_LICENSE_FILES = $(LUA_TESTMORE_SUBDIR)/COPYRIGHT
 
diff --git a/package/luabitop/luabitop.mk b/package/luabitop/luabitop.mk
index 4368c94..5ced99b 100644
--- a/package/luabitop/luabitop.mk
+++ b/package/luabitop/luabitop.mk
@@ -6,7 +6,7 @@
 
 LUABITOP_VERSION_UPSTREAM = 1.0.2
 LUABITOP_VERSION = $(LUABITOP_VERSION_UPSTREAM)-1
-LUABITOP_SUBDIR  = LuaBitOp-$(LUABITOP_VERSION_UPSTREAM)
+LUABITOP_SUBDIR = LuaBitOp-$(LUABITOP_VERSION_UPSTREAM)
 LUABITOP_LICENSE = MIT
 LUABITOP_LICENSE_FILES = $(LUABITOP_SUBDIR)/README
 
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 42d6a72..2c1f8f4 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LUAJIT_VERSION = 2.0.3
-LUAJIT_SOURCE  = LuaJIT-$(LUAJIT_VERSION).tar.gz
-LUAJIT_SITE    = http://luajit.org/download
+LUAJIT_SOURCE = LuaJIT-$(LUAJIT_VERSION).tar.gz
+LUAJIT_SITE = http://luajit.org/download
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
 
@@ -32,9 +32,9 @@ endif
 # bitness is used. Of course, this assumes that the 32 bits multilib
 # libraries are installed.
 ifeq ($(BR2_ARCH_IS_64),y)
-LUAJIT_HOST_CC=$(HOSTCC)
+LUAJIT_HOST_CC = $(HOSTCC)
 else
-LUAJIT_HOST_CC=$(HOSTCC) -m32
+LUAJIT_HOST_CC = $(HOSTCC) -m32
 endif
 
 # We unfortunately can't use TARGET_CONFIGURE_OPTS, because the luajit
diff --git a/package/luajson/luajson.mk b/package/luajson/luajson.mk
index 8269a79..67bc266 100644
--- a/package/luajson/luajson.mk
+++ b/package/luajson/luajson.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LUAJSON_VERSION = 1.3.3-1
-LUAJSON_SUBDIR  = luajson
+LUAJSON_SUBDIR = luajson
 LUAJSON_LICENSE = MIT
 LUAJSON_LICENSE_FILES = $(LUAJSON_SUBDIR)/LICENSE
 
diff --git a/package/lualogging/lualogging.mk b/package/lualogging/lualogging.mk
index d17353c..3444a29 100644
--- a/package/lualogging/lualogging.mk
+++ b/package/lualogging/lualogging.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LUALOGGING_VERSION = 1.3.0-1
-LUALOGGING_SUBDIR  = lualogging
+LUALOGGING_SUBDIR = lualogging
 LUALOGGING_LICENSE = MIT
 LUALOGGING_LICENSE_FILES = $(LUALOGGING_SUBDIR)/COPYRIGHT
 
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 30be6e6..44bd520 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -11,7 +11,7 @@ LUAROCKS_LICENSE_FILES = COPYING
 
 HOST_LUAROCKS_DEPENDENCIES = host-luainterpreter
 
-LUAROCKS_CONFIG_DIR  = $(HOST_DIR)/usr/etc/luarocks
+LUAROCKS_CONFIG_DIR = $(HOST_DIR)/usr/etc/luarocks
 LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/config-$(LUAINTERPRETER_ABIVER).lua
 
 HOST_LUAROCKS_CONF_OPTS = \
diff --git a/package/luasec/luasec.mk b/package/luasec/luasec.mk
index 69f53b2..fd1f1cd 100644
--- a/package/luasec/luasec.mk
+++ b/package/luasec/luasec.mk
@@ -6,7 +6,7 @@
 
 LUASEC_VERSION_UPSTREAM = 0.5
 LUASEC_VERSION = $(LUASEC_VERSION_UPSTREAM)-2
-LUASEC_SUBDIR  = luasec
+LUASEC_SUBDIR = luasec
 LUASEC_LICENSE = MIT
 LUASEC_LICENSE_FILES = $(LUASEC_SUBDIR)/LICENSE
 LUASEC_DEPENDENCIES = openssl
diff --git a/package/luasocket/luasocket.mk b/package/luasocket/luasocket.mk
index ca72277..20927fc 100644
--- a/package/luasocket/luasocket.mk
+++ b/package/luasocket/luasocket.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LUASOCKET_VERSION = 3.0rc1-1
-LUASOCKET_SUBDIR  = luasocket-3.0-rc1
+LUASOCKET_SUBDIR = luasocket-3.0-rc1
 LUASOCKET_LICENSE = MIT
 LUASOCKET_LICENSE_FILES = $(LUASOCKET_SUBDIR)/LICENSE
 
diff --git a/package/luasql-sqlite3/luasql-sqlite3.mk b/package/luasql-sqlite3/luasql-sqlite3.mk
index 0e7ae6a..23983a8 100644
--- a/package/luasql-sqlite3/luasql-sqlite3.mk
+++ b/package/luasql-sqlite3/luasql-sqlite3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LUASQL_SQLITE3_VERSION = 2.3.0-1
-LUASQL_SQLITE3_SUBDIR  = luasql
+LUASQL_SQLITE3_SUBDIR = luasql
 LUASQL_SQLITE3_LICENSE = MIT
 LUASQL_SQLITE3_LICENSE_FILES = $(LUASQL_SQLITE3_SUBDIR)/README
 LUASQL_SQLITE3_DEPENDENCIES = sqlite
diff --git a/package/lunit/lunit.mk b/package/lunit/lunit.mk
index 15d94ab..3c557f8 100644
--- a/package/lunit/lunit.mk
+++ b/package/lunit/lunit.mk
@@ -6,7 +6,7 @@
 
 LUNIT_VERSION_UPSTREAM = 0.5
 LUNIT_VERSION = $(LUNIT_VERSION_UPSTREAM)-2
-LUNIT_SUBDIR  = lunit-$(LUNIT_VERSION_UPSTREAM)
+LUNIT_SUBDIR = lunit-$(LUNIT_VERSION_UPSTREAM)
 LUNIT_LICENSE = MIT
 LUNIT_LICENSE_FILES = $(LUNIT_SUBDIR)/LICENSE
 
diff --git a/package/lzlib/lzlib.mk b/package/lzlib/lzlib.mk
index c96bea8..ec37842 100644
--- a/package/lzlib/lzlib.mk
+++ b/package/lzlib/lzlib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LZLIB_VERSION = 0.4.work3-1
-LZLIB_SUBDIR  = lzlib-0.4-work3
+LZLIB_SUBDIR = lzlib-0.4-work3
 LZLIB_DEPENDENCIES = zlib
 LZLIB_LICENSE = MIT
 
diff --git a/package/mii-diag/mii-diag.mk b/package/mii-diag/mii-diag.mk
index a0e4dcf..af2d8776 100644
--- a/package/mii-diag/mii-diag.mk
+++ b/package/mii-diag/mii-diag.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 MII_DIAG_VERSION = 2.11
-MII_DIAG_SOURCE  = mii-diag_$(MII_DIAG_VERSION).orig.tar.gz
-MII_DIAG_PATCH   = mii-diag_$(MII_DIAG_VERSION)-3.diff.gz
-MII_DIAG_SITE    = $(BR2_DEBIAN_MIRROR)/debian/pool/main/m/mii-diag
+MII_DIAG_SOURCE = mii-diag_$(MII_DIAG_VERSION).orig.tar.gz
+MII_DIAG_PATCH = mii-diag_$(MII_DIAG_VERSION)-3.diff.gz
+MII_DIAG_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/m/mii-diag
 MII_DIAG_LICENSE = GPL # No version specified
 MII_DIAG_LICENSE_FILES = mii-diag.c
 
diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index 372d840..ca74298 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MMC_UTILS_VERSION = 11f2ceabc4ad3f0dd568e0ce68166e4803e0615b
-MMC_UTILS_SITE    = git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git
+MMC_UTILS_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git
 MMC_UTILS_LICENSE = GPLv2
 
 define MMC_UTILS_BUILD_CMDS
diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index d2485e9..0c216d7 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -14,9 +14,9 @@ MPLAYER_LDFLAGS = $(TARGET_LDFLAGS)
 # mplayer needs pcm+mixer support, but configure fails to check for it
 ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yyy)
 MPLAYER_DEPENDENCIES += alsa-lib
-MPLAYER_CONF_OPTS    += --enable-alsa
+MPLAYER_CONF_OPTS += --enable-alsa
 else
-MPLAYER_CONF_OPTS    += --disable-alsa
+MPLAYER_CONF_OPTS += --disable-alsa
 endif
 
 ifeq ($(BR2_ENDIAN),"BIG")
diff --git a/package/musepack/musepack.mk b/package/musepack/musepack.mk
index 80bc26b..db613a0 100644
--- a/package/musepack/musepack.mk
+++ b/package/musepack/musepack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSEPACK_VERSION =  r475
+MUSEPACK_VERSION = r475
 MUSEPACK_SITE = http://files.musepack.net/source
 MUSEPACK_SOURCE = musepack_src_$(MUSEPACK_VERSION).tar.gz
 MUSEPACK_DEPENDENCIES = libcuefile libreplaygain
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 1fe6dd7..e73e080 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -49,20 +49,20 @@ define HOST_NODEJS_INSTALL_CMDS
 endef
 
 ifeq ($(BR2_i386),y)
-NODEJS_CPU=ia32
+NODEJS_CPU = ia32
 else ifeq ($(BR2_x86_64),y)
-NODEJS_CPU=x64
+NODEJS_CPU = x64
 else ifeq ($(BR2_mipsel),y)
-NODEJS_CPU=mipsel
+NODEJS_CPU = mipsel
 else ifeq ($(BR2_arm),y)
-NODEJS_CPU=arm
+NODEJS_CPU = arm
 # V8 needs to know what floating point ABI the target is using.  There's also
 # a 'hard' option which we're not exposing here at the moment, because
 # buildroot itself doesn't really support it at present.
 ifeq ($(BR2_SOFT_FLOAT),y)
-NODEJS_ARM_FP=soft
+NODEJS_ARM_FP = soft
 else
-NODEJS_ARM_FP=softfp
+NODEJS_ARM_FP = softfp
 endif
 endif
 
diff --git a/package/on2-8170-modules/on2-8170-modules.mk b/package/on2-8170-modules/on2-8170-modules.mk
index f779eda..209bcb5 100644
--- a/package/on2-8170-modules/on2-8170-modules.mk
+++ b/package/on2-8170-modules/on2-8170-modules.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ON2_8170_MODULES_VERSION = 73b08061d30789178e692bc332b73d1d9922bf39
-ON2_8170_MODULES_SITE    = $(call github,alexandrebelloni,on2-8170-modules,$(ON2_8170_MODULES_VERSION))
+ON2_8170_MODULES_SITE = $(call github,alexandrebelloni,on2-8170-modules,$(ON2_8170_MODULES_VERSION))
 
 ON2_8170_MODULES_DEPENDENCIES = linux
 
diff --git a/package/orbit/orbit.mk b/package/orbit/orbit.mk
index 970d1e2..7df7790 100644
--- a/package/orbit/orbit.mk
+++ b/package/orbit/orbit.mk
@@ -6,7 +6,7 @@
 
 ORBIT_VERSION_UPSTREAM = 2.2.1
 ORBIT_VERSION = $(ORBIT_VERSION_UPSTREAM)-1
-ORBIT_SUBDIR  = orbit
+ORBIT_SUBDIR = orbit
 ORBIT_LICENSE = MIT
 ORBIT_LICENSE_FILES = $(ORBIT_SUBDIR)/doc/us/license.md
 
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index f9e8695..819d6a4 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -17,7 +17,7 @@ else
 	PCIUTILS_ZLIB=no
 endif
 
-PCIUTILS_DNS=no
+PCIUTILS_DNS = no
 
 ifeq ($(BR2_PACKAGE_KMOD),y)
 	PCIUTILS_DEPENDENCIES += kmod
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 3c3348a..1816a9e 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -15,8 +15,8 @@ PERL_INSTALL_STAGING = YES
 PERL_CROSS_VERSION = 0.9.2
 PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).0
 # DO NOT refactor with the github helper (the result is not the same)
-PERL_CROSS_SITE    = http://raw.github.com/arsv/perl-cross/releases
-PERL_CROSS_SOURCE  = perl-$(PERL_CROSS_BASE_VERSION)-cross-$(PERL_CROSS_VERSION).tar.gz
+PERL_CROSS_SITE = http://raw.github.com/arsv/perl-cross/releases
+PERL_CROSS_SOURCE = perl-$(PERL_CROSS_BASE_VERSION)-cross-$(PERL_CROSS_VERSION).tar.gz
 PERL_CROSS_OLD_POD = perl$(subst .,,$(PERL_CROSS_BASE_VERSION))delta.pod
 PERL_CROSS_NEW_POD = perl$(subst .,,$(PERL_VERSION))delta.pod
 
diff --git a/package/php/php.mk b/package/php/php.mk
index 2e97c9a..bca4f3a 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -13,7 +13,7 @@ PHP_INSTALL_TARGET_OPTS = INSTALL_ROOT=$(TARGET_DIR) install
 PHP_DEPENDENCIES = host-pkgconf
 PHP_LICENSE = PHP
 PHP_LICENSE_FILES = LICENSE
-PHP_CONF_OPTS =  --mandir=/usr/share/man \
+PHP_CONF_OPTS = --mandir=/usr/share/man \
 		--infodir=/usr/share/info \
 		--disable-all \
 		--without-pear \
diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
index bfb3906..7858d2b 100644
--- a/package/picocom/picocom.mk
+++ b/package/picocom/picocom.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PICOCOM_VERSION = 1.7
-PICOCOM_SITE    = http://picocom.googlecode.com/files
+PICOCOM_SITE = http://picocom.googlecode.com/files
 PICOCOM_LICENSE = GPLv2+
 PICOCOM_LICENSE_FILES = LICENSE.txt
 
diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index 1abee49..39358a7 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -10,7 +10,7 @@ PINENTRY_SITE = ftp://ftp.gnupg.org/gcrypt/pinentry
 PINENTRY_LICENSE = GPLv2+
 PINENTRY_LICENSE_FILES = COPYING
 PINENTRY_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-PINENTRY_CONF_OPTS =  --disable-pinentry-gtk # gtk1
+PINENTRY_CONF_OPTS = --disable-pinentry-gtk # gtk1
 PINENTRY_CONF_OPTS += --disable-pinentry-qt  # qt3
 PINENTRY_CONF_OPTS += --without-libcap       # requires PAM
 
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 0761736..0cf0b63 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -21,7 +21,7 @@ export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 # Default spider mode is 'DOWNLOAD'. Other possible values are 'SOURCE_CHECK'
 # used by the _source-check target and 'SHOW_EXTERNAL_DEPS', used by the
 # external-deps target.
-DL_MODE=DOWNLOAD
+DL_MODE = DOWNLOAD
 
 # DL_DIR may have been set already from the environment
 ifeq ($(origin DL_DIR),undefined)
@@ -44,16 +44,16 @@ DL_DIR := $(shell mkdir -p $(DL_DIR) && cd $(DL_DIR) >/dev/null && pwd)
 # * scp://www.example.com:dir/file (with domainseparator :)
 #
 # geturischeme: http
-geturischeme=$(firstword $(subst ://, ,$(call qstrip,$(1))))
+geturischeme = $(firstword $(subst ://, ,$(call qstrip,$(1))))
 # stripurischeme: www.example.com/dir/file
-stripurischeme=$(lastword $(subst ://, ,$(call qstrip,$(1))))
+stripurischeme = $(lastword $(subst ://, ,$(call qstrip,$(1))))
 # domain: www.example.com
-domain=$(firstword $(subst $(call domainseparator,$(2)), ,$(call stripurischeme,$(1))))
+domain = $(firstword $(subst $(call domainseparator,$(2)), ,$(call stripurischeme,$(1))))
 # notdomain: dir/file
-notdomain=$(patsubst $(call domain,$(1),$(2))$(call domainseparator,$(2))%,%,$(call stripurischeme,$(1)))
+notdomain = $(patsubst $(call domain,$(1),$(2))$(call domainseparator,$(2))%,%,$(call stripurischeme,$(1)))
 #
 # default domainseparator is /, specify alternative value as first argument
-domainseparator=$(if $(1),$(1),/)
+domainseparator = $(if $(1),$(1),/)
 
 # github(user,package,version): returns site of GitHub repository
 github = https://github.com/$(1)/$(2)/archive/$(3)
diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
index 7abafc3..808d2ce 100644
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -19,7 +19,7 @@
 #
 ################################################################################
 
-PERL_ARCHNAME	= $(ARCH)-linux
+PERL_ARCHNAME = $(ARCH)-linux
 
 ################################################################################
 # inner-perl-package -- defines how the configuration, compilation and
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 902531d..ce39197 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -52,8 +52,8 @@ endef
 # directory from its makefile directory, using the $(MAKEFILE_LIST)
 # variable provided by make. This is used by the *TARGETS macros to
 # automagically find where the package is located.
-pkgdir       = $(dir $(lastword $(MAKEFILE_LIST)))
-pkgname      = $(lastword $(subst /, ,$(pkgdir)))
+pkgdir = $(dir $(lastword $(MAKEFILE_LIST)))
+pkgname = $(lastword $(subst /, ,$(pkgdir)))
 
 # Define extractors for different archive suffixes
 INFLATE.bz2  = $(BZCAT)
@@ -67,15 +67,15 @@ INFLATE.tar  = cat
 suitable-extractor = $(INFLATE$(suffix $(1)))
 
 # MESSAGE Macro -- display a message in bold type
-MESSAGE     = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(call qstrip,$(1))$(TERM_RESET)"
-TERM_BOLD  := $(shell tput smso)
+MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(call qstrip,$(1))$(TERM_RESET)"
+TERM_BOLD := $(shell tput smso)
 TERM_RESET := $(shell tput rmso)
 
 # Utility functions for 'find'
 # findfileclauses(filelist) => -name 'X' -o -name 'Y'
 findfileclauses = $(call notfirstword,$(patsubst %,-o -name '%',$(1)))
 # finddirclauses(base, dirlist) => -path 'base/dirX' -o -path 'base/dirY'
-finddirclauses  = $(call notfirstword,$(patsubst %,-o -path '$(1)/%',$(2)))
+finddirclauses = $(call notfirstword,$(patsubst %,-o -path '$(1)/%',$(2)))
 
 # Miscellaneous utility functions
 # notfirstword(wordlist): returns all but the first word in wordlist
@@ -100,7 +100,7 @@ endef
 #
 # legal-info helper functions
 #
-LEGAL_INFO_SEPARATOR="::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
+LEGAL_INFO_SEPARATOR = "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
 
 define legal-warning # text
 	echo "WARNING: $(1)" >>$(LEGAL_WARNINGS)
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 1ceb047..ce735bd 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -44,7 +44,7 @@ endef
 
 PROFTPD_POST_CONFIGURE_HOOKS = PROFTPD_MAKENAMES
 
-PROFTPD_MAKE=$(MAKE1)
+PROFTPD_MAKE = $(MAKE1)
 
 define PROFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/proftpd $(TARGET_DIR)/usr/sbin/proftpd
diff --git a/package/python-dialog/python-dialog.mk b/package/python-dialog/python-dialog.mk
index e6887c9..b75d19f 100644
--- a/package/python-dialog/python-dialog.mk
+++ b/package/python-dialog/python-dialog.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 PYTHON_DIALOG_VERSION = 3.0.1
-PYTHON_DIALOG_SOURCE  = python2-pythondialog-$(PYTHON_DIALOG_VERSION).tar.bz2
-PYTHON_DIALOG_SITE    = http://downloads.sourceforge.net/project/pythondialog/pythondialog/$(PYTHON_DIALOG_VERSION)
+PYTHON_DIALOG_SOURCE = python2-pythondialog-$(PYTHON_DIALOG_VERSION).tar.bz2
+PYTHON_DIALOG_SITE = http://downloads.sourceforge.net/project/pythondialog/pythondialog/$(PYTHON_DIALOG_VERSION)
 PYTHON_DIALOG_LICENSE = LGPLv2.1+
 PYTHON_DIALOG_LICENSE_FILES = COPYING
 PYTHON_DIALOG_SETUP_TYPE = distutils
diff --git a/package/python-ipy/python-ipy.mk b/package/python-ipy/python-ipy.mk
index 6e05ee9..178ce85 100644
--- a/package/python-ipy/python-ipy.mk
+++ b/package/python-ipy/python-ipy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_IPY_VERSION = IPy-0.75
-PYTHON_IPY_SITE    = $(call github,haypo,python-ipy,$(PYTHON_IPY_VERSION))
+PYTHON_IPY_SITE = $(call github,haypo,python-ipy,$(PYTHON_IPY_VERSION))
 PYTHON_IPY_LICENSE = BSD-3c
 PYTHON_IPY_LICENSE_FILES = COPYING
 PYTHON_IPY_SETUP_TYPE = distutils
diff --git a/package/python-mad/python-mad.mk b/package/python-mad/python-mad.mk
index 3395071..5a49887 100644
--- a/package/python-mad/python-mad.mk
+++ b/package/python-mad/python-mad.mk
@@ -14,9 +14,9 @@ PYTHON_MAD_LICENSE_FILES = COPYING
 PYTHON_MAD_DEPENDENCIES = libmad
 
 ifeq ($(BR2_ENDIAN),"LITTLE")
-PYTHON_MAD_ENDIAN=little
+PYTHON_MAD_ENDIAN = little
 else
-PYTHON_MAD_ENDIAN=big
+PYTHON_MAD_ENDIAN = big
 endif
 
 define PYTHON_MAD_CONFIGURE_CMDS
diff --git a/package/python-netifaces/python-netifaces.mk b/package/python-netifaces/python-netifaces.mk
index 33d63cf..f3b9beb 100644
--- a/package/python-netifaces/python-netifaces.mk
+++ b/package/python-netifaces/python-netifaces.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 PYTHON_NETIFACES_VERSION = 0.7
-PYTHON_NETIFACES_SOURCE  = netifaces-$(PYTHON_NETIFACES_VERSION).tar.gz
-PYTHON_NETIFACES_SITE    = http://alastairs-place.net/projects/netifaces
+PYTHON_NETIFACES_SOURCE = netifaces-$(PYTHON_NETIFACES_VERSION).tar.gz
+PYTHON_NETIFACES_SITE = http://alastairs-place.net/projects/netifaces
 PYTHON_NETIFACES_LICENSE = MIT
 PYTHON_NETIFACES_LICENSE_FILES = README
 PYTHON_NETIFACES_SETUP_TYPE = setuptools
diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
index 36ab644..2708312 100644
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
-PYTHON_PROTOBUF_SOURCE  = $(PROTOBUF_SOURCE)
-PYTHON_PROTOBUF_SITE    = $(PROTOBUF_SITE)
+PYTHON_PROTOBUF_SOURCE = $(PROTOBUF_SOURCE)
+PYTHON_PROTOBUF_SITE = $(PROTOBUF_SITE)
 PYTHON_PROTOBUF_LICENSE = BSD-3c
 PYTHON_PROTOBUF_LICENSE_FILES = COPYING.txt
 PYTHON_PROTOBUF_DEPENDENCIES = host-protobuf
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index 82a907b..8e83f34 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_PYPARSING_VERSION         = 2.0.2
-PYTHON_PYPARSING_SOURCE          = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
-PYTHON_PYPARSING_SITE            = http://downloads.sourceforge.net/project/pyparsing/pyparsing/pyparsing-$(PYTHON_PYPARSING_VERSION)
-PYTHON_PYPARSING_LICENSE         = MIT
-PYTHON_PYPARSING_LICENSE_FILES   = LICENSE
-PYTHON_PYPARSING_SETUP_TYPE      = distutils
+PYTHON_PYPARSING_VERSION = 2.0.2
+PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
+PYTHON_PYPARSING_SITE = http://downloads.sourceforge.net/project/pyparsing/pyparsing/pyparsing-$(PYTHON_PYPARSING_VERSION)
+PYTHON_PYPARSING_LICENSE = MIT
+PYTHON_PYPARSING_LICENSE_FILES = LICENSE
+PYTHON_PYPARSING_SETUP_TYPE = distutils
 
 $(eval $(python-package))
diff --git a/package/python-pyro/python-pyro.mk b/package/python-pyro/python-pyro.mk
index 5e636e1..26c026e 100644
--- a/package/python-pyro/python-pyro.mk
+++ b/package/python-pyro/python-pyro.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 PYTHON_PYRO_VERSION = 3.14
-PYTHON_PYRO_SOURCE  = Pyro-$(PYTHON_PYRO_VERSION).tar.gz
-PYTHON_PYRO_SITE    = https://pypi.python.org/packages/source/P/Pyro
+PYTHON_PYRO_SOURCE = Pyro-$(PYTHON_PYRO_VERSION).tar.gz
+PYTHON_PYRO_SITE = https://pypi.python.org/packages/source/P/Pyro
 PYTHON_PYRO_LICENSE = MIT
 PYTHON_PYRO_LICENSE_FILES = LICENSE
 PYTHON_PYRO_SETUP_TYPE = distutils
diff --git a/package/python-serial/python-serial.mk b/package/python-serial/python-serial.mk
index d35a9f0..b9b5931 100644
--- a/package/python-serial/python-serial.mk
+++ b/package/python-serial/python-serial.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 PYTHON_SERIAL_VERSION = 2.6
-PYTHON_SERIAL_SOURCE  = pyserial-$(PYTHON_SERIAL_VERSION).tar.gz
-PYTHON_SERIAL_SITE    = http://pypi.python.org/packages/source/p/pyserial
+PYTHON_SERIAL_SOURCE = pyserial-$(PYTHON_SERIAL_VERSION).tar.gz
+PYTHON_SERIAL_SITE = http://pypi.python.org/packages/source/p/pyserial
 PYTHON_SERIAL_LICENSE = Python Software Foundation License
 PYTHON_SERIAL_LICENSE_FILES = LICENSE.txt
 PYTHON_SERIAL_SETUP_TYPE = distutils
diff --git a/package/python/python.mk b/package/python/python.mk
index 24367a3..3db31d3 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -5,10 +5,10 @@
 ################################################################################
 
 PYTHON_VERSION_MAJOR = 2.7
-PYTHON_VERSION       = $(PYTHON_VERSION_MAJOR).8
-PYTHON_SOURCE        = Python-$(PYTHON_VERSION).tar.xz
-PYTHON_SITE          = http://python.org/ftp/python/$(PYTHON_VERSION)
-PYTHON_LICENSE       = Python software foundation license v2, others
+PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).8
+PYTHON_SOURCE = Python-$(PYTHON_VERSION).tar.xz
+PYTHON_SITE = http://python.org/ftp/python/$(PYTHON_VERSION)
+PYTHON_LICENSE = Python software foundation license v2, others
 PYTHON_LICENSE_FILES = LICENSE
 
 # Python needs itself to be built, so in order to cross-compile
@@ -48,7 +48,7 @@ HOST_PYTHON_CONF_ENV += \
 # MAKE1 has shown to workaround the problem.
 HOST_PYTHON_MAKE = $(MAKE1)
 
-PYTHON_DEPENDENCIES  = host-python libffi
+PYTHON_DEPENDENCIES = host-python libffi
 
 HOST_PYTHON_DEPENDENCIES = host-expat host-zlib
 
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index d952323..2c1ef2a 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -37,7 +37,7 @@ HOST_PYTHON3_CONF_OPTS += 	\
 HOST_PYTHON3_CONF_ENV += \
 	LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags"
 
-PYTHON3_DEPENDENCIES  = host-python3 libffi
+PYTHON3_DEPENDENCIES = host-python3 libffi
 
 HOST_PYTHON3_DEPENDENCIES = host-expat host-zlib
 
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index be56c45..827bb77 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -57,7 +57,7 @@ endif
 ifeq ($(HOST_QEMU_ARCH),powerpc)
     HOST_QEMU_ARCH = ppc
 endif
-HOST_QEMU_TARGETS=$(HOST_QEMU_ARCH)-linux-user
+HOST_QEMU_TARGETS = $(HOST_QEMU_ARCH)-linux-user
 
 # Note: although QEMU has a ./configure script, it is not a real autotools
 # package, and ./configure chokes on options such as --host or --target.
diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
index 888370a..85abe19 100644
--- a/package/qextserialport/qextserialport.mk
+++ b/package/qextserialport/qextserialport.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-QEXTSERIALPORT_VERSION     = 6c47244de4ce6db43c2f05caee957666c951dae1
-QEXTSERIALPORT_SITE        = https://qextserialport.googlecode.com/git
+QEXTSERIALPORT_VERSION = 6c47244de4ce6db43c2f05caee957666c951dae1
+QEXTSERIALPORT_SITE = https://qextserialport.googlecode.com/git
 QEXTSERIALPORT_SITE_METHOD = git
 
 QEXTSERIALPORT_LICENSE = MIT
diff --git a/package/qjson/qjson.mk b/package/qjson/qjson.mk
index dcd53bc..2a0690f 100644
--- a/package/qjson/qjson.mk
+++ b/package/qjson/qjson.mk
@@ -8,7 +8,7 @@ QJSON_VERSION = 0.8.1
 
 QJSON_SITE = $(call github,flavio,qjson,$(QJSON_VERSION))
 QJSON_INSTALL_STAGING = YES
-QJSON_DEPENDENCIES =  qt
+QJSON_DEPENDENCIES = qt
 QJSON_LICENSE = LGPLv2.1
 QJSON_LICENSE_FILES = COPYING.lib
 
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 92a090f..255d6d2 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -13,8 +13,8 @@
 
 QT_VERSION_MAJOR = 4.8
 QT_VERSION = $(QT_VERSION_MAJOR).6
-QT_SOURCE  = qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
-QT_SITE    = http://download.qt-project.org/official_releases/qt/$(QT_VERSION_MAJOR)/$(QT_VERSION)
+QT_SOURCE = qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
+QT_SITE = http://download.qt-project.org/official_releases/qt/$(QT_VERSION_MAJOR)/$(QT_VERSION)
 QT_DEPENDENCIES = host-pkgconf
 QT_INSTALL_STAGING = YES
 
@@ -28,7 +28,7 @@ ifeq ($(BR2_PACKAGE_QT_LICENSE_APPROVED),y)
 QT_CONFIGURE_OPTS += -opensource -confirm-license
 endif
 
-QT_CONFIG_FILE=$(call qstrip,$(BR2_PACKAGE_QT_CONFIG_FILE))
+QT_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_QT_CONFIG_FILE))
 
 ifneq ($(QT_CONFIG_FILE),)
 QT_CONFIGURE_OPTS += -qconfig buildroot
@@ -252,7 +252,7 @@ QT_CONFIGURE_OPTS += -qt-zlib
 else
 ifeq ($(BR2_PACKAGE_QT_SYSTEMZLIB),y)
 QT_CONFIGURE_OPTS += -system-zlib
-QT_DEPENDENCIES   += zlib
+QT_DEPENDENCIES += zlib
 endif
 endif
 
@@ -261,7 +261,7 @@ QT_CONFIGURE_OPTS += -qt-libjpeg
 else
 ifeq ($(BR2_PACKAGE_QT_SYSTEMJPEG),y)
 QT_CONFIGURE_OPTS += -system-libjpeg
-QT_DEPENDENCIES   += jpeg
+QT_DEPENDENCIES += jpeg
 else
 QT_CONFIGURE_OPTS += -no-libjpeg
 endif
@@ -272,7 +272,7 @@ QT_CONFIGURE_OPTS += -qt-libpng
 else
 ifeq ($(BR2_PACKAGE_QT_SYSTEMPNG),y)
 QT_CONFIGURE_OPTS += -system-libpng
-QT_DEPENDENCIES   += libpng
+QT_DEPENDENCIES += libpng
 else
 QT_CONFIGURE_OPTS += -no-libpng
 endif
@@ -283,7 +283,7 @@ QT_CONFIGURE_OPTS += -qt-libtiff
 else
 ifeq ($(BR2_PACKAGE_QT_SYSTEMTIFF),y)
 QT_CONFIGURE_OPTS += -system-libtiff
-QT_DEPENDENCIES   += tiff
+QT_DEPENDENCIES += tiff
 else
 QT_CONFIGURE_OPTS += -no-libtiff
 endif
@@ -302,29 +302,29 @@ else
 ifeq ($(BR2_PACKAGE_QT_SYSTEMFREETYPE),y)
 QT_CONFIGURE_OPTS += -system-freetype
 QT_CONFIGURE_OPTS += -I $(STAGING_DIR)/usr/include/freetype2/
-QT_DEPENDENCIES   += freetype
+QT_DEPENDENCIES += freetype
 else
 QT_CONFIGURE_OPTS += -no-freetype
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_QT_DBUS),y)
-QT_DEPENDENCIES   += dbus
+QT_DEPENDENCIES += dbus
 endif
 
 ifeq ($(BR2_PACKAGE_QT_OPENSSL),y)
 QT_CONFIGURE_OPTS += -openssl
-QT_DEPENDENCIES   += openssl
+QT_DEPENDENCIES += openssl
 else
 QT_CONFIGURE_OPTS += -no-openssl
 endif
 
 ifeq ($(BR2_PACKAGE_QT_OPENGL_ES),y)
 QT_CONFIGURE_OPTS += -opengl es2 -egl
-QT_DEPENDENCIES   += libgles libegl
-QT_CFLAGS   += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)
+QT_DEPENDENCIES += libgles libegl
+QT_CFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)
 QT_CXXFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)
-QT_LDFLAGS  += $(shell $(PKG_CONFIG_HOST_BINARY) --libs egl)
+QT_LDFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --libs egl)
 else
 QT_CONFIGURE_OPTS += -no-opengl
 endif
@@ -336,22 +336,22 @@ QT_CONFIGURE_OPTS += -qt-sql-ibase
 endif
 ifeq ($(BR2_PACKAGE_QT_MYSQL),y)
 QT_CONFIGURE_OPTS += -qt-sql-mysql -mysql_config $(STAGING_DIR)/usr/bin/mysql_config
-QT_DEPENDENCIES   += mysql
+QT_DEPENDENCIES += mysql
 endif
 ifeq ($(BR2_PACKAGE_QT_ODBC),y)
 QT_CONFIGURE_OPTS += -qt-sql-odbc
 endif
 ifeq ($(BR2_PACKAGE_QT_PSQL),y)
 QT_CONFIGURE_OPTS += -qt-sql-psql
-QT_CONFIGURE_ENV  += PSQL_LIBS=-L$(STAGING_DIR)/usr/lib
-QT_DEPENDENCIES   += postgresql
+QT_CONFIGURE_ENV += PSQL_LIBS=-L$(STAGING_DIR)/usr/lib
+QT_DEPENDENCIES += postgresql
 endif
 ifeq ($(BR2_PACKAGE_QT_SQLITE_QT),y)
 QT_CONFIGURE_OPTS += -qt-sql-sqlite
 else
 ifeq ($(BR2_PACKAGE_QT_SQLITE_SYSTEM),y)
 QT_CONFIGURE_OPTS += -system-sqlite
-QT_DEPENDENCIES   += sqlite
+QT_DEPENDENCIES += sqlite
 else
 QT_CONFIGURE_OPTS += -no-sql-sqlite
 endif
@@ -380,14 +380,14 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT_AUDIO_BACKEND),y)
 QT_CONFIGURE_OPTS += -audio-backend
-QT_DEPENDENCIES   += alsa-lib
+QT_DEPENDENCIES += alsa-lib
 else
 QT_CONFIGURE_OPTS += -no-audio-backend
 endif
 
 ifeq ($(BR2_PACKAGE_QT_PHONON),y)
 QT_CONFIGURE_OPTS += -phonon
-QT_DEPENDENCIES   += gstreamer gst-plugins-base
+QT_DEPENDENCIES += gstreamer gst-plugins-base
 else
 QT_CONFIGURE_OPTS += -no-phonon
 endif
@@ -532,63 +532,63 @@ endef
 
 # Build the list of libraries and plugins to install to the target
 
-QT_INSTALL_LIBS    += QtCore
-QT_HOST_PROGRAMS   += moc rcc qmake lrelease
+QT_INSTALL_LIBS += QtCore
+QT_HOST_PROGRAMS += moc rcc qmake lrelease
 
 ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
-QT_INSTALL_LIBS    += QtGui
-QT_HOST_PROGRAMS   += uic
+QT_INSTALL_LIBS += QtGui
+QT_HOST_PROGRAMS += uic
 endif
 ifeq ($(BR2_PACKAGE_QT_SQL_MODULE),y)
-QT_INSTALL_LIBS    += QtSql
+QT_INSTALL_LIBS += QtSql
 endif
 ifeq ($(BR2_PACKAGE_QT_MULTIMEDIA),y)
-QT_INSTALL_LIBS    += QtMultimedia
+QT_INSTALL_LIBS += QtMultimedia
 endif
 ifeq ($(BR2_PACKAGE_QT_PHONON),y)
-QT_INSTALL_LIBS    += phonon
+QT_INSTALL_LIBS += phonon
 endif
 ifeq ($(BR2_PACKAGE_QT_SVG),y)
-QT_INSTALL_LIBS    += QtSvg
+QT_INSTALL_LIBS += QtSvg
 endif
 ifeq ($(BR2_PACKAGE_QT_NETWORK),y)
-QT_INSTALL_LIBS    += QtNetwork
+QT_INSTALL_LIBS += QtNetwork
 endif
 ifeq ($(BR2_PACKAGE_QT_WEBKIT),y)
-QT_INSTALL_LIBS    += QtWebKit
+QT_INSTALL_LIBS += QtWebKit
 endif
 ifeq ($(BR2_PACKAGE_QT_XML),y)
-QT_INSTALL_LIBS    += QtXml
+QT_INSTALL_LIBS += QtXml
 endif
 ifeq ($(BR2_PACKAGE_QT_DBUS),y)
-QT_INSTALL_LIBS    += QtDBus
+QT_INSTALL_LIBS += QtDBus
 endif
 ifeq ($(BR2_PACKAGE_QT_XMLPATTERNS),y)
-QT_INSTALL_LIBS    += QtXmlPatterns
+QT_INSTALL_LIBS += QtXmlPatterns
 endif
 ifeq ($(BR2_PACKAGE_QT_SCRIPT),y)
-QT_INSTALL_LIBS    += QtScript
+QT_INSTALL_LIBS += QtScript
 endif
 ifeq ($(BR2_PACKAGE_QT_SCRIPTTOOLS),y)
-QT_INSTALL_LIBS    += QtScriptTools
+QT_INSTALL_LIBS += QtScriptTools
 endif
 ifeq ($(BR2_PACKAGE_QT_DECLARATIVE),y)
-QT_INSTALL_LIBS    += QtDeclarative
+QT_INSTALL_LIBS += QtDeclarative
 endif
 ifeq ($(BR2_PACKAGE_QT_QT3SUPPORT),y)
-QT_INSTALL_LIBS    += Qt3Support
+QT_INSTALL_LIBS += Qt3Support
 endif
 ifeq ($(BR2_PACKAGE_QT_OPENGL_ES),y)
-QT_INSTALL_LIBS    += QtOpenGL
+QT_INSTALL_LIBS += QtOpenGL
 endif
 ifeq ($(BR2_PACKAGE_QT_GFX_POWERVR),y)
-QT_INSTALL_LIBS    += pvrQWSWSEGL
+QT_INSTALL_LIBS += pvrQWSWSEGL
 endif
 ifeq ($(BR2_PACKAGE_QT_TEST),y)
-QT_INSTALL_LIBS    += QtTest
+QT_INSTALL_LIBS += QtTest
 endif
 
-QT_CONF_FILE=$(HOST_DIR)/usr/bin/qt.conf
+QT_CONF_FILE = $(HOST_DIR)/usr/bin/qt.conf
 
 # Since host programs and spec files have been moved to $(HOST_DIR),
 # we need to tell qmake the new location of the various elements,
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index e75d217..a92d6b4 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -10,7 +10,7 @@ QWT_SITE = http://downloads.sourceforge.net/project/qwt/qwt/$(QWT_VERSION)
 QWT_INSTALL_STAGING = YES
 QWT_DEPENDENCIES = qt
 
-QWT_CONFIG  =    's%QWT_INSTALL_PREFIX.*/usr/local/.*%QWT_INSTALL_PREFIX = /usr%'
+QWT_CONFIG = 's%QWT_INSTALL_PREFIX.*/usr/local/.*%QWT_INSTALL_PREFIX = /usr%'
 QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtDesigner.*$$/\# QWT_CONFIG += QwtDesigner/'
 QWT_CONFIG += -e 's%/features%/mkspecs/features%'
 
diff --git a/package/rings/rings.mk b/package/rings/rings.mk
index 09d9b02..151546a 100644
--- a/package/rings/rings.mk
+++ b/package/rings/rings.mk
@@ -6,7 +6,7 @@
 
 RINGS_VERSION_MAJOR = 1.3.0
 RINGS_VERSION = $(RINGS_VERSION_MAJOR)-1
-RINGS_SUBDIR  = rings-v_$(subst .,_,$(RINGS_VERSION_MAJOR))
+RINGS_SUBDIR = rings-v_$(subst .,_,$(RINGS_VERSION_MAJOR))
 RINGS_LICENSE = MIT
 
 $(eval $(luarocks-package))
diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index 49e0490..b7c2261 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 RPCBIND_VERSION = 0.2.1
-RPCBIND_SITE    = http://downloads.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIND_VERSION)
-RPCBIND_SOURCE  = rpcbind-$(RPCBIND_VERSION).tar.bz2
+RPCBIND_SITE = http://downloads.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIND_VERSION)
+RPCBIND_SOURCE = rpcbind-$(RPCBIND_VERSION).tar.bz2
 RPCBIND_LICENSE = BSD-3c
 RPCBIND_LICENSE_FILES = COPYING
 RPCBIND_AUTORECONF = YES
diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
index 804ee17..33318e8 100644
--- a/package/rtai/rtai.mk
+++ b/package/rtai/rtai.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 RTAI_VERSION = 3.8.1
-RTAI_SOURCE  = rtai-$(RTAI_VERSION).tar.bz2
-RTAI_SITE    = https://www.rtai.org/userfiles/downloads/RTAI
+RTAI_SOURCE = rtai-$(RTAI_VERSION).tar.bz2
+RTAI_SITE = https://www.rtai.org/userfiles/downloads/RTAI
 RTAI_INSTALL_STAGING = YES
 
 # The <pkg>_CONFIG_SCRIPTS cannot apply here to the specificities of rtai-config
diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index 7e05fdc..c03fcc4 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SAM_BA_SITE    = http://www.atmel.com/dyn/resources/prod_documents
+SAM_BA_SITE = http://www.atmel.com/dyn/resources/prod_documents
 SAM_BA_VERSION = 2.12
-SAM_BA_SOURCE  = sam-ba_$(SAM_BA_VERSION).zip
+SAM_BA_SOURCE = sam-ba_$(SAM_BA_VERSION).zip
 SAM_BA_PATCH = sam-ba_$(SAM_BA_VERSION)_patch5.gz
 SAM_BA_LICENSE = BSD-like (partly binary-only)
 SAM_BA_LICENSE_FILES = doc/readme.txt
diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index c3b7272..d59d26c 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -6,7 +6,7 @@
 
 SG3_UTILS_VERSION = 1.39
 SG3_UTILS_SOURCE = sg3_utils-$(SG3_UTILS_VERSION).tar.xz
-SG3_UTILS_SITE  = http://sg.danny.cz/sg/p
+SG3_UTILS_SITE = http://sg.danny.cz/sg/p
 SG3_UTILS_LICENSE = BSD-3c
 # utils progs are GPLv2+ licenced
 ifeq ($(BR2_PACKAGE_SG3_UTILS_PROGS),y)
diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
index 0e20843..7a5f515 100644
--- a/package/slirp/slirp.mk
+++ b/package/slirp/slirp.mk
@@ -7,15 +7,15 @@
 # There's no tarball releases of slirp, so we use the git repo
 # Also, there's no tag, so we use a random SHA1 (master's HEAD
 # of today)
-SLIRP_VERSION         = 8c2da74c1385242f20799fec8c04f8378edc6550
-SLIRP_SITE            = git://anongit.freedesktop.org/spice/slirp
-SLIRP_LICENSE         = BSD-4c BSD-2c
+SLIRP_VERSION = 8c2da74c1385242f20799fec8c04f8378edc6550
+SLIRP_SITE = git://anongit.freedesktop.org/spice/slirp
+SLIRP_LICENSE = BSD-4c BSD-2c
 # Note: The license file 'COPYRIGHT' is missing from the sources,
 # although some files refer to it.
 SLIRP_INSTALL_STAGING = YES
 
 # As we're using the git tree, there's no ./configure,
 # so we need to autoreconf.
-SLIRP_AUTORECONF      = YES
+SLIRP_AUTORECONF = YES
 
 $(eval $(autotools-package))
diff --git a/package/spice-protocol/spice-protocol.mk b/package/spice-protocol/spice-protocol.mk
index 2b7c937..6762ff0 100644
--- a/package/spice-protocol/spice-protocol.mk
+++ b/package/spice-protocol/spice-protocol.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-SPICE_PROTOCOL_VERSION         = 0.12.6
-SPICE_PROTOCOL_SOURCE          = spice-protocol-$(SPICE_PROTOCOL_VERSION).tar.bz2
-SPICE_PROTOCOL_SITE            = http://www.spice-space.org/download/releases
-SPICE_PROTOCOL_LICENSE         = BSD-3c
-SPICE_PROTOCOL_LICENSE_FILES   = COPYING
+SPICE_PROTOCOL_VERSION = 0.12.6
+SPICE_PROTOCOL_SOURCE = spice-protocol-$(SPICE_PROTOCOL_VERSION).tar.bz2
+SPICE_PROTOCOL_SITE = http://www.spice-space.org/download/releases
+SPICE_PROTOCOL_LICENSE = BSD-3c
+SPICE_PROTOCOL_LICENSE_FILES = COPYING
 SPICE_PROTOCOL_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index 117d08c..0c0af6f 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-SPICE_VERSION         = 0.12.4
-SPICE_SOURCE          = spice-$(SPICE_VERSION).tar.bz2
-SPICE_SITE            = http://www.spice-space.org/download/releases
-SPICE_LICENSE         = LGPLv2.1+
-SPICE_LICENSE_FILES   = COPYING
+SPICE_VERSION = 0.12.4
+SPICE_SOURCE = spice-$(SPICE_VERSION).tar.bz2
+SPICE_SITE = http://www.spice-space.org/download/releases
+SPICE_LICENSE = LGPLv2.1+
+SPICE_LICENSE_FILES = COPYING
 SPICE_INSTALL_STAGING = YES
-SPICE_DEPENDENCIES    = \
+SPICE_DEPENDENCIES =    \
     alsa-lib            \
     celt051             \
     jpeg                \
@@ -21,7 +21,7 @@ SPICE_DEPENDENCIES    = \
 
 # We disable everything for now, because the dependency tree can become
 # quite deep if we try to enable some features, and I have not tested that.
-SPICE_CONF_OPTS =            \
+SPICE_CONF_OPTS =           \
   --disable-opengl          \
   --disable-smartcard       \
   --disable-automated-tests \
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 3a7eac2..d588122 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 SYSVINIT_VERSION = 2.88
-SYSVINIT_SOURCE  = sysvinit_$(SYSVINIT_VERSION)dsf.orig.tar.gz
-SYSVINIT_PATCH   = sysvinit_$(SYSVINIT_VERSION)dsf-13.1.diff.gz
-SYSVINIT_SITE    = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sysvinit
+SYSVINIT_SOURCE = sysvinit_$(SYSVINIT_VERSION)dsf.orig.tar.gz
+SYSVINIT_PATCH = sysvinit_$(SYSVINIT_VERSION)dsf-13.1.diff.gz
+SYSVINIT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sysvinit
 SYSVINIT_LICENSE = GPLv2+
 SYSVINIT_LICENSE_FILES = COPYING
 
diff --git a/package/tcllib/tcllib.mk b/package/tcllib/tcllib.mk
index 037ec1c..9eb3b7d 100644
--- a/package/tcllib/tcllib.mk
+++ b/package/tcllib/tcllib.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-TCLLIB_VERSION       = 1.13
-TCLLIB_SOURCE        = tcllib-$(TCLLIB_VERSION).tar.bz2
-TCLLIB_SITE          = http://downloads.sourceforge.net/project/tcllib/tcllib/$(TCLLIB_VERSION)
-TCLLIB_LICENSE       = tcl license
+TCLLIB_VERSION = 1.13
+TCLLIB_SOURCE = tcllib-$(TCLLIB_VERSION).tar.bz2
+TCLLIB_SITE = http://downloads.sourceforge.net/project/tcllib/tcllib/$(TCLLIB_VERSION)
+TCLLIB_LICENSE = tcl license
 TCLLIB_LICENSE_FILES = license.terms
-TCLLIB_DEPENDENCIES  = host-tcl
-TCLLIB_CONF_ENV      = ac_cv_path_tclsh="$(HOST_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR)"
+TCLLIB_DEPENDENCIES = host-tcl
+TCLLIB_CONF_ENV = ac_cv_path_tclsh="$(HOST_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR)"
 
 $(eval $(autotools-package))
diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index 75e7828..c8457db 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TFTPD_VERSION  = 5.2
-TFTPD_SOURCE   = tftp-hpa-$(TFTPD_VERSION).tar.xz
-TFTPD_SITE     = $(BR2_KERNEL_MIRROR)/software/network/tftp/tftp-hpa
+TFTPD_VERSION = 5.2
+TFTPD_SOURCE = tftp-hpa-$(TFTPD_VERSION).tar.xz
+TFTPD_SITE = $(BR2_KERNEL_MIRROR)/software/network/tftp/tftp-hpa
 TFTPD_CONF_OPTS = --without-tcpwrappers
 
 ifneq ($(BR2_INET_IPV6),y)
diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index a621ad9..a621ae0 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -21,7 +21,7 @@ endif
 
 THTTPD_POST_PATCH_HOOKS = THTTPD_DEBIAN_PATCHES
 
-THTTPD_MAKE=$(MAKE1)
+THTTPD_MAKE = $(MAKE1)
 
 define THTTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/thttpd $(TARGET_DIR)/usr/sbin/thttpd
diff --git a/package/tstools/tstools.mk b/package/tstools/tstools.mk
index 8271dcd..a35fe0f 100644
--- a/package/tstools/tstools.mk
+++ b/package/tstools/tstools.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 TSTOOLS_VERSION = 1_11
-TSTOOLS_SITE    = https://tstools.googlecode.com/files
-TSTOOLS_SOURCE  = tstools-$(TSTOOLS_VERSION).tgz
+TSTOOLS_SITE = https://tstools.googlecode.com/files
+TSTOOLS_SOURCE = tstools-$(TSTOOLS_VERSION).tgz
 TSTOOLS_LICENSE = MPL v1.1
 
 define TSTOOLS_BUILD_CMDS
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index cd346dd..1445838 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -51,7 +51,7 @@ define TVHEADEND_INSTALL_DB
 	              $(TARGET_DIR)/home/tvheadend/.hts/tvheadend/accesscontrol/1
 	chmod -R go-rwx $(TARGET_DIR)/home/tvheadend
 endef
-TVHEADEND_POST_INSTALL_TARGET_HOOKS  = TVHEADEND_INSTALL_DB
+TVHEADEND_POST_INSTALL_TARGET_HOOKS = TVHEADEND_INSTALL_DB
 
 define TVHEADEND_INSTALL_INIT_SYSV
 	$(INSTALL) -D package/tvheadend/etc.default.tvheadend $(TARGET_DIR)/etc/default/tvheadend
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 2e720ac..f02bb55 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 UBOOT_TOOLS_VERSION = 2014.07
-UBOOT_TOOLS_SOURCE  = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
-UBOOT_TOOLS_SITE    = ftp://ftp.denx.de/pub/u-boot
+UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
+UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPLv2+
 UBOOT_TOOLS_LICENSE_FILES = Licenses/gpl-2.0.txt
 
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index ac7cfa9..7a241069 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 UDISKS_VERSION = 1.0.4
-UDISKS_SITE    = http://hal.freedesktop.org/releases
+UDISKS_SITE = http://hal.freedesktop.org/releases
 UDISKS_LICENSE = GPLv2+
 UDISKS_LICENSE_FILES = COPYING
 
diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
index ad593a4..dc87321 100644
--- a/package/usbredir/usbredir.mk
+++ b/package/usbredir/usbredir.mk
@@ -4,18 +4,18 @@
 #
 ################################################################################
 
-USBREDIR_VERSION         = 0.6
-USBREDIR_SOURCE          = usbredir-$(USBREDIR_VERSION).tar.bz2
-USBREDIR_SITE            = http://spice-space.org/download/usbredir
-USBREDIR_LICENSE         = LGPLv2.1+
-USBREDIR_LICENSE_FILES   = COPYING.LIB
+USBREDIR_VERSION = 0.6
+USBREDIR_SOURCE = usbredir-$(USBREDIR_VERSION).tar.bz2
+USBREDIR_SITE = http://spice-space.org/download/usbredir
+USBREDIR_LICENSE = LGPLv2.1+
+USBREDIR_LICENSE_FILES = COPYING.LIB
 USBREDIR_INSTALL_STAGING = YES
-USBREDIR_DEPENDENCIES    = host-pkgconf libusb
+USBREDIR_DEPENDENCIES = host-pkgconf libusb
 
 ifeq ($(BR2_PACKAGE_USBREDIR_SERVER),y)
 
-USBREDIR_LICENSE         += (for the library), GPLv2+ (for the server)
-USBREDIR_LICENSE_FILES   += COPYING
+USBREDIR_LICENSE += (for the library), GPLv2+ (for the server)
+USBREDIR_LICENSE_FILES += COPYING
 
 else # BR2_PACKAGE_USBREDIR_SERVER != y
 
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 5048439..9b79941 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 VALGRIND_VERSION = 3.10.0
-VALGRIND_SITE    = http://valgrind.org/downloads
-VALGRIND_SOURCE  = valgrind-$(VALGRIND_VERSION).tar.bz2
+VALGRIND_SITE = http://valgrind.org/downloads
+VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPLv2 GFDLv1.2
 VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
 VALGRIND_CONF_OPTS = --disable-tls
diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
index 814698e..e7ec332 100644
--- a/package/vde2/vde2.mk
+++ b/package/vde2/vde2.mk
@@ -4,15 +4,15 @@
 #
 ################################################################################
 
-VDE2_VERSION         = 2.3.2
-VDE2_SOURCE          = vde2-$(VDE2_VERSION).tar.bz2
-VDE2_SITE            = http://downloads.sourceforge.net/project/vde/vde2/$(VDE2_VERSION)
-VDE2_LICENSE         = GPLv2+ LGPLv2.1+ BSD-3c
-VDE2_LICENSE_FILES   = COPYING COPYING.libvdeplug COPYING.slirpvde
+VDE2_VERSION = 2.3.2
+VDE2_SOURCE = vde2-$(VDE2_VERSION).tar.bz2
+VDE2_SITE = http://downloads.sourceforge.net/project/vde/vde2/$(VDE2_VERSION)
+VDE2_LICENSE = GPLv2+ LGPLv2.1+ BSD-3c
+VDE2_LICENSE_FILES = COPYING COPYING.libvdeplug COPYING.slirpvde
 VDE2_INSTALL_STAGING = YES
 
 # We touch configure.ac, so we need to autoreconf
-VDE2_AUTORECONF      = YES
+VDE2_AUTORECONF = YES
 
 # Reasons for enabling/disabling stuff:
 #?- tuntap is enabled in the hope we're using a recent-enough toolchain
diff --git a/package/vpnc/vpnc.mk b/package/vpnc/vpnc.mk
index 4d3e7b6..f5ab5fc 100644
--- a/package/vpnc/vpnc.mk
+++ b/package/vpnc/vpnc.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-VPNC_VERSION       = 0.5.3
-VPNC_SITE          = http://www.unix-ag.uni-kl.de/~massar/vpnc
-VPNC_LICENSE       = GPLv2+
+VPNC_VERSION = 0.5.3
+VPNC_SITE = http://www.unix-ag.uni-kl.de/~massar/vpnc
+VPNC_LICENSE = GPLv2+
 VPNC_LICENSE_FILES = COPYING
 
-VPNC_DEPENDENCIES  = libgcrypt libgpg-error
+VPNC_DEPENDENCIES = libgcrypt libgpg-error
 
-VPNC_LDFLAGS  = $(TARGET_LDFLAGS) -lgcrypt -lgpg-error
+VPNC_LDFLAGS = $(TARGET_LDFLAGS) -lgcrypt -lgpg-error
 VPNC_CPPFLAGS = -DVERSION=\\\"$(VPNC_VERSION)\\\"
 
 define VPNC_BUILD_CMDS
diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
index a269878..1fb91b5 100644
--- a/package/xinetd/xinetd.mk
+++ b/package/xinetd/xinetd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XINETD_VERSION       = 2.3.15
-XINETD_SITE          = http://www.xinetd.org
-XINETD_LICENSE       = xinetd license
+XINETD_VERSION = 2.3.15
+XINETD_SITE = http://www.xinetd.org
+XINETD_LICENSE = xinetd license
 XINETD_LICENSE_FILES = COPYRIGHT
 
 XINETD_CFLAGS = $(TARGET_CFLAGS)
diff --git a/package/zxing/zxing.mk b/package/zxing/zxing.mk
index 7d30cc3..234f780 100644
--- a/package/zxing/zxing.mk
+++ b/package/zxing/zxing.mk
@@ -17,7 +17,7 @@ ZXING_DEPENDENCIES += libiconv
 else
 # There is no locale support in the toolchain and libiconv
 # is not available so disable iconv support in zxing
-ZING_MAKE_OPTS=CXXFLAGS+="-DNO_ICONV"
+ZING_MAKE_OPTS = CXXFLAGS+="-DNO_ICONV"
 endif
 endif
 
diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index 155a909..8232721 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -5,7 +5,7 @@
 #
 ################################################################################
 
-DEPENDENCIES_HOST_PREREQ := 
+DEPENDENCIES_HOST_PREREQ :=
 
 # suitable-host-pkg: calls check-host-$(1).sh shell script. Parameter (2)
 # can be the candidate to be checked. If not present, the check-host-$(1).sh
@@ -17,7 +17,7 @@ endef
 -include $(sort $(wildcard support/dependencies/check-host-*.mk))
 
 ifeq ($(BR2_STRIP_sstrip),y)
-DEPENDENCIES_HOST_PREREQ+=host-sstrip
+DEPENDENCIES_HOST_PREREQ += host-sstrip
 endif
 
 ifeq ($(BR2_CCACHE),y)
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 78c2273..b7a0e60 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -62,22 +62,22 @@
 #  of Buildroot is handled identical for the 2 toolchain types.
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
-LIB_EXTERNAL_LIBS+=libc.so.* libcrypt.so.* libdl.so.* libgcc_s.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
+LIB_EXTERNAL_LIBS += libc.so.* libcrypt.so.* libdl.so.* libgcc_s.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_ARM_EABIHF),yy)
-LIB_EXTERNAL_LIBS+=ld-linux-armhf.so.*
+LIB_EXTERNAL_LIBS += ld-linux-armhf.so.*
 else
-LIB_EXTERNAL_LIBS+=ld*.so.*
+LIB_EXTERNAL_LIBS += ld*.so.*
 endif
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-LIB_EXTERNAL_LIBS+=libpthread.so.*
+LIB_EXTERNAL_LIBS += libpthread.so.*
 ifneq ($(BR2_PACKAGE_GDB)$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY),)
-LIB_EXTERNAL_LIBS+=libthread_db.so.*
+LIB_EXTERNAL_LIBS += libthread_db.so.*
 endif # gdbserver
 endif # ! no threads
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
-LIB_EXTERNAL_LIBS+=libnss_files.so.* libnss_dns.so.*
+LIB_EXTERNAL_LIBS += libnss_files.so.* libnss_dns.so.*
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
@@ -85,10 +85,10 @@ LIB_EXTERNAL_LIBS += libc.so libgcc_s.so.*
 endif
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-USR_LIB_EXTERNAL_LIBS+=libstdc++.so.*
+USR_LIB_EXTERNAL_LIBS += libstdc++.so.*
 endif
 
-LIB_EXTERNAL_LIBS+=$(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
+LIB_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
 
 # Details about sysroot directory selection.
 #
@@ -127,11 +127,11 @@ LIB_EXTERNAL_LIBS+=$(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
 # each variant-specific sysroot directory.
 
 
-TOOLCHAIN_EXTERNAL_PREFIX=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
+TOOLCHAIN_EXTERNAL_PREFIX = $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
-TOOLCHAIN_EXTERNAL_INSTALL_DIR=$(HOST_DIR)/opt/ext-toolchain
+TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(HOST_DIR)/opt/ext-toolchain
 else
-TOOLCHAIN_EXTERNAL_INSTALL_DIR=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
+TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
 endif
 
 ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
@@ -147,10 +147,10 @@ TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/bin
 endif
 endif
 
-TOOLCHAIN_EXTERNAL_CROSS=$(TOOLCHAIN_EXTERNAL_BIN)/$(TOOLCHAIN_EXTERNAL_PREFIX)-
-TOOLCHAIN_EXTERNAL_CC=$(TOOLCHAIN_EXTERNAL_CROSS)gcc
-TOOLCHAIN_EXTERNAL_CXX=$(TOOLCHAIN_EXTERNAL_CROSS)g++
-TOOLCHAIN_EXTERNAL_READELF=$(TOOLCHAIN_EXTERNAL_CROSS)readelf
+TOOLCHAIN_EXTERNAL_CROSS = $(TOOLCHAIN_EXTERNAL_BIN)/$(TOOLCHAIN_EXTERNAL_PREFIX)-
+TOOLCHAIN_EXTERNAL_CC = $(TOOLCHAIN_EXTERNAL_CROSS)gcc
+TOOLCHAIN_EXTERNAL_CXX = $(TOOLCHAIN_EXTERNAL_CROSS)g++
+TOOLCHAIN_EXTERNAL_READELF = $(TOOLCHAIN_EXTERNAL_CROSS)readelf
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS = -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
 
 ifeq ($(filter $(HOST_DIR)/%,$(TOOLCHAIN_EXTERNAL_BIN)),)
@@ -163,17 +163,17 @@ TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += \
 	-DBR_CROSS_PATH_REL='"$(TOOLCHAIN_EXTERNAL_BIN:$(HOST_DIR)/%=%)"'
 endif
 
-CC_TARGET_TUNE_:=$(call qstrip,$(BR2_GCC_TARGET_TUNE))
+CC_TARGET_TUNE_ := $(call qstrip,$(BR2_GCC_TARGET_TUNE))
 ifeq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
-CC_TARGET_CPU_:=$(call qstrip,$(BR2_GCC_TARGET_CPU))
+CC_TARGET_CPU_ := $(call qstrip,$(BR2_GCC_TARGET_CPU))
 else
-CC_TARGET_CPU_:=$(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
+CC_TARGET_CPU_ := $(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
 endif
-CC_TARGET_ARCH_:=$(call qstrip,$(BR2_GCC_TARGET_ARCH))
-CC_TARGET_ABI_:=$(call qstrip,$(BR2_GCC_TARGET_ABI))
-CC_TARGET_FPU_:=$(call qstrip,$(BR2_GCC_TARGET_FPU))
-CC_TARGET_FLOAT_ABI_:=$(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
-CC_TARGET_MODE_:=$(call qstrip,$(BR2_GCC_TARGET_MODE))
+CC_TARGET_ARCH_ := $(call qstrip,$(BR2_GCC_TARGET_ARCH))
+CC_TARGET_ABI_ := $(call qstrip,$(BR2_GCC_TARGET_ABI))
+CC_TARGET_FPU_ := $(call qstrip,$(BR2_GCC_TARGET_FPU))
+CC_TARGET_FLOAT_ABI_ := $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
+CC_TARGET_MODE_ := $(call qstrip,$(BR2_GCC_TARGET_MODE))
 
 # march/mtune/floating point mode needs to be passed to the external toolchain
 # to select the right multilib variant
@@ -333,15 +333,15 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209),y)
 TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE = ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
-TOOLCHAIN_EXTERNAL_SITE   = http://downloads.sourceforge.net/project/adi-toolchain/2012R2/2012R2-RC2/i386/
+TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2012R2/2012R2-RC2/i386/
 TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2012R2-RC2.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2012R2-RC2.i386.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1),y)
-TOOLCHAIN_EXTERNAL_SITE   = http://downloads.sourceforge.net/project/adi-toolchain/2013R1/2013R1-RC1/i386/
+TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2013R1/2013R1-RC1/i386/
 TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2013R1-RC1.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2013R1-RC1.i386.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1),y)
-TOOLCHAIN_EXTERNAL_SITE   = http://downloads.sourceforge.net/project/adi-toolchain/2014R1/2014R1-RC2/i386/
+TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2014R1/2014R1-RC2/i386/
 TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2014R1-RC2.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3),y)
-- 
1.8.5.1
