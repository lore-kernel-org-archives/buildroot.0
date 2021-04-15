From: Vadym Kochan <vadym.kochan@plvision.eu>
Date: Thu, 15 Apr 2021 14:07:53 +0300
Subject: [Buildroot] [PATCH] configs/solidrun_macchiatobin_defconfig:
 include for Singleshot DTS
In-Reply-To: <YHc0JbHzCrOw40g2@curiosity>
References: <20210408073349.16629-1-vadym.kochan@plvision.eu>
 <YG68WisliSerKFtr@curiosity> <20210409124556.GA8110@plvision.eu>
 <YHCinVc5pCs57i1N@curiosity> <20210409185844.GA23498@plvision.eu>
 <20210414155944.GA13866@plvision.eu> <YHc0JbHzCrOw40g2@curiosity>
Message-ID: <20210415110753.GA4013@plvision.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sergey,

On Wed, Apr 14, 2021 at 09:27:49PM +0300, Sergey Matyukevich wrote:
> Hello Vadym,
> 
> > > > > > > Single- & Double shot boards have many in common except additional
> > > > > > > RJ45 tranceivers near by each of 10G SFP and a bit different CPU freq.
> > > > > > > 
> > > > > > > Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
> > > > > > > ---
> > > > > > >  configs/solidrun_macchiatobin_defconfig | 2 +-
> > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > > 
> > > > > > > diff --git a/configs/solidrun_macchiatobin_defconfig b/configs/solidrun_macchiatobin_defconfig
> > > > > > > index 7d06313b03db..34094a833b66 100644
> > > > > > > --- a/configs/solidrun_macchiatobin_defconfig
> > > > > > > +++ b/configs/solidrun_macchiatobin_defconfig
> > > > > > > @@ -30,7 +30,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > > > > > >  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.5"
> > > > > > >  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> > > > > > >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> > > > > > > -BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-8040-mcbin"
> > > > > > > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-8040-mcbin marvell/armada-8040-mcbin-singleshot"
> > > > > > >  BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/solidrun/macchiatobin/linux-extras.config"
> > > > > > >  BR2_LINUX_KERNEL_INSTALL_TARGET=y
> > > > > > >  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> > > > > > 
> > > > > > I do not have access to MacchiatoBin hardware anymore, but I have been using
> > > > > > current defconfig with DoubleShot boards. If this defconfig does not work
> > > > > > well for SingleShot boards, then it makes sense to add a separate defconfig
> > > > > > for such boards rather then remove DoubleShot support completely. Probably
> > > > > > linux-extras.config in board/solidrun/macchiatobin worth another look to
> > > > > > make sure that features for both boards are included.
> > > > > > 
> > > > > > Regards,
> > > > > > Sergey
> > > > > 
> > > > > If comparing Single- and DoubleShot Linux DTS files they have difference
> > > > > only in SFP config and +1 heartbeat LED. Do you think it is worth to duplicate
> > > > > current defconfig for SingleShot board even if SFP will not work by
> > > > > using DualShot DTS instead of just append _INTREE_DTS_NAME with
> > > > > -singleshot version ?
> > > > 
> > > > I think any option will do if it does not break existing use-cases.
> > > > Could you please confirm that DoubleShot image does not work
> > > > properly on SingleShot board ?
> > > > 
> > > > BTW, I thought that support for autodetect of copper vs fiber with
> > > > some prioritization has been already implemented in Linux for
> > > > mcbin hardware. Do you know if this is true or not ?
> > > > 
> > > > Regards,
> > > > Sergey
> > > > 
> > > 
> > > I will check SFP modules in Monday with DoubleShot DTS.
> > > 
> > > Thanks,
> > 
> > 
> > Looks like there is no much reason to add particular SingleShot DTS
> > but only if someone really need the heartbeat LED is blinking which
> > works only with SingleShot DTS)
> 
> Do you mean that network interfaces on SingleShot board are working
> properly with current buildroot mcbin image ?
> 
> Regards,
> Sergey

OK, I was wrong ...

So I am using the same Buildroot defconfig and just switching between
DualShot and SingleShot DTSs to check the difference, and on SingleShot
I can bring up eth1 & eth3 with NG Optics SFP modules connected via
loopback, but I can't do this on DualShot DTS and Linux prints no PHY
for eth1. So there is a really functional difference for SFPs.

So, probably it is better to create separate defconfig for _singleshot
version.

Also I got an issue with NFS boot with this Linux version which I fixed
it with in armada-8040-mcbin.dtsi:

&cp1_eth1 {
	/* CPS Lane 0 - J5 (Gigabit RJ45) */

	...

	managed = "in-band-status";

	...
};

But issue is not observed on net-next's version (probably
issue might already be fixed in some of the stable version, I can
look for stable version with the fixed .dtsi).

The fix also applicable for DualShot DTS version (which I checked
on SingleShot board).

Regards,
