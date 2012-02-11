From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Feb 2012 17:05:26 +0100
Subject: [Buildroot] [PATCH 2/3] gst-plugins-base: add option to select
	'alsa'
In-Reply-To: <1328918676-19482-3-git-send-email-felipe.contreras@gmail.com>
References: <1328918676-19482-1-git-send-email-felipe.contreras@gmail.com>
 <1328918676-19482-3-git-send-email-felipe.contreras@gmail.com>
Message-ID: <201202111705.26348.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 11 February 2012 01:04:35 Felipe Contreras wrote:
> It's nice to go straight to GStreamer, and enable all the plug-in
> elements without having to go back through the menus to select the
> dependencies.
> 
> Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
> ---
>  package/multimedia/gst-plugins-base/Config.in |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)
> 
> diff --git a/package/multimedia/gst-plugins-base/Config.in b/package/multimedia/gst-plugins-base/Config.in
> index 851337b..a1fa0f1 100644
> --- a/package/multimedia/gst-plugins-base/Config.in
> +++ b/package/multimedia/gst-plugins-base/Config.in
> @@ -94,5 +94,10 @@ config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VORBIS
>  	bool "vorbis (*.ogg audio)"
>  	select BR2_PACKAGE_LIBVORBIS
>  
> -endif
> +config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ALSA
> +	bool "alsa"
> +	select BR2_PACKAGE_ALSA_LIB
> +	select BR2_PACKAGE_ALSA_LIB_MIXER
> +	select BR2_PACKAGE_ALSA_LIB_PCM
>  
> +endif

 Keep the config options ordered alphabetically, so put it before OGG.

 Also, if the option exists, it should be used in the mk-file.  So add:

ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ALSA),y)
GST_PLUGINS_BASE_CONF_OPT += --enable-alsa
else
GST_PLUGINS_BASE_CONF_OPT += --disable-alsa
endif

(again alphabetically).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
