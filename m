From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 16 Dec 2019 14:53:01 +0000
Subject: [Buildroot] [Bug 12411] New: Kernel zImage is actually a uImage
Message-ID: <bug-12411-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12411

            Bug ID: 12411
           Summary: Kernel zImage is actually a uImage
           Product: buildroot
           Version: 2019.08.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: bradley.gamble at ncipher.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I am currently building the Linux kernel with Buildroot and have been
outputting a working, bootable uImage file without issue.
A snippet of my config file:

    BR2_LINUX_KERNEL=y
    BR2_LINUX_KERNEL_CUSTOM_VERSION=y
    BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.1.9"
    BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
   
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(BR2_EXTERNAL)/board/linux-config/platform_defconfig"
    BR2_LINUX_KERNEL_DTS_SUPPORT=y
   
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="$(BR2_EXTERNAL)/board/device-tree/platform.dts"

I wanted to instead output a zImage file. I added the following line to the
config:
    BR2_LINUX_KERNEL_ZIMAGE=y

After a full rebuild (for snity) a zImage file is output to the
"./output/images/" directory, however the file is not actually a zImage:
    $ file zImage 
    zImage: u-boot legacy uImage, Linux-5.1.9, Linux/PowerPC, OS Kernel Image
(gzip), 4304978 bytes, Mon Dec 16 14:39:07 2019, Load Address: 0x00000000,
Entry Point: 0x00000000, Header CRC: 0x43D672C7, Data CRC: 0x4FF108C3

I am able to manually truncate the first 64 bytes which will give me a working
zImage file, however I expected Buildroot to give me an actual zImage file, not
requiring any manual modification.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
