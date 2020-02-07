From: Carlos Santos <unixmania@gmail.com>
Date: Fri, 7 Feb 2020 18:52:56 -0300
Subject: [Buildroot] [PATCH 2/2] package/skeleton-init-sysv:
 conditionally enable swapon/swapoff in inittab
In-Reply-To: <87r1z7xrz3.fsf@dell.be.48ers.dk>
References: <20200206173225.25677-1-unixmania@gmail.com>
 <20200206173225.25677-3-unixmania@gmail.com>
 <87r1z7xrz3.fsf@dell.be.48ers.dk>
Message-ID: <CAJ4jsacJdQ_DaymU_a3ntvULU=DmmvNS=Ce8TNG_mCFbaoP=9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 6, 2020 at 7:37 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:
>
>  > From: Carlos Santos <unixmania@gmail.com>
>  > The default inittab files added by busybox and sysvinit run 'swapon -a'
>  > during init and 'swapoff -a' during shutdown but those programs are not
>  > guaranteed to be available, so the boot log may become polluted by error
>  > messages like this:
>
>  >     swapon: not found
>
>  > To avoid this, make the swapon/swapoff lines in inittab optional.
>
>  > - Add a BR2_SYSTEM_HAS_SWAPON_SWAPOFF config to inform that swapon and
>  >   swapoff are available.
>
>  > - Add a BR2_PACKAGE_BUSYBOX_SWAPON_SWAPOFF config that depends on
>  >   BR2_USE_MMU and selects BR2_SYSTEM_HAS_SWAPON_SWAPOFF. Build the
>  >   Busybox swapon/swapoff utilities based on this new option.
>
>  > - Make UTIL_LINUX_BINARIES select BR2_SYSTEM_HAS_SWAPON_SWAPOFF config.
>
>  > - Add a targe-finalize hook to skeleton-init-sysv that comments-out or
>  >   enables the swapon/swapoff lines in /etc/inittab, based on the value
>  >   of BR2_SYSTEM_HAS_SWAPON_SWAPOFF.
>
>  > Based on a previous patch sent by Thomas De Schampheleire.
>
>  > Signed-off-by: Carlos Santos <unixmania@gmail.com>
>  > ---
>  > CC: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>  > CC: Peter Korsgaard <peter@korsgaard.com>
>  > ---
>  >  package/busybox/Config.in                        |  6 ++++++
>  >  package/busybox/busybox.mk                       | 14 ++++++++++++++
>  >  package/skeleton-init-sysv/skeleton-init-sysv.mk | 12 ++++++++++++
>  >  package/util-linux/Config.in                     |  1 +
>  >  system/Config.in                                 |  6 ++++++
>  >  5 files changed, 39 insertions(+)
>
>  > diff --git a/package/busybox/Config.in b/package/busybox/Config.in
>  > index 5e5c586762..9103256494 100644
>  > --- a/package/busybox/Config.in
>  > +++ b/package/busybox/Config.in
>  > @@ -68,6 +68,12 @@ config BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES
>  >  comment "Busybox individual binaries need a toolchain w/ dynamic library"
>  >      depends on BR2_STATIC_LIBS
>
>  > +config BR2_PACKAGE_BUSYBOX_SWAPON_SWAPOFF
>  > +    bool
>  > +    default y
>  > +    depends on BR2_USE_MMU
>  > +    select BR2_SYSTEM_HAS_SWAPON_SWAPOFF # used by skeleton-init-sysv
>
> You are presumably missing some option text here so this becomes a
> visible option in menuconfig.
>
>
>
>  > +ifeq ($(BR2_PACKAGE_BUSYBOX_SWAPON_SWAPOFF),y)
>  > +define BUSYBOX_SET_SWAPON_SWAPOFF
>  > +    $(call KCONFIG_ENABLE_OPT,CONFIG_SWAPON,$(BUSYBOX_BUILD_CONFIG))
>  > +    $(call KCONFIG_ENABLE_OPT,CONFIG_SWAPOFF,$(BUSYBOX_BUILD_CONFIG))
>  > +    $(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_SWAPONOFF_LABEL,$(BUSYBOX_BUILD_CONFIG))
>  > +endef
>  > +else
>  > +define BUSYBOX_SET_SWAPON_SWAPOFF
>  > +    $(call KCONFIG_DISABLE_OPT,CONFIG_SWAPON,$(BUSYBOX_BUILD_CONFIG))
>  > +    $(call KCONFIG_DISABLE_OPT,CONFIG_SWAPOFF,$(BUSYBOX_BUILD_CONFIG))
>  > +endef
>  > +endif
>
> I am not really convinced that this is an improvement over Thomas'
> version. In general I think we should keep the .config tweaks to a
> minimum as it can be quite confusing to users that their (potentially
> custom) .config settings is overridden.
>
> Do you see any functional issue with the swapon/off handling as is, or
> is it just a question of "taste"?
>
> --
> Bye, Peter Korsgaard

I must admit that it's mostly a matter of taste. Thinking better I
believe that a much simpler approach is possible.

-- 
Carlos Santos <unixmania@gmail.com>
