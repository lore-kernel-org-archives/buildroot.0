From: Carlos Santos <unixmania@gmail.com>
Date: Sat, 2 Nov 2019 20:42:55 -0300
Subject: [Buildroot] [PATCH RFC 1/3] package/pkg-generic.mk: support
 hooks and tables in virtual packages
In-Reply-To: <CAJ4jsadYWEHoBGuk0gY8R4KP=q2Rmg2AEA6=0RfLfTM0QndyYA@mail.gmail.com>
References: <20191030132759.8643-1-unixmania@gmail.com>
 <20191030132759.8643-2-unixmania@gmail.com>
 <20191031201501.GA2553@scaer>
 <CAJ4jsadYWEHoBGuk0gY8R4KP=q2Rmg2AEA6=0RfLfTM0QndyYA@mail.gmail.com>
Message-ID: <CAJ4jsafpZ5KeQ1ZK-2m715x2fHvJNTDySLZpQh1RKq_UtxBcZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 31, 2019 at 6:47 PM Carlos Santos <unixmania@gmail.com> wrote:
>
> On Thu, Oct 31, 2019 at 5:15 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >
> > Carlos, All,
> >
> > On 2019-10-30 10:27 -0300, unixmania at gmail.com spake thusly:
> > > From: Carlos Santos <unixmania@gmail.com>
> > >
> > > Virtual packages are not built but it's useful to allow them to have
> > > permission/device/user tables and target-finalize/rootfs-pre-cmd hooks.
> >
> > Agreed, that would be nice to deduplicate such things.
> >
> > > With this change we don't need to replicate date as currently done in
> >
> > What do you mean by "date"?
>
> It means "typo", should be "data".
>
> > > eudev and systemd user tables or test if the package is selected to add
> > > a target-finalize hook as in luainterpreter.
> > >
> > > Signed-off-by: Carlos Santos <unixmania@gmail.com>
> > > ---
> > >  package/pkg-generic.mk | 17 +++++++++++++++++
> > >  1 file changed, 17 insertions(+)
> > >
> > > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > > index 893faba22a..7b3f1646ae 100644
> > > --- a/package/pkg-generic.mk
> > > +++ b/package/pkg-generic.mk
> > > @@ -930,6 +930,7 @@ $$($(2)_TARGET_DIRCLEAN):         PKG=$(2)
> > >  # Compute the name of the Kconfig option that correspond to the
> > >  # package being enabled. We handle three cases: the special Linux
> > >  # kernel case, the bootloaders case, and the normal packages case.
> > > +# Virtual packages are handled separately (see below).
> > >  ifeq ($(1),linux)
> > >  $(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
> > >  else ifneq ($$(filter boot/% $$(foreach dir,$$(BR2_EXTERNAL_DIRS),$$(dir)/boot/%),$(pkgdir)),)
> > > @@ -1118,6 +1119,22 @@ ifneq ($$($(2)_HELP_CMDS),)
> > >  HELP_PACKAGES += $(2)
> > >  endif
> > >
> > > +# Virtual packages are not built but it's useful to allow them to have
> > > +# permission/device/user tables and target-finalize/rootfs-pre-cmd hooks.
> > > +else ifeq ($$(BR2_PACKAGE_HAS_$(2)),y) # $(2)_KCONFIG_VAR
> >
> > Actually, I think that virtual packages should instead also be "nornal"
> > packages, so that they use the standard code path. By "normal" package,
> > I mean they should also have a BR2_PACKAGE_FOO option in addition to the
> > BR2_PACKAGE_HAS_FOO option.
>
> So we could use this, instead, instead of the else below :
>
> # Compute the name of the Kconfig option that correspond to the
> # package being enabled. We handle three cases: the special Linux
> # kernel case, the bootloaders case, and the normal packages case.
> # Virtual packages are not built but it's useful to allow them to have
> # permission/device/user tables and target-finalize/rootfs-pre-cmd
> hooks.
> ifeq ($(1),linux)
> $(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
> else ifneq ($$(filter boot/% $$(foreach
> dir,$$(BR2_EXTERNAL_DIRS),$$(dir)/boot/%),$(pkgdir)),)
> $(2)_KCONFIG_VAR = BR2_TARGET_$(2)
> else ifneq ($$(filter toolchain/% $$(foreach
> dir,$$(BR2_EXTERNAL_DIRS),$$(dir)/toolchain/%),$(pkgdir)),)
> $(2)_KCONFIG_VAR = BR2_$(2)
> else ifeq ($(2)_IS_VIRTUAL,YES)
> $(2)_KCONFIG_VAR = BR2_PACKAGE_HAS_$(2)
> else
> $(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
> endif

I attempted this solution but it adds virtual packages to the global
package list unless I add something like

ifeq ($$($(2)_IS_VIRTUAL),)
PACKAGES += $(1)
endif

Also it does not seem to make sense to check FOO_PROVIDES and process
reverse dependencies.

-- 
Carlos Santos <unixmania@gmail.com>
