From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Dec 2019 15:01:07 +0100
Subject: [Buildroot] [PATCH/next v3 1/5] package/ti-sgx-libgbm: new
 package
In-Reply-To: <20191115125001.28255-2-unixmania@gmail.com>
References: <20191115125001.28255-1-unixmania@gmail.com>
 <20191115125001.28255-2-unixmania@gmail.com>
Message-ID: <20191230150107.29c15d37@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 Nov 2019 09:49:57 -0300
unixmania at gmail.com wrote:

> diff --git a/package/Config.in b/package/Config.in
> index f72c77b416..0a0499421c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -541,6 +541,7 @@ endmenu
>  	source "package/ti-sgx-demos/Config.in"
>  	source "package/ti-sgx-km/Config.in"
>  	source "package/ti-sgx-um/Config.in"
> +	source "package/ti-sgx-libgbm/Config.in"

Alphabetic ordering here was not good (reported by check-package).

> diff --git a/package/ti-sgx-libgbm/Config.in b/package/ti-sgx-libgbm/Config.in
> new file mode 100644
> index 0000000000..33014b2ed3
> --- /dev/null
> +++ b/package/ti-sgx-libgbm/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_TI_SGX_LIBGBM
> +	bool "ti-sgx-libgbm"

Missing:

        depends on BR2_TOOLCHAIN_HAS_THREADS
        depends on BR2_PACKAGE_HAS_UDEV
        select BR2_PACKAGE_LIBDRM

to follow the dependencies of the .mk file.

> +# Extract the license from the gbm.h header instead of distributing the whole
> +# file. This is safe because if the terms change in the header the sha256 hash
> +# will stop matching.
> +define TI_SGX_LIBGBM_EXTRACT_LICENSE
> +	head -n 26 $(@D)/gbm.h > $(@D)/license.txt
> +endef
> +TI_SGX_LIBGBM_POST_EXTRACT_HOOKS += TI_SGX_LIBGBM_EXTRACT_LICENSE

I've used the complete gbm.h as license file. We already use full
source files as license files in other packages, it's simple enough,
and this gbm.h is unlikely to ever change anyway.

I've also taken into account the comments from Yegor, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
