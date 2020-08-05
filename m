From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 22:34:34 +0200
Subject: [Buildroot] [PATCH 1/2] package/freescale-imx/imx-m4-demos: new
 package
In-Reply-To: <20200731121333.3754957-1-fabrice.goucem@oss.nxp.com>
References: <20200731121333.3754957-1-fabrice.goucem@oss.nxp.com>
Message-ID: <20200805223434.56d08a15@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

Thanks a lot for your patch series. Overall it looks pretty good, but a
few changes are needed.

First a minor detail: your commit title doesn't match the actual
package name being added. See below for other comments.

On Fri, 31 Jul 2020 14:13:32 +0200
Fabrice Goucem <fabrice.goucem@oss.nxp.com> wrote:

>  DEVELOPERS                                    |  1 +
>  board/freescale/common/imx/post-image.sh      | 14 ++++-

I think this part (changes to post-image.sh) should go into a separate
commit, after the package addition.

> diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
> index 06ccaac3a4..dc651ac584 100755
> --- a/board/freescale/common/imx/post-image.sh
> +++ b/board/freescale/common/imx/post-image.sh
> @@ -30,6 +30,18 @@ linux_image()
>  	fi
>  }
>  
> +#
> +# mcore_image prints all available MCORE demo file names for the genimage
> +# configuration file
> +#
> +mcore_image()
> +{
> +	if grep -Eq "^BR2_PACKAGE_IMX_MCORE_DEMOS=y$" ${BR2_CONFIG}; then
> +		echo -n ", "
> +		for f in $(ls ${BINARIES_DIR}/mcore_*); do echo -n "$(basename $f), "; done

If I look at this, it seems like having the list finish with a comma is
fine. If that's the case, then I think we should modify the
linux_image() function so that it echoes a string that is
comma-terminated, so that the mcore_image() doesn't have to worry about
this, and looks like dtb_list() in how it handles the comma.

> diff --git a/package/freescale-imx/imx-mcore-demos/imx-mcore-demos.hash b/package/freescale-imx/imx-mcore-demos/imx-mcore-demos.hash
> new file mode 100644
> index 0000000000..13f3092c88
> --- /dev/null
> +++ b/package/freescale-imx/imx-mcore-demos/imx-mcore-demos.hash
> @@ -0,0 +1,10 @@
> +# locally computed
> +sha256  cc00d3b936d49b2794a2a99e10129437e70caba3fd26b8379b8c50dd22f73254  imx7d-sabresd-m4-freertos-1.0.1.bin
> +sha256  a8fbe1180b3d20e933a410cd76e60baac7a9f54e8b2bae8b6b8a3e1af550eca6  imx7ulp-m4-demo-2.8.0.bin
> +sha256  2dbfab7fbbe89e89a2881d77c84a6c257699dc73ee6462a813bdd5ad09836b04  imx8mm-m4-demo-2.8.0.bin
> +sha256  e877c7462b6ea87c498563842f42352d204eb28a65f35f7dc1fec643f84abb66  imx8mn-m7-demo-2.8.0.bin
> +sha256  ac88568f63a794530339775a6e49e7928d3d09bcf4ba5edacea1841989e674b0  imx8mq-m4-demo-2.8.0.bin
> +sha256  d06a636b84cd559483091cbdb07b5ce9e15a534bca31d4cb756b33b696c2160b  imx8qm-m4-demo-2.8.0.bin
> +sha256  7800cdbebe07f426cdac50b0e295d64215164a767e79ca58bd917445c50e345f  imx8qx-m4-demo-2.8.0.bin
> +
> +# no hash for license file as it is different for each package listed above

Hm, that's is not great, but I don't really have a good/simple solution
for this.

> +ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7),y)
> +IMX_MCORE_DEMOS_VERSION = 1.0.1
> +IMX_MCORE_DEMOS_SOURCE = imx7d-sabresd-m4-freertos-$(IMX_MCORE_DEMOS_VERSION).bin
> +EXT = bin

Variables in Buildroot are global, so a variable named just "EXT" is
not good. It should be IMX_MCORE_DEMOS_FILE_EXT or something like that.

> +else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP),y)

This BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP option is only
introduced in the second patch of the series. I think it would make
more sense to introduce the i.MX7ULP platform as a separate patch
earlier in the series.

> +# Note: firmware names are copied to binaries directory with an "mcore_" prefix, for easier post image scripting

Please wrap long lines.

> +define IMX_MCORE_DEMOS_INSTALL_IMAGES_CMDS
> +	for f in $(@D)/*.$(EXT); do cp "$$f" $(BINARIES_DIR)/mcore_$$(basename "$$f"); done

Could you try (untested):

	$(foreach f,$(wildcard $(@D)/*.$(IMX_MCORE_DEMOS_FILE_EXT), \
		$(INSTALL) -D -m 0644 $(f) $(BINARIES_DIR)/mcore_$(notdir $(f))
	)

This is a bit more make-style :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
