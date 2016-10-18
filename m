From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Oct 2016 17:25:43 +0200
Subject: [Buildroot] [PATCH 1/1] avahi: link with libintl if libglib2 is
 enabled
In-Reply-To: <1476802403-5879-1-git-send-email-johan.oudinet@gmail.com>
References: <1476802403-5879-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20161018172543.20a693fa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Oct 2016 16:53:23 +0200, Johan Oudinet wrote:

> diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
> index 069b45a..c9cf2bc 100644
> --- a/package/avahi/avahi.mk
> +++ b/package/avahi/avahi.mk
> @@ -168,7 +168,9 @@ endif
>  
>  AVAHI_CONF_ENV += CFLAGS="$(AVAHI_CFLAGS)"
>  
> -AVAHI_MAKE_OPTS += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),LIBS=-lintl)
> +# If either locale or libglib2 is defined, avahi needs libintl.
> +AVAHI_MAKE_OPTS += \
> +	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE)$(BR2_PACKAGE_LIBGLIB2),LIBS=-lintl)

Hum, I wondering if it wouldn't be nicer to rely on the fact that the
Config.in of those packages enable BR2_PACKAGE_GETTEXT when necessary.
So maybe we should instead rely on BR2_PACKAGE_GETTEXT=y, with
something like:

ifeq ($(BR2_PACKAGE_GETTEXT),y)
AVAHI_DEPENDENCIES += gettext
AVAHI_MAKE_OPTS += LIBS=-lintl
endif

(and of course, remove the gettext dependency added conditionally on
BR2_NEEDS_GETTEXT_IF_LOCALE).

It would be necessary to also test this with musl and glibc
configurations, with gettext enabled, to make sure it doesn't break.

And if it works, then we should update the Buildroot manual, which has
a section on the gettext integration.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
