From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Oct 2012 14:23:41 +0000 (UTC)
Subject: [Buildroot] [Bug 5516] appended device tree blobs on uImage fails
In-Reply-To: <bug-5516-163@https.bugs.busybox.net/>
References: <bug-5516-163@https.bugs.busybox.net/>
Message-ID: <20121003142341.B1E88997A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5516

--- Comment #3 from richard.genoud at gmail.com 2012-10-03 14:23:40 UTC ---
ok, this time to really be sure that I don't mess with anything, I made this
script:
cat ../test_zImage.sh 
#!/bin/sh

export
CROSS_COMPILE=PATH_TO_BUILDROOT/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi- 
export ARCH=arm

git checkout v3.0
git clean -fdx
make at91sam9263_defconfig 
make -j8 zImage 1>/dev/null 2>&1
ls --full-time arch/arm/boot/zImage
make -j8 uImage
ls --full-time arch/arm/boot/zImage


Be careful with it, there's the git clean -fdx that wipes out your kernel repo,
and the script itself by the way.

./test_zImage.sh
[...]
-rwxr-xr-x 1 rgenoud rgenoud 1790036 2012-10-03 15:52:55.074666703 +0200
arch/arm/boot/zImage
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
make[1]: ? include/generated/mach-types.h ? est ? jour.
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  Kernel: arch/arm/boot/Image is ready
  LZMA    arch/arm/boot/compressed/piggy.lzma
  SHIPPED arch/arm/boot/compressed/lib1funcs.S
  AS      arch/arm/boot/compressed/lib1funcs.o
  AS      arch/arm/boot/compressed/piggy.lzma.o
  LD      arch/arm/boot/compressed/vmlinux
  OBJCOPY arch/arm/boot/zImage
  Kernel: arch/arm/boot/zImage is ready
  UIMAGE  arch/arm/boot/uImage
Image Name:   Linux-3.0.0
Created:      Wed Oct  3 15:52:58 2012
Image Type:   ARM Linux Kernel Image (uncompressed)
Data Size:    1790036 Bytes = 1748.08 kB = 1.71 MB
Load Address: 20008000
Entry Point:  20008000
  Image arch/arm/boot/uImage is ready
-rwxr-xr-x 1 rgenoud rgenoud 1790036 2012-10-03 15:52:58.518707579 +0200
arch/arm/boot/zImage

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
