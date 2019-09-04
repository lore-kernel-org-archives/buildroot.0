From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 04 Sep 2019 15:40:42 +0000
Subject: [Buildroot] [Bug 12186] New: Raspberry Pi Zero-W build fails on
 newer kernel versions
Message-ID: <bug-12186-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12186

            Bug ID: 12186
           Summary: Raspberry Pi Zero-W build fails on newer kernel
                    versions
           Product: buildroot
           Version: 2019.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: info at hifiberry.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

On newer kernel versions of the Raspberry Pi kernel, the Raspberry Pi Zero-W
overlay has been renamed from 

bcm2708-rpi-0-w.dtb

to

bcm2708-rpi-zero-w.dtb


Reproduce the problem:

make raspberrypi0w_defconfig
make

works

Now change 
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call
github,raspberrypi,linux,5eeff139ea9135db6e01a58ef613338f1d0899d8)/linux-5eeff139ea9135db6e01a58ef613338f1d0899d8.tar.gz"

to 
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call
github,raspberrypi,linux,8a9ebbd9b474592730dbbaee9be726600af1157b)/linux-8a9ebbd9b474592730dbbaee9be726600af1157b.tar.gz"
(current 4.19 Raspberry Pi kernel)

make now fails:

make[3]: *** No rule to make target 'arch/arm/boot/dts/bcm2708-rpi-0-w.dtb'. 
Stop.
arch/arm/Makefile:343: recipe for target 'bcm2708-rpi-0-w.dtb' failed
make[2]: *** [bcm2708-rpi-0-w.dtb] Error 2
package/pkg-generic.mk:238: recipe for target
'/home/matuschd/buildroot-2019.05.1/output/build/linux-custom/.stamp_built'
failed
make[1]: ***
[/home/matuschd/buildroot-2019.05.1/output/build/linux-custom/.stamp_built]
Error 2
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2

Some logic seems to be required here to distinguish between older and newer
kernels.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
