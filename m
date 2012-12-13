From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 13 Dec 2012 09:21:49 +0100
Subject: [Buildroot] Results of an all-package build
Message-ID: <50C9901D.2020704@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi all,

  As part of the test of the disable-doc patch I just sent, I built something
approaching an allyespackageconfig for x86_64 with a Sourcery-2012.09 toolchain.
Interesting to look at the results.

- The following fail to build:

  * classpath
  * diffutils
  * gpsd
  * ipsec-tools
  * linux-pam
  * ltp-testsuite
  * matchbox-desktop
  * metacity
  * webkit
  * neard
  * netatalk
  * network-manager
  * pcmanfm
  * pv
  * sconeserver-http-sconesite-image
  * xdriver_xf86-video-geode
  * xdriver_xf86-input-synaptics
  * valgrind (because glibc 2.16 is not supported, needs valgrind bump)
  * xstroke
  * grub
  * uboot (wrong ARCH parameter)

  midori and jamvm are not built because they depend on the above.

  There are a few more that fail to build in my environment if the
libxml2/mesa3d and linux-fusion patches are not applied. Also xenomai
must be extracted manually before the build, otherwise linux fails to
build.

- About 920 packages (host+target) are built, from 843 source
tarballs.

- legal-info succeeds without problems, except that sylpheed's
license file is not correctly defined.

- I also built a 3.2.28 kernel with Xenomai extension (OCF and RTAI
don't have support for that kernel version) and a x86_64 defconfig.

- cramfs fails to build because it's too large; iso9660 fails to
build because of grub.

- Resulting image sizes:

-rw-r--r-- 1 arnout arnout 374M Dec 13 05:47 bzImage
-rwxr-xr-x 1 arnout arnout  24K Dec 13 05:31 isolinux.bin*
-rwxr-xr-x 1 arnout arnout  27K Dec 13 05:31 pxelinux.bin*
-rw-r--r-- 1 arnout arnout 378M Dec 13 05:38 rootfs.cloop
-rw-r--r-- 1 arnout arnout 903M Dec 13 05:40 rootfs.cpio
-rw-r--r-- 1 arnout arnout 1.1G Dec 13 05:42 rootfs.ext2
-rw-r--r-- 1 arnout arnout 473M Dec 13 05:51 rootfs.jffs2
-rw-r--r-- 1 arnout arnout 899M Dec 13 05:54 rootfs.romfs
-rw-r--r-- 1 arnout arnout 369M Dec 13 05:56 rootfs.squashfs
-rw-r--r-- 1 arnout arnout 922M Dec 13 05:59 rootfs.tar
-rw-r--r-- 1 arnout arnout 251M Dec 13 06:12 rootfs.tar.lzma
-rw-r--r-- 1 arnout arnout 516M Dec 13 06:15 rootfs.ubi
-rw-r--r-- 1 arnout arnout 508M Dec 13 06:15 rootfs.ubifs

- The output directory (including all these images) is 31GB: 21GB
for build, 6.5GB for images, 2.9GB for host of which 2GB for staging.
The sources (excluding toolchain) are 1.6GB.

- Time for a clean build (without ccache and JLEVEL=3) on my laptop
is 6 hours. A yocto build takes roughly the same time on my laptop,
but has less than half as many packages.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
