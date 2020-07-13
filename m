From: Suniel Mahesh <sunil@amarulasolutions.com>
Date: Mon, 13 Jul 2020 12:12:59 +0530
Subject: [Buildroot] [PATCH v3 1/2] configs/rock_pi_n10: new defconfig
In-Reply-To: <20200712220441.0ca413bb@windsurf.home>
References: <1593893805-8430-1-git-send-email-sunil@amarulasolutions.com>
 <1593893805-8430-2-git-send-email-sunil@amarulasolutions.com>
 <20200712220441.0ca413bb@windsurf.home>
Message-ID: <CAM+7aWtw-j2YjuJ4UVWSTmQi3PT7wAaMOctNAYfCXvpr=1QNyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Jul 13, 2020 at 1:34 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Sun,  5 Jul 2020 01:46:44 +0530
> Suniel Mahesh <sunil@amarulasolutions.com> wrote:
>
> > Add initial support for RK3399PRO SOM based rockpi-n10 target
> > with below features:
> >
> >       - Custom U-Boot 2020.07-rc4
> >         https://github.com/amarula/u-boot-amarula.git
> >         branch rock-pi
> >       - Linux 5.7.2
> >       - GPT partition layout is being used
> >       - Default packages from buildroot
> >
> > Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
>
> I've applied, after doing some minor changes, see below.
>
> > diff --git a/board/radxa/rockpi-n10/genimage.cfg
> b/board/radxa/rockpi-n10/genimage.cfg
> > new file mode 100644
> > index 0000000..8fbf562
> > --- /dev/null
> > +++ b/board/radxa/rockpi-n10/genimage.cfg
> > @@ -0,0 +1,39 @@
> > +image boot.vfat {
> > +     vfat {
> > +             files = {
> > +                     "Image",
> > +                     "rk3399pro-rock-pi-n10.dtb",
> > +                     "extlinux"
> > +             }
> > +     }
> > +     size = 112M
>
> To be honest, it was not clear why you had this 112MB here. I kept it,
> but it feels weird. Why 112MB ?
>

 I am checking with my team, whether they have any specific reason for 112M.
Tested with 64M and the build/target works/boots fine.
I will send changes accordingly with justification.


> > diff --git a/configs/rock_pi_n10_defconfig
> b/configs/rock_pi_n10_defconfig
> > new file mode 100644
> > index 0000000..96b14bb
> > --- /dev/null
> > +++ b/configs/rock_pi_n10_defconfig
> > @@ -0,0 +1,57 @@
> > +# Architecture
> > +BR2_aarch64=y
> > +BR2_cortex_a72_a53=y
> > +
> > +# Linux headers same as kernel, a 5.4 series
>
> You're using a 5.7 kernel :-)
>
my bad, thanks for the correction.

>
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
> > +# Kernel
> > +BR2_LINUX_KERNEL=y
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.2"
> > +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399pro-rock-pi-n10"
> > +BR2_LINUX_KERNEL_INSTALL_TARGET=y
>
> I dropped this line. Indeed, the kernel is loaded by U-Boot from the
> FAT partition, not from the root filesystem, so it is useless to
> install it in the rootfs.
>
> Let me know if there was a reason for this.
>

Yes, the config option looks unnecessary, since the kernel is loaded by
U-Boot from the
FAT partition. Thanks for the correction again and the review.

Suniel

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200713/0f0a4170/attachment.html>
