From: maitysanchayan at gmail.com <maitysanchayan@gmail.com>
Date: Fri, 3 Jun 2016 16:52:18 +0530
Subject: [Buildroot] [PATCH v2 1/2] configs: Add support for Toradex
 Colibri Vybrid Modules
In-Reply-To: <20160531231954.18455f2e@free-electrons.com>
References: <cover.1449902276.git.maitysanchayan@gmail.com>
 <57ea79a5678e14be13215ddc1be041c962b3be10.1449902276.git.maitysanchayan@gmail.com>
 <20160531231954.18455f2e@free-electrons.com>
Message-ID: <20160603112218.GA1688@Sanchayan-Arch.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 16-05-31 23:19:54, Thomas Petazzoni wrote:
> Hello,
> 
> Thanks for this new iteration, and sorry for the very slow response.
> Are you still interested in getting this defconfig merged in Buildroot
> upstream? If so, please see my comments below.

Yes, I am still interested.

> 
> On Sat, 12 Dec 2015 12:36:57 +0530, Sanchayan Maity wrote:
> > Add a minimal default configuration for Colibri Vybrid modules.
> > 
> > Tested on Colibri VF50 and VF61 modules.
> 
> We need your Signed-off-by line here.
> 
> > ---
> >  configs/colibri_vf_defconfig | 38 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >  create mode 100644 configs/colibri_vf_defconfig
> > 
> > diff --git a/configs/colibri_vf_defconfig b/configs/colibri_vf_defconfig
> > new file mode 100644
> > index 0000000..19a3394
> > --- /dev/null
> > +++ b/configs/colibri_vf_defconfig
> > @@ -0,0 +1,38 @@
> > +BR2_arm=y
> > +BR2_cortex_a5=y
> > +BR2_ARM_EABIHF=y
> > +BR2_ARM_ENABLE_NEON=y
> > +BR2_ARM_FPU_NEON_VFPV4=y
> 
> Please add here:
> 
> # Linux headers same as kernel, a 4.5 series
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
> 
> Of course 4.5 should be adjusted to match the kernel version you're
> using. This is needed to make sure that the toolchain is built with
> kernel headers that are at least as old as the kernel running on the
> target.

Ok. I have this in a new version in my local branch.

> 
> > +BR2_TARGET_GENERIC_HOSTNAME="colibri-vf"
> > +BR2_TARGET_GENERIC_ISSUE="Colibri VF 20151211"
> > +BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
> > +BR2_LINUX_KERNEL=y
> > +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> > +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.toradex.com/linux-toradex.git"
> > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="a276a526ac8e0d255f4165221c5bece5940dbc95"
> > +BR2_LINUX_KERNEL_DEFCONFIG="colibri_vf"
> > +BR2_LINUX_KERNEL_ZIMAGE=y
> > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="vf610-colibri-eval-v3 vf500-colibri-eval-v3"
> > +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> > +BR2_TARGET_ROOTFS_UBIFS=y
> > +BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
> > +BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE=0x800
> > +BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=8112
> > +BR2_TARGET_ROOTFS_UBIFS_RT_LZO=y
> > +BR2_TARGET_ROOTFS_UBIFS_NONE=y
> > +BR2_TARGET_ROOTFS_UBIFS_OPTS="--space-fixup -o ubifs.img"
> 
> Remove the -o ubifs.img, it is anyway overridden by the ubifs.mk build
> logic in Buildroot. If you really want to rename the file, do so in a
> post-image script.

Ah I see. I was wondering why it does not work as intended. Thanks for
the tip. I will look into the post-image script part.

Regards,
Sanchayan.

> 
> > +BR2_TARGET_ROOTFS_UBI=y
> > +BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x20000
> > +BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
> > +BR2_TARGET_ROOTFS_UBI_OPTS=""
> > +BR2_TARGET_UBOOT=y
> > +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> > +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> > +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.toradex.com/u-boot-toradex.git"
> > +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="1bb2de8875a385dd390678e8d46d3aab5a70445d"
> > +BR2_TARGET_UBOOT_USE_DEFCONFIG=y
> > +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="colibri_vf"
> > +BR2_TARGET_UBOOT_FORMAT_IMX=y
> > +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> > +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nand.imx"
> 
> I have some more comments on the second patch, which I'll do now.
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
