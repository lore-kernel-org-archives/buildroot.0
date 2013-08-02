From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  2 Aug 2013 08:31:00 +0000 (UTC)
Subject: [Buildroot] [Bug 6410] omap3_beagle has uimage error load address
	error
In-Reply-To: <bug-6410-163@https.bugs.busybox.net/>
References: <bug-6410-163@https.bugs.busybox.net/>
Message-ID: <20130802083100.BC4769B001@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6410

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-08-02 08:31:23 UTC ---
Well, BR2_TARGET_UBOOT_BOARDNAME="omap3_beagle" is a U-Boot option, while the
build error you have is from the kernel.

Since a few kernel versions, ARM has moved to multiplatform kernel, and the
load address is no longer known by the kernel sources themselves, and must be
passed as a LOADADDR environment variable when generating a kernel uImage.

Buildroot has support for that, in the form of the
BR2_LINUX_KERNEL_UIMAGE_LOADADDR:

config BR2_LINUX_KERNEL_UIMAGE_LOADADDR
        string "load address (for 3.7+ multi-platform image)"
        depends on BR2_arm || BR2_armeb
        depends on BR2_LINUX_KERNEL_UIMAGE || BR2_LINUX_KERNEL_APPENDED_UIMAGE
        help
          If your ARM system's Linux kernel is configured with the new (3.7+)
          multi-architecture support (CONFIG_ARCH_MULTIPLATFORM=y in your
          kernel config), then it is necessary to specify a kernel load address
          when building the uImage. This should be a hexadecimal string
          beginning with 0x, for example: 0x00008000.

          If unsure, let this option empty.

You simply need to use this option. For your OMAP3 BeagleBoard, I suggest you
to use 0x80008000.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
