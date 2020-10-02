From: Pieter De Gendt <pieter.degendt@gmail.com>
Date: Fri, 2 Oct 2020 09:16:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/mbedtls: custom configuration
 file
In-Reply-To: <20201001193142.GC11621@scaer>
References: <20200928092945.584196-1-pieter.degendt@basalte.be>
 <20200930215728.181df33f@windsurf.home>
 <CAFfn7Uk3-cwCEs=TeP5jLvUgyk3Hf0E8KjiY0z2MKda+AtBKiQ@mail.gmail.com>
 <20201001193142.GC11621@scaer>
Message-ID: <CAFfn7UnFz=5Da91iWqwyE9m6VWpiOUsstGWe4mp3FpgE==UQ7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

See comment below.

On Thu, Oct 1, 2020 at 9:31 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Pieter, Thomas, All,
>
> On 2020-10-01 09:29 +0200, Pieter De Gendt spake thusly:
> > On Wed, Sep 30, 2020 at 9:57 PM Thomas Petazzoni
> > <thomas.petazzoni@bootlin.com> wrote:
> > > On Mon, 28 Sep 2020 11:29:45 +0200
> > > Pieter De Gendt <pieter.degendt@gmail.com> wrote:
> > > > diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
> > > > index 5094434e6c..fa74197004 100644
> > > > --- a/package/mbedtls/mbedtls.mk
> > > > +++ b/package/mbedtls/mbedtls.mk
> > > > @@ -68,4 +68,12 @@ else ifeq ($(BR2_microblaze)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
> > > >  MBEDTLS_POST_CONFIGURE_HOOKS += MBEDTLS_DISABLE_ASM
> > > >  endif
> > > >
> > > > +define MBEDTLS_OVERRIDE_CONFIG
> > > > +     cp $(BR2_PACKAGE_MBEDTLS_CUSTOM_CONFIG) $(@D)/include/mbedtls/config.h
> > > > +endef
> > > > +
> > > > +ifneq ($(call qstrip,$(BR2_PACKAGE_MBEDTLS_CUSTOM_CONFIG)),)
> > > > +MBEDTLS_POST_CONFIGURE_HOOKS += MBEDTLS_OVERRIDE_CONFIG
> > > > +endif
> [--SNIP--]
> > > However, what bothers me a bit is how it completely overrides all the
> > > configuration logic that takes place before in mbedtls.mk. For example,
> > > if you enable BR2_PACKAGE_MBEDTLS_COMPRESSION=y and use your option to
> > > have a custom configuration file, then what
> > > BR2_PACKAGE_MBEDTLS_COMPRESSION=y does will be ignored.
> > >
> > > So, we would have to make BR2_PACKAGE_MBEDTLS_COMPRESSION disappear
> > > when BR2_PACKAGE_MBEDTLS_CUSTOM_CONFIG, but then, how do you bring zlib
> > > as a build dependency of mbedtls ?
> > >
> > > We need to decide if the custom configuration file should override all
> > > tweaks, or if all tweaks should be applied on top of the custom
> > > configuration file.
> >
> > I understand why you are bothered with completely overriding the configuration,
> > however I couldn't think of a workable alternative. There are a lot of
> > settings in the
> > config.h file. See: https://tls.mbed.org/api/config_8h.html
> >
> > Agreed, there are more settings that don't require altering the
> > dependency chain,
> > but exposing all in buildroot would be a lot of work and hard to maintain?
> >
> > Applying tweaks on the custom config also feels a bit awkward, since
> > you already
> > took the effort of creating the custom config and the "sed" commands might not
> > even apply.
>
> But that is what we are doing with the user-provided configuration files
> for:
>   - uClibc-ng
>   - the linux kernel
>   - busybox
>   - uboot
>   - and probably a few others as well...
>
> So it would feel natural that we do the same for mbedtls, so that there
> is a consistent behaviour across the board.
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

The packages you list have a kconfig provided by the package itself,
for mbedtls it's
simply a header file. Do you suggest adding this, and maintaining it
within buildroot?

Regards,
Pieter
