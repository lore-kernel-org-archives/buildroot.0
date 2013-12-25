From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 10:07:15 +0100
Subject: [Buildroot] [PATCH] ffmpeg: fix build for xtensa
In-Reply-To: <dbffcc9384caa8009093e59944182ddfaafbdb5c.1387910266.git.baruch@tkos.co.il>
References: <dbffcc9384caa8009093e59944182ddfaafbdb5c.1387910266.git.baruch@tkos.co.il>
Message-ID: <20131225100715.6473dee2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue, 24 Dec 2013 20:37:46 +0200, Baruch Siach wrote:
> The ffmpeg package generates libraries that are too large for the xtensa
> default placement of literals in a dedicated section. Use
> -mtext-section-literal to place literals in the text section.
> 
> Fixes
> http://autobuild.buildroot.net/results/606/60670d35f16c3b8fe19debf7f8e40a046a579520/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/ffmpeg/ffmpeg.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index 6685110..11703e3 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -21,6 +21,10 @@ FFMPEG_CONF_OPT = \
>  	--disable-avfilter	\
>  	$(if $(BR2_HAVE_DOCUMENTATION),,--disable-doc)
>  
> +ifeq ($(BR2_xtensa),y)
> +FFMPEG_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mtext-section-literals"
> +endif

Thanks, but to prevent future mistakes, could you provide a slightly
different version that does:

FFMPEG_CFLAGS = $(TARGET_CFLAGS)

ifeq ($(BR2_xtensa),y)
FFMPEG_CFLAGS += -mtext-section-literals
endif

FFMPEG_CONF_ENV = CFLAGS="$(FFMPEG_CFLAGS)"

This is a little bit better than your version in that we can add things
to CFLAGS in other places in ffmpeg.mk.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
