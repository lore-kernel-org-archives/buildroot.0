From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Mar 2021 22:47:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/mbedtls: security bump to
 version 2.6.10
In-Reply-To: <20210312202133.10544-1-fontaine.fabrice@gmail.com>
References: <20210312202133.10544-1-fontaine.fabrice@gmail.com>
Message-ID: <20210312214701.GC2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-03-12 21:21 +0100, Fabrice Fontaine spake thusly:
> - Fix a buffer overflow in mbedtls_mpi_sub_abs() when calculating
>   |A| - |B| where |B| is larger than |A| and has more limbs (so the
>   function should return MBEDTLS_ERR_MPI_NEGATIVE_VALUE). Only
>   applications calling mbedtls_mpi_sub_abs() directly are affected:
>   all calls inside the library were safe since this function is
>   only called with |A| >= |B|.
> - Fix an errorneous estimation for an internal buffer in
>   mbedtls_pk_write_key_pem(). If MBEDTLS_MPI_MAX_SIZE is set to an odd
>   value the function might fail to write a private RSA keys of the
>   largest supported size.
> - Fix a stack buffer overflow with mbedtls_net_poll() and
>   mbedtls_net_recv_timeout() when given a file descriptor that is
>   beyond FD_SETSIZE.
> - Guard against strong local side channel attack against base64 tables
>   by making access aceess to them use constant flow code.
> 
> https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.10
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mbedtls/mbedtls.hash | 4 ++--
>  package/mbedtls/mbedtls.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
> index 39df050609..f366744887 100644
> --- a/package/mbedtls/mbedtls.hash
> +++ b/package/mbedtls/mbedtls.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.9:
> -sha256  fc17ff7d8c11d08f23ae2800a18269408ad2c24ea6bb8b9363e41a01c2425697  mbedtls-2.16.9.tar.gz
> +# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.10:
> +sha256  37949e823c7e1f6695fc56858578df355da0770c284b1c1304cfc8b396d539cd  mbedtls-2.16.10.tar.gz

That is not what I see written on that webpage:

    Checksum
    The SHA256 hashes for the archives are:
    96257bb03b30300b2f35f861ffe204ed957e9fd0329d80646fe57fc49f589b29 mbedtls-2.16.10.tar.gz
    8a1537efd03dacdb0fc4bd6fddac0b0a49f91c229182268815e5980b9ffc555a mbedtls-2.16.10.zip

And the 96257b... hash is the one I get here, indeed.

The 37949e... hash you provided, is however what is provided on the
2.26.0 release page:

    https://github.com/ARMmbed/mbedtls/releases/tag/v2.26.0

    Checksum
    The SHA256 hashes for the archives are:
    37949e823c7e1f6695fc56858578df355da0770c284b1c1304cfc8b396d539cd mbedtls-2.26.0.tar.gz
    23a7437284fb07c136891cb981a065b9541b7f78d97e3671fe07c7ce59c2f3b3 mbedtls-2.26.0.zip

However, it seems upstream messed up their hashes or their uploads, or
both, somehow:

    https://github.com/ARMmbed/mbedtls/issues/4225
    Wrong SHA256 checksum for mbedtls-2.7.19.tar.gz shown on release page

So... Meh...

Applied to master with the hash fixed, thanks.

Regards,
Yann E. MORIN.

>  # Locally calculated
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache-2.0.txt
> diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
> index 9e3e9f626d..8776fb9134 100644
> --- a/package/mbedtls/mbedtls.mk
> +++ b/package/mbedtls/mbedtls.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MBEDTLS_VERSION = 2.16.9
> +MBEDTLS_VERSION = 2.16.10
>  MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
>  MBEDTLS_CONF_OPTS = \
>  	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
> -- 
> 2.30.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
