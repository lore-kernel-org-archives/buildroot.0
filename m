From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 May 2013 13:39:06 +0200
Subject: [Buildroot] [PATCH] Add HW decoding support for Hantro x170
In-Reply-To: <1369689224-492-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1369689224-492-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <20130528133906.5bfff499@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexandre Belloni,

On Mon, 27 May 2013 23:13:44 +0200, Alexandre Belloni wrote:
> This actually consist in a set of proprietary libs, on2-8170-libs and a
> gstreamer plugin making use of those libraries.
> 
> on2-8170-libs is probably libc agnostic but this has not been tested
> thoroughly.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  package/multimedia/Config.in                       |  2 ++
>  package/multimedia/gst-plugin-x170/Config.in       | 10 ++++++++
>  .../gst-plugin-x170-01-correct-CFLAGS.patch        | 28 ++++++++++++++++++++++
>  .../multimedia/gst-plugin-x170/gst-plugin-x170.mk  | 14 +++++++++++
>  package/multimedia/on2-8170-libs/Config.in         |  8 +++++++
>  package/multimedia/on2-8170-libs/on2-8170-libs.mk  | 20 ++++++++++++++++

We normally do separate patches for separate package additions. So a
first patch for on2-8170-libs, and then a second patch with the
gst-plugin.

> diff --git a/package/multimedia/gst-plugin-x170/gst-plugin-x170.mk b/package/multimedia/gst-plugin-x170/gst-plugin-x170.mk
> new file mode 100644
> index 0000000..e1c42ef
> --- /dev/null
> +++ b/package/multimedia/gst-plugin-x170/gst-plugin-x170.mk
> @@ -0,0 +1,14 @@
> +#############################################################
> +#
> +# gst-plugins-x170
> +#
> +#############################################################

On empty new line between header and variables please.

> +GST_PLUGIN_X170_VERSION = 1.0
> +GST_PLUGIN_X170_SITE = ftp://ftp.linux4sam.org/pub/demo/linux4sam_1.9/codec/

You should add _LICENSE and _LICENSE_FILES variables as well.

> diff --git a/package/multimedia/on2-8170-libs/Config.in b/package/multimedia/on2-8170-libs/Config.in
> new file mode 100644
> index 0000000..d5d1a58
> --- /dev/null
> +++ b/package/multimedia/on2-8170-libs/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_ON2_8170_LIBS
> +	depends on BR2_arm926t
> +	bool "on2-8170-libs"
> +	help
> +	  Libraries for Hantro X170 video decoder
> +
> +	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SAM9M10Gstreamer

As was pointed out in a previous review, this package contains
pre-built library. And they can only work with glibc:

$ readelf -d libdwlx170.so | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libc.so.6]

This means that whenever something will try to load libdwlx170.so, it
will try to find libc.so.6, which is glibc.

So your package should have something like:

	depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
		BR2_TOOLCHAIN_CTNG_eglibc || \
		BR2_TOOLCHAIN_CTNG_glibc

with a comment above that explains why.

> diff --git a/package/multimedia/on2-8170-libs/on2-8170-libs.mk b/package/multimedia/on2-8170-libs/on2-8170-libs.mk
> new file mode 100644
> index 0000000..160b2d9
> --- /dev/null
> +++ b/package/multimedia/on2-8170-libs/on2-8170-libs.mk
> @@ -0,0 +1,20 @@
> +#############################################################
> +#
> +# on2-8170-libs
> +#
> +#############################################################

Missing empty line.

> +ON2_8170_LIBS_VERSION = 1.0
> +ON2_8170_LIBS_SITE = ftp://ftp.linux4sam.org/pub/demo/linux4sam_1.9/codec/

_LICENSE and _LICENSE_FILES.

> +
> +ON2_8170_LIBS_INSTALL_STAGING = YES
> +
> +define ON2_8170_LIBS_INSTALL_STAGING_CMDS
> +	cp -dpf $(@D)/*.a $(@D)/*.so $(STAGING_DIR)/usr/lib
> +	cp -dpf $(@D)/*.h $(STAGING_DIR)/usr/include
> +endef
> +
> +define ON2_8170_LIBS_INSTALL_TARGET_CMDS
> +	cp -dpf $(@D)/*.so $(TARGET_DIR)/usr/lib
> +endef
> +
> +$(eval $(generic-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
