From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Mar 2014 21:53:42 +0100
Subject: [Buildroot] [PATCH v2] gstreamer1-imx: new package
In-Reply-To: <1393363488-5547-1-git-send-email-ps.report@gmx.net>
References: <1393363488-5547-1-git-send-email-ps.report@gmx.net>
Message-ID: <20140303205342.GF3380@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

I've added Gustavo in Cc: for his hindsights on Waf.

On 2014-02-25 22:24 +0100, Peter Seiderer spake thusly:
> Add gstreamer1-imx package (gstreamer-1.x equivalent to
> gstreamer-0.10/gst-fsl-plugins package).
[--SNIP--]
> diff --git a/package/gstreamer1/gstreamer1-imx/Config.in b/package/gstreamer1/gstreamer1-imx/Config.in
> new file mode 100644
> index 0000000..5753202
> --- /dev/null
> +++ b/package/gstreamer1/gstreamer1-imx/Config.in
> @@ -0,0 +1,21 @@
> +comment "gstreamer1-imx needs an imx-specific Linux kernel to be built"
> +	depends on BR2_arm && !BR2_LINUX_KERNEL
> +
> +config BR2_PACKAGE_GSTREAMER1_IMX
> +	bool "gstreamer1-imx"
> +	depends on BR2_LINUX_KERNEL

This dependency is inherited from imx-lib, so we usually state so like
this:
        depends on BR2_LINUX_KERNEL # imx-lib

> diff --git a/package/gstreamer1/gstreamer1-imx/gstreamer1-imx.mk b/package/gstreamer1/gstreamer1-imx/gstreamer1-imx.mk
> new file mode 100644
> index 0000000..91dab48
> --- /dev/null
> +++ b/package/gstreamer1/gstreamer1-imx/gstreamer1-imx.mk
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# gstreamer1-imx
> +#
> +################################################################################
> +
> +GSTREAMER1_IMX_VERSION = 0.9.3
> +GSTREAMER1_IMX_SITE = $(call github,Freescale,gstreamer-imx,$(GSTREAMER1_IMX_VERSION))
> +
> +GSTREAMER1_IMX_LICENSE = LGPLv2+
> +GSTREAMER1_IMX_LICENSE_FILES = LICENSE

Yes, in case someone wonders, it is indeed the Library GPL, not the
Lesser GPL, so it is indeed LGPLv2+.

> +GSTREAMER1_IMX_DEPENDENCIES = gstreamer1 gst1-plugins-base libfslvpuwrap \

You forgot to add a 'depends on BR2_PACKAGE_LIBFSLVPUWRAP' in the
Config.in.

> +	imx-lib libfslparser libfslcodec
> +
> +# needs access to imx-specific kernel headers
> +GSTREAMER1_IMX_DEPENDENCIES += linux
> +
> +define GSTREAMER1_IMX_CONFIGURE_CMDS
> +	(cd $(@D); \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		./waf configure \
> +		--prefix=/usr \
> +		--kernel-headers=$(LINUX_DIR)/include \
> +	)
> +endef
> +
> +define GSTREAMER1_IMX_BUILD_CMDS
> +       (cd $(@D); ./waf build -j $(PARALLEL_JOBS))

Waf is known to have lotta isue when cross-compiling. Is that really
working correctly?

Fortunately, this is only supposed to ever be run for an ARM target, so
maybe they were not really concerned of making it really cross-compile
friendly, as long as it works in these specific comditions.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
