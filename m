From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 4 Nov 2019 08:17:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/iputils: add systemd dependency
In-Reply-To: <CADvTj4q3o-RyML7f3ACg=eb48tLdjnWpKdxy+Ro6Z++c+aev+Q@mail.gmail.com>
References: <20191103060743.107052-1-james.hilliard1@gmail.com>
 <20191103065533.GA31542@x230>
 <CADvTj4q3o-RyML7f3ACg=eb48tLdjnWpKdxy+Ro6Z++c+aev+Q@mail.gmail.com>
Message-ID: <20191104071703.GA15382@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi James,

> > > This is needed to ensure systemd services are installed.

> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

> > > ---
> > >  package/iputils/iputils.mk | 4 ++++
> > >  1 file changed, 4 insertions(+)

> > > diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> > > index 57e90a973a..daceb192f2 100644
> > > --- a/package/iputils/iputils.mk
> > > +++ b/package/iputils/iputils.mk
> > > @@ -49,6 +49,10 @@ IPUTILS_CONF_OPTS += -DUSE_CRYPTO=none
> > >  IPUTILS_NINFOD = n
> > >  endif

> > > +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> > > +IPUTILS_DEPENDENCIES += systemd
> > > +endif

Hm, it works with your config, your patch is probably right.
Acked-by: Petr Vorel <petr.vorel@gmail.com>

I used more or less the same (make defconfig, but changed manually to glibc and
systemd as init, which then also have BR2_PACKAGE_SYSTEMD=y and
BR2_INIT_SYSTEMD=y).

I just wonder if it this should somehow depend on BR2_INIT_SYSTEMD.

Therefore last commit "meson: Use prefix for systemd directory" from PR#226 [1]
is probably wrong.

Kind regards,
Petr

[1] https://github.com/iputils/iputils/pull/226

> > I'm trying to debug it with ./utils/test-pkg and it still does not install it.
> Are you able to reproduce this issue when doing a normal build?
> I haven't been able to reproduce this, do you have a defconfig I can test with?
> I did a build with pc_x86_64_efi_defconfig modified to enable systemd
> and iputils
> and the iputils systemd services were installed just fine.
> my defconfig for reference:
> BR2_x86_64=y
> BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
> BR2_INIT_SYSTEMD=y
> BR2_TARGET_GENERIC_GETTY_PORT="tty1"
> BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi-gpt.sh"
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.10"
> BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
> BR2_LINUX_KERNEL_INSTALL_TARGET=y
> BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> BR2_PACKAGE_LINUX_FIRMWARE=y
> BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9170=y
> BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271=y
> BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160=y
> BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3168=y
> BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000=y
> BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A=y
> BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2B=y
> BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260=y
> BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265D=y
> BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8000C=y
> BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8265=y
> BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73=y
> BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX=y
> BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=y
> BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX=y
> BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX=y
> BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
> BR2_PACKAGE_ACPID=y
> BR2_PACKAGE_CONNMAN=y
> BR2_PACKAGE_CONNMAN_WIFI=y
> BR2_PACKAGE_CONNMAN_CLIENT=y
> BR2_PACKAGE_IPUTILS=y
> BR2_TARGET_ROOTFS_EXT2=y
> BR2_TARGET_ROOTFS_EXT2_4=y
> BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> # BR2_TARGET_ROOTFS_TAR is not set
> BR2_TARGET_GRUB2=y
> BR2_TARGET_GRUB2_X86_64_EFI=y
> BR2_PACKAGE_HOST_DOSFSTOOLS=y
> BR2_PACKAGE_HOST_MTOOLS=y
