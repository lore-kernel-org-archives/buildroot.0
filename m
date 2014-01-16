From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 16 Jan 2014 11:36:42 +0200
Subject: [Buildroot] [RFC,
 PATCH 5/8] package/kexec-lite: Add a package for the kexec-lite
 tools
In-Reply-To: <1389862338.919140.855251422258.5.gpush@pablo>
References: <1389862338.917573.283530987294.0.gpush@pablo>
 <1389862338.919140.855251422258.5.gpush@pablo>
Message-ID: <20140116093642.GC4602@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jeremy,

On Thu, Jan 16, 2014 at 04:52:18PM +0800, Jeremy Kerr wrote:
> Kexec-lite is a tiny impementation of kexec for devicetree-based
> platforms.
> 
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

[...]

> diff --git a/package/kexec-lite/Config.in b/package/kexec-lite/Config.in
> new file mode 100644
> index 00000000..0dc05155
> --- /dev/null
> +++ b/package/kexec-lite/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_KEXEC_LITE
> +	bool "kexec-lite"
> +	depends on BR2_powerpc
> +	select BR2_PACKAGE_LIBELF
> +	select BR2_PACKAGE_DTC
> +	select BR2_PACKAGE_DTC_PROGRAMS
> +	help
> +	  Kexec is a user space utiltity for loading another kernel
> +	  and asking the currently running kernel to do something with it.

This looks like a description of the generic kexec. You should mention that 
this is a special version as the commit log says.

[...]

> diff --git a/package/kexec-lite/kexec-lite.mk 
> b/package/kexec-lite/kexec-lite.mk
> new file mode 100644
> index 00000000..4d844f43
> --- /dev/null
> +++ b/package/kexec-lite/kexec-lite.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# kexec
> +#
> +################################################################################
> +
> +KEXEC_LITE_VERSION = 6c762a7

Full commit id.

> +KEXEC_LITE_SITE = git://github.com/antonblanchard/kexec-lite

Please use the github helper. See docs/manual/adding-packages-tips.txt.

> +KEXEC_LITE_LICENSE = GPL
> +KEXEC_LITE_DEPENDENCIES = libelf dtc
> +
> +define KEXEC_LITE_BUILD_CMDS
> +	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
> +endef
> +
> +define KEXEC_LITE_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 755 $(@D)/kexec $(TARGET_DIR)/usr/sbin/
> +endef
> +
> +$(eval $(generic-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
