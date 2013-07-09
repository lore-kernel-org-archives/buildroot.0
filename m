From: Spenser Gilliland <spenser@gillilanding.com>
Date: Tue, 9 Jul 2013 09:03:02 -0500
Subject: [Buildroot] [PATCH 1/2] linux: install firmware to staging.
In-Reply-To: <20130709125435.68e83fc2@skate>
References: <1373239866-18076-1-git-send-email-spenser@gillilanding.com>
 <20130708175221.GE3206@free.fr> <20130709125435.68e83fc2@skate>
Message-ID: <CAEBucnC7c1tJFQCeGRfYD4O4xD4vwn=GpZnK6gQnJ=7X_jAjyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

>> # This option can be selected by other packages that require special
>> # firmwares bundled in some fiorks of the Linux kernell (eg. the BBB
>> # capes firmwares (.dtbo) as distributed in the TI Linux kernel fork).
>> # To install other firmwares, please use the linux-firmware package.
>
> The thing that worries me here is that this .dtbo thing for capes is
> custom to the BBB kernel, and as far as I know, not in the upstream
> kernel. So it annoys me a bit to have this within the linux/linux.mk
> logic, because if we started to add vendor-specific logic in this
> generic kernel .mk file, where are we going to end?

This should be the only change required to support any in-kernel
firmware.  It's very vendor agnostic and can be useful for more than
just beagle-capes.  This also establishes precedent for how to handle
non-mainlined in-kernel firmware.

> In order to have a better understanding of the problem, could someone
> summarize how things work with those .dtbo? Where are they located
> source wise, how they are built, where they should be installed,
> how/when they are loaded/used in the system, etc.

The .dtbo are device tree overlay files, the device tree sources from
which they are made are located in <kernel>/firmware/capes.  They are
built using the device tree compiler (dtc). They should be installed
in /lib/firmware and are used by the in-kernel capebus manager on boot
to add support for the capes.  The kernel installs these dtbo when the
firmware_install target is built.

In the kernel, the capebus manager uses eeproms to determine which
capes are installed on the target and installs the needed dtbo for the
cape.  This creates the needed platform devices in the kernel.

Thanks,
Spenser


--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
