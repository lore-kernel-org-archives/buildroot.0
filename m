From: Fragkiskos Sigalas <frasigal@gmail.com>
Date: Thu, 13 Jun 2019 00:53:15 +0300
Subject: [Buildroot] add option to run docker with initramfs
In-Reply-To: <20190612201856.GH2647@scaer>
References: <CAL+Nh7PQaDFU_SrWoV_W7-H=s6Y4ALHeC3A_LUozY+SnyXo3Lw@mail.gmail.com>
 <20190612201856.GH2647@scaer>
Message-ID: <CAL+Nh7PV+5toCMzScou2PauqijFZ6aogKbTK2P-umgAuZZvpVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

In order to use pivot_root a real device is needed, alas initramfs space is
not a real one.
Config.in for util-linux in busybox states:

The pivot_root utility swaps the mount points for the root filesystem
        with some other mounted filesystem. This allows you to do all sorts
        of wild and crazy things with your Linux system and is far more
        powerful than 'chroot'.

        Note: This is for initrd in linux 2.4. Under initramfs (introduced
        in linux 2.6) use switch_root instead.

So in case of initramfs switch_root should be used instead. I think that
dockerd
uses MS_MOVE with chroot, but this is of less or no importance.

On Wed, Jun 12, 2019 at 11:19 PM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Frank, All,
>
> On 2019-06-12 19:18 +0300, Fragkiskos Sigalas spake thusly:
> > By default docker uses pivot_root which is not available in initramfs.
>
> pivot_root is provided by either util-linux or busybox; it has (AFAICT)
> no relation to whether running from an initramfs or any other filesystem).
>
> Our default configuration for busybox eeven enables pivot_root.
>
> So, it looks like your could very well add pivot_root to your initramfs,
> in fact.
>
> Regards,
> Yann E. MORIN.
>
> > The way to override the default behaviour is to define an
> > environment variable DOCKER_RAMDISK when starting the daemon (weirdly
> enough there appears to be no respective command line option).
> > Would it make sense to add such an option in the docker package?
>
>
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190613/ff6a5296/attachment.html>
