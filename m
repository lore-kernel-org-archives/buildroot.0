From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jan 2017 14:52:39 +0100
Subject: [Buildroot] Firmware auto-loading does not work
In-Reply-To: <7ee11e7f-a489-9f3a-cfd8-3d93f291f695@oliseo.fr> ("Guillaume
 GARDET - =?utf-8?Q?Olis=C3=A9o=22's?= message of "Wed, 25 Jan 2017 13:56:22
 +0100")
References: <5a5c69bf-efc5-e35c-f95c-d303047320c4@oliseo.fr>
 <874m0ngv5h.fsf@dell.be.48ers.dk>
 <7ee11e7f-a489-9f3a-cfd8-3d93f291f695@oliseo.fr>
Message-ID: <87ziiffdqw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Guillaume" == Guillaume GARDET <- Olis?o <guillaume.gardet@oliseo.fr>> writes:

 > Le 25/01/2017 ? 13:51, Peter Korsgaard a ?crit :
 >>>>>>> "Guillaume" == Guillaume GARDET <- Olis?o <guillaume.gardet@oliseo.fr>> writes:
 >> > Hello,
 >> > I am using buildroot 2016.05 (with a 2.6.37 kernel) and firmware
 >> > auto-loading does not work. I need to do it manually (through
 >> > sysfs). I tried mdev and eudev, both are not working.
 >> 
 >> > Is there a known bug about that? In busybox, maybe?
 >> 
 >> If you have tried both eudev and mdev, then it is unlikely to be a bug
 >> in busybox (mdev). Are you using busybox modprobe applet or kmod?

 > This is not a problem of module loading (it is working fine) but
 > loading _firmware_ to devices for the WiFi dongle in my case.

Heh, I wonder how I could misread your email so much - Sorry about that.

First of all, our default busybox configuration has
CONFIG_FEATURE_MDEV_LOAD_FIRMWARE disabled. Have you enabled it? Without
that option, mdev doesn't do anything about firmware.

Less ancient (since 3.7, so 2012) Linux kernels directly loads firmware
files from the kernel, so the support in mdev isn't needed, but as you
are using an ancient kernel this doesn't work for you:

commit abb139e75c2cdbb955e840d6331cb5863e409d0e
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed Oct 3 15:58:32 2012 -0700

    firmware: teach the kernel to load firmware files directly from the filesystem

    This is a first step in allowing people to by-pass udev for loading
    device firmware.  Current versions of udev will deadlock (causing us to
    block for the 30 second timeout) under some circumstances if the
    firmware is loaded as part of the module initialization path, and this
    is causing problems for media drivers in particular.

    The current patch hardcodes the firmware path that udev uses by default,
    and will fall back to the legacy udev mode if the firmware cannot be
    found there.  We'd like to add support for both configuring the paths
    and the fallback behaviour, but in the meantime this hopefully fixes the
    immediate problem, while also giving us a way forward.

    [ v2: Some VFS layer interface cleanups suggested by Al Viro ]
    [ v3: use the default udev paths suggested by Kay Sievers ]

    Suggested-by: Ivan Kalvachev <ikalvachev@gmail.com>
    Acked-by: Greg KH <gregkh@linuxfoundation.org>
    Acked-by: Al Viro <viro@zeniv.linux.org.uk>
    Cc: Mauro Carvalho Chehab <mchehab@redhat.com>
    Cc: Kay Sievers <kay@redhat.com>
    Cc: Ming Lei <ming.lei@canonical.com>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

Looking at eudev git history, I see that the legacy user space loading
support got removed in 2014, so that is why it isn't working with eudev
either:

commit 3b717594600fa717cdf9bcfd0c7c1b703b245482
Author: Kay Sievers <kay@vrfy.org>
Date:   Mon Sep 1 09:07:49 2014 -0400

   udev: remove userspace firmware loading support

   Signed-off-by: Anthony G. Basile <blueness@gentoo.org>

We should probably enable CONFIG_FEATURE_MDEV_LOAD_FIRMWARE in our
default busybox.config to better support these old systems.

Can you confirm that it works if you enable that option.

-- 
Bye, Peter Korsgaard
