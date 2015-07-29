From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jul 2015 17:36:43 +0200
Subject: [Buildroot] [PATCH 1/1 v2] Build El Torito for i386 PC
In-Reply-To: <1438170732.2675.12.camel@intel.com>
References: <1438170732.2675.12.camel@intel.com>
Message-ID: <20150729173643.18dabf28@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Kinsella, Ray,

On Wed, 29 Jul 2015 11:52:14 +0000, Kinsella, Ray wrote:
> Building Grub2 El Torito for i386 EFI errors complaining it cannot find cdboot.img
> 
>         cdboot.img: No such file or directory
> 
> This commit builds El Torito for i386 PC only
> 
> Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>

The title of the patch should have been:

	grub2: build El Torito image only for i386 PC

We want all commit titles to be prefixed by the name of the package the
commit is touching.


> +ifeq ($(BR2_TARGET_GRUB2_I386_PC),y)
> +define GRUB2_IMAGE_INSTALL_ELTORITO
> +	cat $(HOST_DIR)/usr/lib/grub/$(GRUB2_TUPLE)/cdboot.img $(GRUB2_IMAGE) > \
> +		$(BINARIES_DIR)/grub-eltorito.img
> +endef
> +GRUB2_POST_INSTALL_TARGET_HOOKS += GRUB2_IMAGE_INSTALL_ELTORITO
> +endif
> +
>  define GRUB2_IMAGE_INSTALLATION
>  	mkdir -p $(dir $(GRUB2_IMAGE))
>  	$(HOST_DIR)/usr/bin/grub-mkimage \
> @@ -76,8 +84,6 @@ define GRUB2_IMAGE_INSTALLATION
>  		-p "$(GRUB2_PREFIX)" \
>  		$(if $(GRUB2_BUILTIN_CONFIG),-c $(GRUB2_BUILTIN_CONFIG)) \
>  		$(GRUB2_BUILTIN_MODULES)
> -	cat $(HOST_DIR)/usr/lib/grub/$(GRUB2_TUPLE)/cdboot.img $(GRUB2_IMAGE) > \
> -		$(BINARIES_DIR)/grub-eltorito.img
>  	mkdir -p $(dir $(GRUB2_CFG))
>  	$(INSTALL) -D -m 0644 boot/grub2/grub.cfg $(GRUB2_CFG)
>  endef

And I tested your patch, and it fails to build. So it seems like you
did not test it properly. The reason is that the $(GRUB2_IMAGE) used by
your new post-install hook is not generated until the next post-install
hook (the existing GRUB2_IMAGE_INSTALLATION function) gets executed. But
this hook is afterwards.

So I changed the implementation to simply make the
GRUB2_IMAGE_INSTALLATION function call GRUB2_IMAGE_INSTALL_ELTORITO.

I applied your patch with those changes, see:

   http://git.buildroot.net/buildroot/commit/?id=8f609ed603220e0ac0ef9a45b0214eb87ab85d1e

Thanks for this contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
