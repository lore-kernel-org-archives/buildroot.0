From: Steve Calfee <stevecalfee@gmail.com>
Date: Wed, 25 Sep 2019 07:54:12 -0700
Subject: [Buildroot] Failure upgrading 8/2017 to 8/2019
Message-ID: <CAJJ6jxvMGKJoO=L6TSP9dc2Wyvg62GyKobn6nwemvUK-tC5RGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, I decided to upgrade to the latest buildroot 8/2019. My latest
pull/build was from 2017.8

When I tried to pull into my old tree I got a corrupted git tree - but
I keep no custom stuff in the buildroot tree, so I just cloned a new
copy from buildroot.org. I checked out tag 2019.08. I do like the
external stuff.

I use a buildroot constructed toolchain (from maybe 2014), so make
clean, make doesn't take soo long. But the build failed, any
suggestions on how to get locale to build?

Thanks, Steve

It built for a very long time, but failed in the target-finalize step.
It failed generating locales:

Generating locale en_US.UTF-8
[error] LC_IDENTIFICATION: unknown standard `en_US:2000' for category `LC_CTYPE'
[error] LC_IDENTIFICATION: unknown standard `en_US:2000' for category
`LC_NUMERIC'
[error] LC_IDENTIFICATION: unknown standard `en_US:2000' for category `LC_TIME'
[error] LC_IDENTIFICATION: unknown standard `en_US:2000' for category
`LC_COLLATE'
[error] LC_IDENTIFICATION: unknown standard `en_US:2000' for category
`LC_MONETARY'
[error] LC_IDENTIFICATION: unknown standard `en_US:2000' for category
`LC_MESSAGES'
[error] LC_IDENTIFICATION: unknown standard `en_US:2000' for category `LC_PAPER'
[error] LC_IDENTIFICATION: unknown standard `en_US:2000' for category `LC_NAME'
[error] LC_IDENTIFICATION: unknown standard `en_US:2000' for category
`LC_ADDRESS'
[error] LC_IDENTIFICATION: unknown standard `en_US:2000' for category
`LC_TELEPHONE'
[error] LC_IDENTIFICATION: unknown standard `en_US:2000' for category
`LC_MEASUREMENT'
[error] LC_IDENTIFICATION: unknown standard `en_US:2000' for category
`LC_IDENTIFICATION'
[error] no output file produced because errors were issued
Makefile:738: recipe for target 'target-finalize' failed
make[1]: *** [target-finalize] Error 4
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2

Here is my buildroot config:
BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_PATH="$(TOPDIR)/../new_sept_2014_tools/output/host/usr"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-linux"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_HOST_GDB=y
BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY=y
BR2_TARGET_GENERIC_HOSTNAME="dockstar"
BR2_TARGET_GENERIC_ISSUE="Welcome to Steve's Dockstar"
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_ROOTFS_DEVICE_TABLE="$(BR2_EXTERNAL_MY_DOCKSTAR_PATH)/seagatedockstar/device_table.txt"
BR2_ENABLE_LOCALE_WHITELIST="C en_US.utf8 C.UTF-8 en_US"
BR2_GENERATE_LOCALE="en_US"
BR2_ROOTFS_OVERLAY="$(BR2_EXTERNAL_MY_DOCKSTAR_PATH)/seagatedockstar/skeleton"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(BR2_EXTERNAL_MY_DOCKSTAR_PATH)/configs/dockstar_linux_defconfig"
BR2_LINUX_KERNEL_UIMAGE=y
BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="kirkwood-dockstar"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_PACKAGE_BUSYBOX_CONFIG="$(BR2_EXTERNAL_MY_DOCKSTAR_PATH)/configs/testbb_defconfig"
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_STRACE=y
BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_TREE=y
BR2_PACKAGE_MTD=y
BR2_PACKAGE_MTD_MKFSUBIFS=y
BR2_PACKAGE_NFS_UTILS=y
BR2_PACKAGE_NFS_UTILS_RPCDEBUG=y
BR2_PACKAGE_SSHFS=y
BR2_PACKAGE_UBOOT_TOOLS=y
BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE=y
BR2_PACKAGE_UBOOT_TOOLS_MKENVIMAGE=y
BR2_PACKAGE_USBMOUNT=y
BR2_PACKAGE_USBUTILS=y
BR2_PACKAGE_PHP=y
BR2_PACKAGE_PHP_SAPI_CGI=y
BR2_PACKAGE_PHP_SAPI_CLI=y
BR2_PACKAGE_PHP_EXT_SIMPLEXML=y
BR2_PACKAGE_PHP_EXT_WDDX=y
BR2_PACKAGE_PHP_EXT_XML=y
BR2_PACKAGE_PHP_EXT_XMLREADER=y
BR2_PACKAGE_PHP_EXT_XMLWRITER=y
BR2_PACKAGE_PHP_EXT_XSL=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_PY_PYC=y
BR2_PACKAGE_PYTHON_UCS4=y
BR2_PACKAGE_PYTHON_HASHLIB=y
BR2_PACKAGE_PYTHON_PYMYSQL=y
BR2_PACKAGE_PYTHON_PYRATEMP=y
BR2_PACKAGE_PYTHON_REQUESTS=y
BR2_PACKAGE_PYTHON_TORNADO=y
BR2_PACKAGE_MYSQL=y
BR2_PACKAGE_ORACLE_MYSQL_SERVER=y
BR2_PACKAGE_LIBCURL=y
BR2_PACKAGE_CURL=y
BR2_PACKAGE_LIBCURL_VERBOSE=y
BR2_PACKAGE_NSS_MDNS=y
BR2_PACKAGE_ICU=y
BR2_PACKAGE_NCURSES_WCHAR=y
BR2_PACKAGE_AVAHI=y
BR2_PACKAGE_AVAHI_DAEMON=y
BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY=y
BR2_PACKAGE_NTP=y
BR2_PACKAGE_RSYNC=y
BR2_PACKAGE_STUNNEL=y
BR2_PACKAGE_TCPDUMP=y
BR2_PACKAGE_BASH=y
BR2_PACKAGE_LESS=y
BR2_PACKAGE_MC=y
BR2_PACKAGE_NANO=y
BR2_TARGET_ROOTFS_UBIFS=y
BR2_TARGET_ROOTFS_UBI=y
BR2_TARGET_SHEEVAPLUG=y
