From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Thu, 22 Jan 2009 10:09:18 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/gst-plugins-good
In-Reply-To: <20090121133322.0FFA4770FC@busybox.osuosl.org>
References: <20090121133322.0FFA4770FC@busybox.osuosl.org>
Message-ID: <200901221009.18267.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

laird at uclibc.org, 21.01.2009:
> Author: laird
> Date: 2009-01-21 13:33:21 +0000 (Wed, 21 Jan 2009)
> New Revision: 24937
> 
> Log:
> package/multimedia/gst-plugins-good/gst-plugins-good.mk
> package/multimedia/gst-plugins-good/Config.in
> 
> gst-plugins-good does not build unless some package dependencies are forced.
> This patch allows you to turn off some of the plugins with these dependencies and hides
> others that require some packages (like PNG/JPEG)
> 
> Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>
> 
> 
> 
> Modified:
>    trunk/buildroot/package/multimedia/gst-plugins-good/Config.in
>    trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk
> 
> 
> Changeset:
> Modified: trunk/buildroot/package/multimedia/gst-plugins-good/Config.in
> ===================================================================
> --- trunk/buildroot/package/multimedia/gst-plugins-good/Config.in	2009-01-21 07:09:41 UTC (rev 24936)
> +++ trunk/buildroot/package/multimedia/gst-plugins-good/Config.in	2009-01-21 13:33:21 UTC (rev 24937)
> @@ -72,6 +72,7 @@
>  
>  config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MATROSKA
>  	bool "matroska"
> +	depends on BR2_PACKAGE_BZIP2 && BR2_PACKAGE_ZLIB
>  
>  config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MONOSCOPE
>  	bool "monoscope"

This plugin is listed at the dependency-less plugins, so it should not
need to depend on any external library. Looking at
gst/matroska/matroska-demux.c, I can see that it is an optional
dependency with #ifdef HAVE_ZLIB and #ifdef HAVE_BZ2.

There are the --disable-zlib and --disable-bz2 configure options,
probably these should be used? I'll send a patch.

> @@ -119,4 +120,25 @@
>  	bool "wavparse (*.wav audio)"
>  	default y
>  
> +comment "plugins with external dependencies (more to come)"
> +
> +config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ANNODEX
> +	bool "annodex (XML Library)"
> +	default y

This is listed at the plugins with external dependencies. Looking at
Gentoo's ebuild, libxml2 is required. So there should be a "select
BR2_PACKAGE_LIBXML2" and and additional entry in the .mk file.

But why "default y"? In the initial patch, I just enabled the plugins
(all were dependency-less), that were mandatory for audio and video
playback. I think this should be kept.

> +config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ESD
> +	bool "esdsink (ESounD sound daemon)"

Also missing dependency. But I guess you put this here because it was
selected during configure. But since esd is not available in Buildroot,
it can be disabled completely.

> +config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_JPEG
> +	bool "jpeg (JPEG support)"
> +	depends on BR2_PACKAGE_JPEG
> +	default y

Again, I'd suggest to remove "default y". And as this is not a plugin, I
would not put it into the "external plugins" section, but at the top.

> +config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS
> +	bool "ossaudio (OSS audio)"

Same as esdsink.

> +config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PNG
> +	bool "png (PNG support)"
> +	depends on BR2_PACKAGE_LIBPNG
> +	default y
>  endif

Same as jpeg, please remove "default y" and put it at the top of
Config.in.

Markus
