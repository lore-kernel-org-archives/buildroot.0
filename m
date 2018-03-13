From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 13 Mar 2018 14:45:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/linux: fix custom dts files
 handling
In-Reply-To: <CANmNbVxkQCDMC+4qRcPSoH-i=mJEGH=-jUQH8KG+zKHBT=AirA@mail.gmail.com>
References: <20180312213523.32213-1-rafal.susz@gmail.com>
 <20180313113217.27657-1-rafal.susz@gmail.com>
 <20180313114901.unmgzziwzgim6dkz@tarshish>
 <CANmNbVxkQCDMC+4qRcPSoH-i=mJEGH=-jUQH8KG+zKHBT=AirA@mail.gmail.com>
Message-ID: <20180313124520.turpf26h3jmrdwpo@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rafa?,

On Tue, Mar 13, 2018 at 01:31:36PM +0100, Rafa? Susz wrote:
> could you point where is "another reference" to this bool. I grepped br and
> did not find any other files.
> In general it was good idea to drop these booleans and basing on
> user-entered strings take do some action or not.

Here is what I get for current git master:

$ git grep KERNEL_USE_CUSTOM_DTS origin/master 
origin/master:configs/s6lx9_microboard_defconfig:BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
origin/master:linux/linux.mk:   $(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
origin/master:linux/linux.mk:BR2_LINUX_KERNEL_USE_INTREE_DTS / BR2_LINUX_KERNEL_USE_CUSTOM_DTS settings)

Your patch only removes the second reference. There a two more to be 
converted/removed.

baruch

> 2018-03-13 12:49 GMT+01:00 Baruch Siach <baruch@tkos.co.il>:
> > On Tue, Mar 13, 2018 at 12:32:17PM +0100, Rafal Susz wrote:
> > > Custom dts files are still conditionally copied based on non existing
> > > boolean. So it is currently not possible to use custom dts file(s) at
> > all.
> > >
> > > List of dts files is now iterated and files are copied into dedicated
> > kernel arch dir.
> > >
> > > Signed-off-by: Rafal Susz <rafal.susz@gmail.com>
> > > ---
> > >  linux/linux.mk | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/linux/linux.mk b/linux/linux.mk
> > > index e98b25cb72..12f0b03dbc 100644
> > > --- a/linux/linux.mk
> > > +++ b/linux/linux.mk
> > > @@ -370,8 +370,9 @@ endif
> > >  # Compilation. We make sure the kernel gets rebuilt when the
> > >  # configuration has changed.
> > >  define LINUX_BUILD_CMDS
> > > -     $(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
> > > -             cp -f $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH))
> > $(KERNEL_ARCH_PATH)/boot/dts/)
> >
> > Commit f142f23ecf9ee (package/linux: drop useless intermediate DTS
> > booleans)
> > should have removed BR2_LINUX_KERNEL_USE_CUSTOM_DTS. There is another
> > reference to this symbol below.
> >
> > > +     @for dts in $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH));
> > do \
> > > +             cp -f $${dts} $(KERNEL_ARCH_PATH)/boot/dts/ ;   \
> > > +     done
> > >       $(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D)
> > $(LINUX_TARGET_NAME)
> > >       @if grep -q "CONFIG_MODULES=y" $(@D)/.config; then      \
> > >               $(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D)
> > modules ;        \
> >
> > baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
