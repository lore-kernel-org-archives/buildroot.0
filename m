From: Norbert Lange <nolange79@gmail.com>
Date: Thu, 15 Oct 2020 14:42:35 +0200
Subject: [Buildroot] [PATCH] package/uboot-tools: create /var/lock
 directory for fw_printenv
In-Reply-To: <20201014235531.301aa821@windsurf>
References: <20201004125538.15161-1-aleontiev@elvees.com>
 <20201014235531.301aa821@windsurf>
Message-ID: <CADYdroNTfe-CMVv+vvSqdq5WuAMU4LUP4pFktgR3YUAOpxDcFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd init will not create /run/lock and the /var/lock symlink anymore,
this was caused by one of my changes. Still need some feedback for the
correct solution

1) copy over the old legacy.conf. Patch is at [1]
    (would be a quick temporary solution)
2) create a own buildroot.conf in the systemd-skeleton, adding those dirs
there (and in the future potentially other stuff)
3) Add some variable BR_SKELETON_LOCKDIR that uboot-tools selects (aswell
as sysv and busybox init)
    Only do 1 or2 if that variable is set.

At any rate, systemd-tmpfiles tool should be mandatory for systemd.

And if there's the will to drop the legacy /var/lock directory, then
packages like uboot-tools should be configured or
patched to use /run/lock, and that directory should exist for all init
systems [2].

Norbert

[1] - https://patchwork.ozlabs.org/project/buildroot/list/?series=197464
[2] - https://patchwork.ozlabs.org/project/buildroot/list/?series=205918


Am Mi., 14. Okt. 2020 um 23:55 Uhr schrieb Thomas Petazzoni <
thomas.petazzoni@bootlin.com>:

> Hello Anton,
>
> Thanks for your patch, I'm adding Norbert in Cc. See below for some
> comments.
>
> On Sun,  4 Oct 2020 15:55:38 +0300
> Anton Leontiev <aleontiev@elvees.com> wrote:
>
> > fw_setenv/fw_printenv create lock-files in /var/lock. If this directory
> > doesn't exist tools fail with following error:
> >
> >   Error opening lock file /var/lock/fw_printenv.lock
> >
> > Signed-off-by: Anton Leontiev <aleontiev@elvees.com>
> > ---
> >  package/uboot-tools/uboot-tools.mk | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/
> uboot-tools.mk
> > index a06c25998f..578702f04e 100644
> > --- a/package/uboot-tools/uboot-tools.mk
> > +++ b/package/uboot-tools/uboot-tools.mk
> > @@ -65,6 +65,7 @@ ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV),y)
> >  define UBOOT_TOOLS_INSTALL_FWPRINTENV
> >       $(INSTALL) -m 0755 -D $(@D)/tools/env/fw_printenv
> $(TARGET_DIR)/usr/sbin/fw_printenv
> >       ln -sf fw_printenv $(TARGET_DIR)/usr/sbin/fw_setenv
> > +     $(INSTALL) -m 0755 -d $(TARGET_DIR)/var/lock
>
> Unfortunately, this cannot be the correct solution: the
> skeleton-init-sysv package already creates /var/lock, as a symlink to
> /tmp, so your patch would clash with that. So I suppose you have a
> systemd init?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201015/52e126d3/attachment.html>
