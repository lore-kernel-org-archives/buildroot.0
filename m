From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Jan 2017 13:09:23 +1100
Subject: [Buildroot] [Proposal] Build RPi dtbo overlays instead of just
 copying
In-Reply-To: <1484767966.594811027@apps.rackspace.com>
References: <1484767966.594811027@apps.rackspace.com>
Message-ID: <20170119130923.72a70f90@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Jan 2017 14:32:46 -0500 (EST), Scott Ellis wrote:
> Currently RPi dtbo overlays come from the rpi-firmware package and are
> just copies of the binaries built upstream.
> 
> The source for the dtbos are in the same github.com/raspberrypi/linux
> tree that Buildroot is using for the kernel and the main board dtb.

Indeed.

> I'm suggesting the overlay dtbos should be in sync with the kernel
> and the main dtb we are using and get built at the same time.
> 
> The particular problem I want to solve is to allow my modifications 
> to overlays or addition of new overlays both via standard kernel patches
> get built and installed into the image.

Makes sense.

> I understand this is an RPi specific change to linux.mk, so I'm asking
> first whether it is of interest and worthwhile submitting a patch.

Indeed the below is too RPi specific in my opinion. If we want to merge
a solution, it has to be more generic, which is difficult to achieve
because there are no overlays in the upstream Linux kernel so there is
nothing that shows what should be the "standard" way of
storing/building overlays.

> +ifeq ($(BR2_LINUX_KERNEL_DTS_OVERLAYS_SUPPORT),y)
> +define LINUX_INSTALL_DTB_OVERLAYS
> +       cp $(KERNEL_ARCH_PATH)/boot/dts/overlays/*.dtbo $(1)

Perhaps the location where the .dtbo are produced should be
configurable, since it's not a standardized behavior that they end up
in arch/ARCH/boot/dts/overlays/ ?

>  ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
> @@ -350,6 +357,10 @@ define LINUX_BUILD_CMDS
>         @if grep -q "CONFIG_MODULES=y" $(@D)/.config; then      \
>                 $(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;        \
>         fi
> +       $(if $(BR2_LINUX_KERNEL_DTS_OVERLAYS_SUPPORT),
> +               $(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) dtbs ;           \
> +       )

I'm not sure how to handle that one. It doesn't relate only to overlay
support, but also to regular Device Trees. It is actually going to
build all Device Trees that are enabled for the currently selected
kernel configuration.

BTW, if there is a make rule for .dtbo, have you tried simply adding
your list of .dtbo of interest to BR2_LINUX_KERNEL_USE_INTREE_DTS ?

> @@ -390,6 +403,8 @@ endef
>  define LINUX_INSTALL_IMAGES_CMDS
>         $(call LINUX_INSTALL_IMAGE,$(BINARIES_DIR))
>         $(call LINUX_INSTALL_DTB,$(BINARIES_DIR))
> +       mkdir -p $(BINARIES_DIR)/rpi-firmware/overlays
> +       $(call LINUX_INSTALL_DTB_OVERLAYS,$(BINARIES_DIR)/rpi-firmware/overlays)

This rpi-firmware reference is clearly too RPi specific to be in
linux.mk.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
