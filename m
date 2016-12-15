From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Dec 2016 21:47:57 +0100
Subject: [Buildroot] [PATCH 1/1] gst1-vaapi: new package
In-Reply-To: <1481813631-23515-1-git-send-email-jbb@gamblify.com>
References: <1481813631-23515-1-git-send-email-jbb@gamblify.com>
Message-ID: <20161215214757.0eb1f3d8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this contribution!

On Thu, 15 Dec 2016 15:53:51 +0100, Jesper B?kdahl wrote:
> --- /dev/null
> +++ b/package/gstreamer1/gst1-vaapi/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_GST1_VAAPI
> +	bool "gst1-vaapi"
> +	select BR2_PACKAGE_GST1_PLUGINS_BASE
> +	select BR2_PACKAGE_GST1_PLUGINS_BAD

Are you sure you need those set of plugins to be built to build the
gst1-vaapi plugin? I'm not too familiar with GStreamer, so maybe this
is correct, but it looks strange.

> +	select BR2_PACKAGE_GST1_PLUGINS_LIBVA
> +	select BR2_PACKAGE_GST1_PLUGINS_LIBDRM

These two lines however are clearly wrong: those symbols don't exist in
Buildroot. And your .mk file has a dependency on libva and libdrm
instead. So these should be:

	select BR2_PACKAGE_LIBVA
	select BR2_PACKAGE_LIBDRM

However, you need to inherit the dependencies of those packages:

        depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm/libpthread-stubs
        depends on !BR2_STATIC_LIBS

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
