From: Paul Enman <paul.enman@gmail.com>
Date: Tue, 8 Dec 2015 13:34:30 -0600
Subject: [Buildroot] [PATCH 1/1] [1/1] package/uclibc: Enable compile in
 thumb mode when selected
In-Reply-To: <5662FDE3.6070809@mind.be>
References: <1449269795-17864-1-git-send-email-paul.enman@gmail.com>
 <5662FDE3.6070809@mind.be>
Message-ID: <CAEp4hJ1sT=Kp4_a4Tn862_mvcECYrBuQGCRUXOZUfO98orqVmw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,
Thanks, I checked the old commit and tested with both uClibc-0.9.33 and
uClibc-ng and older gcc; I was suprised to discover updated gcc versions
resolve the issue (uclibc/arm: doesn't build in thumb(1) mode with threads).

With this existing (v1) patch, for example:
Config: arm926t, thumb1; builds only with gcc-4.9 or better
Config: cortex-a5, thumb2; builds with all configuration options gcc-4.7
through gcc-5.x
Config: cortex-m3, thumb1 or thumb2; builds with all configuration options
gcc-4.7 though gcc-5.x

Since uclibc has some unresolved cases building with older gcc using
thumb1, I'll limit the scope and prepare a v2 patch that will pass the
thumb config option to uclibc when using thumb2 instruction set and not
interfere with the existing thumb1 workaround that relies on interworking
between arm and thumb instructions.

On Sat, Dec 5, 2015 at 9:08 AM, Arnout Vandecappelle <arnout@mind.be> wrote:

>  Hi penman,
>
> On 04-12-15 23:56, penman wrote:
> > Signed-off-by: penman <paul.enman@gmail.com>
>
>  Please use your full real name in the Sob (I guess that's Paul Enman).
>
> > ---
> >  package/uclibc/uclibc.mk | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> > index c62a40f..4f5c605 100644
> > --- a/package/uclibc/uclibc.mk
> > +++ b/package/uclibc/uclibc.mk
> > @@ -86,9 +86,15 @@ define UCLIBC_ARM_ABI_CONFIG
> >       $(call KCONFIG_ENABLE_OPT,CONFIG_ARM_EABI,$(@D)/.config)
> >  endef
> >
> > -# Thumb build is broken with threads, build in ARM mode
>
>  Can you explain what changed in the last two years since this fix was
> introduced in commit d244782ca? It might have been fixed in -ng, but
> 0.9.33.2
> hasn't changed in a very long time so I guess it's still broken there.
> You'll
> need to add a condition on -NG.
>
>  Or it could be gcc that has been fixed, but in that case please verify
> that it
> works with gcc-4.7
>
>  Regards,
>  Arnout
>
> > -ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
> > -UCLIBC_EXTRA_CFLAGS += -marm
> > +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_ARM_INSTRUCTIONS_THUMB2),y)
> > +define UCLIBC_ARM_THUMB_CONFIG
> > +     $(call KCONFIG_ENABLE_OPT,COMPILE_IN_THUMB_MODE,$(@D)/.config)
> > +     $(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_CONTEXT_FUNCS,$(@D)/.config)
> > +endef
> > +else
> > +define UCLIBC_ARM_THUMB_CONFIG
> > +     $(call KCONFIG_DISABLE_OPT,COMPILE_IN_THUMB_MODE,$(@D)/.config)
> > +endef
> >  endif
> >
> >  ifeq ($(BR2_UCLIBC_ARM_BX),y)
> > @@ -373,6 +379,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
> >       $(UCLIBC_ARC_TYPE_CONFIG)
> >       $(UCLIBC_ARC_PAGE_SIZE_CONFIG)
> >       $(UCLIBC_ARM_ABI_CONFIG)
> > +     $(UCLIBC_ARM_THUMB_CONFIG)
> >       $(UCLIBC_ARM_BX_CONFIG)
> >       $(UCLIBC_MIPS_ABI_CONFIG)
> >       $(UCLIBC_MIPS_ISA_CONFIG)
> >
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151208/b7827b23/attachment.html>
