From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 16 Jun 2017 00:34:20 +0200
Subject: [Buildroot] [PATCH 2/5] libssl: new virtual package.
In-Reply-To: <20170615142928.31927-2-aduskett@codeblue.com>
References: <20170615142928.31927-1-aduskett@codeblue.com>
 <20170615142928.31927-2-aduskett@codeblue.com>
Message-ID: <98205bfa-07bc-1d4d-d33f-ef7db8612b68@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-06-17 16:29, Adam Duskett wrote:
>     libressl is API compatible with OpenSSL 1.0.1 and is almost API compatible
>     with OpenSSL 1.0.2.  As such, a new virtual package is needed to handle
>     having both libressl and openssl.
> 
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(after fixing commit indentation and wrapping).

 I'm not entirely happy with the the "libssl" name, because we have a dozen
different ssl/tls libraries and only two implement this virtual package. But I
can't really come up with anything better - "openssl-compat" just doesn't sound
very sexy :-)

 Regards,
 Arnout

> ---
>  package/Config.in        | 1 +
>  package/libssl/Config.in | 6 ++++++
>  package/libssl/libssl.mk | 7 +++++++
>  3 files changed, 14 insertions(+)
>  create mode 100644 package/libssl/Config.in
>  create mode 100644 package/libssl/libssl.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 1674444..a7af71e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -967,6 +967,7 @@ menu "Crypto"
>  	source "package/libscrypt/Config.in"
>  	source "package/libsecret/Config.in"
>  	source "package/libsha1/Config.in"
> +	source "package/libssl/Config.in"
>  	source "package/libsodium/Config.in"
>  	source "package/libssh/Config.in"
>  	source "package/libssh2/Config.in"
> diff --git a/package/libssl/Config.in b/package/libssl/Config.in
> new file mode 100644
> index 0000000..71347de
> --- /dev/null
> +++ b/package/libssl/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_HAS_LIBSSL
> +	bool
> +
> +config BR2_PACKAGE_PROVIDES_LIBSSL
> +	string
> +	depends on BR2_PACKAGE_HAS_LIBSSL
> diff --git a/package/libssl/libssl.mk b/package/libssl/libssl.mk
> new file mode 100644
> index 0000000..6e89bcc
> --- /dev/null
> +++ b/package/libssl/libssl.mk
> @@ -0,0 +1,7 @@
> +################################################################################
> +#
> +# libssl
> +#
> +################################################################################
> +
> +$(eval $(virtual-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
