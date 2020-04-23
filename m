From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Apr 2020 22:09:05 +0200
Subject: [Buildroot] [PATCH 1/3] package/mbedtls: add
 BR2_PACKAGE_MBEDTLS_X509_UNSUPPORTED_CRITICAL_EXTENSION
In-Reply-To: <20200422192059.790299-1-fontaine.fabrice@gmail.com>
References: <20200422192059.790299-1-fontaine.fabrice@gmail.com>
Message-ID: <20200423220905.06d9dc59@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 Apr 2020 21:20:57 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add an option to enable
> MBEDTLS_X509_ALLOW_UNSUPPORTED_CRITICAL_EXTENSION
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mbedtls/Config.in  | 10 ++++++++++
>  package/mbedtls/mbedtls.mk |  8 ++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/package/mbedtls/Config.in b/package/mbedtls/Config.in
> index a39ba65d98..e48f0473b0 100644
> --- a/package/mbedtls/Config.in
> +++ b/package/mbedtls/Config.in
> @@ -29,4 +29,14 @@ config BR2_PACKAGE_MBEDTLS_COMPRESSION
>  	  sure CRIME and similar attacks are not applicable to your
>  	  particular situation.
>  
> +config BR2_PACKAGE_MBEDTLS_X509_UNSUPPORTED_CRITICAL_EXTENSION
> +	bool "allow X509 unsupported critical extension"
> +	help
> +	  If set, the X509 parser will not break-off when parsing an
> +	  X509 certificate and encountering an unknown critical
> +	  extension.
> +
> +	  Warning: Depending on your PKI use, enabling this can be a
> +	  security risk!
> +
>  endif

This whole series is pretty awkward. Shouldn't we instead simply not
allow the use of uacme mbedtls crypto backend ?

What is this X509_UNSUPPORTED_CRITICAL_EXTENSION functionality that is
so weird that it requires patching the mbedtls config.h file ? Why is
uacme absolutely requiring this functionality that no other user of
mbedtls requires ?

Until these questions are answered, I'd prefer to drop support for
mbedtls as a crypto backend for uacme.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
