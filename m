From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 14 Oct 2015 13:44:53 +0200
Subject: [Buildroot] [PATCH v2 1/8] package/dhcp: fix SysV init scripts
 option passing
In-Reply-To: <561E1DAC.6000605@wsystem.com>
References: <1444728929-46246-1-git-send-email-benoit@wsystem.com>
 <CAGduivzbpaMUfyJYWtSXnZ1SH494jVVLv7nYx3T8f62gsh6Spg@mail.gmail.com>
 <561E1DAC.6000605@wsystem.com>
Message-ID: <CAGduivxnwRGBMCvmCUta6kHrz7LR1+Escr+PGC-tCxU-6q6XUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 14, 2015 at 11:17 AM, Beno?t Th?baudeau <benoit@wsystem.com>
wrote:

> Hi Maxime,
>
> On 14/10/2015 09:21, Maxime Hadjinlian wrote:
> > On Tue, Oct 13, 2015 at 11:35 AM, Beno?t Th?baudeau <benoit@wsystem.com
> <mailto:benoit@wsystem.com>> wrote:
> >
> >     The SysV init scripts have configuration variables like INTERFACES
> whose
> >     contents have to be passed to the daemon. These variables are
> >     initialized as empty strings, but some of them are not allowed to be
> >     empty and there was no means of filling them apart from creating a
> root
> >     FS overlay to overwrite these scripts.
> >
> >     This commit adds support for files under /etc/default/ to set these
> >     configuration variables. Such light files can now be added to the
> root
> >     FS skeleton or overlays without having to duplicate most of the SysV
> >     init scripts.
> >
> >     Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com <mailto:
> benoit at wsystem.com>>
> >
> >
> > Thanks a lot for your work, I am afraid I am going to add to your work
> and maybe be a bit of a kill joy:
> >
> > What about systemd ?
> >
> > There's already a service file in the dhcp package, so any changes made
> to the init scripts should also be made to the .service to keep the whole
> package coherent.
> >
> > If you need any help/tips, do ask.
>
> I don't have any experience with systemd. I see the basics from the online
> documentation.
>
> In order to switch an existing SysV + BusyBox defconfig to systemd, is
> there
> anything else to tweak than setting the init system to systemd in the
> configuration?
>
That's it, that's all you gotta do.

>
> Looking at the files, most of this series seems to already be fine with
> systemd.
> The SysV init scripts have not been kept consistent when systemd was
> added. But
> there are a few things to do for systemd though.
>
> For 1/8, would it be OK to change
> "EnvironmentFile=/etc/default/dhcpd.conf" to
> "EnvironmentFile=/etc/default/dhcpd" for systemd in order to share the
> filename
> with SysV? If I look into the /etc/default/ folder on my Ubuntu 15.04
> (which
> uses systemd), none of the files present has a .conf extension. The
> purpose of
> these files is to set some environment variables, so they're more scripts
> than
> configuration files.
>
Yep that's a good idea.

>
> When a change would affect both SysV and systemd, should there be a single
> patch
> common to both, or one patch per init system?
>
Separate patch would be better I think.

>
> Best regards,
> Beno?t
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151014/7007b7b7/attachment.html>
