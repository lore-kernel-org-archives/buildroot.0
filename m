From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Jun 2013 18:57:06 +0200
Subject: [Buildroot] [PATCHv2 1/3] Add on2-8170 kernel modules
In-Reply-To: <1370803110-27093-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1370803110-27093-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <51B60562.1020308@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/06/13 20:38, Alexandre Belloni wrote:
> diff --git a/package/on2-8170-modules/Config.in b/package/on2-8170-modules/Config.in
> new file mode 100644
> index 0000000..f082c5f
> --- /dev/null
> +++ b/package/on2-8170-modules/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_ON2_8170_MODULES
> +	bool "on2-8170 modules"
> +	depends on BR2_LINUX_KERNEL

  We usually add a "depends on BR2_arm" or something similar for such 
SoC-specific packages.

  I'm not sure though if everyone agrees that this is a good ide.

> +	help
> +	  Kernel modules for the Hantro x170 hardware video decompression.
> +
> +	http://www.at91.com/linux4sam/bin/view/Linux4SAM/SAM9M10Gstreamer
> +
> +comment "on2-8170 modules requires a linux kernel to be built"
> +	depends on !BR2_LINUX_KERNEL
> diff --git a/package/on2-8170-modules/on2-8170-modules.mk b/package/on2-8170-modules/on2-8170-modules.mk
> new file mode 100644
> index 0000000..53286fb
> --- /dev/null
> +++ b/package/on2-8170-modules/on2-8170-modules.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# on2-8170-modules
> +#
> +################################################################################
> +
> +ON2_8170_MODULES_VERSION = 73b08061d30789178e692bc332b73d1d9922bf39
> +ON2_8170_MODULES_SITE    = git://github.com/alexandrebelloni/on2-8170-modules.git

  Can you use a tarball, cfr. 
docs/manual/adding-packages-tips.txt:[[github-download-url]] ?

  Could you add license info?



  Regards,
  Arnout

> +
> +ON2_8170_MODULES_DEPENDENCIES = linux
> +
> +define ON2_8170_MODULES_BUILD_CMDS
> +	$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) M=$(@D)
> +endef
> +
> +define ON2_8170_MODULES_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) M=$(@D) modules_install
> +endef
> +
> +$(eval $(generic-package))


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
