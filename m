From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu, 19 Jul 2012 21:53:45 -0400
Subject: [Buildroot] [PATCH] avahi: only install
 default.script/S05avahi-setup.sh if not present in fs skeleton
In-Reply-To: <20120717234535.6ae0b109@skate>
References: <1341980076-28347-1-git-send-email-danomimanchego123@gmail.com>
 <20120717234535.6ae0b109@skate>
Message-ID: <CANxTyt4p2hR7StT27=SXN40KcYY4L-oBVfZ5V=dOYKLuY7GTfw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

> If avahi is built before
> Busybox, then you'll have the Avahi script. If Busybox is built before
> Avahi, then you'll have the Busybox script. This doesn't look correct.

Would it be appropriate to add something like this to busybox.mk, so that
Avahi always gets built first?

ifeq ($(BR2_PACKAGE_AVAHI),y)
# Compile Avahi first, to ensure proper preference of conditional
udhcpc/default.script installations
BUSYBOX_DEPENDENCIES += avahi
endif

Dan -

On Tue, Jul 17, 2012 at 5:45 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Le Wed, 11 Jul 2012 00:14:36 -0400,
> Danomi Manchego <danomimanchego123@gmail.com> a ?crit :
>
> > +     if [ ! -f $(TARGET_DIR)/usr/share/udhcpc/default.script ]; then \
> > +             $(INSTALL) -m 0755 -D
> package/avahi/busybox-udhcpc-default.script \
> > +                     $(TARGET_DIR)/usr/share/udhcpc/default.script; \
> > +     fi
>
> This doesn't work: the Busybox package already installs a
> default.script file in usr/share/udhcpc. If avahi is built before
> Busybox, then you'll have the Avahi script. If Busybox is built before
> Avahi, then you'll have the Busybox script. This doesn't look correct.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120719/82c9d98f/attachment.html>
