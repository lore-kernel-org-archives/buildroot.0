From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 May 2015 17:31:17 +0200
Subject: [Buildroot] [PATCH 3/7] boot/uboot: do not check hash for
 custom versions
In-Reply-To: <55437C36.6020707@mind.be>
References: <cover.1430260630.git.yann.morin.1998@free.fr>
 <12d715d71a908668d9156cfb3c0a0de1966bea66.1430260630.git.yann.morin.1998@free.fr>
 <55437C36.6020707@mind.be>
Message-ID: <20150501153117.GB4206@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-05-01 15:14 +0200, Arnout Vandecappelle spake thusly:
> On 29/04/15 00:40, Yann E. MORIN wrote:
> > For custom tarballs, it's quite obvious we can not check hashes.
> > 
> > For custom versions, that's not so obvious. One might think we could
> > have hashes for all the official releases, but that's not possible: if
> > the user uses a released version of Buildroot (say 2015.05) much later
> > in the future, and wants to use the then-released 2038.02 U-Boot. It now
> > seems pretty obvious that Buildroot 2015.02 can't know the hash for
> > U-Boot 2038.02.
> > 
> > So, disable checking the hash for custom tarballs and custom versions.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Vincent Stehle <vincent.stehle@laposte.net>
> > ---
> >  boot/uboot/uboot.mk | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> > index 01aaf2c..410d8d8 100644
> > --- a/boot/uboot/uboot.mk
> > +++ b/boot/uboot/uboot.mk
> > @@ -17,6 +17,7 @@ ifeq ($(UBOOT_VERSION),custom)
> >  UBOOT_TARBALL = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION))
> >  UBOOT_SITE = $(patsubst %/,%,$(dir $(UBOOT_TARBALL)))
> >  UBOOT_SOURCE = $(notdir $(UBOOT_TARBALL))
> > +BR_NO_CHECK_HASH_FOR += $(UBOOT_SOURCE)
> >  else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_GIT),y)
> >  UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
> >  UBOOT_SITE_METHOD = git
> > @@ -27,6 +28,9 @@ else
> >  # Handle stable official U-Boot versions
> >  UBOOT_SITE = ftp://ftp.denx.de/pub/u-boot
> >  UBOOT_SOURCE = u-boot-$(UBOOT_VERSION).tar.bz2
> > +ifeq ($(BR2_TARGET_UBOOT_CUSTOM_VERSION),y)
> > +BR_NO_CHECK_HASH_FOR += $(UBOOT_SOURCE)
> > +endif
> >  endif
> 
>  Since we really only have a hash for the latest version, I would prefer a
> simple check after the entire condition:
> 
> ifeq ($(BR2_TARGET_UBOOT_LATEST_VERSION),)
> BR_NO_CHECK_HASH_FOR += $(UBOOT_SOURCE)
> endif
> 
>  This redundantly handles the VCS cases, but OTOH it doesn't hurt to have these
> tarballs in there either.

Acutally, I prefer we explicitly exclude only what we really want to be
excluded.

VCS sutff is forcibly excluded, becasue the git/hg/cvs/svn/bzr macros do
explicitly disable checking hashes by themselves.

Also, I would ultimately like that it is an error if there is a hash for
something that is excluded. Granted, it;'s currently not possible, but
long-term I;d like to revisit this.

So, in the end, I'd really like to only exckude what really needs to be
excluded.

> Actually, before patch 2/7, the VCS cases wouldn't
> even be added because UBOOT_SOURCE is not set yet at that point :-)

Well, in my patch, it is set a few lines above. And patch 2 is already
applied! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
