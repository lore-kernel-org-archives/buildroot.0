From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Sep 2016 21:04:25 +0200
Subject: [Buildroot] [PATCH] gst1-imx: add menuconfig to select each
 plugin individually
In-Reply-To: <20160916131038.23240-1-gary.bisson@boundarydevices.com>
References: <20160916131038.23240-1-gary.bisson@boundarydevices.com>
Message-ID: <20160920210425.1ca82f17@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gary,

On Fri, 16 Sep 2016 15:10:38 +0200, Gary Bisson wrote:
> Also making each plugin dependencies clearer with comments.
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  package/gstreamer1/gst1-imx/Config.in   | 89 ++++++++++++++++++++++++++++-----
>  package/gstreamer1/gst1-imx/gst1-imx.mk | 32 ++++++++++++
>  2 files changed, 108 insertions(+), 13 deletions(-)

Thanks for the patch. I have a few questions/comments, see below.


> +config BR2_PACKAGE_GST1_IMX_EGLVISINK
> +	bool "imxeglvivsink"
> +	depends on BR2_PACKAGE_IMX_GPU_VIV
> +	help
> +	  Elements leveraging the 3D GPU

Instead of doing "depends on" everywhere, can we use "select" in the
cases where the dependencies of the package to select are not too
crazy ?

> +ifneq ($(BR2_PACKAGE_GST1_IMX_EGLVISINK),y)
> +GST1_IMX_CONF_OPTS += --disable-eglvivsink
> +endif

For all those options, please use the standard Buildroot way of
expressing dependencies:

ifeq ($(BR2_PACKAGE_FOO),y)
BAZ_CONF_OPTS += --enable-foo
BAZ_DEPENDENCIES += foo
else
BAZ_CONF_OPTS += --disable-foo
endif

i.e:

 1/ Add an explicit --enable-<foo> for each option

 2/ Group the --enable/--disable passing with the addition of the
    dependency

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
