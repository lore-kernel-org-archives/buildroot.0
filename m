From: Christian Stewart <christian@paral.in>
Date: Sun, 24 Dec 2017 17:35:36 -0800
Subject: [Buildroot] systemd: build failure against pam on arm
In-Reply-To: <20171224120957.GY27558@waldemar-brodkorb.de>
References: <CA+h8R2q1W9PZ8DbTDuxZQhg3+hauZqaDdwzFAGgmTJd7KqiQEg@mail.gmail.com>
 <87fufjgycd.fsf@dell.be.48ers.dk>
 <CA+h8R2qdYZkwynNoPKjiDynzs_gs=TfFZ7i-STGrednoG4O-ew@mail.gmail.com>
 <CA+h8R2o8=LmmcudEaiJSCenX7t4QmHB3SPwm-UowrGQEu2bMPw@mail.gmail.com>
 <29DD8155-F769-488E-8A9E-39D8B6D18B54@openadk.org> <87608xykge.fsf@paral.in>
 <1397D1DC-9330-40CF-89AB-8CB27EEFF333@openadk.org> <873741w59p.fsf@paral.in>
 <20171224120957.GY27558@waldemar-brodkorb.de>
Message-ID: <87po73d1xz.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

There are no extra pam files in my Buildroot tree - before building I
ensure this with a "git clean -xfd" and I've searched the tree as well.

Waldemar Brodkorb <wbx@openadk.org> writes:
> I cannot reproduce the problem with your defconfig and br git
> master.

It may be something specific to Gentoo? The environment looks clean, so
I don't know how Gentoo would affect it, but there's one difference.

BR2_COMPILER_PARANOID_UNSAFE_PATH is enabled, shouldn't this catch it?

Note, I'm using an external build - 

 $ cd buildroot-src/
 $ make O=/home/paralin/buildroot defconfig
 $ cd /home/paralin/buildroot
 $ make clean
 $ make defconfig BR2_DEFCONFIG=$(pwd)/defconfig
 $ make all

> I disabled ccache. Could you try without ccache?

With ccache disabled:

libtool: link: /home/paralin/builroot/host/bin/arm-buildroot-linux-gnueabihf-gcc -D__SANE_USERSPACE_TYPES__ -pipe -Wall -Wextra -Wundef -Wlogical-op -Wmissing-include-dirs -Wold-style-definition -Wpointer-arith -Winit-self -Wdeclaration-after-statement -Wfloat-equal -Wsuggest-attribute=noreturn -Werror=missing-prototypes -Werror=implicit-function-declaration -Werror=missing-declarations -Werror=return-type -Werror=incompatible-pointer-types -Werror=format=2 -Wstrict-prototypes -Wredundant-decls -Wmissing-noreturn -Wshadow -Wendif-labels -Wstrict-aliasing=2 -Wwrite-strings -Wno-unused-parameter -Wno-missing-field-initializers -Wno-unused-result -Wno-format-signedness -Werror=overflow -Wdate-time -Wnested-externs -ffast-math -fno-common -fdiagnostics-show-option -fno-strict-aliasing -fvisibility=hidden -fstack-protector -fstack-protector-strong -fPIE --param=ssp-buffer-size=4 -Werror=shadow -flto -ffunction-sections -fdata-sections -I/home/paralin/builroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libmount -I/home/paralin/builroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/blkid -I/home/paralin/builroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/uuid -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -fno-lto -Wl,--gc-sections -Wl,--as-needed -Wl,--no-undefined -Wl,-z -Wl,relro -Wl,-z -Wl,now -pie -o systemd-analyze src/analyze/systemd_analyze-analyze.o src/analyze/systemd_analyze-analyze-verify.o  ./.libs/libcore.a /home/paralin/builroot/build/systemd-234/.libs/libsystemd-shared.so -L/home/paralin/builroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib -lcap -lresolv -llz4 /home/paralin/builroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libgcrypt.so /home/paralin/builroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libgpg-error.so /home/paralin/builroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libblkid.so /lib/libpam.so /lib/libpam_misc.so /home/paralin/builroot/build/linux-pam-1.3.0/libpam/.libs/libpam.so -ldl /home/paralin/builroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libkmod.so /home/paralin/builroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/liblzma.so -lz /home/paralin/builroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libmount.so /home/paralin/builroot/build/util-linux-2.31/.libs/libblkid.so /home/paralin/builroot/build/util-linux-2.31/.libs/libuuid.so -lrt -pthread -Wl,-rpath -Wl,/home/paralin/builroot/build/systemd-234/.libs -Wl,-rpath -Wl,/home/paralin/builroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib -Wl,-rpath -Wl,/home/paralin/builroot/build/linux-pam-1.3.0/libpam/.libs -Wl,-rpath -Wl,/home/paralin/builroot/build/util-linux-2.31/.libs -Wl,-rpath -Wl,/lib/systemd -Wl,-rpath -Wl,/home/paralin/builroot/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
/lib/libpam.so: file not recognized: File format not recognized
collect2: error: ld returned 1 exit status

> Isn't --disable-pam used when you did not enable linux-pam?

linux-pam is selected by:

 BR2_PACKAGE_UTIL_LINUX_{LOGIN, RUNUSER, SU}

Which I have enabled- here is a full defconfig:

  BR2_cortex_a7=y
  BR2_ARM_FPU_NEON_VFPV4=y
  BR2_CCACHE=y
  BR2_OPTIMIZE_2=y
  BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
  BR2_BINUTILS_VERSION_2_27_X=y
  BR2_TOOLCHAIN_BUILDROOT_CXX=y
  BR2_GCC_ENABLE_LTO=y
  BR2_TARGET_GENERIC_PASSWD_SHA256=y
  BR2_INIT_SYSTEMD=y
  BR2_SYSTEM_BIN_SH_BASH=y
  BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
  BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
  BR2_ENABLE_LOCALE_WHITELIST="C en_US en_US.UTF-8"
  BR2_GENERATE_LOCALE="en_US.UTF-8"
  BR2_LINUX_KERNEL=y
  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
  BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/raspberrypi/linux/archive/a5de96867a1d9a5087129ac61608446919a922ac/linux-rpi-4.9.70-a5de96.tar.gz"
  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
  BR2_LINUX_KERNEL_DTS_SUPPORT=y
  BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b"
  BR2_PACKAGE_BZIP2=y
  BR2_PACKAGE_GZIP=y
  BR2_PACKAGE_LZ4=y
  BR2_PACKAGE_UNZIP=y
  BR2_PACKAGE_XZ=y
  BR2_PACKAGE_ZIP=y
  BR2_PACKAGE_LSOF=y
  BR2_PACKAGE_BINUTILS=y
  BR2_PACKAGE_GREP=y
  BR2_PACKAGE_E2FSPROGS=y
  BR2_PACKAGE_E2FSPROGS_RESIZE2FS=y
  BR2_PACKAGE_MMC_UTILS=y
  BR2_PACKAGE_RPI_FIRMWARE=y
  BR2_PACKAGE_RTL8192CU=y
  BR2_PACKAGE_USBUTILS=y
  BR2_PACKAGE_LIBZIP=y
  BR2_PACKAGE_LZO=y
  BR2_PACKAGE_CA_CERTIFICATES=y
  BR2_PACKAGE_LIBSSH=y
  BR2_PACKAGE_LIBSSH2=y
  BR2_PACKAGE_LIBCURL=y
  BR2_PACKAGE_CURL=y
  BR2_PACKAGE_LIBSEPOL=y
  BR2_PACKAGE_ETHTOOL=y
  BR2_PACKAGE_IPUTILS=y
  BR2_PACKAGE_IW=y
  BR2_PACKAGE_MOSH=y
  BR2_PACKAGE_NETWORK_MANAGER=y
  BR2_PACKAGE_NTP=y
  BR2_PACKAGE_NTP_NTPDATE=y
  BR2_PACKAGE_NTP_NTPDC=y
  BR2_PACKAGE_NTP_NTPQ=y
  BR2_PACKAGE_RSYNC=y
  BR2_PACKAGE_WGET=y
  BR2_PACKAGE_WPA_SUPPLICANT=y
  BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT=y
  BR2_PACKAGE_WPA_SUPPLICANT_EAP=y
  BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT=y
  BR2_PACKAGE_WPA_SUPPLICANT_WPS=y
  BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
  BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO=y
  BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
  BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW=y
  BR2_PACKAGE_FILE=y
  BR2_PACKAGE_COREUTILS=y
  # BR2_PACKAGE_SYSTEMD_NETWORKD is not set
  # BR2_PACKAGE_SYSTEMD_RESOLVED is not set
  # BR2_PACKAGE_SYSTEMD_TIMEDATED is not set
  # BR2_PACKAGE_SYSTEMD_TIMESYNCD is not set
  BR2_PACKAGE_UTIL_LINUX_FALLOCATE=y
  BR2_PACKAGE_UTIL_LINUX_KILL=y
  BR2_PACKAGE_UTIL_LINUX_LINE=y
  BR2_PACKAGE_UTIL_LINUX_LOGIN=y
  BR2_PACKAGE_UTIL_LINUX_MORE=y
  BR2_PACKAGE_UTIL_LINUX_NEWGRP=y
  BR2_PACKAGE_UTIL_LINUX_RFKILL=y
  BR2_PACKAGE_UTIL_LINUX_SETPRIV=y
  BR2_PACKAGE_UTIL_LINUX_SU=y
  BR2_PACKAGE_NANO=y
  BR2_PACKAGE_VIM=y
  # BR2_PACKAGE_VIM_RUNTIME is not set
  BR2_TARGET_ROOTFS_CPIO=y
  BR2_TARGET_ROOTFS_CPIO_GZIP=y
  BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
  # BR2_TARGET_ROOTFS_TAR is not set
  BR2_PACKAGE_HOST_DOSFSTOOLS=y
  BR2_PACKAGE_HOST_E2FSPROGS=y
  BR2_PACKAGE_HOST_GENEXT2FS=y
  BR2_PACKAGE_HOST_GENIMAGE=y
  BR2_PACKAGE_HOST_PARTED=y
  BR2_PACKAGE_HOST_SQUASHFS=y

... so PAM is enabled on the system. I can try building with it disabled
as well, but that would most likely fix it. I need PAM though.

Thanks!
Christian 
