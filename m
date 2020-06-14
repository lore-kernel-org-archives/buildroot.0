From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 12:37:08 +0200
Subject: [Buildroot] [PATCH] fs: squashfs: Add config option to pass
 mksquashfs cmdln paramters.
In-Reply-To: <2569767.EKUIr981zW@diego>
References: <20200612133249.4127906-1-heiko@sntech.de>
 <20200614075725.GD2346@scaer> <2569767.EKUIr981zW@diego>
Message-ID: <20200614103708.GN2346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2020-06-14 12:20 +0200, Heiko St?bner spake thusly:
> Am Sonntag, 14. Juni 2020, 09:57:25 CEST schrieb Yann E. MORIN:
> > Heiko, All,
> > 
> > On 2020-06-12 15:32 +0200, Heiko Stuebner spake thusly:
> > > From: Christoph Muellner <christoph.muellner@theobroma-systems.com>
> > > 
> > > This can be use to specify additional command line argument to
> > > mksquashfs (e.g. -nopad). The implementation is inspired by
> > > a similar mechanism for ext file system images.
> > 
> > What kind of options do you expect to need to pass?
> 
> In our case it is "-nopad" to omit padding to the
> next 4k boundary.
[--SNIP--]
> ok, so if I'm reading you correctly, I should probably
> just introduce a 
> 	config BR2_TARGET_ROOTFS_SQUASHFS_NOPAD
> option, right?

Basically, right. But usually, we go with positive logic (at least
user-facing), so:

    config BR2_TARGET_ROOTFS_SQUASHFS_PAD
        bool "pad to a 4K boundary"
        default y # legacy was always ON
        help
          Say 'y' here (the default) to pad the the filesystem image
          to a 4K boundary. Say 'n' to disable padding.

And then in the .mk :

    ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS_PAD),)
    ROOTFS_SQUASHFS_ARGS += -nopad
    endif

[--SNIP--]
> > > -ROOTFS_SQUASHFS_ARGS = -noappend -processors $(PARALLEL_JOBS)
> > > +SQUASHFS_MKFS_OPTS = $(call qstrip,$(BR2_TARGET_ROOTFS_SQUASHFS_MKFS_OPTIONS))
> > 
> > Keep the vairalbes prefixed with ROOTFS_ here, to avoid clashing with
> > the package namespace: SQUASHFS_MKFS_OPTS by name would be a variable of
> > the "squashfs" package.
> 
> ok, I wasn't sure here what the correct naming is, a lot of file-systems
> seem to use their options without ROOTFS_*

Yes, this is historical, and so far it works: we have no package named
'ext', so there are not actual clashing. But we do have a pakcage named
'squashfs', so there can be clashing.

> > $(PARALLEL_JOBS) is a parameter to the --processor option, so it should
> > be on the same line.
> > However, I don;t think you need to introduce an intermediate variable:
> >     ROOTFS_SQUASHFS_ARGS = \
> >         -noappend \
> >         -processors $(PARALLEL_JOBS) \
> >         $(call qstrip,$(BR2_TARGET_ROOTFS_SQUASHFS_MKFS_OPTIONS))
> this was a bit "modelled" after (aka stolen from) how the extfs does this ;-)

I see, but I don't see the point there either.

> But yeah, we can make this nicer .

Please! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
