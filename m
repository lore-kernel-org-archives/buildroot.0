From: Steve Calfee <nospamcalfee@yahoo.com>
Date: Tue, 14 Dec 2010 10:07:46 -0800 (PST)
Subject: [Buildroot] [PATCH] New package to do a complete build for the
	seagate dockstar hardware.
In-Reply-To: <1292301534-3059-1-git-send-email-nospamcalfee@yahoo.com>
References: <1292301534-3059-1-git-send-email-nospamcalfee@yahoo.com>
Message-ID: <705612.60084.qm@web58201.mail.re3.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I tried to send this to the list using git send-email using the tips on how to 
send via my gmail account. The list manager bounced the email because that email 

address is not used for buildroot. How do others send to the mailing list? Is 
there a way to send via the yahoo mail system from git send-email?

In any case here is the patch and I will attach it too, I don't know what yahoo 
will do tabs etc.

Regards, Steve

----- Original Message ----
> Subject: [PATCH] New package to do a complete build for the seagate dockstar 
>hardware.
> 
> From README for dockstar
> 
> All this started with a Seagate Dockstar  buildroot contribution by Marcus
> Osdoba. He got the original patches set up  etc. The buildroot maintainers
> want a minimal configuration so other uses can  bring up a buildroot
> distribution and add their own packages. I left a few  that are essential to
> using a dockstar without opening up the case.  So  I removed most of Marcus'
> packages and changed the kernel config to match the  dockstar's hardware.
> The dockstar is a USB machine with also a gigabit  ethernet interface.  So I
> configured the kernel to allow booting from  from either nfs or usb or the
> internal nand flash.  This was after  installing Jeff Doozan's uboot which
> also could handle this.
> 
> The  differences needed in the target's file system skeleton are minor,  but
> important.  So locally, in this device directory, I put a  skeleton
> filesystem that you want to overlay the default system in  fs/skeleton. For
> a minimal system only etc/inittab is changed.
> 
> All  files will be added by the patchscript on every build. So change here,
> for  your personal configuration, not in the fs/skeleton.
> 
> Note that I added a  password to etc/shadow for user "root" which is
> password "root" so ssh  connections to the target are possible.  But this
> also affects the  serial connection, so the password will need to be used
> there  too.
> 
> While developing and testing, prevent annoying edits of the host  ~/.ssh/...
> file to change the keys, copy the target's /etc/dropbear/  directory into
> the skeleton/etc here and it will be reapplied after every  build and so the
> keys won't change on the target. If you don't do this  dropbear will
> regenerate the keys on the first startup. I provide Marcus'  initial
> dropbear keys here, just copy the dropbear dir to the  local
> target/device/sheevaplug/SeagateDockStar/skeleton/etc/ directory and  then
> you will only need to type "yes" the first time to ssh.
> 
> Cleaning  up the target filesystem is a problem in Buildroot (and clean is
> painfully  slow). However everything put in the skeleton dir  here
> (target/device/sheevaplug/SeagateDockStar/skeleton) will be installed  every
> build.
> 
> Similarly it is a pain to try and do everything in one  buildroot source
> tree.  The clean or distclean targets require the  rebuild of everything,
> compiler, uclibc library, busybox, buildroot, and the  target packages. To
> avoid this, check out a complete tree and build it. Then  check out another
> complete tree. Then in the new tree copy  the
> target/device/sheevaplug/SeagateDockStar/dockstar_external_toolchain_defconfig
> config  to the configs directory. You will have to edit the toolchain path
> in that  config to point to your previously build toolchain in the other
> buildroot  tree.
> 
> In the new tree do a "make dockstar_external_toolchain_defconfig".  and use
> the just made toolchain and libraries as external toolchains. It  saves at
> least half the build time.
> 
> I have not tried it yet, but both  Linux and u-boot can also be built in other
> trees to save "clean" problems  and allow hacking.
> 
> U-boot - I have not tried to use Marcus' build patches  for u-boot. I have
> successfully downloaded and installed Jeff Doozan's  dockstar uboot and use
> it with dockstar.  It is dangerous changing the  bootstrap - if it is messed
> up it means possibly "bricking" the dockstar and  forcing either a jtag
> recovery, or figuring out how to recover with a xmodem  terminal, or setting
> up an attractive plastic paperweight.
> 
> U-boot - as  a future project I would like to try (or have someone else try
> it) to set up  U-boot to use a usb serial dongle. The kernel already will
> start with a USB  serial dongle console (except for the very early start up
> time), and going to  a uboot dongle will mean I no longer have to crack the
> pretty plastic case  (to get at rs232) to do hacking. Supposedly both
> Doozan's u-boot and the  kernel will also boot with a netconsole.
> ---
>   configs/dockstar_defconfig                          |   83 +
>   target/device/Config.in                             |    1 +
>   target/device/sheevaplug/Config.in                  |   13 +
>  target/device/sheevaplug/Makefile.in                |    4 +
>   .../device/sheevaplug/SeagateDockStar/Makefile.in  |    5 +
>   target/device/sheevaplug/SeagateDockStar/README    |   70 +
>   .../SeagateDockStar-busybox-1.17.x.config           |  966 +++++++++++
>  .../SeagateDockStar-linux-2.6.36.1.config           | 1781 
>++++++++++++++++++++
>   .../SeagateDockStar_uClibc-0.9.31.config            |  259 +++
>  .../dockstar_external_toolchain_defconfig           |   83 +
>   .../dockstar_internal_toolchain_defconfig           |  833 +++++++++
>  .../SeagateDockStar/dropbear/dropbear_dss_host_key  |  Bin 0 -> 458 bytes
>   .../SeagateDockStar/dropbear/dropbear_rsa_host_key |  Bin 0 -> 426  bytes
>  ...itions-for-the-Seagate-FreeAgent-DockStar.patch |   48 +
>   ...ns-used-by-the-Seagate-FreeAgent-DockStar.patch |   31 +
>   ...for-the-SheevaPlug-to-reflect-the-changes.patch |   46 +
>   .../sheevaplug/SeagateDockStar/patchrootfs.sh      |   14  +
>  .../SeagateDockStar/skeleton/etc/inittab            |   46 +
>  .../sheevaplug/SeagateDockStar/skeleton/etc/shadow |   12  +
>  ...Change-RAM-definitions-to-one-bank-128-MB.patch |   42 +
>   ...6-0002-DockStar-environment-is-at-0xa0000.patch |   27 +
>   ...boot-2010.06-0003-DockStar-MTD-partitions.patch |   27 +
>   ...4-DockStar-Change-prompt-and-ident-string.patch |   35 +
>   ...-0007-DockStar-Include-long-help-messages.patch |   24 +
>  24 files  changed, 4450 insertions(+), 0 deletions(-)
>  create mode 100644  configs/dockstar_defconfig
>  create mode 100644  target/device/sheevaplug/Config.in
>  create mode 100644  target/device/sheevaplug/Makefile.in
>  create mode 100644  target/device/sheevaplug/SeagateDockStar/Makefile.in
>  create mode 100644  target/device/sheevaplug/SeagateDockStar/README
>  create mode 100644  
>target/device/sheevaplug/SeagateDockStar/SeagateDockStar-busybox-1.17.x.config
>   create mode 100644  
>target/device/sheevaplug/SeagateDockStar/SeagateDockStar-linux-2.6.36.1.config
>   create mode 100644  
>target/device/sheevaplug/SeagateDockStar/SeagateDockStar_uClibc-0.9.31.config
>   create mode 100644  
>target/device/sheevaplug/SeagateDockStar/dockstar_external_toolchain_defconfig
>   create mode 100644  
>target/device/sheevaplug/SeagateDockStar/dockstar_internal_toolchain_defconfig
>   create mode 100644  
>target/device/sheevaplug/SeagateDockStar/dropbear/dropbear_dss_host_key
>   create mode 100644  
>target/device/sheevaplug/SeagateDockStar/dropbear/dropbear_rsa_host_key
>   create mode 100644  
>target/device/sheevaplug/SeagateDockStar/kernel-patches/linux-0003-LED-definitions-for-the-Seagate-FreeAgent-DockStar.patch
>
>
>   create mode 100644  
>target/device/sheevaplug/SeagateDockStar/kernel-patches/linux-2-6-34-1-0002-MTD-partitons-used-by-the-Seagate-FreeAgent-DockStar.patch
>
>
>   create mode 100644  
>target/device/sheevaplug/SeagateDockStar/kernel-patches/linux-2.6.34-0004-Change-board-name-for-the-SheevaPlug-to-reflect-the-changes.patch
>
>
>   create mode 100755 target/device/sheevaplug/SeagateDockStar/patchrootfs.sh
>   create mode 100644  
>target/device/sheevaplug/SeagateDockStar/skeleton/etc/inittab
>  create mode  100644 
>target/device/sheevaplug/SeagateDockStar/skeleton/etc/shadow
>  create  mode 100644  
>target/device/sheevaplug/SeagateDockStar/u-boot-patches/u-boot-2010.06-0001-DockStar-Change-RAM-definitions-to-one-bank-128-MB.patch
>
>
>   create mode 100644  
>target/device/sheevaplug/SeagateDockStar/u-boot-patches/u-boot-2010.06-0002-DockStar-environment-is-at-0xa0000.patch
>
>
>   create mode 100644  
>target/device/sheevaplug/SeagateDockStar/u-boot-patches/u-boot-2010.06-0003-DockStar-MTD-partitions.patch
>
>
>   create mode 100644  
>target/device/sheevaplug/SeagateDockStar/u-boot-patches/u-boot-2010.06-0004-DockStar-Change-prompt-and-ident-string.patch
>
>
>   create mode 100644  
>target/device/sheevaplug/SeagateDockStar/u-boot-patches/u-boot-2010.06-0007-DockStar-Include-long-help-messages.patch
>
>
> 
> diff  --git a/configs/dockstar_defconfig b/configs/dockstar_defconfig
> new file  mode 100644
> index 0000000..0edeb91
> --- /dev/null
> +++  b/configs/dockstar_defconfig
> @@ -0,0 +1,83  @@
> +BR2_arm=y
> +BR2_arm926t=y
> +BR2_TARGET_SHEEVAPLUG=y
> +BR2_TARGET_GENERIC_HOSTNAME="SeagateDockstar"
> +BR2_TARGET_GENERIC_ISSUE="Welcome  to Buildroot - 1st DockStar build"
> +BR2_WGET="wget --passive-ftp  -nd"
> +BR2_GIT="git  clone"
> +BR2_DL_DIR="$(TOPDIR)/../br_dl"
> +BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/";
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_LARGEFILE=y
> +BR2_INET_RPC=y
> +BR2_USE_WCHAR=y
> +BR2_USE_SSP=y
> +BR2_PTHREADS=y
> +BR2_PROGRAM_INVOCATION=y
> +BR2_INSTALL_LIBSTDCPP=y
> +BR2_TARGET_OPTIMIZATION="-Os -pipe"
> +BR2_TOOLCHAIN_EXTERNAL_PATH="$(HOME)/buildroot/buildroot/output/staging/usr"
> +BR2_TOOLCHAIN_EXTERNAL_PREFIX="arm-unknown-linux-uclibcgnueabi"
>+BR2_PACKAGE_BUSYBOX_CONFIG="$(TOPDIR)/target/device/sheevaplug/SeagateDockStar/SeagateDockStar-busybox-1.17.x.config"
>
>"
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +BR2_PACKAGE_BZIP2=y
> +BR2_PACKAGE_CRAMFS=y
> +BR2_PACKAGE_E2FSPROGS=y
> +BR2_PACKAGE_E2FSPROGS_UTILS=y
> +BR2_PACKAGE_GENEXT2FS=y
> +BR2_PACKAGE_GENROMFS=y
> +BR2_PACKAGE_MTD=y
> +# # BR2_PACKAGE_MTD_FLASHCP is not set
> +# BR2_PACKAGE_MTD_FLASH_ERASE is not  set
> +# BR2_PACKAGE_MTD_FLASH_ERASEALL is not set
> +#  BR2_PACKAGE_MTD_FLASH_INFO is not set
> +# BR2_PACKAGE_MTD_FLASH_LOCK is not  set
> +# BR2_PACKAGE_MTD_FLASH_UNLOCK is not  set
> +BR2_PACKAGE_MTD_JFFS2DUMP=y
> +BR2_PACKAGE_MTD_MKFSJFFS2=y
> +#  BR2_PACKAGE_MTD_MTDINFO is not set
> +# BR2_PACKAGE_MTD_UBIATTACH is not  set
> +# BR2_PACKAGE_MTD_UBICRC32 is not set
> +# BR2_PACKAGE_MTD_UBIDETACH is  not set
> +# BR2_PACKAGE_MTD_UBIFORMAT is not set
> +#  BR2_PACKAGE_MTD_UBIMKVOL is not set
> +# BR2_PACKAGE_MTD_UBINFO is not  set
> +# BR2_PACKAGE_MTD_UBINIZE is not set
> +# BR2_PACKAGE_MTD_UBIRENAME is  not set
> +# BR2_PACKAGE_MTD_UBIRMVOL is not set
> +# BR2_PACKAGE_MTD_UBIRSVOL  is not set
> +# BR2_PACKAGE_MTD_UBIUPDATEVOL is not  set
> +BR2_PACKAGE_SQUASHFS=y
> +BR2_PACKAGE_UDEV_SCSI_ID=y
> +BR2_PACKAGE_USBMOUNT=y
> +BR2_PACKAGE_USBUTILS=y
> +BR2_PACKAGE_HASERL=y
> +BR2_PACKAGE_OPENSSL=y
> +BR2_PACKAGE_OPENSSL_BIN=y
> +BR2_PACKAGE_LIBGLIB2=y
> +BR2_PACKAGE_READLINE=y
> +BR2_PACKAGE_LIBXML2=y
> +BR2_PACKAGE_DROPBEAR=y
> +BR2_PACKAGE_ETHTOOL=y
> +BR2_PACKAGE_NANO=y
> +BR2_PACKAGE_VIM=y
> +#  BR2_PACKAGE_VIM_RUNTIME is not  set
>+BR2_ROOTFS_POST_BUILD_SCRIPT="$(TOPDIR)/target/device/sheevaplug/SeagateDockStar/patchrootfs.sh"
>
>"
> +BR2_TARGET_ROOTFS_JFFS2=y
> +BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K=y
> +BR2_TARGET_ROOTFS_JFFS2_SUMMARY=y
> +BR2_TARGET_ROOTFS_TAR=y
> +BR2_TARGET_ROOTFS_TAR_GZIP=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="sheevaplug"
>+BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR="$(TOPDIR)/target/device/sheevaplug/SeagateDockStar/u-boot-patches"
>
>"
> +BR2_TARGET_UBOOT_TOOL_MKIMAGE=y
> +BR2_TARGET_UBOOT_TOOL_ENV=y
> +BR2_TARGET_UBOOT_SERVERIP="192.168.1.106"
> +BR2_TARGET_UBOOT_IPADDR="192.168.1.254"
> +BR2_TARGET_UBOOT_GATEWAY="192.168.1.1"
> +BR2_TARGET_UBOOT_ETHADDR="00:10:75:1A:87:C6"
> +BR2_LINUX_KERNEL=y
>+BR2_LINUX_KERNEL_PATCH="$(TOPDIR)/target/device/sheevaplug/SeagateDockStar/kernel-patches/"
>
>"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(TOPDIR)/target/device/sheevaplug/SeagateDockStar/SeagateDockStar-linux-2.6.36.1.config"
>
>"
> diff  --git a/target/device/Config.in b/target/device/Config.in
> index  6b7f11a..e524d4e 100644
> --- a/target/device/Config.in
> +++  b/target/device/Config.in
> @@ -8,6 +8,7 @@ source  "target/device/KwikByte/Config.in"
>  source  "target/device/valka/Config.in"
>  source "target/device/x86/Config.in"
>   source "target/device/xtensa/Config.in"
> +source  "target/device/sheevaplug/Config.in"
> 
>  # This must be last
>  source  "target/generic/Config.in"
> diff --git a/target/device/sheevaplug/Config.in  
>b/target/device/sheevaplug/Config.in
> new file mode 100644
> index  0000000..4744591
> --- /dev/null
> +++  b/target/device/sheevaplug/Config.in
> @@ -0,0 +1,13 @@
> +menuconfig  BR2_TARGET_SHEEVAPLUG
> +bool "Currently inserted for SeagateDockstar based on  PogoPlug which is based 
>
>on SheevaPlug "
> +
> +
> +if  BR2_TARGET_SHEEVAPLUG
> +
> +config  BR2_TARGET_SHEEVAPLUG_PROJECT_SEAGATEDOCKSTAR
> +bool "Support for user defined  project DockStar"
> +help
> +This option enables support for project  DockStar
> +
> +endif
> +
> diff --git  a/target/device/sheevaplug/Makefile.in  
>b/target/device/sheevaplug/Makefile.in
> new file mode 100644
> index  0000000..0850d4b
> --- /dev/null
> +++  b/target/device/sheevaplug/Makefile.in
> @@ -0,0 +1,4 @@
> +ifeq  ($(BR2_TARGET_SHEEVAPLUG_PROJECT_SEAGATEDOCKSTAR),y)
> +include  target/device/sheevaplug/SeagateDockStar/Makefile.in
> +endif
> +
> diff  --git a/target/device/sheevaplug/SeagateDockStar/Makefile.in  
>b/target/device/sheevaplug/SeagateDockStar/Makefile.in
> new file mode  100644
> index 0000000..8ebdfb7
> --- /dev/null
> +++  b/target/device/sheevaplug/SeagateDockStar/Makefile.in
> @@ -0,0 +1,5  @@
> +MYNAS             =  ../mynas
> +BOARD_PATH        =  target/device/sheevaplug/SeagateDockStar
> +TARGET_SKELETON =  target_skeleton
> +BOARD_NAME = DockStar
> +
> diff --git  a/target/device/sheevaplug/SeagateDockStar/README  
>b/target/device/sheevaplug/SeagateDockStar/README
> new file mode  100644
> index 0000000..227eca9
> --- /dev/null
> +++  b/target/device/sheevaplug/SeagateDockStar/README
> @@ -0,0 +1,70 @@
> +README  for dockstar
> +
> +All this started with a Seagate Dockstar buildroot  contribution by Marcus
> +Osdoba. He got the original patches set up etc. The  buildroot maintainers
> +want a minimal configuration so other uses can bring  up a buildroot
> +distribution and add their own packages. I left a few that  are essential to
> +using a dockstar without opening up the case.  So I  removed most of Marcus'
> +packages and changed the kernel config to match the  dockstar's hardware.
> +The dockstar is a USB machine with also a gigabit  ethernet interface.  So I
> +configured the kernel to allow booting from  from either nfs or usb or the
> +internal nand flash.  This was after  installing Jeff Doozan's uboot which
> +also could handle this.
> +
> +The  differences needed in the target's file system skeleton are minor,  but
> +important.  So locally, in this device directory, I put a  skeleton
> +filesystem that you want to overlay the default system in  fs/skeleton. For
> +a minimal system only etc/inittab is changed.
> +
> +All  files will be added by the patchscript on every build. So change here,
> +for  your personal configuration, not in the fs/skeleton.
> +
> +Note that I added  a password to etc/shadow for user "root" which is
> +password "root" so ssh  connections to the target are possible.  But this
> +also affects the  serial connection, so the password will need to be used
> +there  too.
> +
> +While developing and testing, prevent annoying edits of the host  ~/.ssh/...
> +file to change the keys, copy the target's /etc/dropbear/  directory into
> +the skeleton/etc here and it will be reapplied after every  build and so the
> +keys won't change on the target. If you don't do this  dropbear will
> +regenerate the keys on the first startup. I provide Marcus'  initial
> +dropbear keys here, just copy the dropbear dir to the  local
> +target/device/sheevaplug/SeagateDockStar/skeleton/etc/ directory and  then
> +you will only need to type "yes" the first time to  ssh.
> +
> +Cleaning up the target filesystem is a problem in Buildroot (and  clean is
> +painfully slow). However everything put in the skeleton dir  here
> +(target/device/sheevaplug/SeagateDockStar/skeleton) will be installed  every
> +build.
> +
> +Similarly it is a pain to try and do everything in one  buildroot source
> +tree.  The clean or distclean targets require the  rebuild of everything,
> +compiler, uclibc library, busybox, buildroot, and the  target packages. To
> +avoid this, check out a complete tree and build it. Then  check out another
> +complete tree. Then in the new tree copy  the
> 
+target/device/sheevaplug/SeagateDockStar/dockstar_external_toolchain_defconfig
> +config  to the configs directory. You will have to edit the toolchain path
> +in that  config to point to your previously build toolchain in the other
> +buildroot  tree. 
> +
> +In the new tree do a "make  dockstar_external_toolchain_defconfig". and use
> +the just made toolchain and  libraries as external toolchains. It saves at
> +least half the build  time.
> +
> +I have not tried it yet, but both Linux and u-boot can also be  built in 
other
> +trees to save "clean" problems and allow  hacking.
> +
> +U-boot - I have not tried to use Marcus' build patches for  u-boot. I have
> +successfully downloaded and installed Jeff Doozan's dockstar  uboot and use
> +it with dockstar.  It is dangerous changing the bootstrap  - if it is messed
> +up it means possibly "bricking" the dockstar and forcing  either a jtag
> +recovery, or figuring out how to recover with a xmodem  terminal, or setting
> +up an attractive plastic paperweight.
> +
> +U-boot -  as a future project I would like to try (or have someone else try
> +it) to set  up U-boot to use a usb serial dongle. The kernel already will
> +start with a  USB serial dongle console (except for the very early start up
> +time), and  going to a uboot dongle will mean I no longer have to crack the
> +pretty  plastic case (to get at rs232) to do hacking. Supposedly both
> +Doozan's  u-boot and the kernel will also boot with a netconsole.
> diff --git  
>a/target/device/sheevaplug/SeagateDockStar/SeagateDockStar-busybox-1.17.x.config  
>
>b/target/device/sheevaplug/SeagateDockStar/SeagateDockStar-busybox-1.17.x.config

> new  file mode 100644
> index 0000000..734a285
> --- /dev/null
> +++  
>b/target/device/sheevaplug/SeagateDockStar/SeagateDockStar-busybox-1.17.x.config

> @@  -0,0 +1,966 @@
> +#
> +# Automatically generated make config: don't  edit
> +# Busybox version: 1.17.2
> +# Sun Sep 19 12:19:45  2010
> +#
> +CONFIG_HAVE_DOT_CONFIG=y
> +
> +#
> +# Busybox  Settings
> +#
> +
> +#
> +# General  Configuration
> +#
> +CONFIG_DESKTOP=y
> +# CONFIG_EXTRA_COMPAT is not  set
> +CONFIG_INCLUDE_SUSv2=y
> +# CONFIG_USE_PORTABLE_CODE is not  set
> +CONFIG_FEATURE_BUFFERS_USE_MALLOC=y
> +#  CONFIG_FEATURE_BUFFERS_GO_ON_STACK is not set
> +#  CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not  set
> +CONFIG_SHOW_USAGE=y
> +CONFIG_FEATURE_VERBOSE_USAGE=y
> +#  CONFIG_FEATURE_COMPRESS_USAGE is not set
> +CONFIG_FEATURE_INSTALLER=y
> +#  CONFIG_LOCALE_SUPPORT is not set
> +CONFIG_UNICODE_SUPPORT=y
> +#  CONFIG_UNICODE_USING_LOCALE is not set
> +# CONFIG_FEATURE_CHECK_UNICODE_IN_ENV  is not set
> +CONFIG_SUBST_WCHAR=63
> +CONFIG_LAST_SUPPORTED_WCHAR=767
> +#  CONFIG_UNICODE_COMBINING_WCHARS is not set
> +# CONFIG_UNICODE_WIDE_WCHARS is  not set
> +# CONFIG_UNICODE_BIDI_SUPPORT is not set
> +#  CONFIG_UNICODE_NEUTRAL_TABLE is not set
> +# CONFIG_UNICODE_PRESERVE_BROKEN is  not  set
> +CONFIG_LONG_OPTS=y
> +CONFIG_FEATURE_DEVPTS=y
> +CONFIG_FEATURE_CLEAN_UP=y
> +CONFIG_FEATURE_UTMP=y
> +CONFIG_FEATURE_WTMP=y
> +#  CONFIG_FEATURE_PIDFILE is not set
> +CONFIG_FEATURE_SUID=y
> +#  CONFIG_FEATURE_SUID_CONFIG is not set
> +# CONFIG_FEATURE_SUID_CONFIG_QUIET is  not set
> +# CONFIG_SELINUX is not set
> +# CONFIG_FEATURE_PREFER_APPLETS is  not  set
> +CONFIG_BUSYBOX_EXEC_PATH="/proc/self/exe"
> +CONFIG_FEATURE_SYSLOG=y
> +CONFIG_FEATURE_HAVE_RPC=y
> +
> +#
> +#  Build Options
> +#
> +# CONFIG_STATIC is not set
> +# CONFIG_PIE is not  set
> +# CONFIG_NOMMU is not set
> +# CONFIG_BUILD_LIBBUSYBOX is not set
> +#  CONFIG_FEATURE_INDIVIDUAL is not set
> +# CONFIG_FEATURE_SHARED_BUSYBOX is not  set
> +CONFIG_LFS=y
> +CONFIG_CROSS_COMPILER_PREFIX=""
> +CONFIG_EXTRA_CFLAGS="-Os  -pipe -Os  -mtune=arm926ej-s -march=armv5te 
>-mabi=aapcs-linux -msoft-float  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
>-D_FILE_OFFSET_BITS=64  
>-I/home/ossy/buildroot/buildroot-dev/output/staging/usr/include  
>-I/home/ossy/buildroot/buildroot-dev/output/staging/include  
>-I/home/ossy/buildroot/buildroot-dev/output/toolchain/linux/include"
> +
> +#
> +#  Debugging Options
> +#
> +# CONFIG_DEBUG is not set
> +#  CONFIG_DEBUG_PESSIMIZE is not set
> +# CONFIG_WERROR is not  set
> +CONFIG_NO_DEBUG_LIB=y
> +# CONFIG_DMALLOC is not set
> +#  CONFIG_EFENCE is not set
> +
> +#
> +# Installation Options
> +#
> +#  CONFIG_INSTALL_NO_USR is not set
> +CONFIG_INSTALL_APPLET_SYMLINKS=y
> +#  CONFIG_INSTALL_APPLET_HARDLINKS is not set
> +#  CONFIG_INSTALL_APPLET_SCRIPT_WRAPPERS is not set
> +#  CONFIG_INSTALL_APPLET_DONT is not set
> +# CONFIG_INSTALL_SH_APPLET_SYMLINK is  not set
> +# CONFIG_INSTALL_SH_APPLET_HARDLINK is not set
> +#  CONFIG_INSTALL_SH_APPLET_SCRIPT_WRAPPER is not  set
> +CONFIG_PREFIX="/home/ossy/buildroot/buildroot-dev/output/target"
> +
> +#
> +#  Busybox Library  Tuning
> +#
> +CONFIG_PASSWORD_MINLEN=6
> +CONFIG_MD5_SIZE_VS_SPEED=2
> +#  CONFIG_FEATURE_FAST_TOP is not set
> +# CONFIG_FEATURE_ETC_NETWORKS is not  set
> +CONFIG_FEATURE_EDITING=y
> +CONFIG_FEATURE_EDITING_MAX_LEN=1024
> +CONFIG_FEATURE_EDITING_VI=y
> +CONFIG_FEATURE_EDITING_HISTORY=999
> +CONFIG_FEATURE_EDITING_SAVEHISTORY=y
> +CONFIG_FEATURE_TAB_COMPLETION=y
> +#  CONFIG_FEATURE_USERNAME_COMPLETION is not  set
> +CONFIG_FEATURE_EDITING_FANCY_PROMPT=y
> +#  CONFIG_FEATURE_EDITING_ASK_TERMINAL is not  set
> +CONFIG_FEATURE_NON_POSIX_CP=y
> +# CONFIG_FEATURE_VERBOSE_CP_MESSAGE is  not  set
> +CONFIG_FEATURE_COPYBUF_KB=4
> +CONFIG_MONOTONIC_SYSCALL=y
> +CONFIG_IOCTL_HEX2STR_ERROR=y
> +CONFIG_FEATURE_HWIB=y
> +
> +#
> +#  Applets
> +#
> +
> +#
> +# Archival  Utilities
> +#
> +CONFIG_FEATURE_SEAMLESS_XZ=y
> +#  CONFIG_FEATURE_SEAMLESS_LZMA is not set
> +# CONFIG_FEATURE_SEAMLESS_BZ2 is not  set
> +# CONFIG_FEATURE_SEAMLESS_GZ is not set
> +# CONFIG_FEATURE_SEAMLESS_Z  is not set
> +CONFIG_AR=y
> +# CONFIG_FEATURE_AR_LONG_FILENAMES is not  set
> +CONFIG_FEATURE_AR_CREATE=y
> +CONFIG_BUNZIP2=y
> +# CONFIG_BZIP2 is  not set
> +CONFIG_CPIO=y
> +# CONFIG_FEATURE_CPIO_O is not set
> +#  CONFIG_FEATURE_CPIO_P is not set
> +# CONFIG_DPKG is not set
> +#  CONFIG_DPKG_DEB is not set
> +# CONFIG_FEATURE_DPKG_DEB_EXTRACT_ONLY is not  set
> +CONFIG_GUNZIP=y
> +CONFIG_GZIP=y
> +# CONFIG_FEATURE_GZIP_LONG_OPTIONS  is not set
> +# CONFIG_LZOP is not set
> +# CONFIG_LZOP_COMPR_HIGH is not  set
> +# CONFIG_RPM2CPIO is not set
> +# CONFIG_RPM is not  set
> +CONFIG_TAR=y
> +CONFIG_FEATURE_TAR_CREATE=y
> +#  CONFIG_FEATURE_TAR_AUTODETECT is not set
> +CONFIG_FEATURE_TAR_FROM=y
> +#  CONFIG_FEATURE_TAR_OLDGNU_COMPATIBILITY is not set
> +#  CONFIG_FEATURE_TAR_OLDSUN_COMPATIBILITY is not  set
> +CONFIG_FEATURE_TAR_GNU_EXTENSIONS=y
> +CONFIG_FEATURE_TAR_LONG_OPTIONS=y
> +CONFIG_FEATURE_TAR_TO_COMMAND=y
> +#  CONFIG_FEATURE_TAR_UNAME_GNAME is not set
> +#  CONFIG_FEATURE_TAR_NOPRESERVE_TIME is not set
> +# CONFIG_FEATURE_TAR_SELINUX  is not set
> +# CONFIG_UNCOMPRESS is not set
> +CONFIG_UNLZMA=y
> +#  CONFIG_FEATURE_LZMA_FAST is not  set
> +CONFIG_LZMA=y
> +CONFIG_UNXZ=y
> +CONFIG_XZ=y
> +CONFIG_UNZIP=y
> +
> +#
> +# Coreutils
> +#
> +CONFIG_BASENAME=y
> +CONFIG_CAT=y
> +CONFIG_DATE=y
> +CONFIG_FEATURE_DATE_ISOFMT=y
> +# # CONFIG_FEATURE_DATE_NANO is not  set
> +CONFIG_FEATURE_DATE_COMPAT=y
> +CONFIG_TEST=y
> +CONFIG_FEATURE_TEST_64=y
> +CONFIG_TR=y
> +CONFIG_FEATURE_TR_CLASSES=y
> +CONFIG_FEATURE_TR_EQUIV=y
> +#  CONFIG_CAL is not  set
> +CONFIG_CATV=y
> +CONFIG_CHGRP=y
> +CONFIG_CHMOD=y
> +CONFIG_CHOWN=y
> +#  CONFIG_FEATURE_CHOWN_LONG_OPTIONS is not  set
> +CONFIG_CHROOT=y
> +CONFIG_CKSUM=y
> +# CONFIG_COMM is not  set
> +CONFIG_CP=y
> +# CONFIG_FEATURE_CP_LONG_OPTIONS is not  set
> +CONFIG_CUT=y
> +CONFIG_DD=y
> +CONFIG_FEATURE_DD_SIGNAL_HANDLING=y
> +#  CONFIG_FEATURE_DD_THIRD_STATUS_LINE is not  set
> +CONFIG_FEATURE_DD_IBS_OBS=y
> +CONFIG_DF=y
> +#  CONFIG_FEATURE_DF_FANCY is not  set
> +CONFIG_DIRNAME=y
> +CONFIG_DOS2UNIX=y
> +CONFIG_UNIX2DOS=y
> +CONFIG_DU=y
> +CONFIG_FEATURE_DU_DEFAULT_BLOCKSIZE_1K=y
> +CONFIG_ECHO=y
> +CONFIG_FEATURE_FANCY_ECHO=y
> +CONFIG_ENV=y
> +#  CONFIG_FEATURE_ENV_LONG_OPTIONS is not set
> +# CONFIG_EXPAND is not set
> +#  CONFIG_FEATURE_EXPAND_LONG_OPTIONS is not  set
> +CONFIG_EXPR=y
> +CONFIG_EXPR_MATH_SUPPORT_64=y
> +CONFIG_FALSE=y
> +CONFIG_FOLD=y
> +#  CONFIG_FSYNC is not  set
> +CONFIG_HEAD=y
> +CONFIG_FEATURE_FANCY_HEAD=y
> +CONFIG_HOSTID=y
> +CONFIG_ID=y
> +CONFIG_INSTALL=y
> +CONFIG_FEATURE_INSTALL_LONG_OPTIONS=y
> +CONFIG_LENGTH=y
> +CONFIG_LN=y
> +CONFIG_LOGNAME=y
> +CONFIG_LS=y
> +CONFIG_FEATURE_LS_FILETYPES=y
> +CONFIG_FEATURE_LS_FOLLOWLINKS=y
> +CONFIG_FEATURE_LS_RECURSIVE=y
> +CONFIG_FEATURE_LS_SORTFILES=y
> +CONFIG_FEATURE_LS_TIMESTAMPS=y
> +CONFIG_FEATURE_LS_USERNAME=y
> +CONFIG_FEATURE_LS_COLOR=y
> +CONFIG_FEATURE_LS_COLOR_IS_DEFAULT=y
> +CONFIG_MD5SUM=y
> +CONFIG_MKDIR=y
> +CONFIG_FEATURE_MKDIR_LONG_OPTIONS=y
> +CONFIG_MKFIFO=y
> +CONFIG_MKNOD=y
> +CONFIG_MV=y
> +CONFIG_FEATURE_MV_LONG_OPTIONS=y
> +CONFIG_NICE=y
> +CONFIG_NOHUP=y
> +CONFIG_OD=y
> +CONFIG_PRINTENV=y
> +CONFIG_PRINTF=y
> +CONFIG_PWD=y
> +CONFIG_READLINK=y
> +CONFIG_FEATURE_READLINK_FOLLOW=y
> +CONFIG_REALPATH=y
> +CONFIG_RM=y
> +CONFIG_RMDIR=y
> +#  CONFIG_FEATURE_RMDIR_LONG_OPTIONS is not  set
> +CONFIG_SEQ=y
> +CONFIG_SHA1SUM=y
> +CONFIG_SHA256SUM=y
> +CONFIG_SHA512SUM=y
> +CONFIG_SLEEP=y
> +#  CONFIG_FEATURE_FANCY_SLEEP is not set
> +# CONFIG_FEATURE_FLOAT_SLEEP is not  set
> +CONFIG_SORT=y
> +CONFIG_FEATURE_SORT_BIG=y
> +# CONFIG_SPLIT is not  set
> +# CONFIG_FEATURE_SPLIT_FANCY is not set
> +# CONFIG_STAT is not  set
> +# CONFIG_FEATURE_STAT_FORMAT is not set
> +CONFIG_STTY=y
> +#  CONFIG_SUM is not set
> +CONFIG_SYNC=y
> +# CONFIG_TAC is not  set
> +CONFIG_TAIL=y
> +CONFIG_FEATURE_FANCY_TAIL=y
> +CONFIG_TEE=y
> +CONFIG_FEATURE_TEE_USE_BLOCK_IO=y
> +CONFIG_TOUCH=y
> +CONFIG_TRUE=y
> +CONFIG_TTY=y
> +CONFIG_UNAME=y
> +#  CONFIG_UNEXPAND is not set
> +# CONFIG_FEATURE_UNEXPAND_LONG_OPTIONS is not  set
> +CONFIG_UNIQ=y
> +CONFIG_USLEEP=y
> +CONFIG_UUDECODE=y
> +CONFIG_UUENCODE=y
> +CONFIG_WC=y
> +#  CONFIG_FEATURE_WC_LARGE is not  set
> +CONFIG_WHO=y
> +CONFIG_WHOAMI=y
> +CONFIG_YES=y
> +
> +#
> +#  Common options for cp and  mv
> +#
> +CONFIG_FEATURE_PRESERVE_HARDLINKS=y
> +
> +#
> +# Common options  for ls, more and telnet
> +#
> +CONFIG_FEATURE_AUTOWIDTH=y
> +
> +#
> +#  Common options for df, du,  ls
> +#
> +CONFIG_FEATURE_HUMAN_READABLE=y
> +
> +#
> +# Common options for  md5sum, sha1sum, sha256sum,  sha512sum
> +#
> +CONFIG_FEATURE_MD5_SHA1_SUM_CHECK=y
> +
> +#
> +# Console  Utilities
> +#
> +CONFIG_CHVT=y
> +CONFIG_FGCONSOLE=y
> +CONFIG_CLEAR=y
> +CONFIG_DEALLOCVT=y
> +CONFIG_DUMPKMAP=y
> +#  CONFIG_KBD_MODE is not  set
> +CONFIG_LOADFONT=y
> +CONFIG_LOADKMAP=y
> +CONFIG_OPENVT=y
> +CONFIG_RESET=y
> +CONFIG_RESIZE=y
> +CONFIG_FEATURE_RESIZE_PRINT=y
> +CONFIG_SETCONSOLE=y
> +#  CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS is not set
> +# CONFIG_SETFONT is not  set
> +# CONFIG_FEATURE_SETFONT_TEXTUAL_MAP is not  set
> +CONFIG_DEFAULT_SETFONT_DIR=""
> +CONFIG_SETKEYCODES=y
> +CONFIG_SETLOGCONS=y
> +#  CONFIG_SHOWKEY is not set
> +
> +#
> +# Common options for loadfont and  setfont
> +#
> +CONFIG_FEATURE_LOADFONT_PSF2=y
> +CONFIG_FEATURE_LOADFONT_RAW=y
> +
> +#
> +#  Debian  Utilities
> +#
> +CONFIG_MKTEMP=y
> +CONFIG_PIPE_PROGRESS=y
> +CONFIG_RUN_PARTS=y
> +CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS=y
> +#  CONFIG_FEATURE_RUN_PARTS_FANCY is not  set
> +CONFIG_START_STOP_DAEMON=y
> +CONFIG_FEATURE_START_STOP_DAEMON_FANCY=y
> +CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS=y
> +CONFIG_WHICH=y
> +
> +#
> +#  Editors
> +#
> +CONFIG_AWK=y
> +# CONFIG_FEATURE_AWK_LIBM is not  set
> +CONFIG_CMP=y
> +CONFIG_DIFF=y
> +# CONFIG_FEATURE_DIFF_LONG_OPTIONS is  not set
> +CONFIG_FEATURE_DIFF_DIR=y
> +# CONFIG_ED is not  set
> +CONFIG_PATCH=y
> +CONFIG_SED=y
> +CONFIG_VI=y
> +CONFIG_FEATURE_VI_MAX_LEN=4096
> +CONFIG_FEATURE_VI_8BIT=y
> +CONFIG_FEATURE_VI_COLON=y
> +CONFIG_FEATURE_VI_YANKMARK=y
> +CONFIG_FEATURE_VI_SEARCH=y
> +CONFIG_FEATURE_VI_USE_SIGNALS=y
> +CONFIG_FEATURE_VI_DOT_CMD=y
> +CONFIG_FEATURE_VI_READONLY=y
> +CONFIG_FEATURE_VI_SETOPTS=y
> +CONFIG_FEATURE_VI_SET=y
> +CONFIG_FEATURE_VI_WIN_RESIZE=y
> +CONFIG_FEATURE_VI_ASK_TERMINAL=y
> +CONFIG_FEATURE_VI_OPTIMIZE_CURSOR=y
> +CONFIG_FEATURE_ALLOW_EXEC=y
> +
> +#
> +#  Finding  Utilities
> +#
> +CONFIG_FIND=y
> +CONFIG_FEATURE_FIND_PRINT0=y
> +CONFIG_FEATURE_FIND_MTIME=y
> +CONFIG_FEATURE_FIND_MMIN=y
> +CONFIG_FEATURE_FIND_PERM=y
> +CONFIG_FEATURE_FIND_TYPE=y
> +CONFIG_FEATURE_FIND_XDEV=y
> +CONFIG_FEATURE_FIND_MAXDEPTH=y
> +CONFIG_FEATURE_FIND_NEWER=y
> +#  CONFIG_FEATURE_FIND_INUM is not  set
> +CONFIG_FEATURE_FIND_EXEC=y
> +CONFIG_FEATURE_FIND_USER=y
> +CONFIG_FEATURE_FIND_GROUP=y
> +CONFIG_FEATURE_FIND_NOT=y
> +CONFIG_FEATURE_FIND_DEPTH=y
> +CONFIG_FEATURE_FIND_PAREN=y
> +CONFIG_FEATURE_FIND_SIZE=y
> +CONFIG_FEATURE_FIND_PRUNE=y
> +#  CONFIG_FEATURE_FIND_DELETE is not  set
> +CONFIG_FEATURE_FIND_PATH=y
> +CONFIG_FEATURE_FIND_REGEX=y
> +#  CONFIG_FEATURE_FIND_CONTEXT is not set
> +# CONFIG_FEATURE_FIND_LINKS is not  set
> +CONFIG_GREP=y
> +CONFIG_FEATURE_GREP_EGREP_ALIAS=y
> +CONFIG_FEATURE_GREP_FGREP_ALIAS=y
> +CONFIG_FEATURE_GREP_CONTEXT=y
> +CONFIG_XARGS=y
> +#  CONFIG_FEATURE_XARGS_SUPPORT_CONFIRMATION is not  set
> +CONFIG_FEATURE_XARGS_SUPPORT_QUOTES=y
> +CONFIG_FEATURE_XARGS_SUPPORT_TERMOPT=y
> +CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=y
> +
> +#
> +#  Init  Utilities
> +#
> +CONFIG_BOOTCHARTD=y
> +CONFIG_FEATURE_BOOTCHARTD_BLOATED_HEADER=y
> +CONFIG_FEATURE_BOOTCHARTD_CONFIG_FILE=y
> +CONFIG_INIT=y
> +CONFIG_FEATURE_USE_INITTAB=y
> +CONFIG_FEATURE_KILL_REMOVED=y
> +CONFIG_FEATURE_KILL_DELAY=0
> +CONFIG_FEATURE_INIT_SCTTY=y
> +CONFIG_FEATURE_INIT_SYSLOG=y
> +CONFIG_FEATURE_EXTRA_QUIET=y
> +#  CONFIG_FEATURE_INIT_COREDUMPS is not  set
> +CONFIG_FEATURE_INITRD=y
> +CONFIG_HALT=y
> +#  CONFIG_FEATURE_CALL_TELINIT is not  set
> +CONFIG_TELINIT_PATH=""
> +CONFIG_MESG=y
> +
> +#
> +# Login/Password  Management Utilities
> +#
> +CONFIG_FEATURE_SHADOWPASSWDS=y
> +#  CONFIG_USE_BB_PWD_GRP is not set
> +# CONFIG_USE_BB_SHADOW is not  set
> +CONFIG_USE_BB_CRYPT=y
> +# CONFIG_USE_BB_CRYPT_SHA is not  set
> +CONFIG_ADDGROUP=y
> +# CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS is not  set
> +# CONFIG_FEATURE_ADDUSER_TO_GROUP is not set
> +CONFIG_DELGROUP=y
> +#  CONFIG_FEATURE_DEL_USER_FROM_GROUP is not set
> +# CONFIG_FEATURE_CHECK_NAMES  is not set
> +CONFIG_ADDUSER=y
> +# CONFIG_FEATURE_ADDUSER_LONG_OPTIONS is not  set
> +CONFIG_FIRST_SYSTEM_ID=100
> +CONFIG_LAST_SYSTEM_ID=999
> +CONFIG_DELUSER=y
> +CONFIG_GETTY=y
> +CONFIG_LOGIN=y
> +#  CONFIG_PAM is not set
> +# CONFIG_LOGIN_SCRIPTS is not  set
> +CONFIG_FEATURE_NOLOGIN=y
> +CONFIG_FEATURE_SECURETTY=y
> +CONFIG_PASSWD=y
> +CONFIG_FEATURE_PASSWD_WEAK_CHECK=y
> +#  CONFIG_CRYPTPW is not set
> +# CONFIG_CHPASSWD is not  set
> +CONFIG_SU=y
> +CONFIG_FEATURE_SU_SYSLOG=y
> +CONFIG_FEATURE_SU_CHECKS_SHELLS=y
> +CONFIG_SULOGIN=y
> +CONFIG_VLOCK=y
> +
> +#
> +#  Linux Ext2 FS  Progs
> +#
> +CONFIG_CHATTR=y
> +CONFIG_FSCK=y
> +CONFIG_LSATTR=y
> +#  CONFIG_TUNE2FS is not set
> +
> +#
> +# Linux Module  Utilities
> +#
> +CONFIG_MODINFO=y
> +# CONFIG_MODPROBE_SMALL is not  set
> +# CONFIG_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE is not set
> +#  CONFIG_FEATURE_MODPROBE_SMALL_CHECK_ALREADY_LOADED is not  set
> +CONFIG_INSMOD=y
> +CONFIG_RMMOD=y
> +CONFIG_LSMOD=y
> +CONFIG_FEATURE_LSMOD_PRETTY_2_6_OUTPUT=y
> +CONFIG_MODPROBE=y
> +#  CONFIG_FEATURE_MODPROBE_BLACKLIST is not set
> +# CONFIG_DEPMOD is not  set
> +
> +#
> +# Options common to multiple modutils
> +#
> +#  CONFIG_FEATURE_2_4_MODULES is not set
> +# CONFIG_FEATURE_INSMOD_TRY_MMAP is  not set
> +# CONFIG_FEATURE_INSMOD_VERSION_CHECKING is not set
> +#  CONFIG_FEATURE_INSMOD_KSYMOOPS_SYMBOLS is not set
> +#  CONFIG_FEATURE_INSMOD_LOADINKMEM is not set
> +# CONFIG_FEATURE_INSMOD_LOAD_MAP  is not set
> +# CONFIG_FEATURE_INSMOD_LOAD_MAP_FULL is not  set
> +CONFIG_FEATURE_CHECK_TAINTED_MODULE=y
> +CONFIG_FEATURE_MODUTILS_ALIAS=y
> +CONFIG_FEATURE_MODUTILS_SYMBOLS=y
> +CONFIG_DEFAULT_MODULES_DIR="/lib/modules"
> +CONFIG_DEFAULT_DEPMOD_FILE="modules.dep"
> +
> +#
> +#  Linux System Utilities
> +#
> +CONFIG_REV=y
> +# CONFIG_ACPID is not  set
> +# CONFIG_FEATURE_ACPID_COMPAT is not set
> +# CONFIG_BLKID is not  set
> +CONFIG_DMESG=y
> +CONFIG_FEATURE_DMESG_PRETTY=y
> +# CONFIG_FBSET is  not set
> +# CONFIG_FEATURE_FBSET_FANCY is not set
> +#  CONFIG_FEATURE_FBSET_READMODE is not  set
> +CONFIG_FDFLUSH=y
> +CONFIG_FDFORMAT=y
> +CONFIG_FDISK=y
> +CONFIG_FDISK_SUPPORT_LARGE_DISKS=y
> +CONFIG_FEATURE_FDISK_WRITABLE=y
> +CONFIG_FEATURE_AIX_LABEL=y
> +CONFIG_FEATURE_SGI_LABEL=y
> +#  CONFIG_FEATURE_SUN_LABEL is not  set
> +CONFIG_FEATURE_OSF_LABEL=y
> +CONFIG_FEATURE_FDISK_ADVANCED=y
> +#  CONFIG_FINDFS is not set
> +CONFIG_FLOCK=y
> +CONFIG_FREERAMDISK=y
> +#  CONFIG_FSCK_MINIX is not set
> +# CONFIG_MKFS_EXT2 is not set
> +#  CONFIG_MKFS_MINIX is not set
> +# CONFIG_FEATURE_MINIX2 is not set
> +#  CONFIG_MKFS_REISER is not set
> +# CONFIG_MKFS_VFAT is not  set
> +CONFIG_GETOPT=y
> +CONFIG_FEATURE_GETOPT_LONG=y
> +CONFIG_HEXDUMP=y
> +#  CONFIG_FEATURE_HEXDUMP_REVERSE is not set
> +# CONFIG_HD is not  set
> +CONFIG_HWCLOCK=y
> +CONFIG_FEATURE_HWCLOCK_LONG_OPTIONS=y
> +CONFIG_FEATURE_HWCLOCK_ADJTIME_FHS=y
> +CONFIG_IPCRM=y
> +CONFIG_IPCS=y
> +CONFIG_LOSETUP=y
> +CONFIG_LSPCI=y
> +CONFIG_LSUSB=y
> +CONFIG_MDEV=y
> +CONFIG_FEATURE_MDEV_CONF=y
> +#  CONFIG_FEATURE_MDEV_RENAME is not set
> +# CONFIG_FEATURE_MDEV_RENAME_REGEXP  is not set
> +CONFIG_FEATURE_MDEV_EXEC=y
> +#  CONFIG_FEATURE_MDEV_LOAD_FIRMWARE is not set
> +CONFIG_MKSWAP=y
> +#  CONFIG_FEATURE_MKSWAP_UUID is not  set
> +CONFIG_MORE=y
> +CONFIG_FEATURE_USE_TERMIOS=y
> +CONFIG_MOUNT=y
> +#  CONFIG_FEATURE_MOUNT_FAKE is not set
> +# CONFIG_FEATURE_MOUNT_VERBOSE is not  set
> +# CONFIG_FEATURE_MOUNT_HELPERS is not set
> +#  CONFIG_FEATURE_MOUNT_LABEL is not  set
> +CONFIG_FEATURE_MOUNT_NFS=y
> +CONFIG_FEATURE_MOUNT_CIFS=y
> +CONFIG_FEATURE_MOUNT_FLAGS=y
> +CONFIG_FEATURE_MOUNT_FSTAB=y
> +CONFIG_PIVOT_ROOT=y
> +CONFIG_RDATE=y
> +#  CONFIG_RDEV is not set
> +CONFIG_READPROFILE=y
> +# CONFIG_RTCWAKE is not  set
> +# CONFIG_SCRIPT is not set
> +# CONFIG_SCRIPTREPLAY is not  set
> +CONFIG_SETARCH=y
> +CONFIG_SWAPONOFF=y
> +# CONFIG_FEATURE_SWAPON_PRI  is not  set
> +CONFIG_SWITCH_ROOT=y
> +CONFIG_UMOUNT=y
> +CONFIG_FEATURE_UMOUNT_ALL=y
> +
> +#
> +#  Common options for  mount/umount
> +#
> +CONFIG_FEATURE_MOUNT_LOOP=y
> +CONFIG_FEATURE_MOUNT_LOOP_CREATE=y
> +#  CONFIG_FEATURE_MTAB_SUPPORT is not set
> +# CONFIG_VOLUMEID is not set
> +#  CONFIG_FEATURE_VOLUMEID_EXT is not set
> +# CONFIG_FEATURE_VOLUMEID_BTRFS is  not set
> +# CONFIG_FEATURE_VOLUMEID_REISERFS is not set
> +#  CONFIG_FEATURE_VOLUMEID_FAT is not set
> +# CONFIG_FEATURE_VOLUMEID_HFS is not  set
> +# CONFIG_FEATURE_VOLUMEID_JFS is not set
> +#  CONFIG_FEATURE_VOLUMEID_XFS is not set
> +# CONFIG_FEATURE_VOLUMEID_NTFS is not  set
> +# CONFIG_FEATURE_VOLUMEID_ISO9660 is not set
> +#  CONFIG_FEATURE_VOLUMEID_UDF is not set
> +# CONFIG_FEATURE_VOLUMEID_LUKS is not  set
> +# CONFIG_FEATURE_VOLUMEID_LINUXSWAP is not set
> +#  CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
> +# CONFIG_FEATURE_VOLUMEID_ROMFS is  not set
> +# CONFIG_FEATURE_VOLUMEID_SYSV is not set
> +#  CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
> +# CONFIG_FEATURE_VOLUMEID_LINUXRAID  is not set
> +
> +#
> +# Miscellaneous Utilities
> +#
> +# CONFIG_CONSPY is  not set
> +# CONFIG_UBIATTACH is not set
> +# CONFIG_UBIDETACH is not  set
> +# CONFIG_ADJTIMEX is not set
> +# CONFIG_BBCONFIG is not set
> +#  CONFIG_BEEP is not  set
> +CONFIG_FEATURE_BEEP_FREQ=0
> +CONFIG_FEATURE_BEEP_LENGTH_MS=0
> +#  CONFIG_CHAT is not set
> +# CONFIG_FEATURE_CHAT_NOFAIL is not set
> +#  CONFIG_FEATURE_CHAT_TTY_HIFI is not set
> +# CONFIG_FEATURE_CHAT_IMPLICIT_CR is  not set
> +# CONFIG_FEATURE_CHAT_SWALLOW_OPTS is not set
> +#  CONFIG_FEATURE_CHAT_SEND_ESCAPES is not set
> +#  CONFIG_FEATURE_CHAT_VAR_ABORT_LEN is not set
> +# CONFIG_FEATURE_CHAT_CLR_ABORT  is not set
> +CONFIG_CHRT=y
> +CONFIG_CROND=y
> +# CONFIG_FEATURE_CROND_D is  not set
> +# CONFIG_FEATURE_CROND_CALL_SENDMAIL is not  set
> +CONFIG_FEATURE_CROND_DIR="/var/spool/cron"
> +CONFIG_CRONTAB=y
> +CONFIG_DC=y
> +#  CONFIG_FEATURE_DC_LIBM is not set
> +# CONFIG_DEVFSD is not set
> +#  CONFIG_DEVFSD_MODLOAD is not set
> +# CONFIG_DEVFSD_FG_NP is not set
> +#  CONFIG_DEVFSD_VERBOSE is not set
> +# CONFIG_FEATURE_DEVFS is not  set
> +CONFIG_DEVMEM=y
> +CONFIG_EJECT=y
> +# CONFIG_FEATURE_EJECT_SCSI is  not set
> +# CONFIG_FBSPLASH is not set
> +# CONFIG_FLASHCP is not set
> +#  CONFIG_FLASH_LOCK is not set
> +# CONFIG_FLASH_UNLOCK is not set
> +#  CONFIG_FLASH_ERASEALL is not set
> +# CONFIG_IONICE is not set
> +#  CONFIG_INOTIFYD is not  set
> +CONFIG_LAST=y
> +CONFIG_FEATURE_LAST_SMALL=y
> +#  CONFIG_FEATURE_LAST_FANCY is not  set
> +CONFIG_LESS=y
> +CONFIG_FEATURE_LESS_MAXLINES=9999999
> +CONFIG_FEATURE_LESS_BRACKETS=y
> +CONFIG_FEATURE_LESS_FLAGS=y
> +#  CONFIG_FEATURE_LESS_MARKS is not set
> +CONFIG_FEATURE_LESS_REGEXP=y
> +#  CONFIG_FEATURE_LESS_WINCH is not set
> +# CONFIG_FEATURE_LESS_DASHCMD is not  set
> +# CONFIG_FEATURE_LESS_LINENUMS is not  set
> +CONFIG_HDPARM=y
> +CONFIG_FEATURE_HDPARM_GET_IDENTITY=y
> +#  CONFIG_FEATURE_HDPARM_HDIO_SCAN_HWIF is not set
> +#  CONFIG_FEATURE_HDPARM_HDIO_UNREGISTER_HWIF is not set
> +#  CONFIG_FEATURE_HDPARM_HDIO_DRIVE_RESET is not set
> +#  CONFIG_FEATURE_HDPARM_HDIO_TRISTATE_HWIF is not set
> +#  CONFIG_FEATURE_HDPARM_HDIO_GETSET_DMA is not set
> +CONFIG_MAKEDEVS=y
> +#  CONFIG_FEATURE_MAKEDEVS_LEAF is not  set
> +CONFIG_FEATURE_MAKEDEVS_TABLE=y
> +# CONFIG_MAN is not set
> +#  CONFIG_MICROCOM is not set
> +CONFIG_MOUNTPOINT=y
> +CONFIG_MT=y
> +#  CONFIG_RAIDAUTORUN is not set
> +# CONFIG_READAHEAD is not set
> +#  CONFIG_RFKILL is not set
> +CONFIG_RUNLEVEL=y
> +# CONFIG_RX is not  set
> +CONFIG_SETSID=y
> +CONFIG_STRINGS=y
> +# CONFIG_TASKSET is not  set
> +# CONFIG_FEATURE_TASKSET_FANCY is not set
> +CONFIG_TIME=y
> +#  CONFIG_TIMEOUT is not set
> +# CONFIG_TTYSIZE is not set
> +# CONFIG_VOLNAME  is not set
> +# CONFIG_WALL is not set
> +CONFIG_WATCHDOG=y
> +
> +#
> +#  Networking Utilities
> +#
> +# CONFIG_NC is not set
> +# CONFIG_NC_SERVER is  not set
> +# CONFIG_NC_EXTRA is not set
> +# CONFIG_NC_110_COMPAT is not  set
> +# CONFIG_FEATURE_IPV6 is not set
> +# CONFIG_FEATURE_UNIX_LOCAL is not  set
> +# CONFIG_FEATURE_PREFER_IPV4_ADDRESS is not set
> +#  CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
> +# CONFIG_ARP is not  set
> +CONFIG_ARPING=y
> +# CONFIG_BRCTL is not set
> +#  CONFIG_FEATURE_BRCTL_FANCY is not set
> +# CONFIG_FEATURE_BRCTL_SHOW is not  set
> +CONFIG_DNSD=y
> +CONFIG_ETHER_WAKE=y
> +# CONFIG_FAKEIDENTD is not  set
> +# CONFIG_FTPD is not set
> +# CONFIG_FEATURE_FTP_WRITE is not set
> +#  CONFIG_FEATURE_FTPD_ACCEPT_BROKEN_LIST is not set
> +# CONFIG_FTPGET is not  set
> +# CONFIG_FTPPUT is not set
> +# CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS  is not set
> +CONFIG_HOSTNAME=y
> +CONFIG_HTTPD=y
> +#  CONFIG_FEATURE_HTTPD_RANGES is not  set
> +CONFIG_FEATURE_HTTPD_USE_SENDFILE=y
> +# CONFIG_FEATURE_HTTPD_SETUID is  not  set
> +CONFIG_FEATURE_HTTPD_BASIC_AUTH=y
> +CONFIG_FEATURE_HTTPD_AUTH_MD5=y
> +CONFIG_FEATURE_HTTPD_CGI=y
> +CONFIG_FEATURE_HTTPD_CONFIG_WITH_SCRIPT_INTERPR=y
> +#  CONFIG_FEATURE_HTTPD_SET_REMOTE_PORT_TO_ENV is not  set
> +CONFIG_FEATURE_HTTPD_ENCODE_URL_STR=y
> +#  CONFIG_FEATURE_HTTPD_ERROR_PAGES is not set
> +# CONFIG_FEATURE_HTTPD_PROXY is  not  set
> +CONFIG_IFCONFIG=y
> +CONFIG_FEATURE_IFCONFIG_STATUS=y
> +CONFIG_FEATURE_IFCONFIG_SLIP=y
> +CONFIG_FEATURE_IFCONFIG_MEMSTART_IOADDR_IRQ=y
> +CONFIG_FEATURE_IFCONFIG_HW=y
> +#  CONFIG_FEATURE_IFCONFIG_BROADCAST_PLUS is not set
> +# CONFIG_IFENSLAVE is not  set
> +# CONFIG_IFPLUGD is not  set
> +CONFIG_IFUPDOWN=y
> +CONFIG_IFUPDOWN_IFSTATE_PATH="/var/run/ifstate"
> +CONFIG_FEATURE_IFUPDOWN_IP=y
> +#  CONFIG_FEATURE_IFUPDOWN_IP_BUILTIN is not set
> +#  CONFIG_FEATURE_IFUPDOWN_IFCONFIG_BUILTIN is not  set
> +CONFIG_FEATURE_IFUPDOWN_IPV4=y
> +# CONFIG_FEATURE_IFUPDOWN_IPV6 is not  set
> +CONFIG_FEATURE_IFUPDOWN_MAPPING=y
> +#  CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP is not  set
> +CONFIG_INETD=y
> +CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO=y
> +CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD=y
> +CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME=y
> +CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME=y
> +CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN=y
> +#  CONFIG_FEATURE_INETD_RPC is not  set
> +CONFIG_IP=y
> +CONFIG_FEATURE_IP_ADDRESS=y
> +CONFIG_FEATURE_IP_LINK=y
> +CONFIG_FEATURE_IP_ROUTE=y
> +CONFIG_FEATURE_IP_TUNNEL=y
> +CONFIG_FEATURE_IP_RULE=y
> +CONFIG_FEATURE_IP_SHORT_FORMS=y
> +#  CONFIG_FEATURE_IP_RARE_PROTOCOLS is not  set
> +CONFIG_IPADDR=y
> +CONFIG_IPLINK=y
> +CONFIG_IPROUTE=y
> +CONFIG_IPTUNNEL=y
> +CONFIG_IPRULE=y
> +#  CONFIG_IPCALC is not set
> +# CONFIG_FEATURE_IPCALC_FANCY is not set
> +#  CONFIG_FEATURE_IPCALC_LONG_OPTIONS is not set
> +CONFIG_NAMEIF=y
> +#  CONFIG_FEATURE_NAMEIF_EXTENDED is not set
> +CONFIG_NETSTAT=y
> +#  CONFIG_FEATURE_NETSTAT_WIDE is not set
> +# CONFIG_FEATURE_NETSTAT_PRG is not  set
> +CONFIG_NSLOOKUP=y
> +# CONFIG_NTPD is not set
> +#  CONFIG_FEATURE_NTPD_SERVER is not set
> +CONFIG_PING=y
> +# CONFIG_PING6 is  not set
> +CONFIG_FEATURE_FANCY_PING=y
> +# CONFIG_PSCAN is not  set
> +CONFIG_ROUTE=y
> +# CONFIG_SLATTACH is not set
> +# CONFIG_TCPSVD is  not  set
> +CONFIG_TELNET=y
> +CONFIG_FEATURE_TELNET_TTYPE=y
> +CONFIG_FEATURE_TELNET_AUTOLOGIN=y
> +#  CONFIG_TELNETD is not set
> +# CONFIG_FEATURE_TELNETD_STANDALONE is not  set
> +# CONFIG_FEATURE_TELNETD_INETD_WAIT is not set
> +CONFIG_TFTP=y
> +#  CONFIG_TFTPD is not set
> +
> +#
> +# Common options for  tftp/tftpd
> +#
> +CONFIG_FEATURE_TFTP_GET=y
> +CONFIG_FEATURE_TFTP_PUT=y
> +CONFIG_FEATURE_TFTP_BLOCKSIZE=y
> +#  CONFIG_FEATURE_TFTP_PROGRESS_BAR is not set
> +# CONFIG_TFTP_DEBUG is not  set
> +CONFIG_TRACEROUTE=y
> +# CONFIG_TRACEROUTE6 is not set
> +#  CONFIG_FEATURE_TRACEROUTE_VERBOSE is not set
> +#  CONFIG_FEATURE_TRACEROUTE_SOURCE_ROUTE is not set
> +#  CONFIG_FEATURE_TRACEROUTE_USE_ICMP is not set
> +# CONFIG_TUNCTL is not  set
> +# CONFIG_FEATURE_TUNCTL_UG is not set
> +# CONFIG_UDHCPD is not  set
> +# CONFIG_DHCPRELAY is not set
> +# CONFIG_DUMPLEASES is not set
> +#  CONFIG_FEATURE_UDHCPD_WRITE_LEASES_EARLY is not  set
> +CONFIG_DHCPD_LEASES_FILE=""
> +CONFIG_UDHCPC=y
> +CONFIG_FEATURE_UDHCPC_ARPING=y
> +#  CONFIG_FEATURE_UDHCP_PORT is not set
> +CONFIG_UDHCP_DEBUG=0
> +#  CONFIG_FEATURE_UDHCP_RFC3397 is not  set
> +CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
> +CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
> +CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R  -n"
> +# CONFIG_UDPSVD is not  set
> +CONFIG_VCONFIG=y
> +CONFIG_WGET=y
> +CONFIG_FEATURE_WGET_STATUSBAR=y
> +CONFIG_FEATURE_WGET_AUTHENTICATION=y
> +CONFIG_FEATURE_WGET_LONG_OPTIONS=y
> +#  CONFIG_ZCIP is not set
> +
> +#
> +# Print Utilities
> +#
> +# CONFIG_LPD  is not set
> +# CONFIG_LPR is not set
> +# CONFIG_LPQ is not  set
> +
> +#
> +# Mail Utilities
> +#
> +# CONFIG_MAKEMIME is not  set
> +CONFIG_FEATURE_MIME_CHARSET=""
> +# CONFIG_POPMAILDIR is not set
> +#  CONFIG_FEATURE_POPMAILDIR_DELIVERY is not set
> +# CONFIG_REFORMIME is not  set
> +# CONFIG_FEATURE_REFORMIME_COMPAT is not set
> +# CONFIG_SENDMAIL is  not set
> +
> +#
> +# Process  Utilities
> +#
> +CONFIG_SMEMCAP=y
> +CONFIG_FREE=y
> +CONFIG_FUSER=y
> +CONFIG_KILL=y
> +CONFIG_KILLALL=y
> +CONFIG_KILLALL5=y
> +#  CONFIG_NMETER is not set
> +# CONFIG_PGREP is not  set
> +CONFIG_PIDOF=y
> +CONFIG_FEATURE_PIDOF_SINGLE=y
> +CONFIG_FEATURE_PIDOF_OMIT=y
> +#  CONFIG_PKILL is not set
> +CONFIG_PS=y
> +CONFIG_FEATURE_PS_WIDE=y
> +#  CONFIG_FEATURE_PS_TIME is not set
> +# CONFIG_FEATURE_PS_ADDITIONAL_COLUMNS is  not set
> +# CONFIG_FEATURE_PS_UNUSUAL_SYSTEMS is not  set
> +CONFIG_RENICE=y
> +CONFIG_BB_SYSCTL=y
> +CONFIG_TOP=y
> +CONFIG_FEATURE_TOP_CPU_USAGE_PERCENTAGE=y
> +CONFIG_FEATURE_TOP_CPU_GLOBAL_PERCENTS=y
> +#  CONFIG_FEATURE_TOP_SMP_CPU is not set
> +# CONFIG_FEATURE_TOP_DECIMALS is not  set
> +# CONFIG_FEATURE_TOP_SMP_PROCESS is not set
> +# CONFIG_FEATURE_TOPMEM  is not set
> +# CONFIG_FEATURE_SHOW_THREADS is not  set
> +CONFIG_UPTIME=y
> +CONFIG_WATCH=y
> +
> +#
> +# Runit  Utilities
> +#
> +# CONFIG_RUNSV is not set
> +# CONFIG_RUNSVDIR is not  set
> +# CONFIG_FEATURE_RUNSVDIR_LOG is not set
> +# CONFIG_SV is not  set
> +CONFIG_SV_DEFAULT_SERVICE_DIR=""
> +# CONFIG_SVLOGD is not set
> +#  CONFIG_CHPST is not set
> +# CONFIG_SETUIDGID is not set
> +# CONFIG_ENVUIDGID  is not set
> +# CONFIG_ENVDIR is not set
> +# CONFIG_SOFTLIMIT is not  set
> +# CONFIG_CHCON is not set
> +# CONFIG_FEATURE_CHCON_LONG_OPTIONS is not  set
> +# CONFIG_GETENFORCE is not set
> +# CONFIG_GETSEBOOL is not set
> +#  CONFIG_LOAD_POLICY is not set
> +# CONFIG_MATCHPATHCON is not set
> +#  CONFIG_RESTORECON is not set
> +# CONFIG_RUNCON is not set
> +#  CONFIG_FEATURE_RUNCON_LONG_OPTIONS is not set
> +# CONFIG_SELINUXENABLED is not  set
> +# CONFIG_SETENFORCE is not set
> +# CONFIG_SETFILES is not set
> +#  CONFIG_FEATURE_SETFILES_CHECK_OPTION is not set
> +# CONFIG_SETSEBOOL is not  set
> +# CONFIG_SESTATUS is not set
> +
> +#
> +#  Shells
> +#
> +CONFIG_ASH=y
> +CONFIG_ASH_BASH_COMPAT=y
> +CONFIG_ASH_JOB_CONTROL=y
> +CONFIG_ASH_ALIAS=y
> +CONFIG_ASH_GETOPTS=y
> +CONFIG_ASH_BUILTIN_ECHO=y
> +CONFIG_ASH_BUILTIN_PRINTF=y
> +CONFIG_ASH_BUILTIN_TEST=y
> +CONFIG_ASH_CMDCMD=y
> +#  CONFIG_ASH_MAIL is not  set
> +CONFIG_ASH_OPTIMIZE_FOR_SIZE=y
> +CONFIG_ASH_RANDOM_SUPPORT=y
> +CONFIG_ASH_EXPAND_PRMT=y
> +#  CONFIG_HUSH is not set
> +# CONFIG_HUSH_BASH_COMPAT is not set
> +#  CONFIG_HUSH_HELP is not set
> +# CONFIG_HUSH_INTERACTIVE is not set
> +#  CONFIG_HUSH_JOB is not set
> +# CONFIG_HUSH_TICK is not set
> +#  CONFIG_HUSH_IF is not set
> +# CONFIG_HUSH_LOOPS is not set
> +#  CONFIG_HUSH_CASE is not set
> +# CONFIG_HUSH_FUNCTIONS is not set
> +#  CONFIG_HUSH_LOCAL is not set
> +# CONFIG_HUSH_EXPORT_N is not set
> +#  CONFIG_HUSH_RANDOM_SUPPORT is not set
> +CONFIG_FEATURE_SH_IS_ASH=y
> +#  CONFIG_FEATURE_SH_IS_HUSH is not set
> +# CONFIG_FEATURE_SH_IS_NONE is not  set
> +# CONFIG_FEATURE_BASH_IS_ASH is not set
> +#  CONFIG_FEATURE_BASH_IS_HUSH is not set
> +CONFIG_FEATURE_BASH_IS_NONE=y
> +#  CONFIG_LASH is not set
> +# CONFIG_MSH is not  set
> +CONFIG_SH_MATH_SUPPORT=y
> +# CONFIG_SH_MATH_SUPPORT_64 is not  set
> +CONFIG_FEATURE_SH_EXTRA_QUIET=y
> +# CONFIG_FEATURE_SH_STANDALONE is  not set
> +# CONFIG_FEATURE_SH_NOFORK is not set
> +# CONFIG_CTTYHACK is not  set
> +
> +#
> +# System Logging  Utilities
> +#
> +CONFIG_SYSLOGD=y
> +CONFIG_FEATURE_ROTATE_LOGFILE=y
> +CONFIG_FEATURE_REMOTE_LOG=y
> +#  CONFIG_FEATURE_SYSLOGD_DUP is not  set
> +CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=256
> +#  CONFIG_FEATURE_IPC_SYSLOG is not  set
> +CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=0
> +# CONFIG_LOGREAD is not  set
> +# CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING is not  set
> +CONFIG_KLOGD=y
> +CONFIG_LOGGER=y
> diff --git  
>a/target/device/sheevaplug/SeagateDockStar/SeagateDockStar-linux-2.6.36.1.config  
>
>b/target/device/sheevaplug/SeagateDockStar/SeagateDockStar-linux-2.6.36.1.config

> new  file mode 100644
> index 0000000..405fdab
> --- /dev/null
> +++  
>b/target/device/sheevaplug/SeagateDockStar/SeagateDockStar-linux-2.6.36.1.config

> @@  -0,0 +1,1781 @@
> +#
> +# Automatically generated make config: don't  edit
> +# Linux kernel version: 2.6.36.1
> +# Sat Dec  4 21:20:43  2010
> +#
> +CONFIG_ARM=y
> +CONFIG_SYS_SUPPORTS_APM_EMULATION=y
> +CONFIG_GENERIC_GPIO=y
> +#  CONFIG_ARCH_USES_GETTIMEOFFSET is not  set
> +CONFIG_GENERIC_CLOCKEVENTS=y
> +CONFIG_HAVE_PROC_CPU=y
> +CONFIG_GENERIC_HARDIRQS=y
> +CONFIG_STACKTRACE_SUPPORT=y
> +CONFIG_HAVE_LATENCYTOP_SUPPORT=y
> +CONFIG_LOCKDEP_SUPPORT=y
> +CONFIG_TRACE_IRQFLAGS_SUPPORT=y
> +CONFIG_HARDIRQS_SW_RESEND=y
> +CONFIG_GENERIC_IRQ_PROBE=y
> +CONFIG_RWSEM_GENERIC_SPINLOCK=y
> +CONFIG_GENERIC_HWEIGHT=y
> +CONFIG_GENERIC_CALIBRATE_DELAY=y
> +CONFIG_NEED_DMA_MAP_STATE=y
> +CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=y
> +CONFIG_VECTORS_BASE=0xffff0000
> +CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
> +CONFIG_CONSTRUCTORS=y
> +
> +#
> +#  General setup
> +#
> +# CONFIG_EXPERIMENTAL is not  set
> +CONFIG_BROKEN_ON_SMP=y
> +CONFIG_LOCK_KERNEL=y
> +CONFIG_INIT_ENV_ARG_LIMIT=32
> +CONFIG_CROSS_COMPILE=""
> +CONFIG_LOCALVERSION=""
> +#  CONFIG_LOCALVERSION_AUTO is not  set
> +CONFIG_HAVE_KERNEL_GZIP=y
> +CONFIG_HAVE_KERNEL_LZMA=y
> +CONFIG_HAVE_KERNEL_LZO=y
> +CONFIG_KERNEL_GZIP=y
> +#  CONFIG_KERNEL_LZMA is not set
> +# CONFIG_KERNEL_LZO is not set
> +#  CONFIG_SWAP is not  set
> +CONFIG_SYSVIPC=y
> +CONFIG_SYSVIPC_SYSCTL=y
> +CONFIG_BSD_PROCESS_ACCT=y
> +#  CONFIG_BSD_PROCESS_ACCT_V3 is not set
> +# CONFIG_TASKSTATS is not set
> +#  CONFIG_AUDIT is not set
> +
> +#
> +# RCU Subsystem
> +#
> +#  CONFIG_TREE_RCU is not set
> +CONFIG_TREE_PREEMPT_RCU=y
> +# CONFIG_TINY_RCU  is not set
> +# CONFIG_RCU_TRACE is not set
> +CONFIG_RCU_FANOUT=32
> +#  CONFIG_RCU_FANOUT_EXACT is not set
> +# CONFIG_TREE_RCU_TRACE is not  set
> +CONFIG_IKCONFIG=y
> +CONFIG_IKCONFIG_PROC=y
> +CONFIG_LOG_BUF_SHIFT=16
> +#  CONFIG_CGROUPS is not set
> +# CONFIG_SYSFS_DEPRECATED_V2 is not set
> +#  CONFIG_RELAY is not set
> +# CONFIG_NAMESPACES is not set
> +#  CONFIG_BLK_DEV_INITRD is not  set
> +CONFIG_CC_OPTIMIZE_FOR_SIZE=y
> +CONFIG_SYSCTL=y
> +CONFIG_ANON_INODES=y
> +CONFIG_EMBEDDED=y
> +CONFIG_UID16=y
> +CONFIG_SYSCTL_SYSCALL=y
> +CONFIG_KALLSYMS=y
> +#  CONFIG_KALLSYMS_EXTRA_PASS is not  set
> +CONFIG_HOTPLUG=y
> +CONFIG_PRINTK=y
> +CONFIG_BUG=y
> +CONFIG_ELF_CORE=y
> +CONFIG_BASE_FULL=y
> +CONFIG_FUTEX=y
> +CONFIG_EPOLL=y
> +CONFIG_SIGNALFD=y
> +CONFIG_TIMERFD=y
> +CONFIG_EVENTFD=y
> +CONFIG_SHMEM=y
> +CONFIG_AIO=y
> +CONFIG_HAVE_PERF_EVENTS=y
> +CONFIG_PERF_USE_VMALLOC=y
> +
> +#
> +#  Kernel Performance Events And Counters
> +#
> +# CONFIG_PERF_EVENTS is not  set
> +# CONFIG_PERF_COUNTERS is not set
> +CONFIG_VM_EVENT_COUNTERS=y
> +#  CONFIG_PCI_QUIRKS is not set
> +# CONFIG_SLUB_DEBUG is not set
> +#  CONFIG_COMPAT_BRK is not set
> +# CONFIG_SLAB is not  set
> +CONFIG_SLUB=y
> +# CONFIG_SLOB is not set
> +# CONFIG_PROFILING is not  set
> +CONFIG_HAVE_OPROFILE=y
> +# CONFIG_KPROBES is not  set
> +CONFIG_HAVE_KPROBES=y
> +CONFIG_HAVE_KRETPROBES=y
> +CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
> +
> +#
> +#  GCOV-based kernel  profiling
> +#
> +CONFIG_HAVE_GENERIC_DMA_COHERENT=y
> +CONFIG_RT_MUTEXES=y
> +CONFIG_BASE_SMALL=0
> +CONFIG_MODULES=y
> +#  CONFIG_MODULE_FORCE_LOAD is not set
> +CONFIG_MODULE_UNLOAD=y
> +#  CONFIG_MODVERSIONS is not set
> +# CONFIG_MODULE_SRCVERSION_ALL is not  set
> +CONFIG_BLOCK=y
> +CONFIG_LBDAF=y
> +# CONFIG_BLK_DEV_BSG is not  set
> +# CONFIG_BLK_DEV_INTEGRITY is not set
> +
> +#
> +# IO  Schedulers
> +#
> +CONFIG_IOSCHED_NOOP=y
> +# CONFIG_IOSCHED_DEADLINE is not  set
> +CONFIG_IOSCHED_CFQ=y
> +# CONFIG_DEFAULT_DEADLINE is not  set
> +CONFIG_DEFAULT_CFQ=y
> +# CONFIG_DEFAULT_NOOP is not  set
> +CONFIG_DEFAULT_IOSCHED="cfq"
> +# CONFIG_INLINE_SPIN_TRYLOCK is not  set
> +# CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
> +# CONFIG_INLINE_SPIN_LOCK  is not set
> +# CONFIG_INLINE_SPIN_LOCK_BH is not set
> +#  CONFIG_INLINE_SPIN_LOCK_IRQ is not set
> +# CONFIG_INLINE_SPIN_LOCK_IRQSAVE is  not set
> +# CONFIG_INLINE_SPIN_UNLOCK is not set
> +#  CONFIG_INLINE_SPIN_UNLOCK_BH is not set
> +# CONFIG_INLINE_SPIN_UNLOCK_IRQ is  not set
> +# CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
> +#  CONFIG_INLINE_READ_TRYLOCK is not set
> +# CONFIG_INLINE_READ_LOCK is not  set
> +# CONFIG_INLINE_READ_LOCK_BH is not set
> +#  CONFIG_INLINE_READ_LOCK_IRQ is not set
> +# CONFIG_INLINE_READ_LOCK_IRQSAVE is  not set
> +# CONFIG_INLINE_READ_UNLOCK is not set
> +#  CONFIG_INLINE_READ_UNLOCK_BH is not set
> +# CONFIG_INLINE_READ_UNLOCK_IRQ is  not set
> +# CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
> +#  CONFIG_INLINE_WRITE_TRYLOCK is not set
> +# CONFIG_INLINE_WRITE_LOCK is not  set
> +# CONFIG_INLINE_WRITE_LOCK_BH is not set
> +#  CONFIG_INLINE_WRITE_LOCK_IRQ is not set
> +# CONFIG_INLINE_WRITE_LOCK_IRQSAVE  is not set
> +# CONFIG_INLINE_WRITE_UNLOCK is not set
> +#  CONFIG_INLINE_WRITE_UNLOCK_BH is not set
> +# CONFIG_INLINE_WRITE_UNLOCK_IRQ is  not set
> +# CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
> +#  CONFIG_MUTEX_SPIN_ON_OWNER is not set
> +# CONFIG_FREEZER is not  set
> +
> +#
> +# System Type
> +#
> +CONFIG_MMU=y
> +#  CONFIG_ARCH_AAEC2000 is not set
> +# CONFIG_ARCH_INTEGRATOR is not set
> +#  CONFIG_ARCH_REALVIEW is not set
> +# CONFIG_ARCH_VERSATILE is not set
> +#  CONFIG_ARCH_VEXPRESS is not set
> +# CONFIG_ARCH_AT91 is not set
> +#  CONFIG_ARCH_BCMRING is not set
> +# CONFIG_ARCH_CLPS711X is not set
> +#  CONFIG_ARCH_CNS3XXX is not set
> +# CONFIG_ARCH_GEMINI is not set
> +#  CONFIG_ARCH_EBSA110 is not set
> +# CONFIG_ARCH_EP93XX is not set
> +#  CONFIG_ARCH_FOOTBRIDGE is not set
> +# CONFIG_ARCH_MXC is not set
> +#  CONFIG_ARCH_STMP3XXX is not set
> +# CONFIG_ARCH_NETX is not set
> +#  CONFIG_ARCH_H720X is not set
> +# CONFIG_ARCH_IOP13XX is not set
> +#  CONFIG_ARCH_IOP32X is not set
> +# CONFIG_ARCH_IOP33X is not set
> +#  CONFIG_ARCH_IXP23XX is not set
> +# CONFIG_ARCH_IXP2000 is not set
> +#  CONFIG_ARCH_IXP4XX is not set
> +# CONFIG_ARCH_DOVE is not  set
> +CONFIG_ARCH_KIRKWOOD=y
> +# CONFIG_ARCH_LOKI is not set
> +#  CONFIG_ARCH_LPC32XX is not set
> +# CONFIG_ARCH_MV78XX0 is not set
> +#  CONFIG_ARCH_ORION5X is not set
> +# CONFIG_ARCH_MMP is not set
> +#  CONFIG_ARCH_KS8695 is not set
> +# CONFIG_ARCH_NS9XXX is not set
> +#  CONFIG_ARCH_W90X900 is not set
> +# CONFIG_ARCH_NUC93X is not set
> +#  CONFIG_ARCH_TEGRA is not set
> +# CONFIG_ARCH_PNX4008 is not set
> +#  CONFIG_ARCH_PXA is not set
> +# CONFIG_ARCH_MSM is not set
> +#  CONFIG_ARCH_SHMOBILE is not set
> +# CONFIG_ARCH_RPC is not set
> +#  CONFIG_ARCH_SA1100 is not set
> +# CONFIG_ARCH_S3C2410 is not set
> +#  CONFIG_ARCH_S3C64XX is not set
> +# CONFIG_ARCH_S5P6440 is not set
> +#  CONFIG_ARCH_S5P6442 is not set
> +# CONFIG_ARCH_S5PC100 is not set
> +#  CONFIG_ARCH_S5PV210 is not set
> +# CONFIG_ARCH_S5PV310 is not set
> +#  CONFIG_ARCH_SHARK is not set
> +# CONFIG_ARCH_LH7A40X is not set
> +#  CONFIG_ARCH_U300 is not set
> +# CONFIG_ARCH_U8500 is not set
> +#  CONFIG_ARCH_NOMADIK is not set
> +# CONFIG_ARCH_DAVINCI is not set
> +#  CONFIG_ARCH_OMAP is not set
> +# CONFIG_PLAT_SPEAR is not set
> +
> +#
> +#  Marvell Kirkwood Implementations
> +#
> +# CONFIG_MACH_DB88F6281_BP is not  set
> +# CONFIG_MACH_RD88F6192_NAS is not set
> +# CONFIG_MACH_RD88F6281 is  not set
> +# CONFIG_MACH_MV88F6281GTW_GE is not  set
> +CONFIG_MACH_SHEEVAPLUG=y
> +# CONFIG_MACH_ESATA_SHEEVAPLUG is not  set
> +# CONFIG_MACH_GURUPLUG is not set
> +# CONFIG_MACH_TS219 is not  set
> +# CONFIG_MACH_TS41X is not set
> +# CONFIG_MACH_OPENRD_BASE is not  set
> +# CONFIG_MACH_OPENRD_CLIENT is not set
> +# CONFIG_MACH_OPENRD_ULTIMATE  is not set
> +# CONFIG_MACH_NETSPACE_V2 is not set
> +#  CONFIG_MACH_INETSPACE_V2 is not set
> +# CONFIG_MACH_NETSPACE_MAX_V2 is not  set
> +# CONFIG_MACH_NET2BIG_V2 is not set
> +# CONFIG_MACH_NET5BIG_V2 is not  set
> +# CONFIG_MACH_T5325 is not set
> +CONFIG_PLAT_ORION=y
> +
> +#
> +#  Processor  Type
> +#
> +CONFIG_CPU_FEROCEON=y
> +CONFIG_CPU_FEROCEON_OLD_ID=y
> +CONFIG_CPU_32v5=y
> +CONFIG_CPU_ABRT_EV5T=y
> +CONFIG_CPU_PABRT_LEGACY=y
> +CONFIG_CPU_CACHE_VIVT=y
> +CONFIG_CPU_COPY_FEROCEON=y
> +CONFIG_CPU_TLB_FEROCEON=y
> +CONFIG_CPU_CP15=y
> +CONFIG_CPU_CP15_MMU=y
> +
> +#
> +#  Processor Features
> +#
> +CONFIG_ARM_THUMB=y
> +# CONFIG_CPU_ICACHE_DISABLE  is not set
> +# CONFIG_CPU_DCACHE_DISABLE is not  set
> +CONFIG_OUTER_CACHE=y
> +CONFIG_CACHE_FEROCEON_L2=y
> +#  CONFIG_CACHE_FEROCEON_L2_WRITETHROUGH is not  set
> +CONFIG_ARM_L1_CACHE_SHIFT=5
> +
> +#
> +# Bus  support
> +#
> +CONFIG_PCI=y
> +CONFIG_PCI_SYSCALL=y
> +#  CONFIG_ARCH_SUPPORTS_MSI is not set
> +# CONFIG_PCI_STUB is not set
> +#  CONFIG_PCI_IOV is not set
> +# CONFIG_PCCARD is not set
> +
> +#
> +# Kernel  Features
> +#
> +CONFIG_TICK_ONESHOT=y
> +CONFIG_NO_HZ=y
> +CONFIG_HIGH_RES_TIMERS=y
> +CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
> +CONFIG_VMSPLIT_3G=y
> +#  CONFIG_VMSPLIT_2G is not set
> +# CONFIG_VMSPLIT_1G is not  set
> +CONFIG_PAGE_OFFSET=0xC0000000
> +# CONFIG_PREEMPT_NONE is not set
> +#  CONFIG_PREEMPT_VOLUNTARY is not  set
> +CONFIG_PREEMPT=y
> +CONFIG_HZ=100
> +CONFIG_AEABI=y
> +#  CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
> +# CONFIG_ARCH_SELECT_MEMORY_MODEL  is not set
> +# CONFIG_SPARSE_IRQ is not  set
> +CONFIG_FLATMEM=y
> +CONFIG_FLAT_NODE_MEM_MAP=y
> +CONFIG_HAVE_MEMBLOCK=y
> +CONFIG_PAGEFLAGS_EXTENDED=y
> +CONFIG_SPLIT_PTLOCK_CPUS=999999
> +#  CONFIG_PHYS_ADDR_T_64BIT is not  set
> +CONFIG_ZONE_DMA_FLAG=0
> +CONFIG_VIRT_TO_BUS=y
> +# CONFIG_KSM is not  set
> +CONFIG_DEFAULT_MMAP_MIN_ADDR=32768
> +CONFIG_FORCE_MAX_ZONEORDER=11
> +CONFIG_ALIGNMENT_TRAP=y
> +#  CONFIG_CC_STACKPROTECTOR is not set
> +# CONFIG_DEPRECATED_PARAM_STRUCT is not  set
> +
> +#
> +# Boot  options
> +#
> +CONFIG_ZBOOT_ROM_TEXT=0x0
> +CONFIG_ZBOOT_ROM_BSS=0x0
> +CONFIG_CMDLINE="console=ttyS0,115200  mem=128M root=/dev/nfs 
>nfsroot=192.168.1.106:/exports/rootfs/rfs1  
>ip=192.168.1.254:192.168.1.106:192.168.1.1:255.255.255.0::eth0: debug  
>rootdelay=3"
> +# CONFIG_CMDLINE_FORCE is not set
> +# CONFIG_XIP_KERNEL is  not set
> +# CONFIG_AUTO_ZRELADDR is not set
> +
> +#
> +# CPU Power  Management
> +#
> +CONFIG_CPU_IDLE=y
> +CONFIG_CPU_IDLE_GOV_LADDER=y
> +CONFIG_CPU_IDLE_GOV_MENU=y
> +
> +#
> +#  Floating point emulation
> +#
> +
> +#
> +# At least one emulation must be  selected
> +#
> +CONFIG_VFP=y
> +
> +#
> +# Userspace binary  formats
> +#
> +CONFIG_BINFMT_ELF=y
> +# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS  is not set
> +CONFIG_HAVE_AOUT=y
> +# CONFIG_BINFMT_AOUT is not  set
> +CONFIG_BINFMT_MISC=m
> +
> +#
> +# Power management  options
> +#
> +CONFIG_PM=y
> +# CONFIG_PM_DEBUG is not set
> +#  CONFIG_SUSPEND is not set
> +# CONFIG_APM_EMULATION is not  set
> +CONFIG_PM_RUNTIME=y
> +CONFIG_PM_OPS=y
> +CONFIG_ARCH_SUSPEND_POSSIBLE=y
> +CONFIG_NET=y
> +
> +#
> +#  Networking  options
> +#
> +CONFIG_PACKET=y
> +CONFIG_UNIX=y
> +CONFIG_XFRM=y
> +CONFIG_XFRM_USER=m
> +CONFIG_XFRM_IPCOMP=m
> +CONFIG_NET_KEY=y
> +CONFIG_INET=y
> +CONFIG_IP_MULTICAST=y
> +CONFIG_IP_ADVANCED_ROUTER=y
> +CONFIG_ASK_IP_FIB_HASH=y
> +#  CONFIG_IP_FIB_TRIE is not  set
> +CONFIG_IP_FIB_HASH=y
> +CONFIG_IP_MULTIPLE_TABLES=y
> +#  CONFIG_IP_ROUTE_MULTIPATH is not  set
> +CONFIG_IP_ROUTE_VERBOSE=y
> +CONFIG_IP_PNP=y
> +CONFIG_IP_PNP_DHCP=y
> +CONFIG_IP_PNP_BOOTP=y
> +#  CONFIG_IP_PNP_RARP is not  set
> +CONFIG_NET_IPIP=m
> +CONFIG_NET_IPGRE=m
> +CONFIG_NET_IPGRE_BROADCAST=y
> +CONFIG_IP_MROUTE=y
> +#  CONFIG_IP_MROUTE_MULTIPLE_TABLES is not set
> +# CONFIG_IP_PIMSM_V1 is not  set
> +# CONFIG_IP_PIMSM_V2 is not set
> +# CONFIG_ARPD is not  set
> +CONFIG_SYN_COOKIES=y
> +CONFIG_INET_AH=m
> +CONFIG_INET_ESP=m
> +CONFIG_INET_IPCOMP=m
> +CONFIG_INET_XFRM_TUNNEL=m
> +CONFIG_INET_TUNNEL=m
> +CONFIG_INET_XFRM_MODE_TRANSPORT=m
> +CONFIG_INET_XFRM_MODE_TUNNEL=m
> +CONFIG_INET_XFRM_MODE_BEET=m
> +CONFIG_INET_LRO=y
> +CONFIG_INET_DIAG=y
> +CONFIG_INET_TCP_DIAG=y
> +#  CONFIG_TCP_CONG_ADVANCED is not  set
> +CONFIG_TCP_CONG_CUBIC=y
> +CONFIG_DEFAULT_TCP_CONG="cubic"
> +#  CONFIG_IPV6 is not set
> +CONFIG_NETWORK_SECMARK=y
> +CONFIG_NETFILTER=y
> +#  CONFIG_NETFILTER_DEBUG is not  set
> +CONFIG_NETFILTER_ADVANCED=y
> +CONFIG_BRIDGE_NETFILTER=y
> +
> +#
> +#  Core Netfilter Configuration
> +#
> +CONFIG_NETFILTER_NETLINK=m
> +#  CONFIG_NETFILTER_NETLINK_QUEUE is not  set
> +CONFIG_NETFILTER_NETLINK_LOG=m
> +CONFIG_NF_CONNTRACK=m
> +CONFIG_NF_CONNTRACK_MARK=y
> +#  CONFIG_NF_CONNTRACK_SECMARK is not set
> +# CONFIG_NF_CONNTRACK_EVENTS is not  set
> +CONFIG_NF_CT_PROTO_GRE=m
> +CONFIG_NF_CT_PROTO_UDPLITE=m
> +#  CONFIG_NF_CONNTRACK_AMANDA is not  set
> +CONFIG_NF_CONNTRACK_FTP=m
> +CONFIG_NF_CONNTRACK_H323=m
> +CONFIG_NF_CONNTRACK_IRC=m
> +CONFIG_NF_CONNTRACK_NETBIOS_NS=m
> +CONFIG_NF_CONNTRACK_PPTP=m
> +CONFIG_NF_CONNTRACK_SIP=m
> +CONFIG_NF_CONNTRACK_TFTP=m
> +#  CONFIG_NF_CT_NETLINK is not set
> +CONFIG_NETFILTER_XTABLES=m
> +
> +#
> +#  Xtables combined  modules
> +#
> +CONFIG_NETFILTER_XT_MARK=m
> +CONFIG_NETFILTER_XT_CONNMARK=m
> +
> +#
> +#  Xtables targets
> +#
> +# CONFIG_NETFILTER_XT_TARGET_CHECKSUM is not  set
> +CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
> +CONFIG_NETFILTER_XT_TARGET_CONNMARK=m
> +#  CONFIG_NETFILTER_XT_TARGET_CT is not  set
> +CONFIG_NETFILTER_XT_TARGET_DSCP=m
> +CONFIG_NETFILTER_XT_TARGET_HL=m
> +#  CONFIG_NETFILTER_XT_TARGET_IDLETIMER is not  set
> +CONFIG_NETFILTER_XT_TARGET_LED=m
> +CONFIG_NETFILTER_XT_TARGET_MARK=m
> +CONFIG_NETFILTER_XT_TARGET_NFLOG=m
> +CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
> +CONFIG_NETFILTER_XT_TARGET_NOTRACK=m
> +CONFIG_NETFILTER_XT_TARGET_RATEEST=m
> +#  CONFIG_NETFILTER_XT_TARGET_TEE is not  set
> +CONFIG_NETFILTER_XT_TARGET_TRACE=m
> +CONFIG_NETFILTER_XT_TARGET_SECMARK=m
> +CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
> +
> +#
> +#  Xtables  matches
> +#
> +CONFIG_NETFILTER_XT_MATCH_CLUSTER=m
> +CONFIG_NETFILTER_XT_MATCH_COMMENT=m
> +CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
> +CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=m
> +CONFIG_NETFILTER_XT_MATCH_CONNMARK=m
> +CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
> +#  CONFIG_NETFILTER_XT_MATCH_CPU is not  set
> +CONFIG_NETFILTER_XT_MATCH_DCCP=m
> +CONFIG_NETFILTER_XT_MATCH_DSCP=m
> +CONFIG_NETFILTER_XT_MATCH_ESP=m
> +CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=m
> +CONFIG_NETFILTER_XT_MATCH_HELPER=m
> +CONFIG_NETFILTER_XT_MATCH_HL=m
> +CONFIG_NETFILTER_XT_MATCH_IPRANGE=m
> +CONFIG_NETFILTER_XT_MATCH_LENGTH=m
> +CONFIG_NETFILTER_XT_MATCH_LIMIT=m
> +CONFIG_NETFILTER_XT_MATCH_MAC=m
> +CONFIG_NETFILTER_XT_MATCH_MARK=m
> +CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
> +CONFIG_NETFILTER_XT_MATCH_OSF=m
> +CONFIG_NETFILTER_XT_MATCH_OWNER=m
> +CONFIG_NETFILTER_XT_MATCH_POLICY=m
> +#  CONFIG_NETFILTER_XT_MATCH_PHYSDEV is not  set
> +CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
> +CONFIG_NETFILTER_XT_MATCH_QUOTA=m
> +CONFIG_NETFILTER_XT_MATCH_RATEEST=m
> +CONFIG_NETFILTER_XT_MATCH_REALM=m
> +CONFIG_NETFILTER_XT_MATCH_RECENT=m
> +CONFIG_NETFILTER_XT_MATCH_STATE=m
> +CONFIG_NETFILTER_XT_MATCH_STATISTIC=m
> +CONFIG_NETFILTER_XT_MATCH_STRING=m
> +CONFIG_NETFILTER_XT_MATCH_TCPMSS=m
> +CONFIG_NETFILTER_XT_MATCH_TIME=m
> +CONFIG_NETFILTER_XT_MATCH_U32=m
> +#  CONFIG_IP_VS is not set
> +
> +#
> +# IP: Netfilter  Configuration
> +#
> +CONFIG_NF_DEFRAG_IPV4=m
> +CONFIG_NF_CONNTRACK_IPV4=m
> +CONFIG_NF_CONNTRACK_PROC_COMPAT=y
> +#  CONFIG_IP_NF_QUEUE is not  set
> +CONFIG_IP_NF_IPTABLES=m
> +CONFIG_IP_NF_MATCH_ADDRTYPE=m
> +CONFIG_IP_NF_MATCH_AH=m
> +CONFIG_IP_NF_MATCH_ECN=m
> +CONFIG_IP_NF_MATCH_TTL=m
> +CONFIG_IP_NF_FILTER=m
> +CONFIG_IP_NF_TARGET_REJECT=m
> +CONFIG_IP_NF_TARGET_LOG=m
> +CONFIG_IP_NF_TARGET_ULOG=m
> +CONFIG_NF_NAT=m
> +CONFIG_NF_NAT_NEEDED=y
> +CONFIG_IP_NF_TARGET_MASQUERADE=m
> +CONFIG_IP_NF_TARGET_NETMAP=m
> +CONFIG_IP_NF_TARGET_REDIRECT=m
> +CONFIG_NF_NAT_SNMP_BASIC=m
> +CONFIG_NF_NAT_PROTO_GRE=m
> +CONFIG_NF_NAT_PROTO_UDPLITE=m
> +CONFIG_NF_NAT_FTP=m
> +CONFIG_NF_NAT_IRC=m
> +CONFIG_NF_NAT_TFTP=m
> +#  CONFIG_NF_NAT_AMANDA is not  set
> +CONFIG_NF_NAT_PPTP=m
> +CONFIG_NF_NAT_H323=m
> +CONFIG_NF_NAT_SIP=m
> +CONFIG_IP_NF_MANGLE=m
> +CONFIG_IP_NF_TARGET_ECN=m
> +CONFIG_IP_NF_TARGET_TTL=m
> +CONFIG_IP_NF_RAW=m
> +CONFIG_IP_NF_ARPTABLES=m
> +CONFIG_IP_NF_ARPFILTER=m
> +CONFIG_IP_NF_ARP_MANGLE=m
> +CONFIG_BRIDGE_NF_EBTABLES=m
> +CONFIG_BRIDGE_EBT_BROUTE=m
> +CONFIG_BRIDGE_EBT_T_FILTER=m
> +CONFIG_BRIDGE_EBT_T_NAT=m
> +CONFIG_BRIDGE_EBT_802_3=m
> +CONFIG_BRIDGE_EBT_AMONG=m
> +CONFIG_BRIDGE_EBT_ARP=m
> +CONFIG_BRIDGE_EBT_IP=m
> +CONFIG_BRIDGE_EBT_LIMIT=m
> +CONFIG_BRIDGE_EBT_MARK=m
> +CONFIG_BRIDGE_EBT_PKTTYPE=m
> +CONFIG_BRIDGE_EBT_STP=m
> +CONFIG_BRIDGE_EBT_VLAN=m
> +CONFIG_BRIDGE_EBT_ARPREPLY=m
> +CONFIG_BRIDGE_EBT_DNAT=m
> +CONFIG_BRIDGE_EBT_MARK_T=m
> +CONFIG_BRIDGE_EBT_REDIRECT=m
> +CONFIG_BRIDGE_EBT_SNAT=m
> +CONFIG_BRIDGE_EBT_LOG=m
> +CONFIG_BRIDGE_EBT_ULOG=m
> +CONFIG_BRIDGE_EBT_NFLOG=m
> +#  CONFIG_ATM is not set
> +# CONFIG_L2TP is not  set
> +CONFIG_STP=m
> +CONFIG_GARP=m
> +CONFIG_BRIDGE=m
> +CONFIG_BRIDGE_IGMP_SNOOPING=y
> +CONFIG_VLAN_8021Q=m
> +CONFIG_VLAN_8021Q_GVRP=y
> +#  CONFIG_DECNET is not set
> +CONFIG_LLC=m
> +# CONFIG_LLC2 is not set
> +#  CONFIG_IPX is not set
> +# CONFIG_ATALK is not set
> +# CONFIG_PHONET is not  set
> +CONFIG_NET_SCHED=y
> +
> +#
> +#  Queueing/Scheduling
> +#
> +CONFIG_NET_SCH_CBQ=m
> +CONFIG_NET_SCH_HTB=m
> +CONFIG_NET_SCH_HFSC=m
> +CONFIG_NET_SCH_PRIO=m
> +CONFIG_NET_SCH_MULTIQ=m
> +CONFIG_NET_SCH_RED=m
> +CONFIG_NET_SCH_SFQ=m
> +CONFIG_NET_SCH_TEQL=m
> +CONFIG_NET_SCH_TBF=m
> +CONFIG_NET_SCH_GRED=m
> +CONFIG_NET_SCH_DSMARK=m
> +CONFIG_NET_SCH_NETEM=m
> +CONFIG_NET_SCH_DRR=m
> +#  CONFIG_NET_SCH_INGRESS is not set
> +
> +#
> +#  Classification
> +#
> +CONFIG_NET_CLS=y
> +CONFIG_NET_CLS_BASIC=m
> +CONFIG_NET_CLS_TCINDEX=m
> +CONFIG_NET_CLS_ROUTE4=m
> +CONFIG_NET_CLS_ROUTE=y
> +CONFIG_NET_CLS_FW=m
> +CONFIG_NET_CLS_U32=m
> +CONFIG_CLS_U32_PERF=y
> +CONFIG_CLS_U32_MARK=y
> +CONFIG_NET_CLS_RSVP=m
> +CONFIG_NET_CLS_RSVP6=m
> +CONFIG_NET_CLS_FLOW=m
> +CONFIG_NET_EMATCH=y
> +CONFIG_NET_EMATCH_STACK=32
> +CONFIG_NET_EMATCH_CMP=m
> +CONFIG_NET_EMATCH_NBYTE=m
> +CONFIG_NET_EMATCH_U32=m
> +CONFIG_NET_EMATCH_META=m
> +CONFIG_NET_EMATCH_TEXT=m
> +CONFIG_NET_CLS_ACT=y
> +#  CONFIG_NET_ACT_POLICE is not set
> +# CONFIG_NET_ACT_GACT is not set
> +#  CONFIG_NET_ACT_MIRRED is not set
> +# CONFIG_NET_ACT_IPT is not set
> +#  CONFIG_NET_ACT_NAT is not set
> +# CONFIG_NET_ACT_PEDIT is not set
> +#  CONFIG_NET_ACT_SIMP is not set
> +# CONFIG_NET_ACT_SKBEDIT is not set
> +#  CONFIG_NET_CLS_IND is not set
> +CONFIG_NET_SCH_FIFO=y
> +# CONFIG_DCB is not  set
> +
> +#
> +# Network testing
> +#
> +CONFIG_NET_PKTGEN=m
> +#  CONFIG_HAMRADIO is not set
> +# CONFIG_CAN is not set
> +# CONFIG_IRDA is not  set
> +# CONFIG_BT is not  set
> +CONFIG_FIB_RULES=y
> +CONFIG_WIRELESS=y
> +CONFIG_WEXT_CORE=y
> +CONFIG_WEXT_PROC=y
> +CONFIG_CFG80211=m
> +#  CONFIG_NL80211_TESTMODE is not set
> +# CONFIG_CFG80211_DEVELOPER_WARNINGS is  not set
> +# CONFIG_CFG80211_REG_DEBUG is not  set
> +CONFIG_CFG80211_DEFAULT_PS=y
> +# CONFIG_CFG80211_INTERNAL_REGDB is not  set
> +CONFIG_CFG80211_WEXT=y
> +CONFIG_WIRELESS_EXT_SYSFS=y
> +CONFIG_LIB80211=m
> +#  CONFIG_LIB80211_DEBUG is not  set
> +CONFIG_MAC80211=m
> +CONFIG_MAC80211_HAS_RC=y
> +#  CONFIG_MAC80211_RC_PID is not  set
> +CONFIG_MAC80211_RC_MINSTREL=y
> +CONFIG_MAC80211_RC_MINSTREL_HT=y
> +CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
> +CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"
> +#  CONFIG_MAC80211_LEDS is not set
> +# CONFIG_MAC80211_DEBUG_MENU is not  set
> +# CONFIG_WIMAX is not set
> +# CONFIG_RFKILL is not set
> +#  CONFIG_CAIF is not set
> +
> +#
> +# Device Drivers
> +#
> +
> +#
> +#  Generic Driver Options
> +#
> +CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
> +#  CONFIG_DEVTMPFS is not  set
> +CONFIG_STANDALONE=y
> +CONFIG_PREVENT_FIRMWARE_BUILD=y
> +CONFIG_FW_LOADER=y
> +CONFIG_FIRMWARE_IN_KERNEL=y
> +CONFIG_EXTRA_FIRMWARE=""
> +#  CONFIG_SYS_HYPERVISOR is not set
> +# CONFIG_CONNECTOR is not  set
> +CONFIG_MTD=y
> +# CONFIG_MTD_DEBUG is not set
> +# CONFIG_MTD_TESTS is  not set
> +# CONFIG_MTD_CONCAT is not set
> +CONFIG_MTD_PARTITIONS=y
> +#  CONFIG_MTD_REDBOOT_PARTS is not set
> +CONFIG_MTD_CMDLINE_PARTS=y
> +#  CONFIG_MTD_AFS_PARTS is not set
> +# CONFIG_MTD_AR7_PARTS is not  set
> +
> +#
> +# User Modules And Translation  Layers
> +#
> +CONFIG_MTD_CHAR=y
> +CONFIG_MTD_BLKDEVS=y
> +CONFIG_MTD_BLOCK=y
> +#  CONFIG_FTL is not set
> +# CONFIG_NFTL is not set
> +# CONFIG_INFTL is not  set
> +# CONFIG_RFD_FTL is not set
> +# CONFIG_SSFDC is not set
> +#  CONFIG_MTD_OOPS is not set
> +
> +#
> +# RAM/ROM/Flash chip  drivers
> +#
> +CONFIG_MTD_CFI=y
> +CONFIG_MTD_JEDECPROBE=y
> +CONFIG_MTD_GEN_PROBE=y
> +CONFIG_MTD_CFI_ADV_OPTIONS=y
> +CONFIG_MTD_CFI_NOSWAP=y
> +#  CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
> +# CONFIG_MTD_CFI_LE_BYTE_SWAP is not  set
> +CONFIG_MTD_CFI_GEOMETRY=y
> +CONFIG_MTD_MAP_BANK_WIDTH_1=y
> +CONFIG_MTD_MAP_BANK_WIDTH_2=y
> +#  CONFIG_MTD_MAP_BANK_WIDTH_4 is not set
> +# CONFIG_MTD_MAP_BANK_WIDTH_8 is not  set
> +# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
> +#  CONFIG_MTD_MAP_BANK_WIDTH_32 is not  set
> +CONFIG_MTD_CFI_I1=y
> +CONFIG_MTD_CFI_I2=y
> +# CONFIG_MTD_CFI_I4 is  not set
> +# CONFIG_MTD_CFI_I8 is not set
> +# CONFIG_MTD_OTP is not  set
> +CONFIG_MTD_CFI_INTELEXT=y
> +# CONFIG_MTD_CFI_AMDSTD is not  set
> +CONFIG_MTD_CFI_STAA=y
> +CONFIG_MTD_CFI_UTIL=y
> +# CONFIG_MTD_RAM is  not set
> +# CONFIG_MTD_ROM is not set
> +# CONFIG_MTD_ABSENT is not  set
> +
> +#
> +# Mapping drivers for chip access
> +#
> +#  CONFIG_MTD_COMPLEX_MAPPINGS is not set
> +CONFIG_MTD_PHYSMAP=y
> +#  CONFIG_MTD_PHYSMAP_COMPAT is not set
> +# CONFIG_MTD_ARM_INTEGRATOR is not  set
> +# CONFIG_MTD_IMPA7 is not set
> +# CONFIG_MTD_INTEL_VR_NOR is not  set
> +# CONFIG_MTD_PLATRAM is not set
> +
> +#
> +# Self-contained MTD  device drivers
> +#
> +# CONFIG_MTD_PMC551 is not set
> +# CONFIG_MTD_SLRAM  is not set
> +# CONFIG_MTD_PHRAM is not set
> +# CONFIG_MTD_MTDRAM is not  set
> +# CONFIG_MTD_BLOCK2MTD is not set
> +
> +#
> +# Disk-On-Chip Device  Drivers
> +#
> +# CONFIG_MTD_DOC2000 is not set
> +# CONFIG_MTD_DOC2001 is  not set
> +# CONFIG_MTD_DOC2001PLUS is not set
> +CONFIG_MTD_NAND_ECC=y
> +#  CONFIG_MTD_NAND_ECC_SMC is not set
> +CONFIG_MTD_NAND=y
> +#  CONFIG_MTD_NAND_VERIFY_WRITE is not set
> +# CONFIG_MTD_SM_COMMON is not  set
> +# CONFIG_MTD_NAND_MUSEUM_IDS is not set
> +# CONFIG_MTD_NAND_DENALI is  not set
> +# CONFIG_MTD_NAND_GPIO is not set
> +CONFIG_MTD_NAND_IDS=y
> +#  CONFIG_MTD_NAND_RICOH is not set
> +# CONFIG_MTD_NAND_CAFE is not set
> +#  CONFIG_MTD_NAND_NANDSIM is not set
> +# CONFIG_MTD_NAND_PLATFORM is not  set
> +# CONFIG_MTD_ALAUDA is not set
> +CONFIG_MTD_NAND_ORION=y
> +#  CONFIG_MTD_ONENAND is not set
> +
> +#
> +# LPDDR flash memory  drivers
> +#
> +# CONFIG_MTD_LPDDR is not set
> +
> +#
> +# UBI - Unsorted  block  images
> +#
> +CONFIG_MTD_UBI=m
> +CONFIG_MTD_UBI_WL_THRESHOLD=4096
> +CONFIG_MTD_UBI_BEB_RESERVE=1
> +#  CONFIG_MTD_UBI_GLUEBI is not set
> +
> +#
> +# UBI debugging  options
> +#
> +# CONFIG_MTD_UBI_DEBUG is not set
> +# CONFIG_PARPORT is not  set
> +CONFIG_BLK_DEV=y
> +# CONFIG_BLK_CPQ_DA is not set
> +#  CONFIG_BLK_CPQ_CISS_DA is not set
> +# CONFIG_BLK_DEV_DAC960 is not set
> +#  CONFIG_BLK_DEV_COW_COMMON is not  set
> +CONFIG_BLK_DEV_LOOP=m
> +CONFIG_BLK_DEV_CRYPTOLOOP=m
> +
> +#
> +#  DRBD disabled because PROC_FS, INET or CONNECTOR not selected
> +#
> +#  CONFIG_BLK_DEV_NBD is not set
> +# CONFIG_BLK_DEV_SX8 is not set
> +#  CONFIG_BLK_DEV_UB is not set
> +# CONFIG_BLK_DEV_RAM is not  set
> +CONFIG_CDROM_PKTCDVD=m
> +CONFIG_CDROM_PKTCDVD_BUFFERS=8
> +#  CONFIG_ATA_OVER_ETH is not set
> +# CONFIG_MG_DISK is not set
> +#  CONFIG_MISC_DEVICES is not set
> +CONFIG_HAVE_IDE=y
> +# CONFIG_IDE is not  set
> +
> +#
> +# SCSI device support
> +#
> +CONFIG_SCSI_MOD=y
> +#  CONFIG_RAID_ATTRS is not set
> +CONFIG_SCSI=y
> +CONFIG_SCSI_DMA=y
> +#  CONFIG_SCSI_NETLINK is not set
> +# CONFIG_SCSI_PROC_FS is not  set
> +
> +#
> +# SCSI support type (disk, tape,  CD-ROM)
> +#
> +CONFIG_BLK_DEV_SD=y
> +# CONFIG_CHR_DEV_ST is not set
> +#  CONFIG_CHR_DEV_OSST is not set
> +# CONFIG_BLK_DEV_SR is not set
> +#  CONFIG_CHR_DEV_SG is not set
> +# CONFIG_CHR_DEV_SCH is not  set
> +CONFIG_SCSI_MULTI_LUN=y
> +CONFIG_SCSI_CONSTANTS=y
> +#  CONFIG_SCSI_LOGGING is not set
> +# CONFIG_SCSI_SCAN_ASYNC is not  set
> +CONFIG_SCSI_WAIT_SCAN=m
> +
> +#
> +# SCSI Transports
> +#
> +#  CONFIG_SCSI_SPI_ATTRS is not set
> +# CONFIG_SCSI_FC_ATTRS is not set
> +#  CONFIG_SCSI_ISCSI_ATTRS is not set
> +# CONFIG_SCSI_SAS_LIBSAS is not set
> +#  CONFIG_SCSI_SRP_ATTRS is not set
> +# CONFIG_SCSI_LOWLEVEL is not set
> +#  CONFIG_SCSI_DH is not set
> +# CONFIG_SCSI_OSD_INITIATOR is not set
> +#  CONFIG_ATA is not set
> +# CONFIG_MD is not set
> +# CONFIG_FUSION is not  set
> +
> +#
> +# IEEE 1394 (FireWire) support
> +#
> +
> +#
> +# You can  enable one or both FireWire driver stacks.
> +#
> +
> +#
> +# The newer  stack is recommended.
> +#
> +# CONFIG_FIREWIRE is not set
> +#  CONFIG_IEEE1394 is not set
> +# CONFIG_FIREWIRE_NOSY is not set
> +#  CONFIG_I2O is not set
> +CONFIG_NETDEVICES=y
> +# CONFIG_IFB is not set
> +#  CONFIG_DUMMY is not set
> +# CONFIG_BONDING is not set
> +# CONFIG_EQUALIZER  is not set
> +CONFIG_TUN=m
> +# CONFIG_VETH is not set
> +# CONFIG_ARCNET is  not set
> +CONFIG_PHYLIB=y
> +
> +#
> +# MII PHY device  drivers
> +#
> +CONFIG_MARVELL_PHY=y
> +# CONFIG_DAVICOM_PHY is not set
> +#  CONFIG_QSEMI_PHY is not set
> +# CONFIG_LXT_PHY is not set
> +#  CONFIG_CICADA_PHY is not set
> +# CONFIG_VITESSE_PHY is not set
> +#  CONFIG_SMSC_PHY is not set
> +# CONFIG_BROADCOM_PHY is not set
> +#  CONFIG_ICPLUS_PHY is not set
> +# CONFIG_REALTEK_PHY is not set
> +#  CONFIG_NATIONAL_PHY is not set
> +# CONFIG_STE10XP is not set
> +#  CONFIG_LSI_ET1011C_PHY is not set
> +# CONFIG_MICREL_PHY is not set
> +#  CONFIG_FIXED_PHY is not set
> +# CONFIG_MDIO_BITBANG is not set
> +#  CONFIG_NET_ETHERNET is not set
> +CONFIG_MII=m
> +CONFIG_NETDEV_1000=y
> +#  CONFIG_ACENIC is not set
> +# CONFIG_DL2K is not set
> +# CONFIG_E1000 is not  set
> +# CONFIG_E1000E is not set
> +# CONFIG_IGB is not set
> +#  CONFIG_IGBVF is not set
> +# CONFIG_NS83820 is not set
> +# CONFIG_HAMACHI is  not set
> +# CONFIG_R8169 is not set
> +# CONFIG_SIS190 is not set
> +#  CONFIG_SKGE is not set
> +# CONFIG_SKY2 is not set
> +# CONFIG_VIA_VELOCITY is  not set
> +# CONFIG_TIGON3 is not set
> +# CONFIG_BNX2 is not set
> +#  CONFIG_CNIC is not set
> +CONFIG_MV643XX_ETH=y
> +# CONFIG_QLA3XXX is not  set
> +# CONFIG_ATL1 is not set
> +# CONFIG_JME is not set
> +#  CONFIG_NETDEV_10000 is not set
> +# CONFIG_TR is not set
> +# CONFIG_WLAN is  not set
> +
> +#
> +# Enable WiMAX (Networking options) to see the WiMAX  drivers
> +#
> +
> +#
> +# USB Network Adapters
> +#
> +#  CONFIG_USB_KAWETH is not set
> +# CONFIG_USB_PEGASUS is not  set
> +CONFIG_USB_USBNET=m
> +# CONFIG_USB_NET_AX8817X is not set
> +#  CONFIG_USB_NET_CDCETHER is not set
> +# CONFIG_USB_NET_DM9601 is not set
> +#  CONFIG_USB_NET_SMSC75XX is not set
> +# CONFIG_USB_NET_SMSC95XX is not  set
> +# CONFIG_USB_NET_GL620A is not set
> +# CONFIG_USB_NET_NET1080 is not  set
> +CONFIG_USB_NET_MCS7830=m
> +# CONFIG_USB_NET_CDC_SUBSET is not  set
> +# CONFIG_USB_NET_ZAURUS is not set
> +# CONFIG_USB_NET_INT51X1 is not  set
> +# CONFIG_USB_IPHETH is not set
> +# CONFIG_USB_SIERRA_NET is not  set
> +# CONFIG_WAN is not set
> +
> +#
> +# CAIF transport  drivers
> +#
> +# CONFIG_FDDI is not set
> +# CONFIG_PPP is not set
> +#  CONFIG_SLIP is not set
> +# CONFIG_NET_FC is not set
> +# CONFIG_NETCONSOLE is  not set
> +# CONFIG_NETPOLL is not set
> +# CONFIG_NET_POLL_CONTROLLER is not  set
> +# CONFIG_VMXNET3 is not set
> +# CONFIG_ISDN is not set
> +#  CONFIG_PHONE is not set
> +
> +#
> +# Input device  support
> +#
> +CONFIG_INPUT=y
> +# CONFIG_INPUT_FF_MEMLESS is not set
> +#  CONFIG_INPUT_POLLDEV is not set
> +# CONFIG_INPUT_SPARSEKMAP is not  set
> +
> +#
> +# Userland interfaces
> +#
> +# CONFIG_INPUT_MOUSEDEV is  not set
> +# CONFIG_INPUT_JOYDEV is not set
> +CONFIG_INPUT_EVDEV=m
> +#  CONFIG_INPUT_EVBUG is not set
> +
> +#
> +# Input Device Drivers
> +#
> +#  CONFIG_INPUT_KEYBOARD is not set
> +# CONFIG_INPUT_MOUSE is not set
> +#  CONFIG_INPUT_JOYSTICK is not set
> +# CONFIG_INPUT_TABLET is not set
> +#  CONFIG_INPUT_TOUCHSCREEN is not set
> +# CONFIG_INPUT_MISC is not  set
> +
> +#
> +# Hardware I/O ports
> +#
> +CONFIG_SERIO=y
> +#  CONFIG_SERIO_SERPORT is not set
> +# CONFIG_SERIO_PCIPS2 is not set
> +#  CONFIG_SERIO_LIBPS2 is not set
> +# CONFIG_SERIO_RAW is not set
> +#  CONFIG_SERIO_ALTERA_PS2 is not set
> +# CONFIG_GAMEPORT is not  set
> +
> +#
> +# Character  devices
> +#
> +CONFIG_VT=y
> +CONFIG_CONSOLE_TRANSLATIONS=y
> +CONFIG_VT_CONSOLE=y
> +CONFIG_HW_CONSOLE=y
> +#  CONFIG_VT_HW_CONSOLE_BINDING is not set
> +# CONFIG_DEVKMEM is not set
> +#  CONFIG_SERIAL_NONSTANDARD is not set
> +
> +#
> +# Serial  drivers
> +#
> +CONFIG_SERIAL_8250=y
> +CONFIG_SERIAL_8250_CONSOLE=y
> +CONFIG_SERIAL_8250_PCI=y
> +CONFIG_SERIAL_8250_NR_UARTS=4
> +CONFIG_SERIAL_8250_RUNTIME_UARTS=2
> +#  CONFIG_SERIAL_8250_EXTENDED is not set
> +
> +#
> +# Non-8250 serial port  support
> +#
> +# CONFIG_SERIAL_MFD_HSU is not  set
> +CONFIG_SERIAL_CORE=y
> +CONFIG_SERIAL_CORE_CONSOLE=y
> +#  CONFIG_SERIAL_JSM is not set
> +# CONFIG_SERIAL_TIMBERDALE is not set
> +#  CONFIG_SERIAL_ALTERA_JTAGUART is not set
> +# CONFIG_SERIAL_ALTERA_UART is not  set
> +CONFIG_UNIX98_PTYS=y
> +# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not  set
> +# CONFIG_LEGACY_PTYS is not set
> +# CONFIG_IPMI_HANDLER is not  set
> +# CONFIG_HW_RANDOM is not set
> +# CONFIG_R3964 is not set
> +#  CONFIG_APPLICOM is not set
> +# CONFIG_RAW_DRIVER is not  set
> +CONFIG_DEVPORT=y
> +# CONFIG_RAMOOPS is not set
> +# CONFIG_I2C is not  set
> +# CONFIG_SPI is not set
> +
> +#
> +# PPS  support
> +#
> +CONFIG_ARCH_REQUIRE_GPIOLIB=y
> +CONFIG_GPIOLIB=y
> +
> +#
> +#  Memory mapped GPIO expanders:
> +#
> +# CONFIG_GPIO_IT8761E is not set
> +#  CONFIG_GPIO_SCH is not set
> +
> +#
> +# I2C GPIO expanders:
> +#
> +#  CONFIG_GPIO_MAX7300 is not set
> +# CONFIG_GPIO_MAX732X is not set
> +#  CONFIG_GPIO_PCA953X is not set
> +# CONFIG_GPIO_PCF857X is not set
> +#  CONFIG_GPIO_ADP5588 is not set
> +
> +#
> +# PCI GPIO expanders:
> +#
> +#  CONFIG_GPIO_CS5535 is not set
> +# CONFIG_GPIO_BT8XX is not set
> +#  CONFIG_GPIO_LANGWELL is not set
> +# CONFIG_GPIO_RDC321X is not  set
> +
> +#
> +# SPI GPIO expanders:
> +#
> +
> +#
> +# AC97 GPIO  expanders:
> +#
> +
> +#
> +# MODULbus GPIO expanders:
> +#
> +# CONFIG_W1  is not set
> +# CONFIG_POWER_SUPPLY is not set
> +# CONFIG_HWMON is not  set
> +# CONFIG_THERMAL is not set
> +CONFIG_WATCHDOG=y
> +#  CONFIG_WATCHDOG_NOWAYOUT is not set
> +
> +#
> +# Watchdog Device  Drivers
> +#
> +CONFIG_SOFT_WATCHDOG=m
> +CONFIG_ORION_WATCHDOG=m
> +#  CONFIG_MAX63XX_WATCHDOG is not set
> +# CONFIG_ALIM7101_WDT is not  set
> +
> +#
> +# PCI-based Watchdog Cards
> +#
> +# CONFIG_PCIPCWATCHDOG  is not set
> +# CONFIG_WDTPCI is not set
> +
> +#
> +# USB-based Watchdog  Cards
> +#
> +# CONFIG_USBPCWATCHDOG is not  set
> +CONFIG_SSB_POSSIBLE=y
> +
> +#
> +# Sonics Silicon  Backplane
> +#
> +# CONFIG_SSB is not set
> +# CONFIG_MFD_SUPPORT is not  set
> +# CONFIG_REGULATOR is not set
> +# CONFIG_MEDIA_SUPPORT is not  set
> +
> +#
> +# Graphics support
> +#
> +# CONFIG_VGA_ARB is not  set
> +# CONFIG_DRM is not set
> +# CONFIG_VGASTATE is not set
> +#  CONFIG_VIDEO_OUTPUT_CONTROL is not set
> +# CONFIG_FB is not set
> +#  CONFIG_BACKLIGHT_LCD_SUPPORT is not set
> +
> +#
> +# Display device  support
> +#
> +# CONFIG_DISPLAY_SUPPORT is not set
> +
> +#
> +# Console  display driver support
> +#
> +CONFIG_DUMMY_CONSOLE=y
> +# CONFIG_SOUND is  not set
> +# CONFIG_HID_SUPPORT is not  set
> +CONFIG_USB_SUPPORT=y
> +CONFIG_USB_ARCH_HAS_HCD=y
> +CONFIG_USB_ARCH_HAS_OHCI=y
> +CONFIG_USB_ARCH_HAS_EHCI=y
> +CONFIG_USB=y
> +#  CONFIG_USB_DEBUG is not  set
> +CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
> +
> +#
> +# Miscellaneous USB  options
> +#
> +# CONFIG_USB_DEVICEFS is not set
> +# CONFIG_USB_DEVICE_CLASS  is not set
> +# CONFIG_USB_DYNAMIC_MINORS is not  set
> +CONFIG_USB_SUSPEND=y
> +# CONFIG_USB_OTG_WHITELIST is not set
> +#  CONFIG_USB_OTG_BLACKLIST_HUB is not set
> +CONFIG_USB_MON=m
> +#  CONFIG_USB_WUSB_CBAF is not set
> +
> +#
> +# USB Host Controller  Drivers
> +#
> +# CONFIG_USB_C67X00_HCD is not  set
> +CONFIG_USB_EHCI_HCD=y
> +CONFIG_USB_EHCI_ROOT_HUB_TT=y
> +CONFIG_USB_EHCI_TT_NEWSCHED=y
> +#  CONFIG_USB_OXU210HP_HCD is not set
> +# CONFIG_USB_ISP116X_HCD is not  set
> +# CONFIG_USB_ISP1362_HCD is not set
> +# CONFIG_USB_OHCI_HCD is not  set
> +# CONFIG_USB_UHCI_HCD is not set
> +# CONFIG_USB_SL811_HCD is not  set
> +# CONFIG_USB_R8A66597_HCD is not set
> +# CONFIG_USB_MUSB_HDRC is not  set
> +
> +#
> +# USB Device Class drivers
> +#
> +# CONFIG_USB_ACM is not  set
> +CONFIG_USB_PRINTER=m
> +# CONFIG_USB_WDM is not set
> +#  CONFIG_USB_TMC is not set
> +
> +#
> +# NOTE: USB_STORAGE depends on SCSI but  BLK_DEV_SD may
> +#
> +
> +#
> +# also be needed; see USB_STORAGE Help for  more info
> +#
> +CONFIG_USB_STORAGE=y
> +# CONFIG_USB_STORAGE_DEBUG is not  set
> +# CONFIG_USB_STORAGE_DATAFAB is not set
> +# CONFIG_USB_STORAGE_FREECOM  is not set
> +# CONFIG_USB_STORAGE_ISD200 is not set
> +#  CONFIG_USB_STORAGE_USBAT is not set
> +# CONFIG_USB_STORAGE_SDDR09 is not  set
> +# CONFIG_USB_STORAGE_SDDR55 is not set
> +# CONFIG_USB_STORAGE_JUMPSHOT  is not set
> +# CONFIG_USB_STORAGE_ALAUDA is not set
> +#  CONFIG_USB_STORAGE_ONETOUCH is not set
> +# CONFIG_USB_STORAGE_KARMA is not  set
> +# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
> +# CONFIG_USB_LIBUSUAL  is not set
> +
> +#
> +# USB Imaging devices
> +#
> +# CONFIG_USB_MDC800 is  not set
> +# CONFIG_USB_MICROTEK is not set
> +
> +#
> +# USB port  drivers
> +#
> +CONFIG_USB_SERIAL=m
> +# CONFIG_USB_EZUSB is not  set
> +CONFIG_USB_SERIAL_GENERIC=y
> +# CONFIG_USB_SERIAL_AIRCABLE is not  set
> +# CONFIG_USB_SERIAL_ARK3116 is not set
> +# CONFIG_USB_SERIAL_BELKIN is  not set
> +# CONFIG_USB_SERIAL_CH341 is not set
> +#  CONFIG_USB_SERIAL_WHITEHEAT is not set
> +# CONFIG_USB_SERIAL_DIGI_ACCELEPORT  is not set
> +# CONFIG_USB_SERIAL_CP210X is not set
> +#  CONFIG_USB_SERIAL_CYPRESS_M8 is not set
> +# CONFIG_USB_SERIAL_EMPEG is not  set
> +CONFIG_USB_SERIAL_FTDI_SIO=m
> +# CONFIG_USB_SERIAL_FUNSOFT is not  set
> +# CONFIG_USB_SERIAL_VISOR is not set
> +# CONFIG_USB_SERIAL_IPAQ is not  set
> +# CONFIG_USB_SERIAL_IR is not set
> +# CONFIG_USB_SERIAL_EDGEPORT is  not set
> +# CONFIG_USB_SERIAL_EDGEPORT_TI is not set
> +#  CONFIG_USB_SERIAL_GARMIN is not set
> +# CONFIG_USB_SERIAL_IPW is not set
> +#  CONFIG_USB_SERIAL_IUU is not set
> +# CONFIG_USB_SERIAL_KEYSPAN_PDA is not  set
> +# CONFIG_USB_SERIAL_KEYSPAN is not set
> +# CONFIG_USB_SERIAL_KLSI is  not set
> +# CONFIG_USB_SERIAL_KOBIL_SCT is not set
> +#  CONFIG_USB_SERIAL_MCT_U232 is not set
> +# CONFIG_USB_SERIAL_MOS7720 is not  set
> +# CONFIG_USB_SERIAL_MOS7840 is not set
> +# CONFIG_USB_SERIAL_MOTOROLA  is not set
> +# CONFIG_USB_SERIAL_NAVMAN is not  set
> +CONFIG_USB_SERIAL_PL2303=m
> +# CONFIG_USB_SERIAL_OTI6858 is not  set
> +# CONFIG_USB_SERIAL_QCAUX is not set
> +# CONFIG_USB_SERIAL_QUALCOMM is  not set
> +# CONFIG_USB_SERIAL_SPCP8X5 is not set
> +# CONFIG_USB_SERIAL_HP4X  is not set
> +# CONFIG_USB_SERIAL_SAFE is not set
> +#  CONFIG_USB_SERIAL_SIEMENS_MPI is not set
> +# CONFIG_USB_SERIAL_SIERRAWIRELESS  is not set
> +# CONFIG_USB_SERIAL_SYMBOL is not set
> +# CONFIG_USB_SERIAL_TI  is not set
> +# CONFIG_USB_SERIAL_CYBERJACK is not set
> +#  CONFIG_USB_SERIAL_XIRCOM is not set
> +# CONFIG_USB_SERIAL_OPTION is not  set
> +# CONFIG_USB_SERIAL_OMNINET is not set
> +# CONFIG_USB_SERIAL_OPTICON  is not set
> +# CONFIG_USB_SERIAL_VIVOPAY_SERIAL is not set
> +#  CONFIG_USB_SERIAL_ZIO is not set
> +# CONFIG_USB_SERIAL_SSU100 is not set
> +#  CONFIG_USB_SERIAL_DEBUG is not set
> +
> +#
> +# USB Miscellaneous  drivers
> +#
> +# CONFIG_USB_EMI62 is not set
> +# CONFIG_USB_EMI26 is not  set
> +# CONFIG_USB_ADUTUX is not set
> +# CONFIG_USB_SEVSEG is not set
> +#  CONFIG_USB_RIO500 is not set
> +# CONFIG_USB_LEGOTOWER is not set
> +#  CONFIG_USB_LCD is not set
> +# CONFIG_USB_LED is not set
> +#  CONFIG_USB_CYPRESS_CY7C63 is not set
> +# CONFIG_USB_CYTHERM is not set
> +#  CONFIG_USB_IDMOUSE is not set
> +# CONFIG_USB_FTDI_ELAN is not set
> +#  CONFIG_USB_APPLEDISPLAY is not set
> +# CONFIG_USB_SISUSBVGA is not set
> +#  CONFIG_USB_LD is not set
> +# CONFIG_USB_TRANCEVIBRATOR is not set
> +#  CONFIG_USB_IOWARRIOR is not set
> +# CONFIG_USB_TEST is not set
> +#  CONFIG_USB_ISIGHTFW is not set
> +# CONFIG_USB_GADGET is not  set
> +
> +#
> +# OTG and related infrastructure
> +#
> +#  CONFIG_USB_GPIO_VBUS is not set
> +# CONFIG_USB_ULPI is not set
> +#  CONFIG_NOP_USB_XCEIV is not set
> +# CONFIG_MMC is not set
> +#  CONFIG_MEMSTICK is not  set
> +CONFIG_NEW_LEDS=y
> +CONFIG_LEDS_CLASS=y
> +
> +#
> +# LED  drivers
> +#
> +CONFIG_LEDS_GPIO=y
> +CONFIG_LEDS_GPIO_PLATFORM=y
> +#  CONFIG_LEDS_LP3944 is not set
> +# CONFIG_LEDS_PCA955X is not set
> +#  CONFIG_LEDS_BD2802 is not set
> +# CONFIG_LEDS_LT3593 is not  set
> +CONFIG_LEDS_TRIGGERS=y
> +
> +#
> +# LED  Triggers
> +#
> +CONFIG_LEDS_TRIGGER_TIMER=m
> +CONFIG_LEDS_TRIGGER_HEARTBEAT=y
> +#  CONFIG_LEDS_TRIGGER_BACKLIGHT is not  set
> +CONFIG_LEDS_TRIGGER_GPIO=m
> +CONFIG_LEDS_TRIGGER_DEFAULT_ON=m
> +
> +#
> +#  iptables trigger is under Netfilter config (LED target)
> +#
> +#  CONFIG_ACCESSIBILITY is not set
> +# CONFIG_INFINIBAND is not  set
> +CONFIG_RTC_LIB=y
> +CONFIG_RTC_CLASS=y
> +# CONFIG_RTC_HCTOSYS is not  set
> +# CONFIG_RTC_DEBUG is not set
> +
> +#
> +# RTC  interfaces
> +#
> +CONFIG_RTC_INTF_SYSFS=y
> +CONFIG_RTC_INTF_PROC=y
> +CONFIG_RTC_INTF_DEV=y
> +#  CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
> +# CONFIG_RTC_DRV_TEST is not  set
> +
> +#
> +# I2C RTC drivers
> +#
> +# CONFIG_RTC_DRV_DS1307 is not  set
> +# CONFIG_RTC_DRV_DS1374 is not set
> +# CONFIG_RTC_DRV_DS1672 is not  set
> +# CONFIG_RTC_DRV_DS3232 is not set
> +# CONFIG_RTC_DRV_MAX6900 is not  set
> +# CONFIG_RTC_DRV_RS5C372 is not set
> +# CONFIG_RTC_DRV_ISL1208 is not  set
> +# CONFIG_RTC_DRV_ISL12022 is not set
> +# CONFIG_RTC_DRV_X1205 is not  set
> +# CONFIG_RTC_DRV_PCF8563 is not set
> +# CONFIG_RTC_DRV_PCF8583 is not  set
> +# CONFIG_RTC_DRV_M41T80 is not set
> +# CONFIG_RTC_DRV_BQ32K is not  set
> +# CONFIG_RTC_DRV_S35390A is not set
> +# CONFIG_RTC_DRV_FM3130 is not  set
> +# CONFIG_RTC_DRV_RX8581 is not set
> +# CONFIG_RTC_DRV_RX8025 is not  set
> +
> +#
> +# SPI RTC drivers
> +#
> +
> +#
> +# Platform RTC  drivers
> +#
> +# CONFIG_RTC_DRV_CMOS is not set
> +# CONFIG_RTC_DRV_DS1286  is not set
> +# CONFIG_RTC_DRV_DS1511 is not set
> +# CONFIG_RTC_DRV_DS1553 is  not set
> +# CONFIG_RTC_DRV_DS1742 is not set
> +# CONFIG_RTC_DRV_STK17TA8 is  not set
> +# CONFIG_RTC_DRV_M48T86 is not set
> +# CONFIG_RTC_DRV_M48T35 is  not set
> +# CONFIG_RTC_DRV_M48T59 is not set
> +# CONFIG_RTC_DRV_MSM6242 is  not set
> +# CONFIG_RTC_DRV_BQ4802 is not set
> +# CONFIG_RTC_DRV_RP5C01 is  not set
> +# CONFIG_RTC_DRV_V3020 is not set
> +
> +#
> +# on-CPU RTC  drivers
> +#
> +CONFIG_RTC_DRV_MV=y
> +CONFIG_DMADEVICES=y
> +#  CONFIG_DMADEVICES_DEBUG is not set
> +
> +#
> +# DMA  Devices
> +#
> +CONFIG_MV_XOR=y
> +# CONFIG_TIMB_DMA is not  set
> +CONFIG_DMA_ENGINE=y
> +
> +#
> +# DMA Clients
> +#
> +#  CONFIG_NET_DMA is not set
> +CONFIG_ASYNC_TX_DMA=y
> +# CONFIG_DMATEST is not  set
> +# CONFIG_AUXDISPLAY is not set
> +# CONFIG_UIO is not set
> +#  CONFIG_STAGING is not set
> +
> +#
> +# File  systems
> +#
> +CONFIG_EXT2_FS=y
> +# CONFIG_EXT2_FS_XATTR is not set
> +#  CONFIG_EXT2_FS_XIP is not  set
> +CONFIG_EXT3_FS=y
> +CONFIG_EXT3_DEFAULTS_TO_ORDERED=y
> +CONFIG_EXT3_FS_XATTR=y
> +CONFIG_EXT3_FS_POSIX_ACL=y
> +#  CONFIG_EXT3_FS_SECURITY is not  set
> +CONFIG_EXT4_FS=m
> +CONFIG_EXT4_FS_XATTR=y
> +CONFIG_EXT4_FS_POSIX_ACL=y
> +#  CONFIG_EXT4_FS_SECURITY is not set
> +# CONFIG_EXT4_DEBUG is not  set
> +CONFIG_JBD=y
> +CONFIG_JBD2=m
> +CONFIG_FS_MBCACHE=y
> +#  CONFIG_REISERFS_FS is not  set
> +CONFIG_JFS_FS=m
> +CONFIG_JFS_POSIX_ACL=y
> +CONFIG_JFS_SECURITY=y
> +#  CONFIG_JFS_DEBUG is not set
> +# CONFIG_JFS_STATISTICS is not  set
> +CONFIG_FS_POSIX_ACL=y
> +CONFIG_XFS_FS=m
> +CONFIG_XFS_QUOTA=y
> +CONFIG_XFS_POSIX_ACL=y
> +#  CONFIG_XFS_RT is not set
> +# CONFIG_OCFS2_FS is not  set
> +CONFIG_FILE_LOCKING=y
> +CONFIG_FSNOTIFY=y
> +CONFIG_DNOTIFY=y
> +CONFIG_INOTIFY_USER=y
> +CONFIG_QUOTA=y
> +#  CONFIG_QUOTA_NETLINK_INTERFACE is not  set
> +CONFIG_PRINT_QUOTA_WARNING=y
> +# CONFIG_QUOTA_DEBUG is not set
> +#  CONFIG_QFMT_V1 is not set
> +# CONFIG_QFMT_V2 is not  set
> +CONFIG_QUOTACTL=y
> +# CONFIG_AUTOFS_FS is not  set
> +CONFIG_AUTOFS4_FS=m
> +# CONFIG_FUSE_FS is not set
> +
> +#
> +#  Caches
> +#
> +# CONFIG_FSCACHE is not set
> +
> +#
> +# CD-ROM/DVD  Filesystems
> +#
> +CONFIG_ISO9660_FS=m
> +CONFIG_JOLIET=y
> +#  CONFIG_ZISOFS is not  set
> +CONFIG_UDF_FS=m
> +CONFIG_UDF_NLS=y
> +
> +#
> +# DOS/FAT/NT  Filesystems
> +#
> +CONFIG_FAT_FS=y
> +CONFIG_MSDOS_FS=y
> +CONFIG_VFAT_FS=y
> +CONFIG_FAT_DEFAULT_CODEPAGE=437
> +CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
> +CONFIG_NTFS_FS=m
> +#  CONFIG_NTFS_DEBUG is not set
> +CONFIG_NTFS_RW=y
> +
> +#
> +# Pseudo  filesystems
> +#
> +CONFIG_PROC_FS=y
> +CONFIG_PROC_SYSCTL=y
> +CONFIG_PROC_PAGE_MONITOR=y
> +CONFIG_SYSFS=y
> +CONFIG_TMPFS=y
> +#  CONFIG_TMPFS_POSIX_ACL is not set
> +# CONFIG_HUGETLB_PAGE is not set
> +#  CONFIG_CONFIGFS_FS is not set
> +CONFIG_MISC_FILESYSTEMS=y
> +#  CONFIG_HFSPLUS_FS is not  set
> +CONFIG_JFFS2_FS=y
> +CONFIG_JFFS2_FS_DEBUG=0
> +CONFIG_JFFS2_FS_WRITEBUFFER=y
> +#  CONFIG_JFFS2_FS_WBUF_VERIFY is not set
> +# CONFIG_JFFS2_COMPRESSION_OPTIONS  is not set
> +CONFIG_JFFS2_ZLIB=y
> +# CONFIG_JFFS2_LZO is not  set
> +CONFIG_JFFS2_RTIME=y
> +# CONFIG_JFFS2_RUBIN is not  set
> +CONFIG_UBIFS_FS=m
> +# CONFIG_UBIFS_FS_XATTR is not set
> +#  CONFIG_UBIFS_FS_ADVANCED_COMPR is not  set
> +CONFIG_UBIFS_FS_LZO=y
> +CONFIG_UBIFS_FS_ZLIB=y
> +#  CONFIG_UBIFS_FS_DEBUG is not set
> +CONFIG_CRAMFS=m
> +CONFIG_SQUASHFS=y
> +#  CONFIG_SQUASHFS_XATTR is not set
> +# CONFIG_SQUASHFS_LZO is not set
> +#  CONFIG_SQUASHFS_EMBEDDED is not  set
> +CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
> +# CONFIG_VXFS_FS is not  set
> +# CONFIG_MINIX_FS is not set
> +# CONFIG_OMFS_FS is not set
> +#  CONFIG_HPFS_FS is not set
> +# CONFIG_QNX4FS_FS is not set
> +#  CONFIG_ROMFS_FS is not set
> +# CONFIG_SYSV_FS is not set
> +# CONFIG_UFS_FS  is not  set
> +CONFIG_NETWORK_FILESYSTEMS=y
> +CONFIG_NFS_FS=y
> +CONFIG_NFS_V3=y
> +#  CONFIG_NFS_V3_ACL is not set
> +# CONFIG_NFS_V4 is not  set
> +CONFIG_ROOT_NFS=y
> +CONFIG_NFSD=m
> +CONFIG_NFSD_V3=y
> +#  CONFIG_NFSD_V3_ACL is not  set
> +CONFIG_LOCKD=y
> +CONFIG_LOCKD_V4=y
> +CONFIG_EXPORTFS=m
> +CONFIG_NFS_COMMON=y
> +CONFIG_SUNRPC=y
> +CONFIG_SUNRPC_GSS=y
> +CONFIG_RPCSEC_GSS_KRB5=y
> +#  CONFIG_SMB_FS is not set
> +# CONFIG_CIFS is not set
> +# CONFIG_NCP_FS is  not set
> +# CONFIG_CODA_FS is not set
> +
> +#
> +# Partition  Types
> +#
> +CONFIG_PARTITION_ADVANCED=y
> +# CONFIG_ACORN_PARTITION is not  set
> +# CONFIG_OSF_PARTITION is not set
> +# CONFIG_AMIGA_PARTITION is not  set
> +# CONFIG_ATARI_PARTITION is not set
> +# CONFIG_MAC_PARTITION is not  set
> +CONFIG_MSDOS_PARTITION=y
> +# CONFIG_BSD_DISKLABEL is not set
> +#  CONFIG_MINIX_SUBPARTITION is not set
> +# CONFIG_SOLARIS_X86_PARTITION is not  set
> +# CONFIG_UNIXWARE_DISKLABEL is not set
> +# CONFIG_LDM_PARTITION is not  set
> +# CONFIG_SGI_PARTITION is not set
> +# CONFIG_ULTRIX_PARTITION is not  set
> +# CONFIG_SUN_PARTITION is not set
> +# CONFIG_KARMA_PARTITION is not  set
> +CONFIG_EFI_PARTITION=y
> +# CONFIG_SYSV68_PARTITION is not  set
> +CONFIG_NLS=y
> +CONFIG_NLS_DEFAULT="iso8859-15"
> +CONFIG_NLS_CODEPAGE_437=m
> +#  CONFIG_NLS_CODEPAGE_737 is not set
> +# CONFIG_NLS_CODEPAGE_775 is not  set
> +CONFIG_NLS_CODEPAGE_850=m
> +# CONFIG_NLS_CODEPAGE_852 is not set
> +#  CONFIG_NLS_CODEPAGE_855 is not set
> +# CONFIG_NLS_CODEPAGE_857 is not  set
> +# CONFIG_NLS_CODEPAGE_860 is not set
> +# CONFIG_NLS_CODEPAGE_861 is  not set
> +# CONFIG_NLS_CODEPAGE_862 is not set
> +# CONFIG_NLS_CODEPAGE_863  is not set
> +# CONFIG_NLS_CODEPAGE_864 is not set
> +#  CONFIG_NLS_CODEPAGE_865 is not set
> +# CONFIG_NLS_CODEPAGE_866 is not  set
> +# CONFIG_NLS_CODEPAGE_869 is not set
> +# CONFIG_NLS_CODEPAGE_936 is  not set
> +# CONFIG_NLS_CODEPAGE_950 is not set
> +# CONFIG_NLS_CODEPAGE_932  is not set
> +# CONFIG_NLS_CODEPAGE_949 is not set
> +#  CONFIG_NLS_CODEPAGE_874 is not set
> +# CONFIG_NLS_ISO8859_8 is not set
> +#  CONFIG_NLS_CODEPAGE_1250 is not set
> +# CONFIG_NLS_CODEPAGE_1251 is not  set
> +# CONFIG_NLS_ASCII is not set
> +CONFIG_NLS_ISO8859_1=m
> +#  CONFIG_NLS_ISO8859_2 is not set
> +# CONFIG_NLS_ISO8859_3 is not set
> +#  CONFIG_NLS_ISO8859_4 is not set
> +# CONFIG_NLS_ISO8859_5 is not set
> +#  CONFIG_NLS_ISO8859_6 is not set
> +# CONFIG_NLS_ISO8859_7 is not set
> +#  CONFIG_NLS_ISO8859_9 is not set
> +# CONFIG_NLS_ISO8859_13 is not set
> +#  CONFIG_NLS_ISO8859_14 is not set
> +CONFIG_NLS_ISO8859_15=y
> +#  CONFIG_NLS_KOI8_R is not set
> +# CONFIG_NLS_KOI8_U is not  set
> +CONFIG_NLS_UTF8=m
> +
> +#
> +# Kernel hacking
> +#
> +#  CONFIG_PRINTK_TIME is not set
> +# CONFIG_ENABLE_WARN_DEPRECATED is not  set
> +# CONFIG_ENABLE_MUST_CHECK is not set
> +CONFIG_FRAME_WARN=1024
> +#  CONFIG_MAGIC_SYSRQ is not set
> +CONFIG_STRIP_ASM_SYMS=y
> +#  CONFIG_UNUSED_SYMBOLS is not set
> +# CONFIG_DEBUG_FS is not set
> +#  CONFIG_HEADERS_CHECK is not set
> +# CONFIG_DEBUG_KERNEL is not set
> +#  CONFIG_HARDLOCKUP_DETECTOR is not set
> +# CONFIG_SLUB_DEBUG_ON is not  set
> +# CONFIG_SLUB_STATS is not set
> +CONFIG_DEBUG_BUGVERBOSE=y
> +#  CONFIG_DEBUG_MEMORY_INIT is not set
> +CONFIG_FRAME_POINTER=y
> +#  CONFIG_RCU_CPU_STALL_DETECTOR is not set
> +# CONFIG_SYSCTL_SYSCALL_CHECK is  not set
> +CONFIG_HAVE_FUNCTION_TRACER=y
> +CONFIG_TRACING_SUPPORT=y
> +#  CONFIG_FTRACE is not set
> +# CONFIG_ATOMIC64_SELFTEST is not set
> +#  CONFIG_SAMPLES is not set
> +CONFIG_HAVE_ARCH_KGDB=y
> +# CONFIG_DEBUG_USER is  not set
> +# CONFIG_OC_ETM is not set
> +
> +#
> +# Security  options
> +#
> +# CONFIG_KEYS is not set
> +# CONFIG_SECURITY is not  set
> +# CONFIG_SECURITYFS is not  set
> +CONFIG_DEFAULT_SECURITY_DAC=y
> +CONFIG_DEFAULT_SECURITY=""
> +CONFIG_CRYPTO=y
> +
> +#
> +#  Crypto core or helper
> +#
> +# CONFIG_CRYPTO_FIPS is not  set
> +CONFIG_CRYPTO_ALGAPI=y
> +CONFIG_CRYPTO_ALGAPI2=y
> +CONFIG_CRYPTO_AEAD=m
> +CONFIG_CRYPTO_AEAD2=y
> +CONFIG_CRYPTO_BLKCIPHER=y
> +CONFIG_CRYPTO_BLKCIPHER2=y
> +CONFIG_CRYPTO_HASH=y
> +CONFIG_CRYPTO_HASH2=y
> +CONFIG_CRYPTO_RNG=m
> +CONFIG_CRYPTO_RNG2=y
> +CONFIG_CRYPTO_PCOMP=m
> +CONFIG_CRYPTO_PCOMP2=y
> +CONFIG_CRYPTO_MANAGER=y
> +CONFIG_CRYPTO_MANAGER2=y
> +CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
> +CONFIG_CRYPTO_GF128MUL=m
> +CONFIG_CRYPTO_NULL=m
> +CONFIG_CRYPTO_WORKQUEUE=y
> +CONFIG_CRYPTO_CRYPTD=m
> +CONFIG_CRYPTO_AUTHENC=m
> +#  CONFIG_CRYPTO_TEST is not set
> +
> +#
> +# Authenticated Encryption with  Associated  Data
> +#
> +CONFIG_CRYPTO_CCM=m
> +CONFIG_CRYPTO_GCM=m
> +CONFIG_CRYPTO_SEQIV=m
> +
> +#
> +#  Block  modes
> +#
> +CONFIG_CRYPTO_CBC=y
> +CONFIG_CRYPTO_CTR=m
> +CONFIG_CRYPTO_CTS=m
> +CONFIG_CRYPTO_ECB=m
> +CONFIG_CRYPTO_PCBC=m
> +
> +#
> +#  Hash modes
> +#
> +CONFIG_CRYPTO_HMAC=m
> +
> +#
> +#  Digest
> +#
> +CONFIG_CRYPTO_CRC32C=y
> +CONFIG_CRYPTO_GHASH=m
> +CONFIG_CRYPTO_MD4=m
> +CONFIG_CRYPTO_MD5=y
> +CONFIG_CRYPTO_MICHAEL_MIC=m
> +CONFIG_CRYPTO_RMD128=m
> +CONFIG_CRYPTO_RMD160=m
> +CONFIG_CRYPTO_RMD256=m
> +CONFIG_CRYPTO_RMD320=m
> +CONFIG_CRYPTO_SHA1=m
> +CONFIG_CRYPTO_SHA256=m
> +CONFIG_CRYPTO_SHA512=m
> +CONFIG_CRYPTO_TGR192=m
> +CONFIG_CRYPTO_WP512=m
> +
> +#
> +# Ciphers
> +#
> +CONFIG_CRYPTO_AES=y
> +CONFIG_CRYPTO_ANUBIS=m
> +CONFIG_CRYPTO_ARC4=y
> +CONFIG_CRYPTO_BLOWFISH=m
> +CONFIG_CRYPTO_CAMELLIA=m
> +CONFIG_CRYPTO_CAST5=m
> +CONFIG_CRYPTO_CAST6=m
> +CONFIG_CRYPTO_DES=y
> +CONFIG_CRYPTO_FCRYPT=m
> +CONFIG_CRYPTO_KHAZAD=m
> +CONFIG_CRYPTO_SEED=m
> +CONFIG_CRYPTO_SERPENT=m
> +CONFIG_CRYPTO_TEA=m
> +CONFIG_CRYPTO_TWOFISH=m
> +CONFIG_CRYPTO_TWOFISH_COMMON=m
> +
> +#
> +# #  Compression
> +#
> +CONFIG_CRYPTO_DEFLATE=y
> +CONFIG_CRYPTO_ZLIB=m
> +CONFIG_CRYPTO_LZO=y
> +
> +#
> +#  Random Number  Generation
> +#
> +CONFIG_CRYPTO_ANSI_CPRNG=m
> +CONFIG_CRYPTO_HW=y
> +CONFIG_CRYPTO_DEV_MV_CESA=m
> +#  CONFIG_CRYPTO_DEV_HIFN_795X is not set
> +# CONFIG_BINARY_PRINTF is not  set
> +
> +#
> +# Library  routines
> +#
> +CONFIG_BITREVERSE=y
> +CONFIG_GENERIC_FIND_LAST_BIT=y
> +CONFIG_CRC_CCITT=m
> +CONFIG_CRC16=m
> +#  CONFIG_CRC_T10DIF is not set
> +CONFIG_CRC_ITU_T=m
> +CONFIG_CRC32=y
> +#  CONFIG_CRC7 is not  set
> +CONFIG_LIBCRC32C=m
> +CONFIG_ZLIB_INFLATE=y
> +CONFIG_ZLIB_DEFLATE=y
> +CONFIG_LZO_COMPRESS=y
> +CONFIG_LZO_DECOMPRESS=y
> +CONFIG_TEXTSEARCH=y
> +CONFIG_TEXTSEARCH_KMP=m
> +CONFIG_TEXTSEARCH_BM=m
> +CONFIG_TEXTSEARCH_FSM=m
> +CONFIG_HAS_IOMEM=y
> +CONFIG_HAS_IOPORT=y
> +CONFIG_HAS_DMA=y
> +CONFIG_NLATTR=y
> +CONFIG_GENERIC_ATOMIC64=y
> diff  --git  
>a/target/device/sheevaplug/SeagateDockStar/SeagateDockStar_uClibc-0.9.31.config  
>
>b/target/device/sheevaplug/SeagateDockStar/SeagateDockStar_uClibc-0.9.31.config
> new  file mode 100644
> index 0000000..3e2bbd0
> --- /dev/null
> +++  
>b/target/device/sheevaplug/SeagateDockStar/SeagateDockStar_uClibc-0.9.31.config
> @@  -0,0 +1,259 @@
> +#
> +# Automatically generated make config: don't  edit
> +# Version: 0.9.31
> +# Sun Apr  4 10:43:39 2010
> +#
> +#  TARGET_alpha is not set
> +# TARGET_arm is not set
> +# TARGET_avr32 is not  set
> +# TARGET_bfin is not set
> +# TARGET_cris is not set
> +# TARGET_e1 is  not set
> +# TARGET_frv is not set
> +# TARGET_h8300 is not set
> +#  TARGET_hppa is not set
> +# TARGET_i386 is not set
> +# TARGET_i960 is not  set
> +# TARGET_ia64 is not set
> +# TARGET_m68k is not set
> +#  TARGET_microblaze is not set
> +# TARGET_mips is not set
> +# TARGET_nios is  not set
> +# TARGET_nios2 is not set
> +# TARGET_powerpc is not set
> +#  TARGET_sh is not set
> +# TARGET_sh64 is not set
> +# TARGET_sparc is not  set
> +# TARGET_v850 is not set
> +# TARGET_vax is not set
> +# TARGET_x86_64  is not set
> +# TARGET_xtensa is not set
> +
> +#
> +# Target Architecture  Features and  Options
> +#
> +TARGET_ARCH="none"
> +FORCE_OPTIONS_FOR_ARCH=y
> +#  ARCH_LITTLE_ENDIAN is not set
> +# ARCH_BIG_ENDIAN is not set
> +#  ARCH_WANTS_LITTLE_ENDIAN is not set
> +# ARCH_WANTS_BIG_ENDIAN is not  set
> +TARGET_SUBARCH=""
> +
> +#
> +# Using Little  Endian
> +#
> +ARCH_HAS_MMU=y
> +ARCH_USE_MMU=y
> +UCLIBC_HAS_FLOATS=y
> +UCLIBC_HAS_FPU=y
> +DO_C99_MATH=y
> +#  DO_XSI_MATH is not set
> +# UCLIBC_HAS_FENV is not  set
> +UCLIBC_HAS_LONG_DOUBLE_MATH=y
> +KERNEL_HEADERS="/usr/src/linux/include"
> +HAVE_DOT_CONFIG=y
> +
> +#
> +#  General Library Settings
> +#
> +# HAVE_NO_PIC is not set
> +DOPIC=y
> +#  ARCH_HAS_NO_SHARED is not set
> +# ARCH_HAS_NO_LDSO is not  set
> +HAVE_SHARED=y
> +# FORCE_SHAREABLE_TEXT_SEGMENTS is not  set
> +LDSO_LDD_SUPPORT=y
> +# LDSO_CACHE_SUPPORT is not set
> +#  LDSO_PRELOAD_FILE_SUPPORT is not set
> +# UCLIBC_STATIC_LDCONFIG is not  set
> +LDSO_RUNPATH=y
> +LDSO_SEARCH_INTERP_PATH=y
> +UCLIBC_CTOR_DTOR=y
> +#  LDSO_GNU_HASH_SUPPORT is not set
> +# HAS_NO_THREADS is not  set
> +LINUXTHREADS_OLD=y
> +# LINUXTHREADS_NEW is not  set
> +UCLIBC_HAS_THREADS=y
> +# PTHREADS_DEBUG_SUPPORT is not  set
> +UCLIBC_HAS_SYSLOG=y
> +UCLIBC_HAS_LFS=y
> +# MALLOC is not set
> +#  MALLOC_SIMPLE is not  set
> +MALLOC_STANDARD=y
> +MALLOC_GLIBC_COMPAT=y
> +UCLIBC_DYNAMIC_ATEXIT=y
> +#  COMPAT_ATEXIT is not set
> +UCLIBC_SUSV3_LEGACY=y
> +#  UCLIBC_SUSV3_LEGACY_MACROS is not set
> +UCLIBC_SUSV4_LEGACY=y
> +#  UCLIBC_HAS_STUBS is not set
> +UCLIBC_HAS_SHADOW=y
> +#  UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
> +# UCLIBC_HAS___PROGNAME is not  set
> +UCLIBC_HAS_PTY=y
> +ASSUME_DEVPTS=y
> +UNIX98PTY_ONLY=y
> +#  UCLIBC_HAS_GETPT is not  set
> +UCLIBC_HAS_LIBUTIL=y
> +UCLIBC_HAS_TM_EXTENSIONS=y
> +UCLIBC_HAS_TZ_CACHING=y
> +UCLIBC_HAS_TZ_FILE=y
> +UCLIBC_HAS_TZ_FILE_READ_MANY=y
> +UCLIBC_TZ_FILE_PATH="/etc/TZ"
> +
> +#
> +#  Advanced Library  Settings
> +#
> +UCLIBC_PWD_BUFFER_SIZE=256
> +UCLIBC_GRP_BUFFER_SIZE=256
> +
> +#
> +#  Support various families of  functions
> +#
> +UCLIBC_LINUX_MODULE_24=y
> +UCLIBC_LINUX_SPECIFIC=y
> +UCLIBC_HAS_GNU_ERROR=y
> +UCLIBC_BSD_SPECIFIC=y
> +UCLIBC_HAS_BSD_ERR=y
> +UCLIBC_HAS_OBSOLETE_BSD_SIGNAL=y
> +UCLIBC_HAS_OBSOLETE_SYSV_SIGNAL=y
> +#  UCLIBC_NTP_LEGACY is not  set
> +UCLIBC_SV4_DEPRECATED=y
> +UCLIBC_HAS_REALTIME=y
> +UCLIBC_HAS_ADVANCED_REALTIME=y
> +UCLIBC_HAS_EPOLL=y
> +UCLIBC_HAS_XATTR=y
> +UCLIBC_HAS_PROFILING=y
> +UCLIBC_HAS_CRYPT_IMPL=y
> +UCLIBC_HAS_CRYPT=y
> +UCLIBC_HAS_NETWORK_SUPPORT=y
> +UCLIBC_HAS_SOCKET=y
> +UCLIBC_HAS_IPV4=y
> +#  UCLIBC_HAS_IPV6 is not set
> +# UCLIBC_HAS_RPC is not set
> +#  UCLIBC_HAS_FULL_RPC is not set
> +# UCLIBC_HAS_REENTRANT_RPC is not  set
> +UCLIBC_USE_NETLINK=y
> +# UCLIBC_SUPPORT_AI_ADDRCONFIG is not set
> +#  UCLIBC_HAS_BSD_RES_CLOSE is not set
> +UCLIBC_HAS_COMPAT_RES_STATE=y
> +#  UCLIBC_HAS_EXTRA_COMPAT_RES_STATE is not  set
> +UCLIBC_HAS_LIBRESOLV_STUB=y
> +UCLIBC_HAS_LIBNSL_STUB=y
> +
> +#
> +#  String and Stdio Support
> +#
> +# UCLIBC_HAS_STRING_GENERIC_OPT is not  set
> +UCLIBC_HAS_STRING_ARCH_OPT=y
> +UCLIBC_HAS_CTYPE_TABLES=y
> +UCLIBC_HAS_CTYPE_SIGNED=y
> +#  UCLIBC_HAS_CTYPE_UNSAFE is not set
> +# UCLIBC_HAS_CTYPE_CHECKED is not  set
> +UCLIBC_HAS_CTYPE_ENFORCED=y
> +# UCLIBC_HAS_WCHAR is not set
> +#  UCLIBC_HAS_LOCALE is not  set
> +UCLIBC_HAS_HEXADECIMAL_FLOATS=y
> +UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
> +#  USE_OLD_VFPRINTF is not  set
> +UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
> +UCLIBC_HAS_SCANF_GLIBC_A_FLAG=y
> +#  UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
> +# UCLIBC_HAS_STDIO_BUFSIZ_256 is  not set
> +# UCLIBC_HAS_STDIO_BUFSIZ_512 is not set
> +#  UCLIBC_HAS_STDIO_BUFSIZ_1024 is not set
> +# UCLIBC_HAS_STDIO_BUFSIZ_2048 is  not set
> +UCLIBC_HAS_STDIO_BUFSIZ_4096=y
> +# UCLIBC_HAS_STDIO_BUFSIZ_8192 is  not set
> +UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
> +#  UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
> +#  UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
> +#  UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
> +# UCLIBC_HAS_STDIO_GETC_MACRO  is not set
> +# UCLIBC_HAS_STDIO_PUTC_MACRO is not  set
> +UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
> +#  UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not  set
> +UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
> +UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
> +UCLIBC_HAS_PRINTF_M_SPEC=y
> +UCLIBC_HAS_ERRNO_MESSAGES=y
> +#  UCLIBC_HAS_SYS_ERRLIST is not set
> +UCLIBC_HAS_SIGNUM_MESSAGES=y
> +#  UCLIBC_HAS_SYS_SIGLIST is not set
> +UCLIBC_HAS_GNU_GETOPT=y
> +#  UCLIBC_HAS_GNU_GETSUBOPT is not set
> +
> +#
> +# Big and  Tall
> +#
> +UCLIBC_HAS_REGEX=y
> +# UCLIBC_HAS_REGEX_OLD is not  set
> +UCLIBC_HAS_FNMATCH=y
> +# UCLIBC_HAS_FNMATCH_OLD is not set
> +#  UCLIBC_HAS_WORDEXP is not  set
> +UCLIBC_HAS_NFTW=y
> +UCLIBC_HAS_FTW=y
> +UCLIBC_HAS_GLOB=y
> +UCLIBC_HAS_GNU_GLOB=y
> +
> +#
> +#  Library Installation  Options
> +#
> +RUNTIME_PREFIX="/"
> +DEVEL_PREFIX="/usr/"
> +MULTILIB_DIR="lib"
> +HARDWIRED_ABSPATH=y
> +
> +#
> +#  Security options
> +#
> +# UCLIBC_BUILD_PIE is not set
> +#  UCLIBC_HAS_ARC4RANDOM is not set
> +# HAVE_NO_SSP is not  set
> +UCLIBC_HAS_SSP=y
> +# UCLIBC_HAS_SSP_COMPAT is not set
> +#  SSP_QUICK_CANARY is not set
> +PROPOLICE_BLOCK_ABRT=y
> +#  PROPOLICE_BLOCK_SEGV is not set
> +# UCLIBC_BUILD_SSP is not  set
> +UCLIBC_BUILD_RELRO=y
> +UCLIBC_BUILD_NOW=y
> +UCLIBC_BUILD_NOEXECSTACK=y
> +
> +#
> +#  uClibc development/debugging  options
> +#
> +CROSS_COMPILER_PREFIX=""
> +UCLIBC_EXTRA_CFLAGS=""
> +#  DODEBUG is not set
> +# DODEBUG_PT is not set
> +DOSTRIP=y
> +# DOASSERTS is  not set
> +# SUPPORT_LD_DEBUG is not set
> +# SUPPORT_LD_DEBUG_EARLY is not  set
> +# UCLIBC_MALLOC_DEBUGGING is not set
> +WARNINGS="-Wall"
> +#  EXTRA_WARNINGS is not set
> +# DOMULTI is not set
> +# UCLIBC_MJN3_ONLY is not  set
> +
> +# USE_BX is not set
> +# CONFIG_GENERIC_ARM is not set
> +#  CONFIG_ARM610 is not set
> +# CONFIG_ARM710 is not set
> +# CONFIG_ARM7TDMI is  not set
> +# CONFIG_ARM720T is not set
> +# CONFIG_ARM920T is not set
> +#  CONFIG_ARM922T is not set
> +# CONFIG_ARM926T is not set
> +# CONFIG_ARM10T is  not set
> +# CONFIG_ARM1136JF_S is not set
> +# CONFIG_ARM1176JZ_S is not  set
> +# CONFIG_ARM1176JZF_S is not set
> +# CONFIG_ARM_CORTEX_M3 is not  set
> +# CONFIG_ARM_CORTEX_M1 is not set
> +# CONFIG_ARM_SA110 is not  set
> +# CONFIG_ARM_SA1100 is not set
> +# CONFIG_ARM_XSCALE is not set
> +#  CONFIG_ARM_IWMMXT is not set
> diff --git  
>a/target/device/sheevaplug/SeagateDockStar/dockstar_external_toolchain_defconfig  
>
>b/target/device/sheevaplug/SeagateDockStar/dockstar_external_toolchain_defconfig

> new  file mode 100644
> index 0000000..0edeb91
> --- /dev/null
> +++  
>b/target/device/sheevaplug/SeagateDockStar/dockstar_external_toolchain_defconfig

> @@  -0,0 +1,83  @@
> +BR2_arm=y
> +BR2_arm926t=y
> +BR2_TARGET_SHEEVAPLUG=y
> +BR2_TARGET_GENERIC_HOSTNAME="SeagateDockstar"
> +BR2_TARGET_GENERIC_ISSUE="Welcome  to Buildroot - 1st DockStar build"
> +BR2_WGET="wget --passive-ftp  -nd"
> +BR2_GIT="git  clone"
> +BR2_DL_DIR="$(TOPDIR)/../br_dl"
> +BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/";
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_LARGEFILE=y
> +BR2_INET_RPC=y
> +BR2_USE_WCHAR=y
> +BR2_USE_SSP=y
> +BR2_PTHREADS=y
> +BR2_PROGRAM_INVOCATION=y
> +BR2_INSTALL_LIBSTDCPP=y
> +BR2_TARGET_OPTIMIZATION="-Os -pipe"
> +BR2_TOOLCHAIN_EXTERNAL_PATH="$(HOME)/buildroot/buildroot/output/staging/usr"
> +BR2_TOOLCHAIN_EXTERNAL_PREFIX="arm-unknown-linux-uclibcgnueabi"
>+BR2_PACKAGE_BUSYBOX_CONFIG="$(TOPDIR)/target/device/sheevaplug/SeagateDockStar/SeagateDockStar-busybox-1.17.x.config"
>
>"
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +BR2_PACKAGE_BZIP2=y
> +BR2_PACKAGE_CRAMFS=y
> +BR2_PACKAGE_E2FSPROGS=y
> +BR2_PACKAGE_E2FSPROGS_UTILS=y
> +BR2_PACKAGE_GENEXT2FS=y
> +BR2_PACKAGE_GENROMFS=y
> +BR2_PACKAGE_MTD=y
> +# # BR2_PACKAGE_MTD_FLASHCP is not set
> +# BR2_PACKAGE_MTD_FLASH_ERASE is not  set
> +# BR2_PACKAGE_MTD_FLASH_ERASEALL is not set
> +#  BR2_PACKAGE_MTD_FLASH_INFO is not set
> +# BR2_PACKAGE_MTD_FLASH_LOCK is not  set
> +# BR2_PACKAGE_MTD_FLASH_UNLOCK is not  set
> +BR2_PACKAGE_MTD_JFFS2DUMP=y
> +BR2_PACKAGE_MTD_MKFSJFFS2=y
> +#  BR2_PACKAGE_MTD_MTDINFO is not set
> +# BR2_PACKAGE_MTD_UBIATTACH is not  set
> +# BR2_PACKAGE_MTD_UBICRC32 is not set
> +# BR2_PACKAGE_MTD_UBIDETACH is  not set
> +# BR2_PACKAGE_MTD_UBIFORMAT is not set
> +#  BR2_PACKAGE_MTD_UBIMKVOL is not set
> +# BR2_PACKAGE_MTD_UBINFO is not  set
> +# BR2_PACKAGE_MTD_UBINIZE is not set
> +# BR2_PACKAGE_MTD_UBIRENAME is  not set
> +# BR2_PACKAGE_MTD_UBIRMVOL is not set
> +# BR2_PACKAGE_MTD_UBIRSVOL  is not set
> +# BR2_PACKAGE_MTD_UBIUPDATEVOL is not  set
> +BR2_PACKAGE_SQUASHFS=y
> +BR2_PACKAGE_UDEV_SCSI_ID=y
> +BR2_PACKAGE_USBMOUNT=y
> +BR2_PACKAGE_USBUTILS=y
> +BR2_PACKAGE_HASERL=y
> +BR2_PACKAGE_OPENSSL=y
> +BR2_PACKAGE_OPENSSL_BIN=y
> +BR2_PACKAGE_LIBGLIB2=y
> +BR2_PACKAGE_READLINE=y
> +BR2_PACKAGE_LIBXML2=y
> +BR2_PACKAGE_DROPBEAR=y
> +BR2_PACKAGE_ETHTOOL=y
> +BR2_PACKAGE_NANO=y
> +BR2_PACKAGE_VIM=y
> +#  BR2_PACKAGE_VIM_RUNTIME is not  set
>+BR2_ROOTFS_POST_BUILD_SCRIPT="$(TOPDIR)/target/device/sheevaplug/SeagateDockStar/patchrootfs.sh"
>
>"
> +BR2_TARGET_ROOTFS_JFFS2=y
> +BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K=y
> +BR2_TARGET_ROOTFS_JFFS2_SUMMARY=y
> +BR2_TARGET_ROOTFS_TAR=y
> +BR2_TARGET_ROOTFS_TAR_GZIP=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="sheevaplug"
>+BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR="$(TOPDIR)/target/device/sheevaplug/SeagateDockStar/u-boot-patches"
>
>"
> +BR2_TARGET_UBOOT_TOOL_MKIMAGE=y
> +BR2_TARGET_UBOOT_TOOL_ENV=y
> +BR2_TARGET_UBOOT_SERVERIP="192.168.1.106"
> +BR2_TARGET_UBOOT_IPADDR="192.168.1.254"
> +BR2_TARGET_UBOOT_GATEWAY="192.168.1.1"
> +BR2_TARGET_UBOOT_ETHADDR="00:10:75:1A:87:C6"
> +BR2_LINUX_KERNEL=y
>+BR2_LINUX_KERNEL_PATCH="$(TOPDIR)/target/device/sheevaplug/SeagateDockStar/kernel-patches/"
>
>"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(TOPDIR)/target/device/sheevaplug/SeagateDockStar/SeagateDockStar-linux-2.6.36.1.config"
>
>"
> diff  --git  
>a/target/device/sheevaplug/SeagateDockStar/dockstar_internal_toolchain_defconfig  
>
>b/target/device/sheevaplug/SeagateDockStar/dockstar_internal_toolchain_defconfig

> new  file mode 100644
> index 0000000..20fc931
> --- /dev/null
> +++  
>b/target/device/sheevaplug/SeagateDockStar/dockstar_internal_toolchain_defconfig

> @@  -0,0 +1,833 @@
> +#
> +# Automatically generated make config: don't  edit
> +# Buildroot version: 2010.11-dirty
> +# Fri Dec 10 12:34:41  2010
> +#
> +BR2_HAVE_DOT_CONFIG=y
> +BR2_arm=y
> +# BR2_armeb is not  set
> +# BR2_avr32 is not set
> +# BR2_i386 is not set
> +# BR2_mips is not  set
> +# BR2_mipsel is not set
> +# BR2_powerpc is not set
> +# BR2_sh is not  set
> +# BR2_sh64 is not set
> +# BR2_sparc is not set
> +# BR2_x86_64 is not  set
> +# BR2_xtensa is not set
> +# BR2_generic_arm is not set
> +#  BR2_arm7tdmi is not set
> +# BR2_arm610 is not set
> +# BR2_arm710 is not  set
> +# BR2_arm720t is not set
> +# BR2_arm920t is not set
> +# BR2_arm922t  is not set
> +BR2_arm926t=y
> +# BR2_arm10t is not set
> +# BR2_arm1136jf_s  is not set
> +# BR2_arm1176jz_s is not set
> +# BR2_arm1176jzf_s is not  set
> +
> +#
> +# cortex-A8/A9 needs gcc >= 4.4.x
> +#
> +#  BR2_cortex_a8 is not set
> +# BR2_cortex_a9 is not set
> +# BR2_sa110 is not  set
> +# BR2_sa1100 is not set
> +# BR2_xscale is not set
> +# BR2_iwmmxt is  not set
> +BR2_ARM_TYPE="ARM926T"
> +BR2_ARM_EABI=y
> +# BR2_ARM_OABI is not  set
> +BR2_ARCH="arm"
> +BR2_ENDIAN="LITTLE"
> +BR2_GCC_TARGET_TUNE="arm926ej-s"
> +BR2_GCC_TARGET_ARCH="armv5te"
> +BR2_GCC_TARGET_ABI="aapcs-linux"
> +
> +#
> +#  Target options
> +#
> +
> +#
> +# Preset Devices
> +#
> +#  BR2_TARGET_ARMLTD is not set
> +# BR2_TARGET_ATMEL is not set
> +#  BR2_TARGET_KWIKBYTE is not set
> +BR2_TARGET_SHEEVAPLUG=y
> +#  BR2_TARGET_SHEEVAPLUG_PROJECT_SEAGATEDOCKSTAR is not  set
> +BR2_TARGET_GENERIC_HOSTNAME="SeagateDockstar"
> +BR2_TARGET_GENERIC_ISSUE="Welcome  to Buildroot - 1st DockStar build"
> +# BR2_TARGET_GENERIC_GETTY is not  set
> +
> +#
> +# Build options
> +#
> +
> +#
> +#  Commands
> +#
> +BR2_WGET="wget --passive-ftp  -nd"
> +BR2_SVN="svn"
> +BR2_BZR="bzr"
> +BR2_GIT="git  clone"
> +BR2_ZCAT="gzip -d  -c"
> +BR2_BZCAT="bzcat"
> +BR2_TAR_OPTIONS=""
> +BR2_DL_DIR="$(TOPDIR)/../br_dl"
> +BR2_STAGING_DIR="$(BASE_DIR)/staging"
> +
> +#
> +#  Mirrors and Download  locations
> +#
> +BR2_PRIMARY_SITE=""
> +BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/";
> +BR2_SOURCEFORGE_MIRROR="easynews"
> +BR2_KERNEL_MIRROR="http://www.kernel.org/pub/";
> +BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu";
> +BR2_DEBIAN_MIRROR="http://ftp.debian.org";
> +BR2_JLEVEL=2
> +# BR2_DEPRECATED is not  set
> +# BR2_ENABLE_DEBUG is not set
> +BR2_STRIP_strip=y
> +#  BR2_STRIP_sstrip is not set
> +# BR2_STRIP_none is not set
> +# BR2_OPTIMIZE_0  is not set
> +# BR2_OPTIMIZE_1 is not set
> +# BR2_OPTIMIZE_2 is not set
> +#  BR2_OPTIMIZE_3 is not set
> +BR2_OPTIMIZE_S=y
> +# BR2_PREFER_STATIC_LIB is  not set
> +# BR2_HAVE_DOCUMENTATION is not set
> +# BR2_HAVE_DEVFILES is not  set
> +
> +#
> +# Toolchain
> +#
> +BR2_TOOLCHAIN_BUILDROOT=y
> +#  BR2_TOOLCHAIN_EXTERNAL is not set
> +# BR2_TOOLCHAIN_CTNG is not  set
> +
> +#
> +# Kernel Header Options
> +#
> +# BR2_KERNEL_HEADERS_2_6_34  is not set
> +# BR2_KERNEL_HEADERS_2_6_35 is not  set
> +BR2_KERNEL_HEADERS_2_6_36=y
> +# BR2_KERNEL_HEADERS_VERSION is not  set
> +# BR2_KERNEL_HEADERS_SNAP is not  set
> +BR2_DEFAULT_KERNEL_HEADERS="2.6.36.1"
> +
> +#
> +# uClibc  Options
> +#
> +# BR2_UCLIBC_VERSION_0_9_30 is not  set
> +BR2_UCLIBC_VERSION_0_9_31=y
> +# BR2_UCLIBC_VERSION_SNAPSHOT is not  set
> +BR2_UCLIBC_VERSION_STRING="0.9.31"
>+BR2_UCLIBC_CONFIG="$(TOPDIR)/target/device/sheevaplug/SeagateDockStar/SeagateDockStar_uClibc-0.9.31.config"
>
>"
> +#  BR2_PTHREAD_DEBUG is not set
> +# BR2_UCLIBC_INSTALL_TEST_SUITE is not  set
> +
> +#
> +# Binutils Options
> +#
> +# BR2_BINUTILS_VERSION_2_20 is  not  set
> +BR2_BINUTILS_VERSION_2_20_1=y
> +BR2_BINUTILS_VERSION="2.20.1"
> +BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
> +
> +#
> +#  GCC Options
> +#
> +# BR2_GCC_VERSION_4_2_4 is not set
> +#  BR2_GCC_VERSION_4_3_X is not set
> +BR2_GCC_VERSION_4_4_X=y
> +#  BR2_GCC_VERSION_4_5_X is not set
> +# BR2_GCC_VERSION_SNAP is not  set
> +BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
> +BR2_GCC_VERSION="4.4.5"
> +BR2_EXTRA_GCC_CONFIG_OPTIONS=""
> +#  BR2_GCC_CROSS_OBJC is not set
> +# BR2_GCC_CROSS_FORTRAN is not set
> +#  BR2_INSTALL_OBJC is not set
> +# BR2_INSTALL_FORTRAN is not  set
> +BR2_GCC_SHARED_LIBGCC=y
> +
> +#
> +# Ccache Options
> +#
> +#  BR2_CCACHE is not set
> +
> +#
> +# Gdb Options
> +#
> +# BR2_PACKAGE_GDB  is not set
> +# BR2_PACKAGE_GDB_SERVER is not set
> +
> +#
> +# Common  Toolchain Options
> +#
> +BR2_LARGEFILE=y
> +# BR2_INET_IPV6 is not  set
> +BR2_INET_RPC=y
> +# BR2_ENABLE_LOCALE is not set
> +#  BR2_ENABLE_LOCALE_PURGE is not  set
> +BR2_NEEDS_GETTEXT=y
> +BR2_USE_WCHAR=y
> +BR2_PREFER_SOFT_FLOAT=y
> +BR2_SOFT_FLOAT=y
> +BR2_USE_SSP=y
> +#  BR2_PTHREADS_NONE is not set
> +BR2_PTHREADS=y
> +# BR2_PTHREADS_OLD is not  set
> +BR2_PROGRAM_INVOCATION=y
> +BR2_GCC_CROSS_CXX=y
> +BR2_INSTALL_LIBSTDCPP=y
> +BR2_TARGET_OPTIMIZATION="-Os  -pipe"
> +# BR2_ELF2FLT is not  set
> +BR2_MKLIBS=y
> +BR2_PACKAGE_SSTRIP_TARGET=y
> +#  BR2_PACKAGE_SSTRIP_HOST is not set
> +# BR2_CROSS_TOOLCHAIN_TARGET_UTILS is not  set
> +
> +#
> +# Package Selection for the  target
> +#
> +BR2_PACKAGE_BUSYBOX=y
> +# BR2_BUSYBOX_VERSION_1_15_X is not  set
> +# BR2_BUSYBOX_VERSION_1_16_X is not  set
> +BR2_BUSYBOX_VERSION_1_17_X=y
> +# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not  set
> +BR2_BUSYBOX_VERSION="1.17.4"
> +BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
>+BR2_PACKAGE_BUSYBOX_CONFIG="$(TOPDIR)/target/device/sheevaplug/SeagateDockStar/SeagateDockStar-busybox-1.17.x.config"
>
>"
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +#  BR2_PACKAGE_CUSTOMIZE is not set
> +
> +#
> +# Audio and video libraries and  applications
> +#
> +# BR2_PACKAGE_ALSA_LIB is not set
> +# BR2_PACKAGE_AUMIX  is not set
> +# BR2_PACKAGE_FLAC is not set
> +# BR2_PACKAGE_FFMPEG is not  set
> +# BR2_PACKAGE_GSTREAMER is not set
> +# BR2_PACKAGE_LIBCDAUDIO is not  set
> +# BR2_PACKAGE_LIBDVDREAD is not set
> +# BR2_PACKAGE_LIBDVDNAV is not  set
> +# BR2_PACKAGE_LIBID3TAG is not set
> +# BR2_PACKAGE_LIBMAD is not  set
> +# BR2_PACKAGE_LIBMMS is not set
> +# BR2_PACKAGE_LIBMPD is not  set
> +# BR2_PACKAGE_LIBMPEG2 is not set
> +# BR2_PACKAGE_LIBOGG is not  set
> +# BR2_PACKAGE_LIBSNDFILE is not set
> +# BR2_PACKAGE_LIBTHEORA is not  set
> +# BR2_PACKAGE_LIBVORBIS is not set
> +# BR2_PACKAGE_MADPLAY is not  set
> +# BR2_PACKAGE_MPG123 is not set
> +# BR2_PACKAGE_MPLAYER is not  set
> +# BR2_PACKAGE_SPEEX is not set
> +# BR2_PACKAGE_SWFDEC is not set
> +#  BR2_PACKAGE_FESTIVAL is not set
> +# BR2_PACKAGE_TAGLIB is not set
> +#  BR2_PACKAGE_TREMOR is not set
> +
> +#
> +# Compressors and  decompressors
> +#
> +BR2_PACKAGE_BZIP2=y
> +BR2_PACKAGE_GZIP=y
> +#  BR2_PACKAGE_LZOP is not set
> +# BR2_PACKAGE_XZ is not set
> +
> +#
> +#  Debugging, profiling and benchmark
> +#
> +# BR2_PACKAGE_DMALLOC is not  set
> +# BR2_PACKAGE_KEXEC is not set
> +# BR2_PACKAGE_LMBENCH is not  set
> +# BR2_PACKAGE_LSOF is not set
> +# BR2_PACKAGE_LTRACE is not set
> +#  BR2_PACKAGE_MEMSTAT is not set
> +# BR2_PACKAGE_NETPERF is not set
> +#  BR2_PACKAGE_STRACE is not set
> +
> +#
> +# Development tools
> +#
> +#  BR2_PACKAGE_AUTOCONF is not set
> +# BR2_PACKAGE_AUTOMAKE is not set
> +#  BR2_PACKAGE_BISON is not set
> +# BR2_PACKAGE_BSDIFF is not set
> +#  BR2_PACKAGE_COREUTILS is not set
> +# BR2_PACKAGE_CVS is not set
> +#  BR2_PACKAGE_DIFFUTILS is not set
> +# BR2_PACKAGE_DISTCC is not set
> +#  BR2_PACKAGE_FAKEROOT is not set
> +# BR2_PACKAGE_FINDUTILS is not set
> +#  BR2_PACKAGE_FLEX is not set
> +# BR2_PACKAGE_GAWK is not set
> +
> +#
> +#  native toolchain needs development files in target  filesystem
> +#
> +BR2_PACKAGE_GETTEXT=y
> +# BR2_PACKAGE_GETTEXT_STATIC is  not set
> +BR2_PACKAGE_LIBINTL=y
> +# BR2_PACKAGE_LIBGMP is not set
> +#  BR2_PACKAGE_GPERF is not set
> +# BR2_PACKAGE_GREP is not set
> +#  BR2_PACKAGE_MAKE is not set
> +# BR2_PACKAGE_LIBMPC is not set
> +#  BR2_PACKAGE_LIBMPFR is not set
> +# BR2_PACKAGE_LIBTOOL is not set
> +#  BR2_PACKAGE_M4 is not set
> +# BR2_PACKAGE_PATCH is not set
> +#  BR2_PACKAGE_PKG_CONFIG is not set
> +# BR2_PACKAGE_SED is not set
> +#  BR2_PACKAGE_TAR is not set
> +
> +#
> +# Games
> +#
> +#  BR2_PACKAGE_GNUCHESS is not set
> +# BR2_PACKAGE_PRBOOM is not  set
> +
> +#
> +# Graphic libraries and applications  (graphic/text)
> +#
> +
> +#
> +# Graphic applications
> +#
> +#  BR2_PACKAGE_RRDTOOL is not set
> +
> +#
> +# graphic libraries
> +#
> +#  BR2_PACKAGE_DIRECTFB is not set
> +# BR2_PACKAGE_FBDUMP is not set
> +#  BR2_PACKAGE_FBSET is not set
> +# BR2_PACKAGE_FBV is not set
> +#  BR2_PACKAGE_IMAGEMAGICK is not set
> +# BR2_PACKAGE_LINUX_FUSION is not  set
> +# BR2_PACKAGE_SDL is not set
> +
> +#
> +# other GUIs
> +#
> +#  BR2_PACKAGE_QT is not set
> +# BR2_PACKAGE_XORG7 is not set
> +
> +#
> +# X  libraries and helper libraries
> +#
> +# BR2_PACKAGE_LIBERATION is not  set
> +
> +#
> +# X Window managers
> +#
> +
> +#
> +# X  applications
> +#
> +# BR2_PACKAGE_GOB2 is not set
> +
> +#
> +# midori  requires C++, WCHAR in toolchain and libgtk2
> +#
> +
> +#
> +# Hardware  handling
> +#
> +# BR2_PACKAGE_CDRKIT is not  set
> +BR2_PACKAGE_CRAMFS=y
> +# BR2_PACKAGE_DBUS is not set
> +#  BR2_PACKAGE_DEVMEM2 is not set
> +# BR2_PACKAGE_DMRAID is not set
> +#  BR2_PACKAGE_DOSFSTOOLS is not  set
> +BR2_PACKAGE_E2FSPROGS=y
> +BR2_PACKAGE_E2FSPROGS_UTILS=y
> +BR2_PACKAGE_E2FSPROGS_BADBLOCKS=y
> +BR2_PACKAGE_E2FSPROGS_BLKID=y
> +BR2_PACKAGE_E2FSPROGS_CHATTR=y
> +BR2_PACKAGE_E2FSPROGS_DUMPE2FS=y
> +BR2_PACKAGE_E2FSPROGS_E2FREEFRAG=y
> +BR2_PACKAGE_E2FSPROGS_E2FSCK=y
> +BR2_PACKAGE_E2FSPROGS_E2LABEL=y
> +BR2_PACKAGE_E2FSPROGS_E2UNDO=y
> +BR2_PACKAGE_E2FSPROGS_FILEFRAG=y
> +BR2_PACKAGE_E2FSPROGS_FINDFS=y
> +BR2_PACKAGE_E2FSPROGS_FSCK=y
> +BR2_PACKAGE_E2FSPROGS_LOGSAVE=y
> +BR2_PACKAGE_E2FSPROGS_LSATTR=y
> +BR2_PACKAGE_E2FSPROGS_MKE2FS=y
> +BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND=y
> +BR2_PACKAGE_E2FSPROGS_TUNE2FS=y
> +BR2_PACKAGE_E2FSPROGS_UUIDGEN=y
> +BR2_PACKAGE_E2FSPROGS_UUIDD=y
> +
> +#
> +#  e2fsprogs  libraries
> +#
> +BR2_PACKAGE_E2FSPROGS_LIBUUID=y
> +BR2_PACKAGE_E2FSPROGS_LIBBLKID=y
> +#  BR2_PACKAGE_EEPROG is not set
> +# BR2_PACKAGE_FCONFIG is not set
> +#  BR2_PACKAGE_FIS is not set
> +# BR2_PACKAGE_GADGETFS_TEST is not  set
> +BR2_PACKAGE_GENEXT2FS=y
> +BR2_PACKAGE_GENROMFS=y
> +#  BR2_PACKAGE_GPSD is not set
> +# BR2_PACKAGE_GVFS is not set
> +#  BR2_PACKAGE_HAL is not set
> +# BR2_PACKAGE_HDPARM is not set
> +#  BR2_PACKAGE_HWDATA is not set
> +# BR2_PACKAGE_I2C_TOOLS is not set
> +#  BR2_PACKAGE_INPUT_TOOLS is not set
> +# BR2_PACKAGE_IOSTAT is not set
> +#  BR2_PACKAGE_KBD is not set
> +# BR2_PACKAGE_LM_SENSORS is not set
> +#  BR2_PACKAGE_LVM2 is not set
> +# BR2_PACKAGE_MAKEDEVS is not set
> +#  BR2_PACKAGE_MDADM is not set
> +# BR2_PACKAGE_MEMTESTER is not  set
> +BR2_PACKAGE_MTD=y
> +
> +#
> +# MTD tools selection
> +#
> +#  BR2_PACKAGE_MTD_DOCFDISK is not set
> +# BR2_PACKAGE_MTD_DOC_LOADBIOS is not  set
> +# BR2_PACKAGE_MTD_FLASHCP is not set
> +# BR2_PACKAGE_MTD_FLASH_ERASE  is not set
> +# BR2_PACKAGE_MTD_FLASH_ERASEALL is not set
> +#  BR2_PACKAGE_MTD_FLASH_INFO is not set
> +# BR2_PACKAGE_MTD_FLASH_LOCK is not  set
> +# BR2_PACKAGE_MTD_FLASH_OTP_DUMP is not set
> +#  BR2_PACKAGE_MTD_FLASH_OTP_INFO is not set
> +# BR2_PACKAGE_MTD_FLASH_UNLOCK is  not set
> +# BR2_PACKAGE_MTD_FTL_CHECK is not set
> +#  BR2_PACKAGE_MTD_FTL_FORMAT is not  set
> +BR2_PACKAGE_MTD_JFFS2DUMP=y
> +BR2_PACKAGE_MTD_MKFSJFFS2=y
> +BR2_PACKAGE_MTD_MTD_DEBUG=y
> +BR2_PACKAGE_MTD_NANDDUMP=y
> +BR2_PACKAGE_MTD_NANDTEST=y
> +BR2_PACKAGE_MTD_NANDWRITE=y
> +#  BR2_PACKAGE_MTD_NFTLDUMP is not set
> +# BR2_PACKAGE_MTD_NFTL_FORMAT is not  set
> +
> +#
> +# recv_image requires a toolchain with IPv6  support
> +#
> +# BR2_PACKAGE_MTD_RFDDUMP is not set
> +#  BR2_PACKAGE_MTD_RFDFORMAT is not set
> +# BR2_PACKAGE_MTD_SERVE_IMAGE is not  set
> +# BR2_PACKAGE_MTD_SUMTOOL is not set
> +# BR2_PACKAGE_MTD_MTDINFO is  not set
> +# BR2_PACKAGE_MTD_UBIATTACH is not set
> +#  BR2_PACKAGE_MTD_UBICRC32 is not set
> +# BR2_PACKAGE_MTD_UBIDETACH is not  set
> +# BR2_PACKAGE_MTD_UBIFORMAT is not set
> +# BR2_PACKAGE_MTD_UBIMKVOL is  not set
> +# BR2_PACKAGE_MTD_UBINFO is not set
> +# BR2_PACKAGE_MTD_UBINIZE is  not set
> +# BR2_PACKAGE_MTD_UBIRENAME is not set
> +#  BR2_PACKAGE_MTD_UBIRMVOL is not set
> +# BR2_PACKAGE_MTD_UBIRSVOL is not  set
> +# BR2_PACKAGE_MTD_UBIUPDATEVOL is not set
> +# BR2_PACKAGE_NTFS_3G is  not set
> +# BR2_PACKAGE_NTFSPROGS is not set
> +# BR2_PACKAGE_PCIUTILS is not  set
> +# BR2_PACKAGE_RNG_TOOLS is not set
> +# BR2_PACKAGE_SETSERIAL is not  set
> +# BR2_PACKAGE_SMARTMONTOOLS is not  set
> +BR2_PACKAGE_SQUASHFS=y
> +BR2_PACKAGE_SQUASHFS_GZIP=y
> +#  BR2_PACKAGE_SQUASHFS_LZMA is not set
> +# BR2_PACKAGE_SQUASHFS_LZO is not  set
> +# BR2_PACKAGE_SYSSTAT is not set
> +BR2_PACKAGE_UDEV=y
> +#  BR2_PACKAGE_UDEV_UTILS is not set
> +
> +#
> +# Extra udev  tools
> +#
> +BR2_PACKAGE_UDEV_VOLUME_ID=y
> +BR2_PACKAGE_UDEV_SCSI_ID=y
> +#  BR2_PACKAGE_UDEV_PATH_ID is not set
> +# BR2_PACKAGE_UDEV_FIRMWARE_SH is not  set
> +# BR2_PACKAGE_USB_MODESWITCH is not  set
> +BR2_PACKAGE_USBMOUNT=y
> +BR2_PACKAGE_USBUTILS=y
> +#  BR2_PACKAGE_USBUTILS_ZLIB is not set
> +# BR2_PACKAGE_WIPE is not set
> +#  BR2_PACKAGE_XFSPROGS is not set
> +
> +#
> +# Interpreter languages and  scripting
> +#
> +BR2_PACKAGE_HASERL=y
> +# BR2_PACKAGE_HASERL_WITH_LUA is  not set
> +# BR2_PACKAGE_HASERL_VERSION_0_8_X is not  set
> +BR2_PACKAGE_HASERL_VERSION_0_9_X=y
> +BR2_PACKAGE_HASERL_VERSION="0.9.27"
> +#  BR2_PACKAGE_LUA is not set
> +# BR2_PACKAGE_MICROPERL is not set
> +#  BR2_PACKAGE_PHP is not set
> +# BR2_PACKAGE_PYTHON is not set
> +#  BR2_PACKAGE_RUBY is not set
> +# BR2_PACKAGE_TCL is not set
> +
> +#
> +#  Libraries
> +#
> +
> +#
> +# Compression and decompression
> +#
> +#  BR2_PACKAGE_LIBARCHIVE is not  set
> +BR2_PACKAGE_LZO=y
> +BR2_PACKAGE_ZLIB=y
> +
> +#
> +#  Crypto
> +#
> +# BR2_PACKAGE_BEECRYPT is not set
> +# BR2_PACKAGE_LIBGCRYPT  is not set
> +# BR2_PACKAGE_LIBGPG_ERROR is not  set
> +BR2_PACKAGE_OPENSSL=y
> +BR2_PACKAGE_OPENSSL_BIN=y
> +#  BR2_PACKAGE_OPENSSL_ENGINES is not set
> +
> +#
> +# Database
> +#
> +#  BR2_PACKAGE_BERKELEYDB is not set
> +# BR2_PACKAGE_MYSQL_CLIENT is not  set
> +# BR2_PACKAGE_SQLITE is not set
> +
> +#
> +# Filesystem
> +#
> +#  BR2_PACKAGE_GAMIN is not set
> +# BR2_PACKAGE_LIBCONFIG is not set
> +#  BR2_PACKAGE_LIBCONFUSE is not set
> +# BR2_PACKAGE_LIBFUSE is not  set
> +BR2_PACKAGE_LIBLOCKFILE=y
> +# BR2_PACKAGE_LIBSYSFS is not  set
> +
> +#
> +# Graphics
> +#
> +# BR2_PACKAGE_ATK is not set
> +#  BR2_PACKAGE_CAIRO is not set
> +# BR2_PACKAGE_FONTCONFIG is not set
> +#  BR2_PACKAGE_FREETYPE is not set
> +# BR2_PACKAGE_JPEG is not set
> +#  BR2_PACKAGE_LIBART is not set
> +# BR2_PACKAGE_GDK_PIXBUF is not set
> +#  BR2_PACKAGE_LIBPNG is not set
> +# BR2_PACKAGE_LIBSVGTINY is not set
> +#  BR2_PACKAGE_LIBUNGIF is not set
> +# BR2_PACKAGE_PANGO is not set
> +#  BR2_PACKAGE_PIXMAN is not set
> +# BR2_PACKAGE_TIFF is not set
> +
> +#
> +#  webkit requires C++, WCHAR in toolchain and libgtk2
> +#
> +
> +#
> +#  Hardware handling
> +#
> +# BR2_PACKAGE_LIBAIO is not set
> +#  BR2_PACKAGE_LIBRAW1394 is not set
> +# BR2_PACKAGE_TSLIB is not  set
> +BR2_PACKAGE_LIBUSB=y
> +BR2_PACKAGE_LIBUSB_COMPAT=y
> +
> +#
> +#  Networking
> +#
> +# BR2_PACKAGE_LIBCGI is not set
> +# BR2_PACKAGE_LIBCGICC  is not set
> +# BR2_PACKAGE_LIBCURL is not set
> +# BR2_PACKAGE_LIBDNET is not  set
> +# BR2_PACKAGE_LIBEXOSIP2 is not set
> +# BR2_PACKAGE_LIBIDN is not  set
> +# BR2_PACKAGE_LIBMICROHTTPD is not set
> +# BR2_PACKAGE_NEON is not  set
> +# BR2_PACKAGE_LIBNL is not set
> +# BR2_PACKAGE_LIBPCAP is not  set
> +# BR2_PACKAGE_LIBOSIP2 is not set
> +# BR2_PACKAGE_LIBRSYNC is not  set
> +# BR2_PACKAGE_LIBSOUP is not set
> +# BR2_PACKAGE_LIBUPNP is not  set
> +
> +#
> +# Other
> +#
> +# BR2_PACKAGE_ARGP_STANDALONE is not  set
> +# BR2_PACKAGE_LIBATOMIC_OPS is not set
> +# BR2_PACKAGE_LIBCAP is not  set
> +# BR2_PACKAGE_LIBDAEMON is not set
> +# BR2_PACKAGE_LIBELF is not  set
> +# BR2_PACKAGE_LIBEVENT is not set
> +BR2_PACKAGE_LIBGLIB2=y
> +#  BR2_PACKAGE_LIBOIL is not set
> +
> +#
> +# Text and terminal  handling
> +#
> +# BR2_PACKAGE_ENCHANT is not set
> +# BR2_PACKAGE_ICU is not  set
> +BR2_PACKAGE_LIBICONV=y
> +BR2_PACKAGE_NCURSES=y
> +#  BR2_PACKAGE_NCURSES_TARGET_PANEL is not set
> +#  BR2_PACKAGE_NCURSES_TARGET_FORM is not set
> +# BR2_PACKAGE_NCURSES_TARGET_MENU  is not set
> +# BR2_PACKAGE_NEWT is not set
> +# BR2_PACKAGE_PCRE is not  set
> +# BR2_PACKAGE_POPT is not set
> +BR2_PACKAGE_READLINE=y
> +#  BR2_PACKAGE_SLANG is not set
> +
> +#
> +# XML
> +#
> +# BR2_PACKAGE_EXPAT  is not set
> +# BR2_PACKAGE_EZXML is not set
> +BR2_PACKAGE_LIBXML2=y
> +#  BR2_PACKAGE_LIBXSLT is not set
> +# BR2_PACKAGE_XERCES is not  set
> +
> +#
> +# Miscellaneous
> +#
> +# BR2_PACKAGE_SHARED_MIME_INFO is  not set
> +
> +#
> +# Networking applications
> +#
> +# BR2_PACKAGE_ARGUS  is not set
> +# BR2_PACKAGE_AVAHI is not set
> +# BR2_PACKAGE_AXEL is not  set
> +# BR2_PACKAGE_BOA is not set
> +# BR2_PACKAGE_BIND is not  set
> +
> +#
> +# bmon requires a toolchain with IPv6 support
> +#
> +#  BR2_PACKAGE_BRIDGE is not set
> +# BR2_PACKAGE_CTORRENT is not set
> +#  BR2_PACKAGE_CUPS is not set
> +# BR2_PACKAGE_DHCP is not set
> +#  BR2_PACKAGE_DNSMASQ is not set
> +BR2_PACKAGE_DROPBEAR=y
> +#  BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS is not  set
> +BR2_PACKAGE_ETHTOOL=y
> +# BR2_PACKAGE_HOSTAPD is not set
> +#  BR2_PACKAGE_IFPLUGD is not set
> +# BR2_PACKAGE_IPERF is not  set
> +
> +#
> +# iproute2 requires a toolchain with IPv6 support
> +#
> +#  BR2_PACKAGE_IPSEC_TOOLS is not set
> +# BR2_PACKAGE_IPTABLES is not set
> +#  BR2_PACKAGE_IW is not set
> +# BR2_PACKAGE_KISMET is not set
> +#  BR2_PACKAGE_L2TP is not set
> +# BR2_PACKAGE_LIGHTTPD is not set
> +#  BR2_PACKAGE_LINKS is not set
> +# BR2_PACKAGE_LRZSZ is not set
> +#  BR2_PACKAGE_MIIDIAG is not set
> +# BR2_PACKAGE_MROUTED is not set
> +#  BR2_PACKAGE_MUTT is not set
> +# BR2_PACKAGE_NBD is not set
> +#  BR2_PACKAGE_NCFTP is not set
> +# BR2_PACKAGE_NETCAT is not set
> +#  BR2_PACKAGE_NETKITBASE is not set
> +# BR2_PACKAGE_NETKITTELNET is not  set
> +# BR2_PACKAGE_NETPLUG is not set
> +# BR2_PACKAGE_NETSNMP is not  set
> +# BR2_PACKAGE_NETSTAT_NAT is not set
> +# BR2_PACKAGE_NFS_UTILS is not  set
> +# BR2_PACKAGE_NTP is not set
> +# BR2_PACKAGE_NUTTCP is not  set
> +
> +#
> +# olsr requires a toolchain with IPv6 support
> +#
> +#  BR2_PACKAGE_OPENNTPD is not set
> +# BR2_PACKAGE_OPENSSH is not set
> +#  BR2_PACKAGE_OPENVPN is not set
> +# BR2_PACKAGE_PORTMAP is not set
> +#  BR2_PACKAGE_PPPD is not set
> +# BR2_PACKAGE_PPTP_LINUX is not set
> +#  BR2_PACKAGE_PROFTPD is not set
> +# BR2_PACKAGE_QUAGGA is not set
> +#  BR2_PACKAGE_RSYNC is not set
> +# BR2_PACKAGE_SAMBA is not set
> +#  BR2_PACKAGE_SER2NET is not set
> +# BR2_PACKAGE_SOCAT is not set
> +#  BR2_PACKAGE_SPAWN_FCGI is not set
> +
> +#
> +# Squid requires a toolchain  with C++ and IPv6 support enabled
> +#
> +# BR2_PACKAGE_TCPDUMP is not  set
> +# BR2_PACKAGE_DHCPDUMP is not set
> +# BR2_PACKAGE_TCPREPLAY is not  set
> +# BR2_PACKAGE_TFTPD is not set
> +# BR2_PACKAGE_THTTPD is not set
> +#  BR2_PACKAGE_TINYHTTPD is not set
> +# BR2_PACKAGE_TN5250 is not set
> +#  BR2_PACKAGE_TTCP is not set
> +# BR2_PACKAGE_UDPCAST is not set
> +#  BR2_PACKAGE_VPNC is not set
> +# BR2_PACKAGE_VSFTPD is not set
> +#  BR2_PACKAGE_VTUN is not set
> +# BR2_PACKAGE_WEBIF is not set
> +#  BR2_PACKAGE_WGET is not set
> +# BR2_PACKAGE_WIRELESS_TOOLS is not set
> +#  BR2_PACKAGE_WPA_SUPPLICANT is not set
> +
> +#
> +# Package  managers
> +#
> +# BR2_PACKAGE_IPKG is not set
> +
> +#
> +# rpm requires  libneon with SSL, XML and ZLIB support
> +#
> +
> +#
> +# Shell and  utilities
> +#
> +# BR2_PACKAGE_AT is not set
> +# BR2_PACKAGE_BASH is not  set
> +# BR2_PACKAGE_DASH is not set
> +# BR2_PACKAGE_DIALOG is not set
> +#  BR2_PACKAGE_FILE is not set
> +BR2_PACKAGE_LOCKFILE_PROGS=y
> +#  BR2_PACKAGE_LOGROTATE is not set
> +# BR2_PACKAGE_SCREEN is not set
> +#  BR2_PACKAGE_SUDO is not set
> +# BR2_PACKAGE_WHICH is not set
> +
> +#
> +#  System tools
> +#
> +# BR2_PACKAGE_BOOTUTILS is not set
> +#  BR2_PACKAGE_MODULE_INIT_TOOLS is not set
> +# BR2_PACKAGE_PROCPS is not  set
> +# BR2_PACKAGE_PSMISC is not set
> +# BR2_PACKAGE_SYSKLOGD is not  set
> +# BR2_PACKAGE_SYSVINIT is not set
> +# BR2_PACKAGE_UTIL-LINUX is not  set
> +
> +#
> +# Text editors and viewers
> +#
> +# BR2_PACKAGE_ED is not  set
> +# BR2_PACKAGE_LESS is not set
> +BR2_PACKAGE_NANO=y
> +#  BR2_PACKAGE_UEMACS is not set
> +BR2_PACKAGE_VIM=y
> +#  BR2_PACKAGE_VIM_RUNTIME is not set
> +
> +#
> +# Target filesystem  options
> +#
>+BR2_ROOTFS_POST_BUILD_SCRIPT="$(TOPDIR)/target/device/sheevaplug/SeagateDockStar/patchrootfs.sh"
>
>"
> +BR2_ROOTFS_DEVICE_TABLE="target/generic/device_table.txt"
> +BR2_ROOTFS_SKELETON_DEFAULT=y
> +#  BR2_ROOTFS_SKELETON_CUSTOM is not set
> +# BR2_TARGET_ROOTFS_CRAMFS is not  set
> +# BR2_TARGET_ROOTFS_CLOOP is not  set
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
> +BR2_TARGET_ROOTFS_EXT2_INODES=0
> +BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
> +BR2_TARGET_ROOTFS_EXT2_SQUASH=y
> +BR2_TARGET_ROOTFS_EXT2_NONE=y
> +#  BR2_TARGET_ROOTFS_EXT2_GZIP is not set
> +# BR2_TARGET_ROOTFS_EXT2_BZIP2 is  not set
> +# BR2_TARGET_ROOTFS_EXT2_LZMA is not  set
> +BR2_TARGET_ROOTFS_JFFS2=y
> +# BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056  is not set
> +# BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528 is not set
> +#  BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_512_16K is not  set
> +BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K=y
> +#  BR2_TARGET_ROOTFS_JFFS2_FLASH_128 is not set
> +#  BR2_TARGET_ROOTFS_JFFS2_FLASH_64 is not set
> +# BR2_TARGET_ROOTFS_JFFS2_CUSTOM  is not  set
> +BR2_TARGET_ROOTFS_JFFS2_PAGESIZE=0x800
> +BR2_TARGET_ROOTFS_JFFS2_EBSIZE=0x20000
> +BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
> +#  BR2_JFFS2_TARGET_SREC is not set
> +# BR2_TARGET_ROOTFS_JFFS2_PAD is not  set
> +BR2_TARGET_ROOTFS_JFFS2_LE=y
> +# BR2_TARGET_ROOTFS_JFFS2_BE is not  set
> +BR2_TARGET_ROOTFS_JFFS2_SUMMARY=y
> +# BR2_TARGET_ROOTFS_UBIFS is not  set
> +# BR2_TARGET_ROOTFS_SQUASHFS is not  set
> +BR2_TARGET_ROOTFS_TAR=y
> +# BR2_TARGET_ROOTFS_TAR_NONE is not  set
> +BR2_TARGET_ROOTFS_TAR_GZIP=y
> +# BR2_TARGET_ROOTFS_TAR_BZIP2 is not  set
> +# BR2_TARGET_ROOTFS_TAR_LZMA is not  set
> +BR2_TARGET_ROOTFS_TAR_OPTIONS=""
> +# BR2_TARGET_ROOTFS_CPIO is not  set
> +# BR2_TARGET_ROOTFS_INITRAMFS is not set
> +# BR2_TARGET_ROOTFS_ROMFS  is not set
> +
> +#
> +# Bootloaders
> +#
> +# BR2_TARGET_BAREBOX is not  set
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="sheevaplug"
> +BR2_TARGET_UBOOT_2010_06=y
> +#  BR2_TARGET_UBOOT_2010_03 is not set
> +# BR2_TARGET_UBOOT_2009_11 is not  set
> +# BR2_TARGET_UBOOT_2009_08 is not set
> +#  BR2_TARGET_UBOOT_CUSTOM_TARBALL is not  set
> +BR2_TARGET_UBOOT_VERSION="2010.06"
>+BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR="$(TOPDIR)/target/device/sheevaplug/SeagateDockStar/u-boot-patches"
>
>"
> +BR2_TARGET_UBOOT_FORMAT_BIN=y
> +#  BR2_TARGET_UBOOT_FORMAT_KWB is not  set
> +BR2_TARGET_UBOOT_TOOL_MKIMAGE=y
> +BR2_TARGET_UBOOT_TOOL_ENV=y
> +BR2_TARGET_UBOOT_NETWORK=y
> +BR2_TARGET_UBOOT_SERVERIP="192.168.1.106"
> +BR2_TARGET_UBOOT_IPADDR="192.168.1.254"
> +BR2_TARGET_UBOOT_GATEWAY="192.168.1.1"
> +BR2_TARGET_UBOOT_NETMASK="255.255.255.0"
> +BR2_TARGET_UBOOT_ETHADDR="00:10:75:1A:87:C6"
> +BR2_TARGET_UBOOT_ETH1ADDR=""
> +#  BR2_TARGET_AT91BOOTSTRAP is not set
> +# BR2_TARGET_DATAFLASHBOOT is not  set
> +
> +#
> +#  Kernel
> +#
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_2_6_36=y
> +#  BR2_LINUX_KERNEL_CUSTOM_VERSION is not set
> +# BR2_LINUX_KERNEL_CUSTOM_TARBALL  is not  set
> +BR2_LINUX_KERNEL_VERSION="2.6.36.1"
>+BR2_LINUX_KERNEL_PATCH="$(TOPDIR)/target/device/sheevaplug/SeagateDockStar/kernel-patches/"
>
>"
> +#  BR2_LINUX_KERNEL_USE_DEFCONFIG is not  set
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(TOPDIR)/target/device/sheevaplug/SeagateDockStar/SeagateDockStar-linux-2.6.36.1.config"
>
>"
> +BR2_LINUX_KERNEL_UIMAGE=y
> +#  BR2_LINUX_KERNEL_ZIMAGE is not set
> diff --git  
>a/target/device/sheevaplug/SeagateDockStar/dropbear/dropbear_dss_host_key  
>b/target/device/sheevaplug/SeagateDockStar/dropbear/dropbear_dss_host_key
> new  file mode 100644
> index  
>0000000000000000000000000000000000000000..9eb8a7ee30c67de6964056cc6d9be8e378fa47c6
>
>
> GIT  binary patch
> literal  458
> zcmV;*0X6;r000Mbb7(DOb8`Ry0D%DJuGo+5s;{8A_aUSrMbz33ww$I^opO^|iT$=n
> zm5Dv2tPFd9U)@%c2QGS`5jQt7z#ZY${s#QcdkQ?&Nxv&SQz`A1?_E at 47;^rLXAAu8
> z<+C^r7mUbi({E?+Qn->NADdVxGT}&_pd%5_Dp)RA2HQ;A#JWs at lYnq-Q$hg%000#L
> zfc1p!BPz86+C?kBc=z1TGa&RK0001hZ*;g8$FRd|7LlyVU`5q15X=?O{aQsi&7uIY
> zQn3lh-<~xO_jd6@dgf3G($6y5Uk?tc_yw$Hlm^<&Xq!xW;|FD8QDC5YQxBcl6vI1{
> z3EmdOu;_*ZkxQkv?Dn5}5u0lw8k^o>K!OSQTn!kQ at EL@;3Gjw6W)Or*Kko+!0001i
> z0L0|X$T>sZ at 6_^9T=ll|alotM at +Uv9*i_kR%g*DW93c>n1M3|CPiR;pZGgRTk`GL6
> zT}m-UC$Qj~A6J$DATAs!j;D3^7$hoP%2xuL-9qW_pP3)Up=JFULIC&BfFDW(sJ`JI
> z$gillm4wx+r|v6VFvb!yyOr<(&YD`@$p8QV6eslZPXR)0xk`7nU4DZpE_5`5gK4eP
> A6aWAK
> 
> literal  0
> HcmV?d00001
> 
> diff --git  
>a/target/device/sheevaplug/SeagateDockStar/dropbear/dropbear_rsa_host_key  
>b/target/device/sheevaplug/SeagateDockStar/dropbear/dropbear_rsa_host_key
> new  file mode 100644
> index  
>0000000000000000000000000000000000000000..7594c4ddc57cae99cefc8cd6882c8578f4919d8e
>
>
> GIT  binary patch
> literal  426
> zcmV;b0agA0000Mbb7(Dcb724g00RL40RR91f_(F)#xBt^DR?g$lbSw-whCr>^1~y-
> zkWO^->uF)wfxG4N<5~OP+KA(PUP0L~p)NmC8?<>}g5I)7L at +#HMlW-is>HROd+rc{
> zH0T+^;CJExB at Y0FSih3jghvaRtqpTW5gsr7ZpJPmTD5;*As_aq%$y&IP1;kox=0aG
> zETHiK004pnFB*0SYE0fUo{TES9`e>gDdkFfJ5SIGID=GfE^ibC2{EnuyyE4H at a7=5
> z-oS93K2(nd?~H-6*idjR7g2ZkA;B1>Ly;}K_oaQ-0>P;yYKo8q>Y<lOm4r895=`}5
> z=FRseC~kTN8jz70`$6UxJ8A at 89JHu&#U5Aq$wPVv*#H0lLIB2~pR$DV4zvG>6UUu5
> znCG$eeoBm1+Y at XG<J@6(3;?+ocP4!#B-xADJtgGVb7_$ERAGc|xYIX(C#U${BRstT
> z002S&p$j0%1;0n(P8s$ipc<MqTgov#S$B8ft5?q6#sn+?qGw(?#zB>H0<UR9ykNcQ
> UjLuO&K~G!J7cdF88-kN+MOxpz#{d8T
> 
> literal  0
> HcmV?d00001
> 
> diff --git  
>a/target/device/sheevaplug/SeagateDockStar/kernel-patches/linux-0003-LED-definitions-for-the-Seagate-FreeAgent-DockStar.patch
>
>b/target/device/sheevaplug/SeagateDockStar/kernel-patches/linux-0003-LED-definitions-for-the-Seagate-FreeAgent-DockStar.patch
>
>h
> new w file mode 100644
> index 0000000..4f9e8f3
> --- /dev/null
> +++  
>b/target/device/sheevaplug/SeagateDockStar/kernel-patches/linux-0003-LED-definitions-for-the-Seagate-FreeAgent-DockStar.patch
>
>
> @@  -0,0 +1,48 @@
> +From 3e07cb8bcd0083744458a68ffe03984c0ca1902c Mon Sep 17  00:00:00 2001
> +From: Alexander Holler <holler@ahsoftware.de>
> +Date: Fri,  22 Jan 2010 12:18:18 +0100
> +Subject: [PATCH 3/4] LED definitions for the  Seagate FreeAgent DockStar.
> +
> +Change the definitions of the LEDs for the  SheevaPlug to reflect
> +the LEDs used by the DockStar.
> +
> +Signed-off-by:  Alexander Holler <holler@ahsoftware.de>
> +---
> +  arch/arm/mach-kirkwood/sheevaplug-setup.c |   13 ++++++++++---
> + 1 files  changed, 10 insertions(+), 3 deletions(-)
> +
> +diff --git  a/arch/arm/mach-kirkwood/sheevaplug-setup.c  
>b/arch/arm/mach-kirkwood/sheevaplug-setup.c
> +index 6df5c49..265939a  100644
> +--- a/arch/arm/mach-kirkwood/sheevaplug-setup.c
> ++++  b/arch/arm/mach-kirkwood/sheevaplug-setup.c
> +@@ -52,9 +52,15 @@ static struct  mvsdio_platform_data sheevaplug_mvsdio_data 

>= {
> + 
> + static struct  gpio_led sheevaplug_led_pins[] = {
> +      {
> +-        .name             =  "plug:green:health",
> ++         .name            =  "dockstar:green:health",
> +          .default_trigger    = "default-on",
> +-         .gpio             = 49,
> ++        .gpio             = 46, /* green */
> ++         .active_low        =  1,
> ++    },
> ++    {
> ++         .name             = "dockstar:orange:misc",
> ++         .default_trigger    = "none",
> ++         .gpio             = 47, /* orange */
> +          .active_low        = 1,
> +      },
> + };
> +@@ -74,7 +80,8 @@ static struct platform_device sheevaplug_leds =  {
> + 
> + static unsigned int sheevaplug_mpp_config[] __initdata = {
> +      MPP29_GPIO,    /* USB Power Enable  */
> +-    MPP49_GPIO,    /* LED  */
> ++    MPP46_GPIO,    /* LED green  */
> ++    MPP47_GPIO,    /* LED orange */
> +      0
> + };
> + 
> +-- 
> +1.6.4.4
> +
> diff --git  
>a/target/device/sheevaplug/SeagateDockStar/kernel-patches/linux-2-6-34-1-0002-MTD-partitons-used-by-the-Seagate-FreeAgent-DockStar.patch
>
>b/target/device/sheevaplug/SeagateDockStar/kernel-patches/linux-2-6-34-1-0002-MTD-partitons-used-by-the-Seagate-FreeAgent-DockStar.patch
>
>h
> new w file mode 100644
> index 0000000..c0cfa51
> --- /dev/null
> +++  
>b/target/device/sheevaplug/SeagateDockStar/kernel-patches/linux-2-6-34-1-0002-MTD-partitons-used-by-the-Seagate-FreeAgent-DockStar.patch
>
>
> @@  -0,0 +1,31 @@
> +From de6b4cc6b7187a5c0d0c1911fd6dc3129f2f6145 Mon Sep 17  00:00:00 2001
> +From: Alexander Holler <holler@ahsoftware.de>
> +Date: Sun,  24 Jan 2010 15:52:15 +0100
> +Subject: [PATCH 2/4] MTD partitons used by the  Seagate FreeAgent DockStar.
> +
> +Change the definition of the MTD partitions  for the SheevaPlug
> +to reflect the partitions used by the  DockStar.
> +
> +Signed-off-by: Alexander Holler <holler@ahsoftware.de>
> +---
> +  arch/arm/mach-kirkwood/sheevaplug-setup.c |    4 ++++
> + 1 files  changed, 4 insertions(+), 0 deletions(-)
> +
> +diff --git  a/arch/arm/mach-kirkwood/sheevaplug-setup.c  
>b/arch/arm/mach-kirkwood/sheevaplug-setup.c
> +index c7319ee..6df5c49  100644
> +--- a/arch/arm/mach-kirkwood/sheevaplug-setup.c
> ++++  b/arch/arm/mach-kirkwood/sheevaplug-setup.c
> +@@ -34,6 +34,10 @@ static struct  mtd_partition sheevaplug_nand_parts[] = {
> +     }, {
> +          .name = "root",
> +          .offset = MTDPART_OFS_NXTBLK,
> ++         .size = SZ_32M
> ++    },  {
> ++        .name =  "data",
> ++        .offset =  MTDPART_OFS_NXTBLK,
> +         .size =  MTDPART_SIZ_FULL
> +     },
> + };
> +-- 
> +1.6.4.4
> +
> diff --git  
>a/target/device/sheevaplug/SeagateDockStar/kernel-patches/linux-2.6.34-0004-Change-board-name-for-the-SheevaPlug-to-reflect-the-changes.patch
>
>b/target/device/sheevaplug/SeagateDockStar/kernel-patches/linux-2.6.34-0004-Change-board-name-for-the-SheevaPlug-to-reflect-the-changes.patch
>
>h
> new w file mode 100644
> index 0000000..97e0ec8
> --- /dev/null
> +++  
>b/target/device/sheevaplug/SeagateDockStar/kernel-patches/linux-2.6.34-0004-Change-board-name-for-the-SheevaPlug-to-reflect-the-changes.patch
>
>
> @@  -0,0 +1,46 @@
> +From 218b349e2e633625365b009cbe13b27521b43de8 Mon Sep 17  00:00:00 2001
> +From: Alexander Holler <holler@ahsoftware.de>
> +Date: Fri,  26 Feb 2010 06:54:40 +0100
> +Subject: [PATCH 4/4] Change board name for the  SheevaPlug to reflect the 
>changes of previous patches
> +
> +We changed the  sources for the SheevaPlug board, so we change the name
> +from "Marvell  SheevaPlug Reference Board" to "Seagate DockStar Board" to
> +make these  changes visible.
> +---
> + arch/arm/mach-kirkwood/Kconfig             |    4 ++--
> +  arch/arm/mach-kirkwood/sheevaplug-setup.c |    2 +-
> + 2 files  changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git  a/arch/arm/mach-kirkwood/Kconfig b/arch/arm/mach-kirkwood/Kconfig
> +index  f6c6196..8b5dd8a 100644
> +--- a/arch/arm/mach-kirkwood/Kconfig
> ++++  b/arch/arm/mach-kirkwood/Kconfig
> +@@ -27,10 +27,10 @@ config  MACH_MV88F6281GTW_GE
> +       Marvell 88F6281 GTW GE  Board.
> + 
> + config MACH_SHEEVAPLUG
> +-    bool "Marvell  SheevaPlug Reference Board"
> ++    bool "Seagate DockStar  Board"
> +     help
> +       Say 'Y' here  if you want your kernel to support the
> +-      Marvell  SheevaPlug Reference Board.
> ++      Seagate DockStar  Board.
> + 
> + config MACH_TS219
> +     bool "QNAP TS-110,  TS-119, TS-210, TS-219 and TS-219P Turbo NAS"
> +diff --git  a/arch/arm/mach-kirkwood/sheevaplug-setup.c  
>b/arch/arm/mach-kirkwood/sheevaplug-setup.c
> +index 265939a..03268f6  100644
> +--- a/arch/arm/mach-kirkwood/sheevaplug-setup.c
> ++++  b/arch/arm/mach-kirkwood/sheevaplug-setup.c
> +@@ -136,7 +136,7 @@ static void  __init sheevaplug_init(void)
> + }
> +
> + #ifdef  CONFIG_MACH_SHEEVAPLUG
> +-MACHINE_START(SHEEVAPLUG, "Marvell SheevaPlug  Reference Board")
> ++MACHINE_START(SHEEVAPLUG, "Seagate DockStar Board")
> +      /* Maintainer: shadi Ammouri <shadi@marvell.com> */
> +      .phys_io    = KIRKWOOD_REGS_PHYS_BASE,
> +      .io_pg_offst    = ((KIRKWOOD_REGS_VIRT_BASE)  >> 18) & 0xfffc,
> +-- 
> +1.6.4.4
> +
> diff --git  a/target/device/sheevaplug/SeagateDockStar/patchrootfs.sh  
>b/target/device/sheevaplug/SeagateDockStar/patchrootfs.sh
> new file mode  100755
> index 0000000..974738b
> --- /dev/null
> +++  b/target/device/sheevaplug/SeagateDockStar/patchrootfs.sh
> @@ -0,0 +1,14  @@
> +#!/bin/bash
> +#
> +# skript which runs before creating  rootfs
> +#
> +#
> +MAINDIR=${1}/../../
> +SRCDIR=${MAINDIR}"target/device/sheevaplug/SeagateDockStar/skeleton/*"
> +DESTDIR=${1}
> +echo  "patching some stuff in " ${DESTDIR} from ${SRCDIR}
> +#echo "DESTDIR "  ${DESTDIR}
> +#echo "SRCDIR " ${SRCDIR}
> +#ls -l ${SRCDIR}  ${SRCDIR}"/etc"
> +cp -rv ${SRCDIR} ${DESTDIR}
> +echo "end of userdefined  script before packing rootfs"
> diff --git  a/target/device/sheevaplug/SeagateDockStar/skeleton/etc/inittab  
>b/target/device/sheevaplug/SeagateDockStar/skeleton/etc/inittab
> new file mode  100644
> index 0000000..2111d5d
> --- /dev/null
> +++  b/target/device/sheevaplug/SeagateDockStar/skeleton/etc/inittab
> @@ -0,0 +1,46  @@
> +# /etc/inittab
> +#
> +# Copyright (C) 2001 Erik Andersen <andersen@codepoet.org>
> +#
> +#  Note: BusyBox init doesn't support runlevels.  The runlevels field is
> +#  completely ignored by BusyBox init. If you want runlevels, use
> +#  sysvinit.
> +#
> +# Format for each entry:  <id>:<runlevels>:<action>:<process>
> +#
> +# id         == tty to run on, or empty for /dev/console
> +# runlevels  == ignored
> +# action    == one of sysinit, respawn, askfirst, wait,  and once
> +# process   == program to run
> +
> +# Startup the  system
> +#null::sysinit:/bin/mount -o remount,rw  /
> +null::sysinit:/bin/mount -t proc proc /proc
> +null::sysinit:/bin/mkdir  -p /dev/pts
> +null::sysinit:/bin/mount -a
> +null::sysinit:/bin/hostname -F  /etc/hostname
> +# now run any rc  scripts
> +::sysinit:/etc/init.d/rcS
> +
> +# Set up a couple of  getty's
> +#tty1::respawn:/sbin/getty 38400 tty1
> +#tty2::respawn:/sbin/getty  38400 tty2
> +
> +# Put a getty on the serial  port
> +ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 #  GENERIC_SERIAL
> +
> +# Logging junk
> +null::sysinit:/bin/touch  /var/log/messages
> +null::respawn:/sbin/syslogd -n -m  0
> +null::respawn:/sbin/klogd -n
> +tty3::respawn:/usr/bin/tail -f  /var/log/messages
> +
> +# Stuff to do for the 3-finger  salute
> +::ctrlaltdel:/sbin/reboot
> +
> +# Stuff to do before  rebooting
> +null::shutdown:/usr/bin/killall  klogd
> +null::shutdown:/usr/bin/killall syslogd
> +null::shutdown:/bin/umount  -a -r
> +null::shutdown:/sbin/swapoff -a
> +
> diff --git  a/target/device/sheevaplug/SeagateDockStar/skeleton/etc/shadow  
>b/target/device/sheevaplug/SeagateDockStar/skeleton/etc/shadow
> new file mode  100644
> index 0000000..ff29c40
> --- /dev/null
> +++  b/target/device/sheevaplug/SeagateDockStar/skeleton/etc/shadow
> @@ -0,0 +1,12  @@
> +root:$1$LqBi5GdU$mYosovzQVc9h8Szv7dtX0/:0:0:99999:7:::
> +bin:*:10933:0:99999:7:::
> +daemon:*:10933:0:99999:7:::
> +adm:*:10933:0:99999:7:::
> +lp:*:10933:0:99999:7:::
> +sync:*:10933:0:99999:7:::
> +shutdown:*:10933:0:99999:7:::
> +halt:*:10933:0:99999:7:::
> +uucp:*:10933:0:99999:7:::
> +operator:*:10933:0:99999:7:::
> +nobody:*:10933:0:99999:7:::
> +default::10933:0:99999:7:::
> diff  --git  
>a/target/device/sheevaplug/SeagateDockStar/u-boot-patches/u-boot-2010.06-0001-DockStar-Change-RAM-definitions-to-one-bank-128-MB.patch
>
>b/target/device/sheevaplug/SeagateDockStar/u-boot-patches/u-boot-2010.06-0001-DockStar-Change-RAM-definitions-to-one-bank-128-MB.patch
>
>h
> new w file mode 100644
> index 0000000..92f6b99
> --- /dev/null
> +++  
>b/target/device/sheevaplug/SeagateDockStar/u-boot-patches/u-boot-2010.06-0001-DockStar-Change-RAM-definitions-to-one-bank-128-MB.patch
>
>
> @@  -0,0 +1,42 @@
> +From 36203d048e32f6f32937581e4d3676d23836c0a6 Mon Sep 17  00:00:00 2001
> +From: Alexander Holler <holler@ahsoftware.de>
> +Date: Thu, 4  Feb 2010 05:42:09 +0100
> +Subject: [PATCH 01/14] DockStar: Change RAM  definitions to one bank (128 
MB).
> +
> +---
> +  board/Marvell/sheevaplug/kwbimage.cfg |   10 ++++------
> + 1 files  changed, 4 insertions(+), 6 deletions(-)
> +
> +diff --git  a/board/Marvell/sheevaplug/kwbimage.cfg  
>b/board/Marvell/sheevaplug/kwbimage.cfg
> +index 3b9c53f..c8c7efe  100644
> +--- a/board/Marvell/sheevaplug/kwbimage.cfg
> ++++  b/board/Marvell/sheevaplug/kwbimage.cfg
> +@@ -74,11 +74,11 @@ DATA 0xFFD0140C  0x00000a33    #  DDR Timing (High)
> + # bit12-11:  TW2W
> + # bit31-13: zero required
> + 
> +-DATA 0xFFD01410  0x000000cc    #  DDR Address Control
> ++DATA 0xFFD01410  0x0000000d    #  DDR Address Control
> + # bit1-0:    00, Cs0width=x8
> + # bit3-2:   11, Cs0size=1Gb
> +-# bit5-4:   00,  Cs1width=x8
> +-# bit7-6:   11, Cs1size=1Gb
> ++# bit5-4:   00,  Cs1width=nonexistent
> ++# bit7-6:   00, Cs1size =nonexistent
> + #  bit9-8:   00, Cs2width=nonexistent
> + # bit11-10: 00, Cs2size  =nonexistent
> + # bit13-12: 00, Cs3width=nonexistent
> +@@ -142,9 +142,7 @@  DATA 0xFFD01504 0x0FFFFFF1    # CS[0]n Size
> + # bit23-4: ones,  required
> + # bit31-24: 0x0F, Size (i.e. 256MB)
> + 
> +-DATA 0xFFD01508  0x10000000    # CS[1]n Base address to 256Mb
> +-DATA 0xFFD0150C  0x0FFFFFF5    # CS[1]n Size 256Mb Window enabled for  CS1
> +-
> ++DATA 0xFFD0150C 0x00000000    # CS[1]n Size,  window disabled
> + DATA 0xFFD01514 0x00000000    # CS[2]n Size,  window disabled
> + DATA 0xFFD0151C 0x00000000    # CS[3]n Size,  window disabled
> + 
> +-- 
> +1.6.4.4
> +
> diff --git  
>a/target/device/sheevaplug/SeagateDockStar/u-boot-patches/u-boot-2010.06-0002-DockStar-environment-is-at-0xa0000.patch
>
>b/target/device/sheevaplug/SeagateDockStar/u-boot-patches/u-boot-2010.06-0002-DockStar-environment-is-at-0xa0000.patch
>
>h
> new w file mode 100644
> index 0000000..6bc600f
> --- /dev/null
> +++  
>b/target/device/sheevaplug/SeagateDockStar/u-boot-patches/u-boot-2010.06-0002-DockStar-environment-is-at-0xa0000.patch
>
>
> @@  -0,0 +1,27 @@
> +From 933ca7c0f6f6c68d68d24373df3733eeb2efc974 Mon Sep 17  00:00:00 2001
> +From: Alexander Holler <holler@ahsoftware.de>
> +Date: Thu, 4  Feb 2010 06:14:55 +0100
> +Subject: [PATCH 02/14] DockStar: environment is at  0xa0000.
> +
> +---
> + include/configs/sheevaplug.h |    4  ++--
> + 1 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git  a/include/configs/sheevaplug.h b/include/configs/sheevaplug.h
> +index  fc401a8..e020cb0 100644
> +--- a/include/configs/sheevaplug.h
> ++++  b/include/configs/sheevaplug.h
> +@@ -123,8 +123,8 @@
> +  * it has to be  rounded to sector size
> +  */
> + #define  CONFIG_ENV_SIZE             0x20000    /* 128k */
> +-#define  CONFIG_ENV_ADDR             0x60000
> +-#define CONFIG_ENV_OFFSET         0x60000    /* env starts here */
> ++#define  CONFIG_ENV_ADDR             0xA0000
> ++#define CONFIG_ENV_OFFSET         0xA0000    /* env starts here */
> + 
> + /*
> +  *  Default environment variables
> +-- 
> +1.6.4.4
> +
> diff --git  
>a/target/device/sheevaplug/SeagateDockStar/u-boot-patches/u-boot-2010.06-0003-DockStar-MTD-partitions.patch
>
>b/target/device/sheevaplug/SeagateDockStar/u-boot-patches/u-boot-2010.06-0003-DockStar-MTD-partitions.patch
>
>h
> new w file mode 100644
> index 0000000..bb8515a
> --- /dev/null
> +++  
>b/target/device/sheevaplug/SeagateDockStar/u-boot-patches/u-boot-2010.06-0003-DockStar-MTD-partitions.patch
>
>
> @@  -0,0 +1,27 @@
> +From ee152f0e659b69f46e52339c65996d5a0addfa4b Mon Sep 17  00:00:00 2001
> +From: Alexander Holler <holler@ahsoftware.de>
> +Date: Thu, 4  Feb 2010 06:29:43 +0100
> +Subject: [PATCH 03/14] DockStar: MTD  partitions.
> +
> +---
> + include/configs/sheevaplug.h |    4  ++--
> + 1 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git  a/include/configs/sheevaplug.h b/include/configs/sheevaplug.h
> +index  e020cb0..cccd142 100644
> +--- a/include/configs/sheevaplug.h
> ++++  b/include/configs/sheevaplug.h
> +@@ -133,8 +133,8 @@
> +      "setenv bootargs ${x_bootargs} ${x_bootargs_root}; "    \
> +      "${x_bootcmd_usb}; bootm 0x6400000;"
> + 
> +-#define  CONFIG_MTDPARTS         "orion_nand:512k(uboot),"    \
> +-     "3m at 1m(kernel),1m at 4m(psm),13m at 5m(rootfs) rw\0"
> ++#define  CONFIG_MTDPARTS         "orion_nand:1m(u-boot),"    \
> ++     "4m at 1m(uImage),32m at 5m(root),219m at 37m(data) rw\0"
> + 
> + #define  CONFIG_EXTRA_ENV_SETTINGS     "x_bootargs=console"    \
> +     "=ttyS0,115200  mtdparts="CONFIG_MTDPARTS    \
> +-- 
> +1.6.4.4
> +
> diff  --git  
>a/target/device/sheevaplug/SeagateDockStar/u-boot-patches/u-boot-2010.06-0004-DockStar-Change-prompt-and-ident-string.patch
>
>b/target/device/sheevaplug/SeagateDockStar/u-boot-patches/u-boot-2010.06-0004-DockStar-Change-prompt-and-ident-string.patch
>
>h
> new w file mode 100644
> index 0000000..94da1f4
> --- /dev/null
> +++  
>b/target/device/sheevaplug/SeagateDockStar/u-boot-patches/u-boot-2010.06-0004-DockStar-Change-prompt-and-ident-string.patch
>
>
> @@  -0,0 +1,35 @@
> +From d378c5eb18b7c208307ad5aaafacf91c4f0d73bb Mon Sep 17  00:00:00 2001
> +From: Alexander Holler <holler@ahsoftware.de>
> +Date: Thu, 4  Feb 2010 05:50:06 +0100
> +Subject: [PATCH 04/14] DockStar: Change prompt and  ident string.
> +
> +It just looks better if the greeting reflects the actual  used hardware. ;)
> +---
> + include/configs/sheevaplug.h |    4  ++--
> + 1 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git  a/include/configs/sheevaplug.h b/include/configs/sheevaplug.h
> +index  cccd142..ecb794c 100644
> +--- a/include/configs/sheevaplug.h
> ++++  b/include/configs/sheevaplug.h
> +@@ -28,7 +28,7 @@
> + /*
> +  *  Version number information
> +  */
> +-#define  CONFIG_IDENT_STRING    "\nMarvell-Sheevaplug"
> ++#define  CONFIG_IDENT_STRING    "\nSeagate FreeAgent DockStar"
> + 
> +  /*
> +  * High Level Configuration Options (easy to change)
> +@@ -81,7  +81,7 @@
> + #define CONFIG_INITRD_TAG    1    /*  enable INITRD tag */
> + #define CONFIG_SETUP_MEMORY_TAGS 1     /* enable memory tag */
> + 
> +-#define     CONFIG_SYS_PROMPT    "Marvell>> "    /*  Command Prompt */
> ++#define     CONFIG_SYS_PROMPT    "DockStar>> "    /*  Command Prompt */
> + #define     CONFIG_SYS_CBSIZE    1024    /* Console I/O Buff  Size */
> + #define    CONFIG_SYS_PBSIZE     (CONFIG_SYS_CBSIZE \
> +          +sizeof(CONFIG_SYS_PROMPT) + 16)    /* Print Buff */
> +-- 
> +1.6.4.4
> +
> diff --git  
>a/target/device/sheevaplug/SeagateDockStar/u-boot-patches/u-boot-2010.06-0007-DockStar-Include-long-help-messages.patch
>
>b/target/device/sheevaplug/SeagateDockStar/u-boot-patches/u-boot-2010.06-0007-DockStar-Include-long-help-messages.patch
>
>h
> new w file mode 100644
> index 0000000..68fac43
> --- /dev/null
> +++  
>b/target/device/sheevaplug/SeagateDockStar/u-boot-patches/u-boot-2010.06-0007-DockStar-Include-long-help-messages.patch
>
>
> @@  -0,0 +1,24 @@
> +From 21b28944090f61500787e6087e65d4d8c4a291ee Mon Sep 17  00:00:00 2001
> +From: Alexander Holler <holler@ahsoftware.de>
> +Date: Tue,  16 Feb 2010 21:11:57 +0100
> +Subject: [PATCH 07/14] DockStar: Include long  help messages.
> +
> +---
> + include/configs/sheevaplug.h |    1  +
> + 1 files changed, 1 insertions(+), 0 deletions(-)
> +
> +diff --git  a/include/configs/sheevaplug.h b/include/configs/sheevaplug.h
> +index  6b56652..4861f3a 100644
> +--- a/include/configs/sheevaplug.h
> ++++  b/include/configs/sheevaplug.h
> +@@ -98,6 +98,7 @@
> + #define  CONFIG_CMD_NAND
> + #define CONFIG_CMD_PING
> + #define  CONFIG_CMD_USB
> ++#define CONFIG_SYS_LONGHELP
> + 
> + /*
> +  * NAND  configuration
> +-- 
> +1.6.4.4
> +
> -- 
> 1.7.0.4
> 
> 


      
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-New-package-to-do-a-complete-build-for-the-seagate-d.patch
Type: application/octet-stream
Size: 140632 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101214/94376b02/attachment-0001.obj>
