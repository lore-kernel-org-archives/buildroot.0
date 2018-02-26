From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Mon, 26 Feb 2018 15:08:49 +0100
Subject: [Buildroot] qt5 (5.9.3): custom app fails to build: multiple
 definition of `__bss_start'
Message-ID: <6c0e8f87-d704-c3cc-0866-a32ba36e603c@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

When I try to build my Qt application, I got the following error:

/home/sszy/development/buildroot-git/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5QuickTemplates2.so.5:(*IND*+0x0):
multiple definition of `_edata'
/home/sszy/development/buildroot-git/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5QuickTemplates2.so.5:(*IND*+0x0):
multiple definition of `__bss_start'
collect2: error: ld returned 1 exit status

I get a similar issue with the wearable demo, but only if I copy the
project outside the qt sources.

After some time looking on Google [1] [2] [3], I found out that it seems
to be an issue with Binutils 2.28, which is the one used by the current
ARM Linaro toolchain (Linaro ARM 2017.11) available in Buildroot.

A workaround is to add "QMAKE_LFLAGS += -fuse-ld=gold" to the .pro files.

My defconfig is:

BR2_arm=y
BR2_cortex_a7=y
BR2_ARM_FPU_NEON_VFPV4=y
BR2_DL_DIR="/home/sszy/development/buildroot-download"
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
BR2_PACKAGE_GDB=y
BR2_PACKAGE_GDB_DEBUGGER=y
BR2_PACKAGE_BITSTREAM_VERA=y
BR2_PACKAGE_CANTARELL=y
BR2_PACKAGE_DEJAVU=y
BR2_PACKAGE_FONT_AWESOME=y
BR2_PACKAGE_LIBERATION=y
BR2_PACKAGE_FBV=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_WIDGETS=y
BR2_PACKAGE_QT5BASE_DEFAULT_QPA="linuxfb"
BR2_PACKAGE_QT5BASE_FONTCONFIG=y
BR2_PACKAGE_QT5BASE_HARFBUZZ=y
BR2_PACKAGE_QT5BASE_GIF=y
BR2_PACKAGE_QT5BASE_JPEG=y
BR2_PACKAGE_QT5BASE_PNG=y
BR2_PACKAGE_QT5BASE_ICU=y
BR2_PACKAGE_QT5BASE_TSLIB=y
BR2_PACKAGE_QT5QUICKCONTROLS=y
BR2_PACKAGE_QT5QUICKCONTROLS2=y
BR2_PACKAGE_QT5SERIALBUS=y
BR2_PACKAGE_QT5VIRTUALKEYBOARD=y
BR2_PACKAGE_QT5VIRTUALKEYBOARD_HANDWRITING=y
BR2_PACKAGE_EVTEST=y
BR2_PACKAGE_PCIUTILS=y
BR2_PACKAGE_LIBDRM=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
BR2_PACKAGE_HOST_AESPIPE=y
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y

Does anyone has the same issue or can reproduce it ?
Do you consider this as a bug ? If so, should we disable gold when
building Qt ?

[1] https://bugreports.qt.io/browse/QTBUG-65071
[2] https://bugreports.qt.io/browse/QTBUG-63083
[3] https://sourceware.org/bugzilla/show_bug.cgi?id=21074

Best regards,

-- 
S?bastien Szymanski
Software engineer, Armadeus Systems
