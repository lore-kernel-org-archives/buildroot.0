From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 18 Mar 2012 17:15:27 +0100
Subject: [Buildroot] [PATCHv4] vlc: New package
In-Reply-To: <1331746290-30643-1-git-send-email-ismael.luceno@gmail.com>
References: <1331746290-30643-1-git-send-email-ismael.luceno@gmail.com>
Message-ID: <201203181715.28279.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 14 March 2012 18:31:30 Ismael Luceno wrote:
[snip]
> +VLC_CONF_OPTS += --disable-rpath --enable-run-as-root

 Have you tested this yourself?  It should be VLC_CONF_OPT...

[snip]
> +ifeq ($(BR2_PACKAGE_AVCODEC),y)
 This should be BR2_PACKAGE_VLC_AVCODEC.

> +VLC_DEPENDENCIES += ffmpeg
> +VLC_CONF_OPTS += --enable-avcodec --enable-avformat
> +VLC_CONF_OPTS += --$(if $(BR2_PACKAGE_VLC_POSTPROC),en,dis)able-postproc
> +VLC_CONF_OPTS += --$(if $(BR2_PACKAGE_VLC_SWSCALE),en,dis)able-swscale
> +else
> +VLC_CONF_OPTS += --disable-avcodec --disable-avformat
 And here you should add --disable-postproc --disable-swscale

> +endif

[snip]
> +ifeq ($(BR2_PACKAGE_VLC_V4L2),y)
> +VLC_DEPENDENCIES += libv4l
> +VLC_CONF_OPTS += --enable-libv4l2
> +else
> +VLC_CONF_OPTS += --disable-libv4l2
> +endif
 This should be en/disable-v4l2 (without the lib).

[snip]


 Also, during the config, I see quite a few lines like this:
configure: WARNING: Library jack needed for jack was not found

 This isn't really a problem at the moment for libraries that are not
included in buildroot, like jack (and I guess none of the others are
included).  But if any of these are ever included in buildroot, they
will make the build of vlc unpredictable - if jack is built first, vlc
will be built with jack support, but if vlc is built first it will be
without jack support.

 So ideally, everything which isn't supported should be --disable'd.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
