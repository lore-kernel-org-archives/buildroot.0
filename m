From: Spenser Gilliland <spenser@gillilanding.com>
Date: Sun, 7 Jul 2013 22:08:08 -0500
Subject: [Buildroot] [PATCH 2/2] beagle-capes: new package
In-Reply-To: <CA+-urNSaorXGZOEOEfGPDgAKk3cVx04K=YBP_htmhxJtB9bYrw@mail.gmail.com>
References: <1373239866-18076-1-git-send-email-spenser@gillilanding.com>
 <1373239866-18076-2-git-send-email-spenser@gillilanding.com>
 <CA+-urNSaorXGZOEOEfGPDgAKk3cVx04K=YBP_htmhxJtB9bYrw@mail.gmail.com>
Message-ID: <CAEBucnCKwf04AyCAXNuCG6YfvswAz4mRQAOm4m6h0Fk7mHqUyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank,

Your buildroot-bbb repo has been a great reference that helped me get
this all up and running.


> Slightly off topic, but did you run into any issues with the eMMC
> virtual cape when you did this? The cape manager requests the eMMC
> cape dtbo before the root file system is mounted. When mdev was
> finally run from the init scripts, it didn't satisfy that request (I
> quickly looked through the mdev source, and I didn't see any code to
> do this. mdev seems to only handle "hotplug" firmware requests). If I
> manually loaded the eMMC virtual cape dtbo file before the timeout, I
> could get things to work. I ended up compiling the dtbos into the
> kernel, but if your br configuration doesn't need to do this, then
> could you share?

Although, this is not a significant part of my testing (mainly focused
on hdmi support.) I can say that the emmc is detected very early in
the boot process and the following is shown during boot.

[    2.064491] mmc1: BKOPS_EN bit is not set
[    2.071345] mmc1: new high speed MMC card at address 0001
[    2.078050] mmcblk1: mmc1:0001 MMC02G 1.78 GiB
[    2.083224] mmcblk1boot0: mmc1:0001 MMC02G partition 1 1.00 MiB
[    2.089812] mmcblk1boot1: mmc1:0001 MMC02G partition 2 1.00 MiB
[    2.098715]  mmcblk1: p1 p2
[    2.106001]  mmcblk1boot1: unknown partition table
[    2.113814]  mmcblk1boot0: unknown partition table

Also, just an fyi to everyone with respect to hdmi output, you must
have beagle-capes enabled to allow HDMI output as HDMI is implemented
as a cape. Also, for any capes to work patch [1] is required.

[1] https://github.com/fhunleth/buildroot-bbb/blob/bbb/board/beagleboneblack/linux-0001-Add-missing-DTC-flags.patch

> Also, and this is just to understand things better, but if you don't
> want a firmware file copied to the target, wouldn't you just turn it
> off in the kernel's configuration?

No, by default Buildroot does not install use the firmware_install
target.  This is for reasons of disk space usage. The kernel, by
default, likes to install a lot of firmware.  Additionally, there is a
linux-firmware package for installing most of this firmware and has
much more granular control.

> Or were you motivated by the shear volume of dtbo files that you get
> when you turn on Beaglebone cape support? I was thinking that I wanted
> finer grain configuration in the Linux kernel so that I could select
> whether or not I wanted "cape-bone-exptest.dtbo" or
> "cape-bone-adafruit-lcd", etc., but I don't think that's a br problem.
> Prior to the Beaglebone capes, I had not seen so many firmware files
> that I didn't need.

I thought about doing individual capes but the constantly changing
nature of these capes would require lots of updates and special cases.
However, the size of dtbo's are negligible so I just installed them
all.

> Thanks,
> Frank
>
> p.s. thanks for the opengl work. I have a project coming up in the
> fall that will need it, so your commits are very timely.

Great to hear.  Hopefully, the Beaglebone Black will be a possible target soon.

Thanks,
Spenser

--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
