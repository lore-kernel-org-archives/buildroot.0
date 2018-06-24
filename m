From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 24 Jun 2018 19:45:53 +0000
Subject: [Buildroot] [Bug 11111] New: raspberry pi 3 b+: missing BSP for
 64-bit kernel
Message-ID: <bug-11111-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11111

            Bug ID: 11111
           Summary: raspberry pi 3 b+: missing BSP for 64-bit kernel
           Product: buildroot
           Version: 2018.05
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: nospam+busybox at jtang.org
                CC: buildroot at uclibc.org
  Target Milestone: ---

I have been trying to get my RPi3 B+ running with Buildroot, using
configs/raspberrypi3_64_defconfig from the 2018.05 as a starting basis. I had
to make the following changes to get my Pi to boot to a usable HDMI console +
USB keyboard:

1. Updated BR2_LINUX_KERNEL_INTREE_DTS_NAME to also build
"broadcom/bcm2710-rpi-3-b-plus'. This is needed because the built-in USB
Ethernet device is handled by the lan78xx driver.[1]

2. At least for me, the generated output/target/etc/inittab was incorrect. The
file ran getty on both 'console' and 'tty1', but both 'console' and 'tty1'
referred to my HDMI/USB console. As a result, keystrokes were duplicated and
output messages were duplicated. I fixed this by setting
BR2_TARGET_GENERIC_GETTY_PORT to "tty1", but I suspect my hack is not
sufficient.

3. Changed board/raspberrypi/post-image.sh to set 'arm_64bit' instead of
'arm_control'.[2]

I would like for someone else with a RPi3+ to try out these changes before I
formally submit patches. Thanks.

References:

[1] https://patchwork.ozlabs.org/cover/898035/
[2] https://www.raspberrypi.org/documentation/configuration/config-txt/misc.md

-- 
You are receiving this mail because:
You are on the CC list for the bug.
