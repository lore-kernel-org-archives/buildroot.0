From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 1 Oct 2020 23:02:11 +0200
Subject: [Buildroot] [PATCH v1] boot/barebox: fix target bareboxenv
 command compile
In-Reply-To: <20201001200340.GE11621@scaer>
References: <20200107195026.25413-1-ps.report@gmx.net>
 <20201001200340.GE11621@scaer>
Message-ID: <20201001230211.5fbd3602@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Thu, 1 Oct 2020 22:03:40 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Peter, All,
>
> Sorry to come back so late on that patch.

Better late than never ;-), nevertheless thanks for review...

>
> On 2020-01-07 20:50 +0100, Peter Seiderer spake thusly:
> > The buildroot custom bareboxenv compile command
> > needs the additional include path 'scripts/include'
> > to gain access to the local copy of the kernel header
> > files.
> >
> > Fixes (with BR2_TARGET_BAREBOX_BAREBOXENV enabled):
> >
> >   build/barebox-2019.12.0/scripts/bareboxenv.c:100:10: fatal error: linux/list.h: No such file or directory
> >
> > Reported-by: Frederick Gotham <cauldwell.thomas@gmail.com>
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  boot/barebox/barebox.mk | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
> > index 52178d89c8..67fd125578 100644
> > --- a/boot/barebox/barebox.mk
> > +++ b/boot/barebox/barebox.mk
> > @@ -82,7 +82,8 @@ $(1)_KCONFIG_DEPENDENCIES = \
> >
> >  ifeq ($$(BR2_TARGET_$(1)_BAREBOXENV),y)
> >  define $(1)_BUILD_BAREBOXENV_CMDS
> > -	$$(TARGET_CC) $$(TARGET_CFLAGS) $$(TARGET_LDFLAGS) -o $$(@D)/bareboxenv \
> > +	$$(TARGET_CC) $$(TARGET_CFLAGS) -I$$(@D)/scripts/include \
> > +		$$(TARGET_LDFLAGS) -o $$(@D)/bareboxenv \
>
> Although this is techniocally,  correct, I wonder why we do not use
> BAREBOX_KONFIG_FIXUP_CMDS to enabler CONFIG_BAREBOXENV_TARGET in the
> barebox configuration, for example:
>
>     diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
>     index 422f27312d..5eaeb7db4c 100644
>     --- a/boot/barebox/barebox.mk
>     +++ b/boot/barebox/barebox.mk
>     @@ -112,6 +112,9 @@ ifneq ($$($(1)_CUSTOM_EMBEDDED_ENV_PATH),)

Seems the wrong place as BR2_TARGET_BAREBOX_BAREBOXENV is/should be independent
of BR2_TARGET_BAREBOX_CUSTOM_EMBEDDED_ENV_PATH

>      define $(1)_KCONFIG_FIXUP_CMDS
>      	$$(call KCONFIG_ENABLE_OPT,CONFIG_DEFAULT_ENVIRONMENT)
>      	$$(call KCONFIG_SET_OPT,CONFIG_DEFAULT_ENVIRONMENT_PATH,"$$($(1)_CUSTOM_EMBEDDED_ENV_PATH)")
>     +	$$(if $$(BAREBOX_KONFIG_FIXUP_CMDS),\

Did you mean '$$(if $$(BR2_TARGET_BAREBOX_BAREBOXENV),' ???

Regards,
Peter

>     +		$$(call KCONFIG_ENABLE_OPT,CONFIG_BAREBOXENV_TARGET),\
>     +		$$(call KCONFIG_DISABLE_OPT,CONFIG_BAREBOXENV_TARGET))
>      endef
>      endif
>
>
> And then we candrop our custom build command for it...
>
> CONFIG_BAREBOXENV_TARGET has existed since commit afb03d7a55, in April
> 2012, so virtually all barebox versions that are recent have it.
>
> Regards,
> Yann E. MORIN.
>
> >  		$$(@D)/scripts/bareboxenv.c
> >  endef
> >  endif
> > --
> > 2.24.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
