From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 23:33:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/minidlna: More fixes to static
 compile
In-Reply-To: <1438203871-8548-1-git-send-email-bernd.kuhls@t-online.de>
References: <1438203871-8548-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150730233348.2aad245e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Wed, 29 Jul 2015 23:04:31 +0200, Bernd Kuhls wrote:

> diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
> index ab93484..2f75993 100644
> --- a/package/minidlna/minidlna.mk
> +++ b/package/minidlna/minidlna.mk
> @@ -17,9 +17,9 @@ MINIDLNA_DEPENDENCIES = \
>  ifeq ($(BR2_STATIC_LIBS),y)
>  # the configure script / Makefile forgets to link with some of the dependent
>  # libraries breaking static linking, so help it along
> -MINIDLNA_STATIC_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs libavcodec libexif libvorbis`
> +MINIDLNA_STATIC_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs libavcodec libexif vorbis sqlite3`
>  MINIDLNA_STATIC_LIBS += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)
> -MINIDLNA_CONF_ENV += LIBS="$(MINIDLNA_STATIC_LIBS)"
> +MINIDLNA_CONF_ENV += LIBS="$(MINIDLNA_STATIC_LIBS) -lm -lz"

Would it be possible to stop hacking this to death? What about instead
taking the saner approach of switching minidlna configure.ac to use
PKG_CHECK_MODULES(), which will remove a lot of crap from it, and make
it work properly for cross-compilation.

Some libraries, such as libid3tag, would also need to install a .pc
file, obviously.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
