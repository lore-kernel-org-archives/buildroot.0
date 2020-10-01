From: Pieter De Gendt <pieter.degendt@gmail.com>
Date: Thu, 1 Oct 2020 09:29:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/mbedtls: custom configuration
 file
In-Reply-To: <20200930215728.181df33f@windsurf.home>
References: <20200928092945.584196-1-pieter.degendt@basalte.be>
 <20200930215728.181df33f@windsurf.home>
Message-ID: <CAFfn7Uk3-cwCEs=TeP5jLvUgyk3Hf0E8KjiY0z2MKda+AtBKiQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for the feedback, see my comments below.

On Wed, Sep 30, 2020 at 9:57 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Pieter,
>
> Thanks for the proposal. See below for some questions/comments.
>
> On Mon, 28 Sep 2020 11:29:45 +0200
> Pieter De Gendt <pieter.degendt@gmail.com> wrote:
>
> > diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
> > index 5094434e6c..fa74197004 100644
> > --- a/package/mbedtls/mbedtls.mk
> > +++ b/package/mbedtls/mbedtls.mk
> > @@ -68,4 +68,12 @@ else ifeq ($(BR2_microblaze)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
> >  MBEDTLS_POST_CONFIGURE_HOOKS += MBEDTLS_DISABLE_ASM
> >  endif
> >
> > +define MBEDTLS_OVERRIDE_CONFIG
> > +     cp $(BR2_PACKAGE_MBEDTLS_CUSTOM_CONFIG) $(@D)/include/mbedtls/config.h
> > +endef
> > +
> > +ifneq ($(call qstrip,$(BR2_PACKAGE_MBEDTLS_CUSTOM_CONFIG)),)
> > +MBEDTLS_POST_CONFIGURE_HOOKS += MBEDTLS_OVERRIDE_CONFIG
> > +endif
>
> We prefer to enclose everything in the conditional block, and do the
> qstripping once:
>
> MBEDTLS_CUSTOM_CONFIG = $(call qstrip,$(BR2_PACKAGE_MBEDTLS_CUSTOM_CONFIG))
>
> ifneq ($(MBEDTLS_CUSTOM_CONFIG),)
> define MBEDTLS_OVERRIDE_CONFIG
>         ..
> endef
> MBEDTLS_POST_CONFIGURE_HOOKS += MBEDTLS_OVERRIDE_CONFIG
> endif

I can adjust that.

>
> However, what bothers me a bit is how it completely overrides all the
> configuration logic that takes place before in mbedtls.mk. For example,
> if you enable BR2_PACKAGE_MBEDTLS_COMPRESSION=y and use your option to
> have a custom configuration file, then what
> BR2_PACKAGE_MBEDTLS_COMPRESSION=y does will be ignored.
>
> So, we would have to make BR2_PACKAGE_MBEDTLS_COMPRESSION disappear
> when BR2_PACKAGE_MBEDTLS_CUSTOM_CONFIG, but then, how do you bring zlib
> as a build dependency of mbedtls ?
>
> We need to decide if the custom configuration file should override all
> tweaks, or if all tweaks should be applied on top of the custom
> configuration file.

I understand why you are bothered with completely overriding the configuration,
however I couldn't think of a workable alternative. There are a lot of
settings in the
config.h file. See: https://tls.mbed.org/api/config_8h.html

Agreed, there are more settings that don't require altering the
dependency chain,
but exposing all in buildroot would be a lot of work and hard to maintain?

Applying tweaks on the custom config also feels a bit awkward, since
you already
took the effort of creating the custom config and the "sed" commands might not
even apply.

>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Let me know how we can move forward with something you agree with.

Best regards,
Pieter
