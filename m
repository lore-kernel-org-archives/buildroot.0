From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Wed, 12 Aug 2015 08:49:51 +0200
Subject: [Buildroot] [PATCH] minidlna: fix static linking
In-Reply-To: <20150812043257.GA13454@waldemar-brodkorb.de>
References: <20150812043257.GA13454@waldemar-brodkorb.de>
Message-ID: <1439362191.22945.8.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar,

On Mi, 2015-08-12 at 06:32 +0200, Waldemar Brodkorb wrote:
> As libid3tag uses compress, -lz must be linked in, as no pkconfig
> file exist.
> The name of the vorbis pkgconfig file is vorbis.pc.
> We also need to add sqlite in pkgconfig call.
> 
> This fixes following autobuilder compile error:
> http://autobuild.buildroot.net/results/f538ad6673b711492acd727d623d0c
> c2de626f16/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/minidlna/minidlna.mk |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/minidlna/minidlna.mk
> b/package/minidlna/minidlna.mk
> index ab93484..385c8df 100644
> --- a/package/minidlna/minidlna.mk
> +++ b/package/minidlna/minidlna.mk
> @@ -17,8 +17,9 @@ MINIDLNA_DEPENDENCIES = \
>  ifeq ($(BR2_STATIC_LIBS),y)
>  # the configure script / Makefile forgets to link with some of the
> dependent
>  # libraries breaking static linking, so help it along
> -MINIDLNA_STATIC_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs libavcodec
> libexif libvorbis`
> +MINIDLNA_STATIC_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs libavcodec
> libexif vorbis sqlite3`
>  MINIDLNA_STATIC_LIBS += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)
> +MINIDLNA_STATIC_LIBS += -lz
>  MINIDLNA_CONF_ENV += LIBS="$(MINIDLNA_STATIC_LIBS)"
>  else
>  MINIDLNA_CONF_OPTS = \

This is an almost identical patch to what Bernd Kuhls sent two weeks
ago [1]. Are there any updates for this patch?

Best regards
J?rg Krause

[1] http://patchwork.ozlabs.org/patch/501844/
