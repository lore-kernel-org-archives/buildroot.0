From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 8 Oct 2018 19:19:09 +0200
Subject: [Buildroot] [PATCH 2/4] package/asterisk: enable for non-glibc
 toolchains
In-Reply-To: <20181003131358.28002-2-bernd.kuhls@t-online.de>
References: <20181003131358.28002-1-bernd.kuhls@t-online.de>
 <20181003131358.28002-2-bernd.kuhls@t-online.de>
Message-ID: <651cc680-f4ea-7ce5-a774-21602cb083e7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 3/10/18 15:13, Bernd Kuhls wrote:
> Quoting Yann:
> http://lists.busybox.net/pipermail/buildroot/2017-September/203004.html
> 
> "As a final stroke of genius, asterisk checks for the re-entrant variant
> of res_ninit(), and concludes that all such functions are available,
> including res_nsearch(). Uclibc-ng has the former but not the latter, so
> the build fails. Since there is no cache variable for that check, we
> can't pre-feed that result to configure, and fixing it is a bigger
> endeavour.  So we make asterisk depend on glibc for now, until someone
> is brave enough to fix it."
> 
> This hack was copied from Optware:
> https://github.com/Optware/Optware-ng/blob/master/make/asterisk13.mk#L331
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/asterisk/Config.in   | 6 ++----
>  package/asterisk/asterisk.mk | 4 ++++
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/package/asterisk/Config.in b/package/asterisk/Config.in
> index 17ac22bfd4..2cf2369749 100644
> --- a/package/asterisk/Config.in
> +++ b/package/asterisk/Config.in
> @@ -1,7 +1,5 @@
>  config BR2_PACKAGE_ASTERISK
>  	bool "asterisk"
> -	# Uses glibc resolver function res_nsearch()
> -	depends on BR2_TOOLCHAIN_USES_GLIBC
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	select BR2_PACKAGE_JANSSON
>  	select BR2_PACKAGE_LIBCURL
> @@ -22,5 +20,5 @@ config BR2_PACKAGE_ASTERISK
>  
>  	  http://www.asterisk.org/
>  
> -comment "asterisk needs a glibc toolchain w/ C++"
> -	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP
> +comment "asterisk needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
> index ea779cc8f6..46fe4de947 100644
> --- a/package/asterisk/asterisk.mk
> +++ b/package/asterisk/asterisk.mk
> @@ -117,6 +117,10 @@ ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
>  ASTERISK_CONF_OPTS += --with-execinfo
>  else
>  ASTERISK_CONF_OPTS += --without-execinfo
> +define ASTERISK_NO_RESINIT
> +	sed -i -e '/AC_DEFINE(\[HAVE_RES_NINIT\]/d' $(@D)/configure.ac
> +endef

 Meh, I'm dead against such sed-patching, and I'm also against conditional
"patching" of a package.

 Is it htat much of a problem to extend the autoconf test with a call to
res_nsearch?

 Regards,
 Arnout

> +ASTERISK_POST_PATCH_HOOKS += ASTERISK_NO_RESINIT
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBGSM),y)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
