From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 12 Feb 2017 14:57:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/avahi: fix gettext dependency
 handling
In-Reply-To: <20170212124615.8875-1-bernd.kuhls@t-online.de>
References: <20170212124615.8875-1-bernd.kuhls@t-online.de>
Message-ID: <20170212125738.ds7suxyz4g6csvcp@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Sun, Feb 12, 2017 at 01:46:15PM +0100, Bernd Kuhls wrote:
> Currently avahi only adds -lintl when BR2_NEEDS_GETTEXT_IF_LOCALE is
> enabled. This is insufficent for defconfigs where BR2_PACKAGE_GETTEXT
> was selected by other packages without BR2_NEEDS_GETTEXT_IF_LOCALE
> being enabled at the same time. If gettext was built before avahi,
> and avahi uses optional dbus support, avahi configure detects libintl:
> 
> checking libintl.h usability... yes
> checking libintl.h presence... yes
> checking for libintl.h... yes
> checking for ngettext in libc... no
> checking for bindtextdomain in -lintl... yes
> checking for ngettext in -lintl... yes
> checking for dgettext in -lintl... yes
> 
> and breaks at linking stage:
> 
>   CCLD     avahi-publish
> /home/buildroot/br7_freeswitch/output/host/usr/lib/gcc/i586-buildroot-linux-uclibc/5.4.0/../../../../i586-buildroot-linux-uclibc/bin/ld: avahi_publish-avahi-publish.o: undefined reference to symbol 'libintl_dgettext'
> /home/buildroot/br7_freeswitch/output/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/lib32/libintl.so.8: error adding symbols: DSO missing from command line
> collect2: error: ld returned 1 exit status
> 
> To reproduce use this minimal defconfig:
> 
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_PACKAGE_GETTEXT=y
> BR2_PACKAGE_DBUS=y
> BR2_PACKAGE_AVAHI=y
> 
> and build gettext before avahi.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/avahi/avahi.mk | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
> index 069b45a96..901beaaba 100644
> --- a/package/avahi/avahi.mk
> +++ b/package/avahi/avahi.mk
> @@ -96,9 +96,7 @@ AVAHI_CONF_OPTS = \
>  	--with-autoipd-user=avahi \
>  	--with-autoipd-group=avahi
>  
> -AVAHI_DEPENDENCIES = \
> -	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-intltool \
> -	host-pkgconf host-gettext
> +AVAHI_DEPENDENCIES = host-intltool host-pkgconf host-gettext
>  
>  AVAHI_CFLAGS = $(TARGET_CFLAGS)
>  
> @@ -168,7 +166,10 @@ endif
>  
>  AVAHI_CONF_ENV += CFLAGS="$(AVAHI_CFLAGS)"
>  
> -AVAHI_MAKE_OPTS += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),LIBS=-lintl)
> +ifeq ($(BR2_PACKAGE_GETTEXT),y)
> +AVAHI_DEPENDENCIES += gettext
> +AVAHI_CONF_ENV += LIBS=-lintl
> +endif

Why do you switch from AVAHI_MAKE_OPTS to AVAHI_CONF_ENV?

<PKG>_CONF_ENV is arguably better, but this change is not mentioned in the 
commit log.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
