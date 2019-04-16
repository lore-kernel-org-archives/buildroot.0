From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Apr 2019 22:26:51 +0200
Subject: [Buildroot] [PATCH v3 1/4] package/intel-mediadriver: new
 package
In-Reply-To: <20190205181946.14496-2-lpdev@cordier.org>
References: <20190205181946.14496-1-lpdev@cordier.org>
 <20190205181946.14496-2-lpdev@cordier.org>
Message-ID: <20190416222651.0a74488d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Feb 2019 19:19:43 +0100
Louis-Paul Cordier <lpdev@cordier.org> wrote:

> Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>

I have applied after doing a few changes, see below.

> diff --git a/package/intel-mediadriver/Config.in b/package/intel-mediadriver/Config.in
> new file mode 100644
> index 0000000000..7dd80fbfc7
> --- /dev/null
> +++ b/package/intel-mediadriver/Config.in
> @@ -0,0 +1,21 @@
> +config BR2_PACKAGE_INTEL_MEDIADRIVER
> +	bool "intel-mediadriver"
> +	depends on BR2_x86_64
> +	depends on !BR2_STATIC_LIBS # mesa3D/libva
> +	depends on BR2_INSTALL_LIBSTDCPP # mesa3D
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # mesa3D
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libva/libdrm/libpthread-stubs
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mesa3D

mesa3D -> mesa3d

but more importantly, when you have dependencies, there should be
corresponding Config.in comments. So I've added:

+comment "intel-mediadriver needs X.org"
+       depends on BR2_x86_64 && BR2_TOOLCHAIN_HAS_SYNC_1
+       depends on !BR2_PACKAGE_XORG7
+
+comment "intel-mediadriver needs a toolchain w/ dynamic library, C++, NPTL"
+       depends on BR2_x86_64 && BR2_TOOLCHAIN_HAS_SYNC_1
+       depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
+               !BR2_TOOLCHAIN_HAS_THREADS_NPTL

> +INTEL_MEDIADRIVER_VERSION = 18.4.0
> +INTEL_MEDIADRIVER_SITE = http://github.com/intel/media-driver/archive
> +INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
> +INTEL_MEDIADRIVER_LICENSE = MIT,BSD-3-Clause

A space should have been used to separate the licenses.

Besides that, the build was failing with a non-SSP capable toolchain,
so I've added a quick patch
package/intel-mediadriver/0001-Drop-hardening-related-flags.patch to
drop -fstack-protector from the build flags.

Could you work on an improved solution that can be submitted upstream ?
The best solution is to provide an option to enable/disable usage of
hardening related options.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
