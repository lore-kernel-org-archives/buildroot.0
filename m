From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jul 2015 14:09:49 +0200
Subject: [Buildroot] [PATCH v2] minidlna: fix static link
In-Reply-To: <1436436004-21802-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1436436004-21802-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150709140949.379f15fe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 9 Jul 2015 12:00:04 +0200, Vicente Olivert Riera wrote:
> minidlna needs to be linked with -lintl when gettext is needed (with
> locales), and also needs to be linked with -lvorbis, -lvorbisenc and
> -lswresample, otherwise it will cause link failures with lots of
> undefined references:
> 
> /br/output/build/libexif-0.6.21/libexif/exif-data.c:1197:
> undefined reference to `libintl_dgettext'
> 
> /br/output/build/ffmpeg-2.6.2/libavcodec/libvorbisenc.c:311:
> undefined reference to `vorbis_analysis'
> 
> /br/output/build/ffmpeg-2.6.2/libavcodec/libvorbisenc.c:113:
> undefined reference to `vorbis_encode_ctl'
> 
> /br/output/build/ffmpeg-2.6.2/libavcodec/opusdec.c:374:
> undefined reference to `swr_is_initialized'
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> v1 -> v2: remove unnecessary -lexif
> 
>  package/minidlna/minidlna.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
> index 7adb832..37543d6 100644
> --- a/package/minidlna/minidlna.mk
> +++ b/package/minidlna/minidlna.mk
> @@ -17,8 +17,13 @@ MINIDLNA_DEPENDENCIES = \
>  ifeq ($(BR2_STATIC_LIBS),y)
>  # the configure script / Makefile forgets to link with some of the dependent
>  # libraries breaking static linking, so help it along
> +ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
>  MINIDLNA_CONF_ENV = \
> -	LIBS='-lavformat -lavcodec -lavutil -logg -lz -lpthread -lm'
> +	LIBS='-lavformat -lavcodec -lavutil -logg -lvorbis -lvorbisenc -lswresample -lz -lpthread -lm -lintl'
> +else
> +MINIDLNA_CONF_ENV = \
> +	LIBS='-lavformat -lavcodec -lavutil -logg -lvorbis -lvorbisenc -lswresample -lz -lpthread -lm'
> +endif

Sorry, but this is really getting ridiculous. Please use pkg-config to
find at least some of these dependencies and avoid such conditions in
Buildroot .mk files.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
