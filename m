From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 22:32:37 +0100
Subject: [Buildroot] [PATCH 1/4] libz160: new package
In-Reply-To: <1415375874-17331-2-git-send-email-jezz@sysmic.org>
References: <1415375874-17331-1-git-send-email-jezz@sysmic.org>
 <1415375874-17331-2-git-send-email-jezz@sysmic.org>
Message-ID: <20141127223237.46d6b8f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Fri,  7 Nov 2014 16:57:51 +0100, J?r?me Pouiller wrote:

> diff --git a/package/freescale-imx/libz160/Config.in b/package/freescale-imx/libz160/Config.in
> new file mode 100644
> index 0000000..b1001da
> --- /dev/null
> +++ b/package/freescale-imx/libz160/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_LIBZ160
> +	bool "libz160"
> +	depends on BR2_arm # Only relevant for i.MX5

This was I believe not needed, since the package can anyway only be
selected on i.MX51/i.MX53, as per package/freescale-imx/Config.in.

> diff --git a/package/freescale-imx/libz160/libz160.mk b/package/freescale-imx/libz160/libz160.mk
> new file mode 100644
> index 0000000..d083d81
> --- /dev/null
> +++ b/package/freescale-imx/libz160/libz160.mk
> @@ -0,0 +1,40 @@
> +#############################################################
> +#
> +# libz160
> +#
> +#############################################################

Bad length of comment header + missing empty new line. I didn't notice
this initially, so I fixed that up as part of a separate commit.

> +LIBZ160_VERSION = 11.09.01
> +LIBZ160_SOURCE = libz160-bin-$(LIBZ160_VERSION).bin
> +LIBZ160_SITE = $(FREESCALE_IMX_SITE)
> +LIBZ160_INSTALL_STAGING = YES
> +LIBZ160_LICENSE = Freescale Semiconductor Software License Agreement
> +
> +# No license file is included in the archive; we could extract it from
> +# the self-extractor, but that's just too much effort.
> +# This is a legal minefield: the EULA specifies that
> +# the Board Support Package includes software and hardware (sic!)
> +# for which a separate license is needed...
> +LIBZ160_REDISTRIBUTE = NO
> +
> +# The archive is a shell-self-extractor of a bzipped tar. Output directory 
> +# depends of version of source.
> +# The --force makes sure it doesn't fail if the source dir already exists.
> +# The --auto-accept skips the license check - not needed for us
> +# because we have legal-info.
> +define LIBZ160_EXTRACT_CMDS
> +	(cd $(@D); \
> +		sh $(DL_DIR)/$(LIBZ160_SOURCE) --force --auto-accept)
> +	mv $(@D)/libz160-bin-$(LIBZ160_VERSION)/* $(@D)
> +	rmdir $(@D)/libz160-bin-$(LIBZ160_VERSION)
> +endef
> +
> +define LIBZ160_INSTALL_STAGING_CMDS
> +	$(INSTALL) -m 644 $(@D)/usr/lib/libz160.so $(STAGING_DIR)/usr/lib/
> +	$(INSTALL) -m 644 $(@D)/usr/include/z160.h $(STAGING_DIR)/usr/include/
> +endef
> +
> +define LIBZ160_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 644 $(@D)/usr/lib/libz160.so $(TARGET_DIR)/usr/lib/
> +endef

We always want full paths for installations, using $(INSTALL) -D. And
libraries are more typically installed 755 rather than 644.

Patch applied to next with those issues fixed, and the patch switching
to the common extract helper merged into it.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
