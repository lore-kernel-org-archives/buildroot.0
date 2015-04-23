From: Santhosh Ramani <srcoolz@gmail.com>
Date: Wed, 22 Apr 2015 22:02:24 -0500
Subject: [Buildroot] Run a custom script after USB mount
In-Reply-To: <20150418143654.021fa104@free-electrons.com>
References: <CADKZYYKSc+rE2YvaBokFteSTE3gwnEvNksY1-w0HNC35u5yFig@mail.gmail.com>
 <CAKAx1ch+bA0RtZ6tfeK959UQazCaWRtRZr_N-DKBdGddXvK9Fg@mail.gmail.com>
 <CADKZYYLY_bj7b-8vJ+ztgxc2zjuxKLJgxAJ0e4XY681=h2aj=Q@mail.gmail.com>
 <20150418143654.021fa104@free-electrons.com>
Message-ID: <CADKZYYJrtTdn_47NCJumggetKmoHt7sAbk5-a9X_zHrMVJdYHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Thanks for your reply - I was able to use 'udevadm monitor' to look at udev
events. Every time the USB is inserted, I do see udev messages indicate
'add'. These are the scripts and rules I have in the system - may be I'm
doing something wrong here...

I have added a rule in /etc/udev/rules.d/ and it has the following single
line.

*# cat /etc/udev/rules.d/99-usb-detection.rules*
* SUBSYSTEM=="usb", ACTION=="add", KERNEL=="sda*",
RUN+="/etc/hcc/usb-detected"*

The usb-detected script is nothing more than a launcher script that runs
the dummy scripts and ensures that udev doesn't have to wait for the script
to finish completion.

*# cat /etc/hcc/usb-detected*







*#! /bin/sh # # The following script is launched when a USB memory stick is
mounted # This is just a launcher script # /root/update_script & exit*

And the update_script is doing nothing but creating a new file.

*# cat /root/update_script*








*#! /bin/sh sleep 5 echo "" > /root/new echo
"******************************************************" >> /root/new echo
"Test file created" >> /root/new echo
"******************************************************" >> /root/new echo
"" >> /root/new*

I can run the usb-detected script and it works fine, however I don't think
it gets launched from the usb-rule. Any thoughts on this?

Thank you for your help.
Regards

Santhosh


On 18 April 2015 at 07:36, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Santhosh Ramani,
>
> On Fri, 17 Apr 2015 11:37:41 -0500, Santhosh Ramani wrote:
>
> > I checked the daemons that are running, and it seems udev is running.
> > However, I do see /sbin/mdev and /sbin/udevd, so not entirely sure which
> > one is running. Under System Configuration /dev management, I do have
> eudev
> > selected rather than mdev.
> >
> > But regardless, shouldn't the script execute when USB is detected. I see
> > that it gets mounted properly at /media/usb0 but the script doesn't seem
> to
> > run.
>
> You may want to try 'udevadm --monitor' or something similar to debug
> the udev events.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>



-- 
Greater the Difficulty....Sweeter is the Victory
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150422/36eead56/attachment.html>
