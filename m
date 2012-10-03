From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Oct 2012 13:25:25 +0000 (UTC)
Subject: [Buildroot] [Bug 5516] appended device tree blobs on uImage fails
In-Reply-To: <bug-5516-163@https.bugs.busybox.net/>
References: <bug-5516-163@https.bugs.busybox.net/>
Message-ID: <20121003132525.C4832997A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5516

--- Comment #2 from richard.genoud at gmail.com 2012-10-03 13:25:24 UTC ---
(In reply to comment #1)
hum, I can't reproduce your zImage not beeing overwritten.
Ok, let's start from that:

Kernel v3.6 (and I tried with 3.0, 2.6.33) :

ARCH=arm
CROSS_COMPILE=/[blablabla]/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-
make -j 8 zImage
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
make[1]: ? include/generated/mach-types.h ? est ? jour.
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  CHK     kernel/config_data.h
  Kernel: arch/arm/boot/Image is ready
  LZMA    arch/arm/boot/compressed/piggy.lzma
  AS      arch/arm/boot/compressed/piggy.lzma.o
  LD      arch/arm/boot/compressed/vmlinux
  OBJCOPY arch/arm/boot/zImage
  Kernel: arch/arm/boot/zImage is ready

linux$ ((v3.6)) ARCH=arm
CROSS_COMPILE=/[blablabla]/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-
make -j 8 uImage
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
make[1]: ? include/generated/mach-types.h ? est ? jour.
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  CHK     kernel/config_data.h
  Kernel: arch/arm/boot/Image is ready
  LZMA    arch/arm/boot/compressed/piggy.lzma
  AS      arch/arm/boot/compressed/piggy.lzma.o
  LD      arch/arm/boot/compressed/vmlinux
  OBJCOPY arch/arm/boot/zImage                          <= zImage overwritten
  Kernel: arch/arm/boot/zImage is ready
  UIMAGE  arch/arm/boot/uImage
Image Name:   Linux-3.6.0
Created:      Wed Oct  3 14:14:37 2012
Image Type:   ARM Linux Kernel Image (uncompressed)
Data Size:    1906552 Bytes = 1861.87 kB = 1.82 MB
Load Address: 20008000
Entry Point:  20008000
  Image arch/arm/boot/uImage is ready

Even without touching to zImage, the objcopy is done again

NB: I tried that with a random config : at91sam9263_defconfig

with 2.6.33:
ARCH=arm
CROSS_COMPILE=/[blablalba]/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-
make -j 8 zImage
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
make[1]: ? include/generated/mach-types.h ? est ? jour.
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  Kernel: arch/arm/boot/Image is ready
  SHIPPED arch/arm/boot/compressed/lib1funcs.S
  AS      arch/arm/boot/compressed/lib1funcs.o
  LD      arch/arm/boot/compressed/vmlinux
  OBJCOPY arch/arm/boot/zImage
  Kernel: arch/arm/boot/zImage is ready
linux$ ((v2.6.33)) ls --full-time arch/arm/boot/zImage
-rwxr-xr-x 1 rgenoud rgenoud 1473900 2012-10-03 14:53:07.839044793
+0200 arch/arm/boot/zImage
linux$ ((v2.6.33)) ARCH=arm
CROSS_COMPILE=/[blablabla]/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-
make -j 8 uImage
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
make[1]: ? include/generated/mach-types.h ? est ? jour.
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  Kernel: arch/arm/boot/Image is ready
  SHIPPED arch/arm/boot/compressed/lib1funcs.S
  AS      arch/arm/boot/compressed/lib1funcs.o
  LD      arch/arm/boot/compressed/vmlinux
  OBJCOPY arch/arm/boot/zImage
  Kernel: arch/arm/boot/zImage is ready
  UIMAGE  arch/arm/boot/uImage
Image Name:   Linux-2.6.33
Created:      Wed Oct  3 14:53:17 2012
Image Type:   ARM Linux Kernel Image (uncompressed)
Data Size:    1473900 Bytes = 1439.36 kB = 1.41 MB
Load Address: 20008000
Entry Point:  20008000
  Image arch/arm/boot/uImage is ready
linux$ ((v2.6.33)) ls --full-time arch/arm/boot/zImage
-rwxr-xr-x 1 rgenoud rgenoud 1473900 2012-10-03 14:53:17.599033136
+0200 arch/arm/boot/zImage
So, dates are not the same.

The buildroot toolchain is compiled with:
BR2_UCLIBC_VERSION_STRING="0.9.33.2"
BR2_BINUTILS_VERSION="2.21.1"
BR2_GCC_VERSION="4.5.4"
(buildroot 2012.08)

2012/10/3  <bugzilla@busybox.net>:
> (In reply to comment #0)
>> that's because in the kernel, the uImage rule is :
>> $(obj)/uImage:  $(obj)/zImage FORCE
>>         @$(check_for_multiple_loadaddr)
>>         $(call if_changed,uimage)
>>         @echo '  Image $@ is ready'
>
> I don't get by looking at that code why the zImage should be overwritten?
The FORCE rule forces uImage creation. and those lines:
$(obj)/zImage:  $(obj)/compressed/vmlinux FORCE
        $(call if_changed,objcopy)
        @echo '  Kernel: $@ is ready'
are forcing zImage creation.
since uImage depends on zImage, zImage is re-evaluated, and recreated
because of FORCE.
At least, that's what I understand.
(file arch/arm/boot/Makefile )

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
