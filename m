From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Aug 2019 14:50:08 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/ghostscript: fix static
 build errors
In-Reply-To: <20190818101406.6574-1-bernd.kuhls@t-online.de>
References: <20190818101406.6574-1-bernd.kuhls@t-online.de>
Message-ID: <20190819145008.7fb17234@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

Thanks for coming up with this new version. See for some questions
below.

On Sun, 18 Aug 2019 12:14:05 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> diff --git a/package/ghostscript/0003-pkgconf-libs-only.patch b/package/ghostscript/0003-pkgconf-libs-only.patch
> new file mode 100644
> index 0000000000..8518c3b1f1
> --- /dev/null
> +++ b/package/ghostscript/0003-pkgconf-libs-only.patch
> @@ -0,0 +1,28 @@
> +fix build with pkg-config enabled

This commit description is too short. What is happening exactly ?

> +
> +Patch sent upstream:
> +https://bugs.ghostscript.com/show_bug.cgi?id=701440
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +
> +diff -uNr ghostscript-9.27.old/configure.ac ghostscript-9.27/configure.ac
> +--- ghostscript-9.27.old/configure.ac	2019-04-04 09:43:14.000000000 +0200
> ++++ ghostscript-9.27/configure.ac	2019-08-18 11:32:50.163910476 +0200
> +@@ -853,7 +853,7 @@
> +                 if $PKGCONFIG --exists fontconfig; then
> +                         AC_MSG_RESULT(yes)
> +                         FONTCONFIG_CFLAGS="$CFLAGS `$PKGCONFIG --cflags fontconfig`"
> +-                        FONTCONFIG_LIBS="`$PKGCONFIG --libs fontconfig`"
> ++                        FONTCONFIG_LIBS="`$PKGCONFIG --libs-only-l fontconfig`"

There are plenty of other places besides those two fontconfig/freetype
cases where PKGCONFIG --libs gets used. Why aren't these other places
also a problem ? What is the actual problem ?

Using --libs-only-l is potentially wrong, as it could be missing some
important flags needed at link time.

>  GHOSTSCRIPT_CONF_ENV = \
> +	BUILD_PKGCONFIG=/bin/false \

A comment here above this would be useful, as it's kind of tricky to
understand why we're passing /bin/false here.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
