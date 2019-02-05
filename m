From: Kostya Porotchkin <kostap@marvell.com>
Date: Tue, 5 Feb 2019 08:52:54 +0000
Subject: [Buildroot] [EXT] Re: [PATCH v2 1/3]
 package/arm-gnu-rm-toolchain: new package
In-Reply-To: <CAAXf6LWVCMLLToobMTQA-QXMZo37jxZqEP=JAmd+5EULF6qg2A@mail.gmail.com>
References: <20190205074324.8097-1-kostap@marvell.com>
 <20190205074324.8097-2-kostap@marvell.com>
 <CAAXf6LWVCMLLToobMTQA-QXMZo37jxZqEP=JAmd+5EULF6qg2A@mail.gmail.com>
Message-ID: <BYAPR18MB2360B5A00EB27EF60CB49E9CCA6E0@BYAPR18MB2360.namprd18.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> -----Original Message-----
> From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Sent: Tuesday, February 5, 2019 10:49
> To: Kostya Porotchkin <kostap@marvell.com>
> Cc: buildroot <buildroot@buildroot.org>
> Subject: [EXT] Re: [Buildroot] [PATCH v2 1/3] package/arm-gnu-rm-toolchain:
> new package
> 
> External Email
> 
> ----------------------------------------------------------------------
> Hello,
> El mar., 5 feb. 2019 a las 8:43, <kostap@marvell.com> escribi?:
> >
> > From: Konstantin Porotchkin <kostap@marvell.com>
> >
> > Add cross-compialtion ARM RM toolchain for supporting firmware builds
> > for Armv8-based SoCs utilizing Cortex-M/Cortex-R service CPUs.
> > The cross-toolchain used for building Armv8 application CPU code
> > cannot be used for Cortex-M/Cortex-R 32-bit THUMB code generation.
> > This patch installs pre-built bate metal ARM GNU-RM toolchain into the
> > host file system folder $(HOST_DIR)/opt/gcc-arm-none-eabi for covering
> > the above mentioned cases.
> >
> > Signed-off-by: Konstantin Porotchkin <kostap@marvell.com>
> > ---
> >  .../arm-gnu-rm-toolchain.hash                    |  2 ++
> >  .../arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.mk | 16
> > ++++++++++++++++
> >  2 files changed, 18 insertions(+)
> >  create mode 100644
> > package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.hash
> >  create mode 100644
> > package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.mk
> >
> > diff --git a/package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.hash
> > b/package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.hash
> > new file mode 100644
> > index 0000000000..a08e8e6208
> > --- /dev/null
> > +++ b/package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.hash
> > @@ -0,0 +1,2 @@
> > +# Locally calculated
> > +sha256
> >
> +bb17109f0ee697254a5d4ae6e5e01440e3ea8f0277f2e8169bf95d07c7d5fe69
> > +gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2
> > diff --git a/package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.mk
> > b/package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.mk
> > new file mode 100644
> > index 0000000000..a72a172fce
> > --- /dev/null
> > +++ b/package/arm-gnu-rm-toolchain/arm-gnu-rm-toolchain.mk
> > @@ -0,0 +1,16 @@
> >
> +#########################################################
> ############
> > +###########
> > +#
> > +# arm-gnu-rm-toolchain
> > +#
> >
> +#########################################################
> ############
> > +###########
> > +
> > +ARM_GNU_RM_TOOLCHAIN_SITE =
> > +https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2
> > +ARM_GNU_RM_TOOLCHAIN_VERSION = 7-2018-q2-update
> > +ARM_GNU_RM_TOOLCHAIN_SOURCE =
> > +gcc-arm-none-eabi-$(ARM_GNU_RM_TOOLCHAIN_VERSION)-
> linux.tar.bz2
> > +
> > +define HOST_ARM_GNU_RM_TOOLCHAIN_INSTALL_CMDS
> > +       mkdir -p $(HOST_DIR)/opt/gcc-arm-none-eabi/
> > +       cp -a $(@D)/* $(HOST_DIR)/opt/gcc-arm-none-eabi/
> > +endef
> > +
> > +$(eval $(host-generic-package))
> > --
> 
> Incidentally I did more or less the same thing locally.
> For reference, here is what I had:
> 
> 
> HOST_RTC_TOOLCHAIN_ARM_SITE =
> https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-
> rm/7-2018q2
> HOST_RTC_TOOLCHAIN_ARM_SOURCE = gcc-arm-none-eabi-7-2018-q2-
> update-linux.tar.bz2
> 
> HOST_RTC_TOOLCHAIN_ARM_PREFIX = arm-none-eabi
> 
> HOST_RTC_TOOLCHAIN_ARM_INSTALL_DIR = $(HOST_DIR)/opt/rtc-
> toolchain-arm define HOST_RTC_TOOLCHAIN_ARM_INSTALL_CMDS
>     rm -rf $(HOST_RTC_TOOLCHAIN_ARM_INSTALL_DIR)
>     mkdir -p $(HOST_RTC_TOOLCHAIN_ARM_INSTALL_DIR)
>     mv $(@D)/* $(HOST_RTC_TOOLCHAIN_ARM_INSTALL_DIR)/
> 
>     cd $(HOST_DIR)/bin; \
>     for i in $(HOST_RTC_TOOLCHAIN_ARM_INSTALL_DIR)/bin/*; do \
>         ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%..%') .; \
>     done
> endef
> 
> $(eval $(host-generic-package))
> 
> 
> So, basically I see following relevant differences:
> 
> 1. Instead of copying the toolchain I _move_ the files, just like the internal
> toolchain is doing. This prevents two copies of the files.
> 2. I also create symlinks in output/host/bin so that the toolchain can easily be
> accessed from places external to Buildroot.
[KP] OK, thank you for the tips, I will re-work this patch now.
Regards
Kosta
> 
> Best regards,
> Thomas
