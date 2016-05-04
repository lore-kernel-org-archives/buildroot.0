From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 4 May 2016 21:51:25 +0200
Subject: [Buildroot] How to enable rtmp support in gst1-plugins-bad?
In-Reply-To: <CAPeTicPX80UHtZHFESZ+mPs54Opvq0t0cyetPnx83py7ouDRvA@mail.gmail.com>
References: <CAPeTicPX80UHtZHFESZ+mPs54Opvq0t0cyetPnx83py7ouDRvA@mail.gmail.com>
Message-ID: <470fe675-7468-d86f-c7a8-3aa5cceefd5a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/04/16 13:01, sonntex wrote:
> I remade patch using git format-patch. Gustavo, is it what do you want?

  As explained in the manual, you should also send it with git send-email, to 
avoid whitespace corruption.

>
> From f03e8de9b664f4aec27c1412de6aea6be80288b7 Mon Sep 17 00:00:00 2001
> From: Nikolay Beloborodov <sonntex at gmail.com <mailto:sonntex@gmail.com>>
> Date: Wed, 4 May 2016 17:39:21 +0300
> Subject: gst1-plugins-bad: add rtmp support
>

  Add a Signed-off-by line for yourself.  This is a short way for you to
assert that you are entitled to contribute the patch under buildroot's
GPL license.  See  http://elinux.org/Developer_Certificate_Of_Origin
for more details.

> ---
>  package/gstreamer1/gst1-plugins-bad/Config.in           | 4 ++--
>  package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> <http://gst1-plugins-bad.mk> | 7 ++++---
>  2 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in
> b/package/gstreamer1/gst1-plugins-bad/Config.in
> index a9667af..afbe2bf 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -382,8 +382,8 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REMOVESILENCE
>         help
>           Removes silence from an audio stream
>
> -config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTP
> -       bool "rtp"
> +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTMP
> +       bool "rtmp"

  In addition, you should add an entry to Config.in.legacy that signals the 
removal of the RTP plugin. Something like:

config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTP
	bool "gst1-plugins-bad rtp plugin moved to gst1-plugins-good"
	select BR2_LEGACY
	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTP


  Thanks!

  Regards,
  Arnout

>
>  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDI
>         bool "sdi"
> diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> <http://gst1-plugins-bad.mk>
> b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> <http://gst1-plugins-bad.mk>
> index a92c4a6..30c4999 100644
> --- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> <http://gst1-plugins-bad.mk>
> +++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> <http://gst1-plugins-bad.mk>
> @@ -479,10 +479,11 @@ else
>  GST1_PLUGINS_BAD_CONF_OPTS += --disable-removesilence
>  endif
>
> -ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTP),y)
> -GST1_PLUGINS_BAD_CONF_OPTS += --enable-rtp
> +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTMP),y)
> +GST1_PLUGINS_BAD_CONF_OPTS += --enable-rtmp
> +GST1_PLUGINS_BAD_DEPENDENCIES += rtmpdump
>  else
> -GST1_PLUGINS_BAD_CONF_OPTS += --disable-rtp
> +GST1_PLUGINS_BAD_CONF_OPTS += --disable-rtmp
>  endif
>
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDI),y)


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
