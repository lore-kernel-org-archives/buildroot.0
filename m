From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 17 Sep 2013 14:53:52 +0200
Subject: [Buildroot] [PATCH 1/1] package: udev is now provided by
 systemd or eudev.
In-Reply-To: <20130917071737.4af20d60@skate>
References: <1378476068-25300-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20130917071737.4af20d60@skate>
Message-ID: <20130917125352.GB13723@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 17, 2013 at 07:17:37AM +0200, Thomas Petazzoni wrote:

>  (1) All the existing BR2_PACKAGE_UDEV* options are being renamed,
>  without them being added in Config.in.legacy to provide a smooth
>  migration path for users upgrading Buildroot. I believe this should be
>  fixed by migrating them to eudev automatically through
>  Config.in.legacy logic.
I was not aware of this mechanism, as I was previously working with an old
version of Buildroot (2012.08).
>
>  (2) I'm not sure I like the fact that the selection of eudev vs.
>  systemd to be "hidden" within the udev virtual package Config.in
>  option. It means that the user needs to go in Target packages -> ...
>  -> udev to be able to select between eudev vs. systemd. I believe this
>  choice should be part of some option within the more global 'System
>  configuration' menu, or derived from the existing options.
>
>  There are I believe a few possibilities. The first one is to decide
>  automatically based on the /dev management solution + the init system
>  being used. If the /dev management solution is udev and the init
>  system is *not* systemd, then eudev can be used automatically, while
>  if the /dev management solution is udev and the init system is
>  systemd, then systemd should be used.
>
>  Another option is to explicitly create another /dev management option:
>
>    - Static /dev
>    - /dev with devtmpfs
>    - /dev with devtmpfs + mdev
>    - /dev with devtmpfs + eudev
>    - /dev with devtmpfs + systemd/udev
>
> I don't have a particular preference at the moment, but I reallly
> believe it should be handled as a global System configuration option
> rather than as a udev virtual package option.

As mentioned in my reply to Arnout, I think it is better to have the selection
of the init system before the selection of the /dev management, because the
first item to choose when building a system is how to start it, not how to
manage the devices.

Our constraints are:

 1) we need to keep a virtual udev package to avoid breaking Pulseaudio, Weston,
    Udisks, etc: as eudev is identical to udev from systemd, it does not
    matter which one is selected to build these packages.
 2) there is no need to offer a static /dev, mdev or eudev if systemd is
    selected. The opposite is allowed.

I ack the idea of moving the choice between udev (from systemd) and eudev to
the "System Configuration" menu. So I suggest that, when the user selects
the init system:

 - if systemd is selected, then the menu to select /dev management is *not*
   displayed, but replaced by a comment as "/dev management with udev
   (from systemd)". The virtual package udev is selected.
 - if systemd is not selected, then the menu to select /dev management is
   displayed, with the following choices:

   * static /dev
   * /dev with devtmpfs
   * /dev with devtmpfs + mdev
   * /dev with devtmpfs + eudev

Selecting eudev selects the udev virtual package. The user can configure
the extras for eudev in the appropriate "Target packages" section.

My reply to Arnout should contain the answers to the other questions.
