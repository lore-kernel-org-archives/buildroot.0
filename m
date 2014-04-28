From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Apr 2014 19:26:44 +0200
Subject: [Buildroot] [PATCH 7/9] boot/syslinux: bump version
In-Reply-To: <535DF1DC.9090307@mind.be>
References: <cover.1398378217.git.yann.morin.1998@free.fr>
 <e9a6a68649fc668ebc91f3f307e40af30c2ccb9b.1398378217.git.yann.morin.1998@free.fr>
 <535DF1DC.9090307@mind.be>
Message-ID: <20140428172644.GB3501@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-04-28 08:14 +0200, Arnout Vandecappelle spake thusly:
> On 25/04/14 00:30, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
[--SNIP--]
> > diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
> > index a1eb394..bec132f 100644
> > --- a/boot/syslinux/syslinux.mk
> > +++ b/boot/syslinux/syslinux.mk
> > @@ -4,32 +4,48 @@
> >  #
> >  ################################################################################
> >  
> > -SYSLINUX_VERSION = 4.07
> > -SYSLINUX_SOURCE  = syslinux-$(SYSLINUX_VERSION).tar.bz2
> > -SYSLINUX_SITE    = $(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux/4.xx/
> > +SYSLINUX_VERSION = 6.02
> > +SYSLINUX_SOURCE  = syslinux-$(SYSLINUX_VERSION).tar.xz
> > +SYSLINUX_SITE    = $(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux/
> >  
> >  SYSLINUX_LICENSE = GPLv2+
> >  SYSLINUX_LICENSE_FILES = COPYING
> >  
> >  SYSLINUX_INSTALL_IMAGES = YES
> >  
> > -SYSLINUX_DEPENDENCIES = host-nasm host-util-linux
> > +SYSLINUX_DEPENDENCIES = host-nasm host-util-linux host-upx
> > +
> > +# The syslinux tarball comes with pre-compiled binaries.
> > +# Since timestamps might not be in the correct order, a rebuild is
> > +# not always triggered for all the different images.
> > +# Cleanup the mess even before we attempt a build, so we indeed
> > +# build everything from source.
> 
>  Do we really need to build everything from source? We anyway already
> check that our host compiler can build for ia32, so the included
> executables will work.

We're not only talking about the host utilities, but also the target
images (pxelinux, isolinux, mbr, efi32/64).

Yes, we do want to build from sources, so we know how to reproduce a
working system, and reproduce a failure so we can fix it, rather than
try to debug a binary blob that may have no relation whatsoever with the
sources it comes from.

Yes, ew do want to be sure that what gets distributed on the target is
indeed coming from the sources (and not a lingering binary that comes
in the tarball and may have no relation whatsoever with the souces) for
which I can be rather confident I'm compliant.

<troll>
Heck, otherwise, let's just use those pesky proprietary bootloaders and
operating systems and applications, no?  :-)  :-p  ;-]  (yes, many
smileys, that's really just to tease you!)
</troll>

> > +define SYSLINUX_CLEANUP
> > +	rm -rf $(@D)/bios $(@D)/efi32 $(@D)/efi64
> > +endef
> > +SYSLINUX_POST_PATCH_HOOKS += SYSLINUX_CLEANUP
> >  
> >  # syslinux build system has no convenient way to pass CFLAGS,
> >  # and the internal zlib should take precedence so -I shouldn't
> >  # be used.
> 
>  Actually, I'm not sure if this comment is still true. I haven't checked
> in 6.02, but 4.07 already had a MYCFLAGS variables that can probably be
> used. Also, the HOST_LDFLAGS may no longer be needed.

OK, I'll investigate those, but as a separate patch (it is working
as-is, so a change would be a cleanup.)

> >  define SYSLINUX_INSTALL_TARGET_CMDS
> >  	# While the actual bootloader is compiled for the target, several
> >  	# utilities for installing the bootloader are meant for the host.
> > -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) INSTALLROOT=$(HOST_DIR) install
> > +	# Repeat the target, otherwise syslinux will try to build everything
> > +	# Repeat CC and AR, since syslinux really wants to check them at
> > +	# install time
> 
>  These comments should come before the define, otherwise they'll be
> printed while building.

Hey! That's how the existing comments are. ;-)
Will see to clean up that, too.

Thank you for the review! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
