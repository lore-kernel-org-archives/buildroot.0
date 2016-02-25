From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Feb 2016 00:52:07 +0100
Subject: [Buildroot] [PATCH 02/32] package/systemd: remove
 BR2_PACKAGE_SYSTEMD_ALL_EXTRAS
In-Reply-To: <1456437341-19025-3-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
 <1456437341-19025-3-git-send-email-gabe@hashrabbit.co>
Message-ID: <56CF93A7.3060806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/25/16 22:55, Gabe Evans wrote:
> The option was a bit misleading since it only selected additional
> libraries without --enable/disabling any features. Including all of them
> here would add a lot of bloat so instead, it is replaced with notes
> detailing which features each library enables.
> 
> Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
> ---
>  package/systemd/Config.in  | 11 +++--------
>  package/systemd/systemd.mk | 16 ++++++++++------
>  2 files changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index f7fc3bb..1972b1d 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -56,6 +56,9 @@ config BR2_PACKAGE_SYSTEMD
>  	  The selection of other packages will enable some features:
>  
>  	  - acl package will add support for multi-seat.
> +	  - xz package will add compression support in journal and coredump.
> +	  - libgcrypt package will add support for journal sealing and resolved
> +	    DNSSEC verification.

 Line is too long. Also 'resolved' is a bit weird here, so:

	  - libgcrypt package will add support for journal sealing and
	    DNSSEC verification in resolved

>  
>  	  http://freedesktop.org/wiki/Software/systemd
>  
> @@ -64,14 +67,6 @@ if BR2_PACKAGE_SYSTEMD
>  config BR2_PACKAGE_PROVIDES_UDEV
>  	default "systemd"
>  
> -config BR2_PACKAGE_SYSTEMD_ALL_EXTRAS

 You'll need to move this to Config.in.legacy, keep the two select statements
below, and add a help text explaining that the option has been removed and that
xz and libgcrypt have to be selected manually in the future.


 Regards,
 Arnout


> -	bool "enable all extras"
> -	select BR2_PACKAGE_XZ
> -	select BR2_PACKAGE_LIBGCRYPT
> -	help
> -	  Enable extra features for Systemd: journal compression and
> -	  signing.
> -
>  config BR2_PACKAGE_SYSTEMD_KDBUS
>  	bool "enable kdbus support"
>  	help
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 05121cf..7a1baf5 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -76,16 +76,20 @@ else
>  SYSTEMD_CONF_OPTS += --disable-kdbus
>  endif
>  
> -ifeq ($(BR2_PACKAGE_SYSTEMD_ALL_EXTRAS),y)
> -SYSTEMD_DEPENDENCIES += xz libgcrypt
> +ifeq ($(BR2_PACKAGE_XZ),y)
> +SYSTEMD_DEPENDENCIES += xz
> +SYSTEMD_CONF_OPTS += --enable-xz
> +else
> +SYSTEMD_CONF_OPTS += --disable-xz
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
> +SYSTEMD_DEPENDENCIES += libgcrypt
>  SYSTEMD_CONF_OPTS += \
> -	--enable-xz \
>  	--enable-gcrypt	\
>  	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
>  else
> -SYSTEMD_CONF_OPTS += \
> -	--disable-xz \
> -	--disable-gcrypt
> +SYSTEMD_CONF_OPTS += --disable-gcrypt
>  endif
>  
>  ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY),y)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
