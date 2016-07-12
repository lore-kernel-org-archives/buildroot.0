From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Jul 2016 16:55:28 +0200
Subject: [Buildroot] [PATCH 5/7] new package: ti-sgx/ti-sgx-demos SGX
 binary demos
In-Reply-To: <1468311988-22059-6-git-send-email-lothar.felten@gmail.com>
References: <1468311988-22059-1-git-send-email-lothar.felten@gmail.com>
 <1468311988-22059-6-git-send-email-lothar.felten@gmail.com>
Message-ID: <20160712165528.462c81ce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Jul 2016 10:26:26 +0200, Lothar Felten wrote:
> This package adds the SGX demos from Imagination Technologies.
> The demos are available as binaries only.
> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>

Commit title should be:

	ti-sgx-demos: new package

> diff --git a/package/ti-sgx/ti-sgx-demos/Config.in b/package/ti-sgx/ti-sgx-demos/Config.in
> new file mode 100644
> index 0000000..e4d4321
> --- /dev/null
> +++ b/package/ti-sgx/ti-sgx-demos/Config.in
> @@ -0,0 +1,4 @@
> +config BR2_PACKAGE_TI_SGX_DEMOS
> +	bool "sgx powervr demo binaries"

	bool "ti-sgx-demos"

> +	help
> +	  TI SGX powervr demos

More details + upstream link.

> diff --git a/package/ti-sgx/ti-sgx-demos/ti-sgx-demos.mk b/package/ti-sgx/ti-sgx-demos/ti-sgx-demos.mk
> new file mode 100644
> index 0000000..04389f1
> --- /dev/null
> +++ b/package/ti-sgx/ti-sgx-demos/ti-sgx-demos.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# ti-sgx-demos
> +#
> +################################################################################
> +
> +# This correpsonds to SDK 02.00.00.00
> +TI_SGX_DEMOS_VERSION = f24650bc8243b25c23d6a0a502ed79fc472ac424
> +TI_SGX_DEMOS_SITE = git://git.ti.com/graphics/img-pvr-sdk.git

http:// download if possible.

> +TI_SGX_DEMOS_LICENSE = Imagination Technogolies License Agreement 
> +TI_SGX_DEMOS_LICENSE_FILES = LegalNotice.txt
> +
> +TI_SGX_DEMOS_DEPENDENCIES =  ti-sgx-km ti-sgx-um 

Trailing space + one too many space after the =.

I guess those demos only work with the TI SGX OpenGL implementation,
and cannot be used with other OpenGL implementations.

> +define TI_SGX_DEMOS_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0555 -t $(TARGET_DIR)/usr/bin \
> +                $(@D)/targetfs/Examples/Advanced/OGLES* 

Please use tabs to indent the second line.

> +endef

555 isn't good, 755 should be used instead. However, it is true that we
generally prefer to use cp -dpfr for such installations:

	cp -dpfr $(@D)/targetfs/Examples/Advanced/OGLES \
		$(TARGET_DIR)/usr/bin/

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
