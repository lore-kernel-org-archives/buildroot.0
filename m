From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 Jul 2015 23:11:13 +0200
Subject: [Buildroot] [PATCH v2] qt: add gst-plugins-base dependency to
 multimedia module
In-Reply-To: <1410743846-30779-1-git-send-email-danomimanchego123@gmail.com>
References: <1410743846-30779-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <55A2D7F1.70301@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Danomi,

 [We're cleaning up patchwork, hence this reply to an ancient patch.]

On 09/15/14 03:17, Danomi Manchego wrote:
> The Qt Multimedia module requires libs and h-files installed
> by gst-plugins-base.  This commit adds the depends-on gstreamer
> and select gst-plugins-base, exactly like the existing logic
> in the Qt Phonon module.
> 
> Fixes: http://autobuild.buildroot.net/results/389617c7c36dfe92b85d3a3db12a706ae092c73d/
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

 I tried the defconfig of that autobuild failure on current master and it didn't
fail anymore with Qt 4.8.7. We also don't see any autobuild failures on 4.8.7
that are related to this (but admittedly, there also aren't that many on 4.8.6
that failed for this reason).

 I thought for a moment that the problem only occured when gstreamer was
selected and gst-plugins-base was not, but even that doesn't make a difference.

 So I've marked this patch as rejected in patchwork. If you think it is still
relevant, please resubmit (with an updated commit log; the contents are good).

 Regards,
 Arnout


> 
> ---
> 
> Changes v1 -> v2:
> - Moved deps from install-libs area to the config-opts area, to match
>   the other Qt module deps.
> ---
>  package/qt/Config.in | 5 +++++
>  package/qt/qt.mk     | 1 +
>  2 files changed, 6 insertions(+)
> 
> diff --git a/package/qt/Config.in b/package/qt/Config.in
> index da159b4..f824914 100644
> --- a/package/qt/Config.in
> +++ b/package/qt/Config.in
> @@ -336,9 +336,14 @@ config BR2_PACKAGE_QT_XMLPATTERNS
>  config BR2_PACKAGE_QT_MULTIMEDIA
>  	bool "Multimedia Module"
>  	depends on BR2_PACKAGE_QT_GUI_MODULE
> +	depends on BR2_PACKAGE_GSTREAMER
> +	select BR2_PACKAGE_GST_PLUGINS_BASE
>  	help
>  	  Build QtMultimedia module.
>  
> +comment "Multimedia module needs gstreamer and gui support"
> +	depends on !(BR2_PACKAGE_GSTREAMER && BR2_PACKAGE_QT_GUI_MODULE)
> +
>  config BR2_PACKAGE_QT_AUDIO_BACKEND
>  	bool "QtMultimedia Audio backend"
>  	depends on BR2_PACKAGE_QT_MULTIMEDIA
> diff --git a/package/qt/qt.mk b/package/qt/qt.mk
> index 92a090f..6cff658 100644
> --- a/package/qt/qt.mk
> +++ b/package/qt/qt.mk
> @@ -374,6 +374,7 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_QT_MULTIMEDIA),y)
>  QT_CONFIGURE_OPTS += -multimedia
> +QT_DEPENDENCIES   += gstreamer gst-plugins-base
>  else
>  QT_CONFIGURE_OPTS += -no-multimedia
>  endif
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
