From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2014 22:58:12 +0100
Subject: [Buildroot] [PATCH v3 7/7] package/tvheadend: Add transcoding
 support by ffmpeg
In-Reply-To: <XnsA3D546EC787EEberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1413311309-30811-1-git-send-email-bernd.kuhls@t-online.de>
 <1413311309-30811-7-git-send-email-bernd.kuhls@t-online.de>
 <20141028221104.35a56dd4@free-electrons.com>
 <XnsA3D546EC787EEberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20141030225812.166745c6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 29 Oct 2014 06:58:20 +0100, Bernd Kuhls wrote:
> [posted and mailed]
> 
> Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
> @public.gmane.org> wrote in news:20141028221104.35a56dd4 at free-electrons.com:
> 
> >> +      --disable-libffmpeg_static          \
> > 
> > Maybe I haven't looked properly, but I don't see this option supported
> > by tvheadend configure script. Can you check?
> 
> Hi,
> 
> you will find the option here:
> https://github.com/tvheadend/tvheadend/blob/master/configure#L36

Aah, yes, it's there. Presumably I was going at the tvheadend code
prior to the recent bump.

However, it's not clear to me what this option does, and therefore was
is the impact on tvheadend.

Also, the code:

+ifeq ($(BR2_PACKAGE_FFMPEG_AVRESAMPLE)$(BR2_PACKAGE_FFMPEG_SWSCALE),yy)
+TVHEADEND_DEPENDENCIES += ffmpeg
+TVHEADEND_CONF_OPTS += --enable-libav
+else
+TVHEADEND_CONF_OPTS += --disable-libav
+endif

Means that the user needs to know that both the avresample and swscale
suboptions of ffmpeg have to be enabled in order to have ffmpeg support
in tvheadend. Not easy to know. Should we do something like:

	select BR2_PACKAGE_FFMPEG_AVRESAMPLE if BR2_PACKAGE_FFMPEG
	select BR2_PACKAGE_FFMPEG_SWSCALE if BR2_PACKAGE_FFMPEG

in the tvheadend/Config.in file? This way the user would only have to
enable BR2_PACKAGE_FFMPEG to get ffmpeg support in tvheadend. And the
condition could be simplified to just test BR2_PACKAGE_FFMPEG.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
