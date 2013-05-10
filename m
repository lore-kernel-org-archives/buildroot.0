From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 May 2013 01:38:47 +0200
Subject: [Buildroot] [PATCH v3 1/7] gstreamer1: Add gstreamer version
 1.0.7 package
In-Reply-To: <1368158558-6069-2-git-send-email-spenser@gillilanding.com>
References: <1368158558-6069-1-git-send-email-spenser@gillilanding.com>
 <1368158558-6069-2-git-send-email-spenser@gillilanding.com>
Message-ID: <518D8507.3060909@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Spenser,

  Very quick first review...

  First of all, a comment that is not so much directed at you but at the 
rest of the BR developers: the naming issue.

  We have a tendency to make a copy of a package when there is a major 
version change, cfr. python3 and qt5. However, in this case, I don't 
think it's a good idea. At this time, many (most?) gstreamer downstreams 
have already moved to 1.x. Also, no more patches will be made the the 
0.10 series (though distro's may still make patches). So we can expect 
the old gstreamer stuff to die out relatively quickly. But if we call the 
new thing gstreamer1 now, we're essentially stuck with that name for all 
eternity.

  So instead I'd try to make 0.10 or 1.0 a choice in the gstreamer 
package itself.  For me it's fine if inside the Config.in and the .mk 
files we basically have the two versions in a big ifeq() construct, but 
at least we can keep on using the BR2_PACKAGE_GST* symbols.

  Obviously, there will be some packages that break down when gstreamer 
1.0 is used, but we'll have to discover that at some point anyway.


On 10/05/13 06:02, Spenser Gilliland wrote:
> This patch adds the gstreamer version 1.x series to buildroot.
>
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
>   package/multimedia/Config.in                |    1 +
>   package/multimedia/gstreamer1/Config.in     |   37 +++++++++++++++++++++++++++
>   package/multimedia/gstreamer1/gstreamer1.mk |   36 ++++++++++++++++++++++++++
>   3 files changed, 74 insertions(+)
>   create mode 100644 package/multimedia/gstreamer1/Config.in
>   create mode 100644 package/multimedia/gstreamer1/gstreamer1.mk
>
> diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
> index 931e6d3..f6a5fd7 100644
> --- a/package/multimedia/Config.in
> +++ b/package/multimedia/Config.in
> @@ -6,6 +6,7 @@ source "package/multimedia/faad2/Config.in"
>   source "package/multimedia/flac/Config.in"
>   source "package/multimedia/ffmpeg/Config.in"
>   source "package/multimedia/gstreamer/Config.in"
> +source "package/multimedia/gstreamer1/Config.in"
>   source "package/multimedia/gst-ffmpeg/Config.in"
>   source "package/multimedia/gst-dsp/Config.in"
>   source "package/multimedia/gst-fsl-plugins/Config.in"
> diff --git a/package/multimedia/gstreamer1/Config.in b/package/multimedia/gstreamer1/Config.in
> new file mode 100644
> index 0000000..b1fd8b1
> --- /dev/null
> +++ b/package/multimedia/gstreamer1/Config.in
> @@ -0,0 +1,37 @@
> +config BR2_PACKAGE_GSTREAMER1
> +	bool "gstreamer1"
> +	depends on BR2_USE_WCHAR # glib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_LIBGLIB2
> +	help
> +	  GStreamer is an open source multimedia framework.
> +
> +	  http://gstreamer.freedesktop.org/
> +
> +config BR2_PACKAGE_GSTREAMER1_GST_DEBUG
> +	bool "enable gst-debug trace support"
> +	default y
> +	depends on BR2_PACKAGE_GSTREAMER1

  We nowadays prefer to put sub-options inside an if...endif construct 
instead of with 'depends on'.


  Regards,
  Arnout

> +	help
> +	  Enable support for the gst-debug tracing functionality in gstreamer.
> +	  This has limited CPU overhead, but does increase the rootfs size
> +	  somewhat.
> +
> +config BR2_PACKAGE_GSTREAMER1_PLUGIN_REGISTRY
> +	bool "enable plugin registry"
> +	default y
> +	depends on BR2_PACKAGE_GSTREAMER1
> +	help
> +	  Enable support for the GStreamer plugin registry. This may increase
> +	  the launch-time for a GStreamer application.
> +
> +config BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS
> +	bool "install gst-launch gst-inspect"
> +	default y
> +	depends on BR2_PACKAGE_GSTREAMER1
> +	help
> +	  Install the gst-launch and gst-inspect tools. This will take up
> +	  additional space on the target
> +
> +comment "gstreamer requires a toolchain with WCHAR and threads support"
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
