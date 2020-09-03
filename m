From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 22:00:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/xilinx_axidma: new package
In-Reply-To: <20191001124220.24763-1-viktar.palstsiuk@promwad.com>
References: <20191001124220.24763-1-viktar.palstsiuk@promwad.com>
Message-ID: <20200903220027.13046337@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Viktar,

Thanks for your contribution, and sorry for the very slow feedback. I
finally looked at your patch, and the main question is: is this kernel
module + library still really maintained? There has been no commits
upstream since November 2018. Does it still work with recent versions
of the Xilinx Linux kernel ?

See below for a few comments.

On Tue, 1 Oct 2019 15:42:20 +0300
Viktar Palstsiuk <viktar.palstsiuk@promwad.com> wrote:

> Signed-off-by: Viktar Palstsiuk <viktar.palstsiuk@promwad.com>
> ---
>  package/Config.in                        |  1 +
>  package/xilinx_axidma/Config.in          |  8 +++++
>  package/xilinx_axidma/xilinx_axidma.hash |  2 ++
>  package/xilinx_axidma/xilinx_axidma.mk   | 38 ++++++++++++++++++++++++
>  4 files changed, 49 insertions(+)

We need the DEVELOPERS file to be updated.

>  create mode 100644 package/xilinx_axidma/Config.in
>  create mode 100644 package/xilinx_axidma/xilinx_axidma.hash
>  create mode 100644 package/xilinx_axidma/xilinx_axidma.mk

I'd prefer the package to be named xilinx-axidma (with a dash) rather
than xilinx_axidma.


> diff --git a/package/xilinx_axidma/Config.in b/package/xilinx_axidma/Config.in
> new file mode 100644
> index 0000000000..9eff093d05
> --- /dev/null
> +++ b/package/xilinx_axidma/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_XILINX_AXIDMA
> +	bool "xilinx_axidma"
> +	depends on BR2_LINUX_KERNEL

You also need:

	depends on !BR2_STATIC_LIBS

since the makefile unconditionally builds a shared library.

> +	help
> +	  xilinx_axidma driver.

This should be extended with more details, like:

	  A zero-copy, high-bandwidth Linux driver and userspace
	  interface library for Xilinx's AXI DMA and VDMA IP blocks. 

	  It needs a vendor-specific Xilinx kernel, built with the
	  following options:

	  ... here list of options ...

	  https://github.com/bperez77/xilinx_axidma

> +comment "xilinx_axidma needs a Linux kernel to be built"
> +	depends on !BR2_LINUX_KERNEL

This needs to be updated to take into account the !BR2_STATIC_LIBS
dependency.

> +define XILINX_AXIDMA_BUILD_CMDS
> +	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) library examples
> +endef
> +
> +define XILINX_AXIDMA_INSTALL_SHARED_LIB
> +	$(INSTALL) -D -m 0644 $(@D)/library/libaxidma.so $(1)/usr/lib/libaxidma.so

Is this macro really useful? It's online of code, and calling it takes
one line :-)

> +endef
> +
> +define XILINX_AXIDMA_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 0644 $(@D)/include/{libaxidma,axidma_ioctl}.h $(STAGING_DIR)/usr/include/

Doing this doesn't work well if $(STAGING_DIR)/usr/include doesn't
exist, as it will be created as a file with the contents of libaxidma.h.

	$(foreach f,libaxidma axidma_ioctl, \
		$(INSTALL) -D -m0644 $(@D)/include/$(f).h $(STAGING_DIR)/usr/include/$(f).h \
	)

> +	$(call XILINX_AXIDMA_INSTALL_SHARED_LIB,$(STAGING_DIR))
> +endef
> +
> +define XILINX_AXIDMA_INSTALL_TARGET_CMDS
> +	$(call XILINX_AXIDMA_INSTALL_SHARED_LIB,$(TARGET_DIR))
> +	$(INSTALL) -D -m 0755 $(@D)/examples/axidma_{benchmark,display_image,transfer} $(TARGET_DIR)/usr/bin/

Same comment here.

So if you're still interested in this, and can confirm that this is
still maintained, do not hesitate to send a new iteration of this patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
