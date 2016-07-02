From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 02 Jul 2016 16:08:01 +0200
Subject: [Buildroot] [PATCH v4 4/7] package/ffmpeg: default to
	--cpu=generic for MIPS architecture
In-Reply-To: <1467466339-19422-4-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sat, 2 Jul 2016 15:32:16 +0200")
References: <1467466339-19422-1-git-send-email-bernd.kuhls@t-online.de>
 <1467466339-19422-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87furs6sla.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > This option is needed to prevent this message from configure:

 > WARNING: unknown CPU. Disabling all MIPS optimizations.

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > v4: no changes
 > v3: no changes
 > v2: no changes

 >  package/ffmpeg/ffmpeg.mk | 5 +++++
 >  1 file changed, 5 insertions(+)

 > diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
 > index 08914b8..418893f 100644
 > --- a/package/ffmpeg/ffmpeg.mk
 > +++ b/package/ffmpeg/ffmpeg.mk
 > @@ -445,6 +445,11 @@ else ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
 >  FFMPEG_CONF_OPTS += --cpu=$(BR2_GCC_TARGET_ARCH)
 >  endif
 
 > +# Default to --cpu=generic for MIPS architecture
 > +ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
 > +FFMPEG_CONF_OPTS += --cpu=generic
 > +endif

This is not really about "defaulting" to it, as the logic really
enforces it. From looking at the upstream configure script passing this
means that we explicitly need to pass --enable/--disable for the MIPS
sub options:

https://github.com/FFmpeg/FFmpeg/blob/master/configure#L4406

> +
 >  FFMPEG_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
 
 >  # Override FFMPEG_CONFIGURE_CMDS: FFmpeg does not support --target and others
 > -- 
 > 2.8.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
