From: =?UTF-8?Q?Einar_J=C3=B3n?= <tolvupostur@gmail.com>
Date: Tue, 28 Jan 2020 11:58:40 +0100
Subject: [Buildroot] [Question]: Building your own external toolchain
Message-ID: <CABhNV22ZOaOa7kKF-0jC9bhH54QyevM5vo50u7+pyEKCDUuUiA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

I am building a rootfs with multiple initramfs targets.
I need GCC8 and glibc 2-29 to target ARM, so none of the supplied
toolchains work.

I would like to use 'make sdk' on the rootfs and use the resulting
images/arm-buildroot-linux-gnueabihf_sdk-buildroot.tar.gz
to build the initramfs.

Before I start:
Am I doing this wrong? Is there a clever way to build a rootfs and couple
of types of initramfs without needing a defconfig for every one (1* rootfs
+ N* initramfs), with a separate output folder for each (output_rootfs,
output_initramfs_debug, output_initramfs_release, ... ) ?

So I have this one:
rootfs defconfig:
BR2_REPRODUCIBLE=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
BR2_GCC_VERSION_8_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y


All the initramfs defconfigs
BR2_REPRODUCIBLE=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="file://$(TOPDIR)/output_rootfs/images/arm-buildroot-linux-gnueabihf_sdk-buildroot.tar.gz"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-buildroot-linux-gnueabihf"
BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y

The 'file://' in BR2_TOOLCHAIN_EXTERNAL_URL seems wrong, but it was the
only way to get it to download. I also had issues with target_install, but
this config seems to work.
Is there a better way to do this?
Is there a way to always "refresh" the
$(BR2_DL_DIR)/toolchain-external-custom/arm-buildroot-linux-gnueabihf_sdk-buildroot.tar.gz
so it is in sync with $(BR2_TOOLCHAIN_EXTERNAL_URL). There is no hash by
design, so I have to do an rm -f
"$(BR2_DL_DIR)/toolchain-external-custom/arm-buildroot-linux-gnueabihf_sdk-buildroot.tar.gz"
every time I call "make O=output_rootfs sdk".
Is there something I am forgetting?

-- 
Regards
Einar J?n
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200128/55bdebb1/attachment.html>
