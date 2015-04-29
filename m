From: Santhosh Ramani <srcoolz@gmail.com>
Date: Wed, 29 Apr 2015 08:31:17 +0530
Subject: [Buildroot] Run a custom script after USB mount
In-Reply-To: <553FD6A9.5060804@mind.be>
References: <CADKZYYKSc+rE2YvaBokFteSTE3gwnEvNksY1-w0HNC35u5yFig@mail.gmail.com>
 <CAKAx1ch+bA0RtZ6tfeK959UQazCaWRtRZr_N-DKBdGddXvK9Fg@mail.gmail.com>
 <CADKZYYLY_bj7b-8vJ+ztgxc2zjuxKLJgxAJ0e4XY681=h2aj=Q@mail.gmail.com>
 <20150418143654.021fa104@free-electrons.com>
 <CADKZYYJrtTdn_47NCJumggetKmoHt7sAbk5-a9X_zHrMVJdYHA@mail.gmail.com>
 <55394E6D.8000404@mind.be>
 <CADKZYY+U0L0jd=2FU9z7u1dOk0sJE5AoSrbihmV7OEYKE7=hAg@mail.gmail.com>
 <553FD6A9.5060804@mind.be>
Message-ID: <CADKZYYK877uwZG-5ghTRiuBM8XWpLh8L1T1gQBCT+whXnjrqUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

I was able to solve the problem, and here is what I did to resolve it.
Buildroot adds a script to udev called "usbmount", so when I added my
script I named it "z-usb-detect" to ensure that it runs after usbmount.
This in conjunction with reloading udev rules "udevadm control
--reload-rules".

These two allowed my script to run fine. The z-usb-detect is a pilot script
that uses "& exit" at the end. I am not certain if this actually helps, but
I added it regardless. It could be helpful if someone explained how this
helps or doesn't help.

Additionally, my actual script uses a "sleep 2" at the start to allow more
time for the mount process to complete.

Thanks again for all your help guys.
Regards

Santhosh

On 29 April 2015 at 00:21, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 04/24/15 01:04, Santhosh Ramani wrote:
> > Hello Arnout,
> >
> >     > /# cat /etc/udev/rules.d/99-usb-detection.rules/*
> >     > SUBSYSTEM=="usb", ACTION=="add", KERNEL=="sda*",
> RUN+="/etc/hcc/usb-detected"*
> >      If it's a scsi device, the subsystem is block, not usb, right?
> >
> >
> > Yes you are correct - I removed the subsystem section and it now works
> properly.
> > I also was not restarting (or reloading) udev rules properly and that
> was also
> > contributing to the problem.
> >
> > The script I want to run copies data from the USB stick and places it at
> a given
> > location. However, it seems that by the time the script finishes
> executing the
> > USB is not yet mounted so nothing gets copied. How can I defer execution
> of the
> > script until the volume is mounted, yet at the same time not block udev.
> I tried
> > the following:
> >
> > usb-detected: Launcher Script
> >
> > /etc/hcc/update_script & exit
> >
> > I was hoping the second script "update" would be launched as a separate
> process
> > and will be non-blocking. I could then add sleep command in the second
> script
> > and delay execution. However, this doesn't seem to work. I was not able
> to use
> > 'disown' either, since it's a bash command. Similarly I didn't have any
> luck
> > with 'at' command either.
> >
> > Any thoughts on how I can defer the thread and not block udev?
>
>  Actually I don't use udev myself - I just read the documentation to
> answer your
> question. so I really can't say.
>
>  However, can't you add something to whatever script is doing the
> mounting, so
> you can be sure that it's mounted already?
>
>  Regards,
>  Arnout
>
> >
> > Thank you once again for all your replies.
> > Regards
> >
> > Santhosh
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>



-- 
Greater the Difficulty....Sweeter is the Victory
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150429/93880a08/attachment.html>
