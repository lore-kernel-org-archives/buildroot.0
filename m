From: Santhosh Ramani <srcoolz@gmail.com>
Date: Thu, 23 Apr 2015 18:04:57 -0500
Subject: [Buildroot] Run a custom script after USB mount
In-Reply-To: <55394E6D.8000404@mind.be>
References: <CADKZYYKSc+rE2YvaBokFteSTE3gwnEvNksY1-w0HNC35u5yFig@mail.gmail.com>
 <CAKAx1ch+bA0RtZ6tfeK959UQazCaWRtRZr_N-DKBdGddXvK9Fg@mail.gmail.com>
 <CADKZYYLY_bj7b-8vJ+ztgxc2zjuxKLJgxAJ0e4XY681=h2aj=Q@mail.gmail.com>
 <20150418143654.021fa104@free-electrons.com>
 <CADKZYYJrtTdn_47NCJumggetKmoHt7sAbk5-a9X_zHrMVJdYHA@mail.gmail.com>
 <55394E6D.8000404@mind.be>
Message-ID: <CADKZYY+U0L0jd=2FU9z7u1dOk0sJE5AoSrbihmV7OEYKE7=hAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

> /# cat /etc/udev/rules.d/99-usb-detection.rules/*
> > SUBSYSTEM=="usb", ACTION=="add", KERNEL=="sda*",
> RUN+="/etc/hcc/usb-detected"*
>  If it's a scsi device, the subsystem is block, not usb, right?


Yes you are correct - I removed the subsystem section and it now works
properly. I also was not restarting (or reloading) udev rules properly and
that was also contributing to the problem.

The script I want to run copies data from the USB stick and places it at a
given location. However, it seems that by the time the script finishes
executing the USB is not yet mounted so nothing gets copied. How can I
defer execution of the script until the volume is mounted, yet at the same
time not block udev. I tried the following:

usb-detected: Launcher Script

/etc/hcc/update_script & exit

I was hoping the second script "update" would be launched as a separate
process and will be non-blocking. I could then add sleep command in the
second script and delay execution. However, this doesn't seem to work. I
was not able to use 'disown' either, since it's a bash command. Similarly I
didn't have any luck with 'at' command either.

Any thoughts on how I can defer the thread and not block udev?

Thank you once again for all your replies.
Regards

Santhosh
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150423/d2b2ae54/attachment.html>
