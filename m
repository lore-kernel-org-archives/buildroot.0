From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Sep 2013 20:45:39 +0200
Subject: [Buildroot] [PATCH 1/1] package: udev is now provided by
 systemd or eudev.
In-Reply-To: <20130917125352.GB13723@pc-eric>
References: <1378476068-25300-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20130917071737.4af20d60@skate> <20130917125352.GB13723@pc-eric>
Message-ID: <20130917204539.7c788c2b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Tue, 17 Sep 2013 14:53:52 +0200, Eric Le Bihan wrote:

> >  (1) All the existing BR2_PACKAGE_UDEV* options are being renamed,
> >  without them being added in Config.in.legacy to provide a smooth
> >  migration path for users upgrading Buildroot. I believe this should be
> >  fixed by migrating them to eudev automatically through
> >  Config.in.legacy logic.
> I was not aware of this mechanism, as I was previously working with an old
> version of Buildroot (2012.08).

No problem.

> As mentioned in my reply to Arnout, I think it is better to have the selection
> of the init system before the selection of the /dev management, because the
> first item to choose when building a system is how to start it, not how to
> manage the devices.

Well, that's a matter of taste, but why not :)

> Our constraints are:
> 
>  1) we need to keep a virtual udev package to avoid breaking Pulseaudio, Weston,
>     Udisks, etc: as eudev is identical to udev from systemd, it does not
>     matter which one is selected to build these packages.

Right.

>  2) there is no need to offer a static /dev, mdev or eudev if systemd is
>     selected. The opposite is allowed.

Sure.

> I ack the idea of moving the choice between udev (from systemd) and eudev to
> the "System Configuration" menu. So I suggest that, when the user selects
> the init system:
> 
>  - if systemd is selected, then the menu to select /dev management is *not*
>    displayed, but replaced by a comment as "/dev management with udev
>    (from systemd)". The virtual package udev is selected.

I don't think that the udev virtual package should have a Config.in
option to select. It should most likely be like the OpenGL virtual
package: it provides an invisible BR2_PACKAGE_HAS_UDEV, which gets
selected by both systemd and eudev. All packages that need an udev
implementation to be available will have to 'depends on
BR2_PACKAGE_HAS_UDEV' and to do FOO_DEPENDENCIES += udev.

>  - if systemd is not selected, then the menu to select /dev management is
>    displayed, with the following choices:
> 
>    * static /dev
>    * /dev with devtmpfs
>    * /dev with devtmpfs + mdev
>    * /dev with devtmpfs + eudev

Right.

> Selecting eudev selects the udev virtual package.

See above. I don't think udev should have a Config.in option to be
selected.

> The user can configure
> the extras for eudev in the appropriate "Target packages" section.

Right.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
