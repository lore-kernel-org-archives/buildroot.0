From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Jun 2018 20:51:36 +0200
Subject: [Buildroot] [PATCH] fs: allow extra arguments to common tarball
 extraction
In-Reply-To: <625048322.1426556.1528289177741.JavaMail.zimbra@datacom.com.br>
References: <20180603022145.14222-1-casantos@datacom.com.br>
 <20180605172345.GB29058@scaer>
 <625048322.1426556.1528289177741.JavaMail.zimbra@datacom.com.br>
Message-ID: <20180606185136.GA2537@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2018-06-06 09:46 -0300, Carlos Santos spake thusly:
> > From: "Yann Morin" <yann.morin.1998@free.fr>
> > On 2018-06-02 23:21 -0300, Carlos Santos spake thusly:
> >> Since commit 118534fe54b (fs: use a common tarball as base for the other
> >> filesystems) Buildroot creates a .tar filesystem image and re-extracts
> >> it in a private directory to create each format-specific image. Add an
> >> option to pass extra arguments to tar when that commom root image is
> >> extracted.
> >> 
> >> This option is useful when the root filesystem is volatile (e.g. initrd)
> >> or read-only but a read-write subtree is still necessary for persistent
> >> data modified by programs as they run.
[--SNIP--]
> > What prevents you from providing your own filesystem mechanism at all?
[--SNIP--]
> The inner-rootfs macro does not seem to be generic enough but I can
> give it a try. Notice, however, that it is an internal thing, like
> the common tarball.

The inner-rootfs macro is indeed an internal one, and you should use the
macro that is named 'rootfs', like is done in all the filesystems, with:

    $(eval $(rootfs))

This macro is for filesystems what the various generic-, autotools-, and
the other *-package macros are for packages.

Indeed, this is not documented, but it *is* made to be used to implement
filesystems in br2-external trees.

I have started writing the documentation for it. And even I made a
mistake: you need not even extract the rootfs.tar: Buidlroot does it for
you before calling your filesystem generator. So, the documentation is
really needed, because even I, whoo wrote the code for the internal
tarball, forgot about that.

So, basically,  your own custom-fs.mk would contain something based on:

    # This is custom-fs.mk
    define ROOTFS_CUSTOM_FS_CMDS
        $(BR2_EXTERNAL_foo_PATH)/mkfs.custom-fs --root-dir=$(TARGET_DIR)
    endef
    $(eval $(rootfs))

> The BR2_ROOTFS_COMMON_UNTAR_ARGS confing, OTOH,
> would be documented. If the corresponding infrastructure changes in
> the future we can move it to Config.in.legacy, preventing the user
> from using an unsupported feature.

What I don't like in the exlanations you gave for your use-case, is that
you anyway already have to handle the content of /var/lib (or whatever)
in an ad-hoc manner from a fakeroot-script, so the behaviour you had to
split in two: one part in the fakeroot script that you own, and the
other part in the buildroot filesystem infra, which is generic.

Whereas if you write your own filesystem, then you do everything on your
own, which gives you absolute flexibility about what you can do with
the layout.

Yes, there *is* one thing that can be seen as a "waste" of Buildroot's
infra: if your main filesystem is of a type that Buildroot already knows
hos to generate (like a squashfs).

But my position has always been consistent on this topic: the images
that Buildroot generates only ever covers just "basic" situations, using
a single-filesystem layout. Anything that needs to do a multi-filesystem
layout should be done as a new filesystem. Doing it in a new filesystem
is much more flexible than whatever kconfig option we may ever add. And
since we already have this wonderful flexibility, I don't think it makes
sense to add a new option that duplicates only a very limited subset of
that flexibility. That duplication is not good, IMNSHO...

Regards,
Yann E. MORIN.

> > In the end, I believe this is more robust and more generic than this
> > extra option to the intermediate tarball, which is purely an internal
> > detail. We may tomorrow decide on another solution for the internal
> > state in the future...
> > 
> > My 2 cents...
> > 
> > Regards,
> > Yann E. MORIN.
> 
> [...]
> 
> -- 
> Carlos Santos (Casantos) - DATACOM, P&D
> ?Marched towards the enemy, spear upright, armed with the certainty
> that only the ignorant can have.? ? Epitaph of a volunteer

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
