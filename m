From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 May 2013 00:36:23 +0200
Subject: [Buildroot] [PATCH 6/6] gnutls: bump to version 3.2.0
In-Reply-To: <1368463259-18958-6-git-send-email-gustavo@zacarias.com.ar>
References: <1368463259-18958-1-git-send-email-gustavo@zacarias.com.ar>
 <1368463259-18958-6-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <5192BC67.2070600@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/05/13 18:40, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias<gustavo@zacarias.com.ar>
> ---
>   package/gnutls/Config.in                           | 15 ++++++
>   ...gnutls-correct_rpl_gettimeofday_signature.patch | 58 ----------------------
>   package/gnutls/gnutls.mk                           | 29 ++++++++---
>   3 files changed, 38 insertions(+), 64 deletions(-)
>   delete mode 100644 package/gnutls/gnutls-correct_rpl_gettimeofday_signature.patch
>
> diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
> index 038b3fb..6c741a6 100644
> --- a/package/gnutls/Config.in
> +++ b/package/gnutls/Config.in
> @@ -1,6 +1,7 @@
>   config BR2_PACKAGE_GNUTLS
>   	bool "gnutls"
>   	select BR2_PACKAGE_NETTLE
> +	select BR2_PACKAGE_PCRE
>   	depends on BR2_USE_WCHAR
>   	help
>   	  GnuTLS is a secure communications library implementing the SSL
> @@ -8,6 +9,20 @@ config BR2_PACKAGE_GNUTLS
>
>   	http://www.gnutls.org
>
> +config BR2_PACKAGE_GNUTLS_PKCS11
> +	bool "PKCS#11 support"
> +	depends on !BR2_PREFER_STATIC_LIB
> +	depends on BR2_USE_MMU
> +	depends on BR2_PACKAGE_GNUTLS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_LIBTASN1
> +	select BR2_PACKAGE_P11_KIT
> +	help
> +	  Enable PKCS#11 support in gnutls.
> +
> +comment "gnutls pkcs#11 support requires a toolchain with thread support"
> +	depends on BR2_PACKAGE_GNUTLS && !BR2_TOOLCHAIN_HAS_THREADS
> +

  Any reason why you want to add this config symbol, instead of just 
checking for BR2_PACKAGE_P11_KIT in the .mk file?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
