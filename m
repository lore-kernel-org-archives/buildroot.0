From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Apr 2014 19:15:14 +0200
Subject: [Buildroot] [PATCH 8/9] boot/syslinux: add option to install
 the EFI image
In-Reply-To: <535DF2CD.3000100@mind.be>
References: <cover.1398378217.git.yann.morin.1998@free.fr>
 <b21bd8bd922ebfb71a12cf929f953f384216f43f.1398378217.git.yann.morin.1998@free.fr>
 <535DF2CD.3000100@mind.be>
Message-ID: <20140428171514.GA3501@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-04-28 08:18 +0200, Arnout Vandecappelle spake thusly:
> On 25/04/14 00:30, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > syslinux can now also build an EFI application.
> > 
> > If the target is 64-bit, we build the 64-bit EFI app,
> > otherwise we build the 32-bit EFI app.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Frank Hunleth <fhunleth@troodon-software.com>
> > ---
> >  boot/syslinux/Config.in                            | 24 +++++++++++++-
> >  .../syslinux-000-user-headers-from-sysroot.patch   | 37 ++++++++++++++++++++++
> >  boot/syslinux/syslinux.mk                          | 21 ++++++++++--
> >  3 files changed, 78 insertions(+), 4 deletions(-)
> >  create mode 100644 boot/syslinux/syslinux-000-user-headers-from-sysroot.patch
> > 
> > diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
> > index b92f28f..d556c55 100644
> > --- a/boot/syslinux/Config.in
> > +++ b/boot/syslinux/Config.in
> > @@ -2,7 +2,6 @@ config BR2_TARGET_SYSLINUX
> >  	bool "syslinux"
> >  	depends on BR2_i386 || BR2_x86_64
> >  	select BR2_HOSTARCH_NEEDS_IA32_COMPILER
> > -	select BR2_TARGET_SYSLINUX_ISOLINUX if !BR2_TARGET_SYSLINUX_PXELINUX
> >  	help
> >  	  The syslinux bootloader for x86 systems.
> >  	  This includes: syslinux, pxelinux, extlinux.
> > @@ -11,6 +10,27 @@ config BR2_TARGET_SYSLINUX
> >  
> >  if BR2_TARGET_SYSLINUX
> >  
> > +choice
> > +	bool "Image type"
> 
>  Why is this a choice? It's possible to build both, no? Similar to
> iso/pxe. So it makes more sense to me to add efi as a third option after
> iso and pxe.

Well, the target will be either BIOS-based or an EFI-based, not both.
So it seems more logical to make it a choice (Thomas seemed to agree on
IRC, as well.)

But thinking of it, we could go even further: iso/pxe/mbr/efi are all
_alternate_ methods of booting, so it does not make sense to have more
than one selected at any one time.

The only reason pxe/iso are not a choice _currently_ (e.g. syslinux-4.0.7),
is that they are always built, and there is a no way to only build one or
the other. This is the same behaviour in 6.0.2: you can build any
combination of {bios,efi32,efi64} (only one, two, or all of them). But
bios will always build pxe and iso (and mbr, see next cset).

In the end, I don't really care, although I'd find it strange to be able
to build both at the same time, since the target will have one or the
other, not both (well, unless we target a desktop PC with legacy bios
enabled in the EFI bios; but we ain't do that, do we?) At worse, I'd
chamge it to a choice for everything (although I could understand a case
where the user would want both pxe and iso and mbr at the same time.)

> > diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
> > index bec132f..bf0bae5 100644
> > --- a/boot/syslinux/syslinux.mk
> > +++ b/boot/syslinux/syslinux.mk
> > @@ -15,6 +15,20 @@ SYSLINUX_INSTALL_IMAGES = YES
> >  
> >  SYSLINUX_DEPENDENCIES = host-nasm host-util-linux host-upx
> >  
> > +ifeq ($(BR2_TARGET_SYSLINUX_LEGACY_BIOS),y)
> > +SYSLINUX_TARGET = bios
> 
>  If you follow my suggestion, this would become SYSLINUX_TARGETS of
> course. And +=

Yes, of course. I already had that in the beginning, but I believe it
does not really make sense.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
