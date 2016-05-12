From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 12 May 2016 21:38:42 +0200
Subject: [Buildroot] [PATCH 1/2] openvpn: remove polarssl crypto backend
 options
In-Reply-To: <1462893074-29188-1-git-send-email-gustavo@zacarias.com.ar>
References: <1462893074-29188-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <4261166d-7b9f-00b1-1c9d-884d286ffd69@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/10/16 17:11, Gustavo Zacarias wrote:
> Now that we need to bump openvpn to version 2.3.11 for security fixes
> the time has come to remove the polarssl option.
> Add legacy handling explaining the situation:
> PolarSSL 1.2.x can coexist with mbedTLS 2.x+, but OpenVPN requires
> PolarSSL/mbedTLS 1.3.x (the transition branch) >= 1.3.8 but doesn't
> build/work with the 2.x series. And PolarSSL/mbedTLS 1.3.x can't coexist
> with mbedTLS 2.x on the same target.
> So, unfortunately, openssl is now the only option (until libressl
> arrives).
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  Config.in.legacy           | 18 ++++++++++++++++++
>  package/openvpn/Config.in  | 21 +--------------------
>  package/openvpn/openvpn.mk | 13 ++-----------
>  3 files changed, 21 insertions(+), 31 deletions(-)
>
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 824a220..394e61b 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -145,6 +145,24 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2016.05"
>
> +config BR2_PACKAGE_OPENVPN_CRYPTO_OPENSSL
> +	bool "openvpn openssl crypto backend option removed"
> +	select BR2_LEGACY
> +	help
> +	  The OpenVPN openssl crypto backend options has been removed.
> +	  It's now the only possible option.

  I think we don't need to add this to the legacy handling.

  The purpose of legacy handling is to warn users that their configuration does 
not work anymore like it did before. In case an option has been renamed, we make 
sure that the new name is selected, but we still select BR2_LEGACY because at 
some point the legacy handling for that option will be removed as well.

  In this case, however, it doesn't help at all that the user is warned: his 
openvpn will work exactly the same as it did before, but he has to go and 
disable this option anyway.

  So I'd say remove this option from Config.in.legacy...

> +
> +config BR2_PACKAGE_OPENVPN_CRYPTO_POLARSSL
> +	bool "openvpn polarssl crypto backend removed"

  ... but keep this one of course.

  Regards,
  Arnout

> +	select BR2_LEGACY
> +	help
> +	  The OpenVPN polarssl crypto backend option has been removed.
> +	  Version from 2.3.10 onwards need polarssl >= 1.3.8 but aren't
> +	  compatible with mbedtls (polarssl) series 2.x which is the
> +	  version provided in buildroot. And both can't coexist.
> +	  It now uses OpenSSL as the only option.
> +
> +
>  config BR2_PACKAGE_NGINX_HTTP_SPDY_MODULE
>  	bool "nginx http spdy module removed"
>  	select BR2_LEGACY
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
