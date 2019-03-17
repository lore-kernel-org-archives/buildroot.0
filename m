From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 14:10:07 +0100
Subject: [Buildroot] [PATCH v8 3/3] openjdk-hello-world: new test
In-Reply-To: <20190315205233.128763-3-aduskett@gmail.com>
References: <20190315205233.128763-1-aduskett@gmail.com>
 <20190315205233.128763-3-aduskett@gmail.com>
Message-ID: <20190317141007.065e8bb9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Mar 2019 16:52:33 -0400
aduskett at gmail.com wrote:

> diff --git a/DEVELOPERS b/DEVELOPERS
> index b4511bb053..ffd472d720 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1500,6 +1500,7 @@ F:	package/valijson/
>  F:	package/wpa_supplicant/
>  F:	package/wireless_tools/
>  F:	package/xen/
> +F:	support/testing/tests/package/br2-external/openjdk/

The test_openjdk.py file was not listed here, so I've added it.

> diff --git a/support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/Config.in b/support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/Config.in
> new file mode 100644
> index 0000000000..4f9022fb92
> --- /dev/null
> +++ b/support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_OPENJDK_HELLO_WORLD
> +	bool "openjdk hello world"
> +	depends on BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	depends on BR2_PACKAGE_XORG7
> +	depends on BR2_USE_WCHAR # gtk2 -> glib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # gtk2 -> glib2
> +	depends on BR2_USE_MMU # gtk2 -> glib2
> +	depends on BR2_INSTALL_LIBSTDCPP # gtk2, cups
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # gtk2 -> pango -> harfbuzz
> +	depends on !BR2_STATIC_LIBS
> +	select BR2_PACKAGE_OPENJDK

For a test case, I don't think it made a lot of sense to replicate all
those dependencies. For example, you were missing the dependency
on !BR2_SOFT_FLOAT.

So instead, I've replaced all of this by a much simpler;

	depends on BR2_PACKAGE_OPENJDK

Applied with this fixed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
