Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DCFC433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 15:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2A0A4091D;
	Fri, 11 Feb 2022 15:06:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bl1Z_AhPWdiz; Fri, 11 Feb 2022 15:06:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE34241675;
	Fri, 11 Feb 2022 15:06:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5164E1BF232
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 15:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FE6741675
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 15:06:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k8Oh9eyAiTZ6 for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 15:06:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94B634091D
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 15:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644591965;
 bh=NbIoz5VUlSxiaSGjntxQXtvbsNl0di7YgjsAuVMLMgM=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=Co0q4Btk1bCAS7X3ZBxAeNfr3FXDMwrWchT3B+iJ3es4W1aj3wd7tjqJ4z4+G7Y0n
 TSf1OOJsAL713RhrrzUHmd488qEQLKM9LaG5b8/iEchmuU/fR47kuvVpl9YHDRReu9
 78LgFL3G/fW2IR4CLxHYDZQ0H2QVvKOahk24r88w=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.232]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MnJlW-1nzXpI3pGG-00jEev for <buildroot@buildroot.org>; Fri, 11 Feb 2022
 16:06:05 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 11 Feb 2022 16:06:03 +0100
Message-Id: <20220211150604.23489-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:8z8FQsCeTnl0bsOGX3GEcKPj5k2L25hto0ekOvHyKuMJvgY7uKx
 vhljC8uJBMIgl0aHGbRICvLFm7kpm625qzw4iJLdgh8y5qN0mOqetWf813obirANpC6nNbI
 Wv2QLj7q2kAbPehwPRxrqLgCpRzUdVhNdtAB06CpLNJKNlMel30QkOSe15UWeUnJ3lz6/YT
 3NSHw5MugmpOGTlk5h7Fw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mV6M51Pxz80=:SDqr2bAx8eU75T2RTFNLdQ
 9oCm6OJHFqTU8WUONuvdiFGnma8EK0keMdmOQ0FmX968DXt3pQyNx238hyWsAul4vzwas+bWt
 qBkJwac2GPyThUoZ6l4PsDuiZWa08LJivQG0/+fN+QL6u4HRVCAMgL8TED/hqxriK3CntwQYx
 b4lsJpwjTrkPr8gVWDxjHFLKbiNW4wxvkuhoNhDzR4ZgNHA9EoRHWA/PPLphLHEcI/esyQ1f4
 VEHGEOyiaNE/InHYHZdvVRT5SA99ZJNiGPnvPIHnNaG4ZW6G3j+ZXHfH90xHOezq2uRBaSa2O
 8T0Ooupvad0vUjRfY5O7W4nvEcsKFTRAUKWNXu9CaRPojsKk2Y40nN4QJR9AOZABtlkZLtJ8p
 qwKFS8ChWdmUs+xxof7jAb/vavmLc/6qjQshDwsXw0A9fE2MM+GKMbcNQlHwtqo1agy3Pm4mS
 96FKv0biKX94gLZE9owVc8RfxN6BfT8zkGnK3pdlbqV5HQ//hAZgsXQU2BCuN5dMbz8MHD8Ll
 BVvXSgCj29o/KsCY2IIoRivxr0uV0eO7oM+O4Rwue147bztBWywL6qEpsup6RotVx910epRjv
 zIb3SHQTwfFcNqyUzWMadqtGUGVn8i/djv1Jq5dXdo2nxlcMPKV8sy76qVi3EUyoPVeSw6RiX
 sr2dbJw+9KkWBZQJBfyysBkmHS3g4xFPyA1n8X0xAdtLUurb3YxpPXmRCEZYdC5TVFYen2KD1
 gG3LsFcdczS19m3eZOu6z7iRXcbZPKm/ocljNnNWsCp2zwRjzN0wTF6SKVyoG1jwuoyk+PPnm
 rjD9JGyy3Mlh3qiQ01S4pD4zPS+pQrZT8i4b+/DXibzhzU7PmrDU5lY6BhSWXiNtUN3W8xkjW
 DG07pQ2sxE7NHT2ZUQdPYLyd4DiUjy0vVupi7px9DAg0oHmUfUZqq5V+WMggF8RcE7Yf/08gF
 nURWMJ0quAsU15b5dfLOajReGjCCGr7U5bwf0I24jC5NI44umTuwXDx91tfXoxwnoFUcDDInS
 1THd8+orw5KlywnxT0q8yz+ko3/3rTu0IOH8t1px7jsuwXXOfTdYfo7U90rYT589pUYnx7rDU
 hewHRH+n34f+zI=
Subject: [Buildroot] [PATCH v6 0/1] package/libcamera-apps: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- patch on top of latest libcamera version bump ([1])

- tested with test-pkg and the following test config

    BR2_PACKAGE_MESA3D=y
    BR2_PACKAGE_MESA3D_GALLIUM_DRIVER=y
    BR2_PACKAGE_MESA3D_DRIVER=y
    BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
    BR2_PACKAGE_MESA3D_GBM=y
    BR2_PACKAGE_MESA3D_OPENGL_EGL=y
    BR2_PACKAGE_XORG7=y
    BR2_PACKAGE_XLIB_LIBX11=y
    BR2_PACKAGE_LIBEPOXY=y
    BR2_PACKAGE_LIBDRM=y
    BR2_PACKAGE_BOOST=y
    BR2_PACKAGE_BOOST_PROGRAM_OPTIONS=y
    BR2_PACKAGE_LIBEXIF=y
    BR2_PACKAGE_JPEG=y
    BR2_PACKAGE_TIFF=y
    BR2_PACKAGE_LIBPNG=y
    BR2_PACKAGE_LIBCAMERA=y
    BR2_PACKAGE_LIBCAMERA_V4L2=y

- runtime tested on RPi3-b-plus/Pi-Camaera-v2.1) with the followig defconfig
  (raspberrypi3_64_defconfig based)

    BR2_aarch64=y
    BR2_ARM_FPU_VFPV4=y
    BR2_OPTIMIZE_3=y
    BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
    BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
    BR2_PACKAGE_GLIBC_UTILS=y
    BR2_GCC_VERSION_11_X=y
    BR2_TOOLCHAIN_BUILDROOT_CXX=y
    BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
    BR2_SYSTEM_DHCP="eth0"
    BR2_GENERATE_LOCALE="en_US"
    BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3-64/post-build.sh"
    BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3-64/post-image.sh"
    BR2_LINUX_KERNEL=y
    BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
    BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
    BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
    BR2_LINUX_KERNEL_DTS_SUPPORT=y
    BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2837-rpi-3-b"
    BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
    BR2_PACKAGE_STRACE=y
    BR2_PACKAGE_MTOOLS=y
    BR2_PACKAGE_DEJAVU=y
    BR2_PACKAGE_MESA3D=y
    BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4=y
    BR2_PACKAGE_MESA3D_OPENGL_ES=y
    BR2_PACKAGE_QT5=y
    BR2_PACKAGE_QT5BASE_EXAMPLES=y
    BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
    BR2_PACKAGE_QT5BASE_EGLFS=y
    BR2_PACKAGE_QT5BASE_DEFAULT_QPA="eglfs"
    BR2_PACKAGE_QT5BASE_FONTCONFIG=y
    BR2_PACKAGE_QT5BASE_HARFBUZZ=y
    BR2_PACKAGE_QT5BASE_GIF=y
    BR2_PACKAGE_QT5BASE_JPEG=y
    BR2_PACKAGE_QT5BASE_PNG=y
    BR2_PACKAGE_QT5QUICKCONTROLS=y
    BR2_PACKAGE_QT5QUICKCONTROLS2=y
    BR2_PACKAGE_RPI_FIRMWARE=y
    BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
    BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
    BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi3-64/config_3_64bit.txt"
    BR2_PACKAGE_LIBXKBCOMMON=y
    BR2_PACKAGE_LIBCAMERA_V4L2=y
    BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI=y
    BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1=y
    BR2_PACKAGE_LIBCAMERA_PIPELINE_SIMPLE=y
    BR2_PACKAGE_LIBCAMERA_PIPELINE_UVCVIDEO=y
    BR2_PACKAGE_LIBCAMERA_PIPELINE_VIMC=y
    BR2_PACKAGE_LIBCAMERA_COMPLIANCE=y
    BR2_PACKAGE_LIBCAMERA_APPS=y
    BR2_PACKAGE_DDRESCUE=y
    BR2_TARGET_ROOTFS_EXT2=y
    BR2_TARGET_ROOTFS_EXT2_4=y
    BR2_TARGET_ROOTFS_EXT2_SIZE="384M"
    # BR2_TARGET_ROOTFS_TAR is not set
    BR2_PACKAGE_HOST_DOSFSTOOLS=y
    BR2_PACKAGE_HOST_GENIMAGE=y
    BR2_PACKAGE_HOST_MTOOLS=y

  and the additional /boot/config.txt entries

    dtoverlay=vc4-kms-v3d           
    dtoverlay=imx219

  and the followig change in the kernel config to fix imx219 camera
  detection ('imx219 10-0010: failed to get regulators')

    @@ -3485,7 +3485,7 @@
 
     CONFIG_REGULATOR=y
     # CONFIG_REGULATOR_DEBUG is not set
    -# CONFIG_REGULATOR_FIXED_VOLTAGE is not set
    +CONFIG_REGULATOR_FIXED_VOLTAGE=y
     # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
     # CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
     # CONFIG_REGULATOR_88PG86X is not set

  and the following libcamera patch to disable the signature check
  (see [2] and [3] for details)

    diff --git a/src/libcamera/ipa_manager.cpp b/src/libcamera/ipa_manager.cpp
    index ad05b9c9..66d4ea48 100644
    --- a/src/libcamera/ipa_manager.cpp
    +++ b/src/libcamera/ipa_manager.cpp
    @@ -302,6 +302,9 @@ std::unique_ptr<IPAProxy> IPAManager::createIPA(PipelineHandler *pipe,
     
     bool IPAManager::isSignatureValid([[maybe_unused]] IPAModule *ipa) const
     {
    +#if 1
    +	return true;
    +#else
     #if HAVE_IPA_PUBKEY
     	File file{ ipa->path() };
     	if (!file.open(File::ReadOnly))
    @@ -321,6 +324,7 @@ bool IPAManager::isSignatureValid([[maybe_unused]] IPAModule *ipa) const
     #else
     	return false;
     #endif
    +#endif
     }
     
     } /* namespace libcamera */


[1] https://patchwork.ozlabs.org/project/buildroot/patch/20220211112245.1357817-1-kieran.bingham@ideasonboard.com/
[2] https://lists.buildroot.org/pipermail/buildroot/2020-June/284963.html
[3] http://lists.busybox.net/pipermail/buildroot/2021-January/302373.html


Peter Seiderer (1):
  package/libcamera-apps: new package

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...ror-and-Wfatal-errors-compiler-comma.patch | 37 +++++++++++++++
 package/libcamera-apps/Config.in              | 30 ++++++++++++
 package/libcamera-apps/libcamera-apps.hash    |  3 ++
 package/libcamera-apps/libcamera-apps.mk      | 46 +++++++++++++++++++
 6 files changed, 118 insertions(+)
 create mode 100644 package/libcamera-apps/0001-cmake-remove-Werror-and-Wfatal-errors-compiler-comma.patch
 create mode 100644 package/libcamera-apps/Config.in
 create mode 100644 package/libcamera-apps/libcamera-apps.hash
 create mode 100644 package/libcamera-apps/libcamera-apps.mk

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
