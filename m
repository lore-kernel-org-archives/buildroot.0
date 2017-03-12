From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 21:52:00 +0100
Subject: [Buildroot] [PATCH 1/2] gst1-vaapi: new package.
In-Reply-To: <20170201131854.3046-1-Adamduskett@outlook.com>
References: <20170201131854.3046-1-Adamduskett@outlook.com>
Message-ID: <20170312215200.45ee99c3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Feb 2017 08:18:53 -0500, Adam Duskett wrote:
> gstreamer-vaapi consists in a collection of VA-API based plugins for
> GStreamer and helper libraries.  These libraries are used for hardware
> decoding and encoding of several video formats.
> 
> decoding formats:
> JPEG, MPEG-2, MPEG-4:2, H.264 AVC, H.264 MVC, VP8, VC-1, WMV3, and HEVC.
> 
> encoding formats:
> MPEG-2, H.264 AVC, H.264 MVC, JPEG, VP8, HEVC
> 
> The package won't compile without at least one renderer enabled, so I
> chose to enable DRM by default, as X11, GLX, and wayland are heavy
> handed with the dependencies.  As such, I have disabled every option
> defaulting to yes except for DRM for the first patch.
> 
> Also, these codecs are only for x86 and require a Intel CPU (See Hardware
> Requirements on line 82 of the README file.)
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>

I've applied your patch, but after doing a number of fixes. The most
important one is that your package was not building with the uClibc C
library. uClibc is our default C library, so developers should *always*
build test their packages with this C library before submitting patches.

So, next time, please the test-pkg script to build test your package
properly. Submitting something that doesn't even build with Buildroot
default configuration is not nice at all.

> diff --git a/package/gstreamer1/gst1-vaapi/Config.in b/package/gstreamer1/gst1-vaapi/Config.in
> new file mode 100644
> index 0000000..44461e3
> --- /dev/null
> +++ b/package/gstreamer1/gst1-vaapi/Config.in
> @@ -0,0 +1,39 @@
> +config BR2_PACKAGE_GST1_VAAPI
> +	bool "gst1-vaapi"
> +	select BR2_PACKAGE_LIBVA
> +	select BR2_PACKAGE_LIBDRM
> +	select BR2_PACKAGE_GST1_PLUGINS_BASE
> +	select BR2_PACKAGE_GST1_PLUGINS_BAD # gstreamer-codecparsers

Your Config.in comment mentioned the udev and thread dependency, but
I don't see them anywhere here... so I've added them.

> +	depends on BR2_i386 || BR2_x86_64 # Only relevant for x86

I don't really see why in fact. I've seen the README file, but I don't
quite understand VA-API is a generic API, it can be used on other
platforms than x86. And it builds fine on ARM, so for now, I've removed
this.

> +comment "gst1-vaapi needs udev /dev management and a toolchain w/ threads, dynamic library"
> +	depends on BR2_i386 || BR2_x86_64

And removed this line.

> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
> +	!BR2_PACKAGE_HAS_UDEV

This last line should have been intended with one more tab.

Also, you missed adding yourself to the DEVELOPERS file, so I've done
that as well. Finally, there were some trailing tabs, and spaces
instead of tabs in the Config.in file.

All in all, the list of changes:

    [Thomas:
     - Add entry to DEVELOPERS file.
     - Add BR2_TOOLCHAIN_HAS_THREADS dependency to the main Config.in
       option.
     - Add BR2_PACKAGE_HAS_UDEV dependency to the main Config.in option.
     - Add comments about the BR2_STATIC_LIBS config option.
     - Rewrap Config.in help text and removing trailing tabs/spaces.
     - Remove restriction to i386/x86-64
     - Add patch to fix build with uClibc.]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
