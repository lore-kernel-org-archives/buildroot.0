From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 15:57:30 +0100
Subject: [Buildroot] [PATCH v3 2/2] wine: Add gettext dependency check
 for host-wine
In-Reply-To: <54FC5B41.5050004@dawncrow.de>
References: <54FC5B41.5050004@dawncrow.de>
Message-ID: <20150308155730.11c74ecc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Hentschel,

On Sun, 08 Mar 2015 15:22:57 +0100, Andr? Hentschel wrote:

> +# selecting gettext also enables host-gettext which is
> +# essential for .po file support in wrc from host-wine
> +ifeq ($(BR2_PACKAGE_GETTEXT),y)
> +HOST_WINE_CONF_OPTS += --with-gettext --with-gettextpo
> +HOST_WINE_DEPENDENCIES += host-gettext
> +else
> +HOST_WINE_CONF_OPTS += --without-gettext --without-gettextpo
> +endif

I'm sorry but this still doesn't make sense.

BR2_PACKAGE_GETTEXT=y indicates that the gettext package is built for
the *target*, i.e it installs stuff in $(TARGET_DIR) and
$(STAGING_DIR), most notably the libintl library.

So, using BR2_PACKAGE_GETTEXT=y as an indication to know whether
gettext support is available for a *host* package (which looks only in
$(HOST_DIR)) does not make sense.

What are you trying to do here?

If you're trying to have optional gettext support for the target Wine,
then what you need is:

+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+WINE_CONF_OPTS += --with-gettext --with-gettextpo
+WINE_DEPENDENCIES += host-gettext
+else
+WINE_CONF_OPTS += --without-gettext --without-gettextpo
+endif

and of course, remove the unconditional --without-gettext
--without-gettextpo from WINE_CONF_OPTS.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
