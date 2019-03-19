From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 19 Mar 2019 07:50:18 +0100
Subject: [Buildroot] [PATCH 1/6] boot/arm-trusted-firmware: support
 32bit Arm targets
In-Reply-To: <CAN5uoS-iCBJ3T1J-UYRHbddwmw6dbTeUEFcLQ7vOpuJxdnzCoA@mail.gmail.com>
References: <7f15bfd5388e2171b13b44722b84149d9f361551.1551866509.git.etienne.carriere@linaro.org>
 <20190314232421.46ad28f2@windsurf>
 <CAN5uoS9QwY7g9swo_ngLxGX8XYi62Vy=S=czO1WvvCtBw7ADvA@mail.gmail.com>
 <CAN5uoS-iCBJ3T1J-UYRHbddwmw6dbTeUEFcLQ7vOpuJxdnzCoA@mail.gmail.com>
Message-ID: <CAN5uoS9-RWA40ofNLCG2+hypGvWKV6h3oGEtFxqk-MMtgf+0hA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

On Mon, 18 Mar 2019 at 08:22, Etienne Carriere
<etienne.carriere@linaro.org> wrote:
>
> Hello Thomas and all,
>
> Below an alternate proposal
>
> On Fri, 15 Mar 2019 at 10:00, Etienne Carriere
> <etienne.carriere@linaro.org> wrote:
> >
> > On Thu, 14 Mar 2019 at 23:24, Thomas Petazzoni
> > <thomas.petazzoni@bootlin.com> wrote:
> > >
> > > Hello,
> > >
> > > On Wed,  6 Mar 2019 11:11:35 +0100
> > > Etienne Carriere <etienne.carriere@linaro.org> wrote:
> > >
> > > > This change allows one to build the TF-A (Trusted Firmware A) for
> > > > 32bit Armv7 and Armv8 platforms which arm-trusted-firmware supports
> > > > since release v1.5.
> > > >
> > > > BR2_aarch64 is changed to BR2_ARM_CPU_ARMV8A as the later complemented
> > > > by BR2_ARM_CPU_ARMV7A better represents to architectures that can
> > > > support Arm Trusted Firmware A.
> > > >
> > > > When BR2_arm is enabled, TF-A is built in Aarch32 mode.
> > > > Selection between Armv8-A (default) and Armv7-A (ARM_ARCH_MAJOR=7) is
> > > > expected from BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES.
> > >
> > > It seems a bit annoying to require passing ARM_ARCH_MAJOR=7 in those
> > > additional variable. Why don't we do it automatically in
> > > arm-trusted-firmware.mk. We have all the knowledge required, no?
> > >
> > > > +ifeq ($(BR2_arm),y)
> > > > +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ARCH=aarch32
> > >
> > > Can we do:
> > >
> > > ifeq ($(BR2_arm),y)
> > > ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ARCH=aarch32 ARM_ARCH_MAJOR=7
> > > else
> > > ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ARCH=aarch64 ARM_ARCH_MAJOR=8
> > > endif
> > >
> > > for example ?
> >
> > Well... I guess yes. Until there comes Aarch32 Armv8-A platforms.
> > So, yes, you're right. Your change will relax ARM_ARCH_MAJOR from
> > ..._ADDITIONAL_VARIABLES.
> >
>
> Below will better reflect the configuration:
>
> ifeq ($(BR2_ARM_CPU_ARMV7A),y)
> ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ARM_ARCH_MAJOR=7
> else ifeq ($(BR2_ARM_CPU_ARMV8A),y)
> ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ARM_ARCH_MAJOR=8
> endif
>
> ifeq ($(BR2_arm),y)
> ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ARCH=aarch32
> else ifeq ($(BR2_aarch64),y)
> ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ARCH=aarch64
> endif
>
> I will push a PATCH v3 with updates in the later commits of the series.
> Thanks.

Please see PATCH v2 at http://patchwork.ozlabs.org/patch/1058134/

regards,
etienne

>
> regards,
> etienne
>
>
> > regards,
> > etienne
> >
> > >
> > > Thomas
> > > --
> > > Thomas Petazzoni, CTO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
