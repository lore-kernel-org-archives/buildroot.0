From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 14:51:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/capnproto: add openssl optional
 dependency
In-Reply-To: <20200727124145.1825309-1-fontaine.fabrice@gmail.com>
References: <20200727124145.1825309-1-fontaine.fabrice@gmail.com>
Message-ID: <20200727125140.GY19818@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-07-27 14:41 +0200, Fabrice Fontaine spake thusly:
> openssl is an optional dependency that is enabled by default since
> version 0.7.0 and
> https://github.com/capnproto/capnproto/commit/23db5e3fd91104a0b2881d8f8ab3c10bf9dd8e75

Seeing how they are testing for openssl, will that no fail for a staitc
link, because they forget to link with -lz in that case ?

      AC_CHECK_LIB(ssl, OPENSSL_init_ssl, [:], [
        with_openssl=no
      ], [-lcrypto])

Why don't they yse pkg-config?

Additionally/alternatively, they do have a cmake-based buildsystem. Can
we switch over?

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/capnproto/capnproto.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
> index 34fb885914..2afeb8ffa3 100644
> --- a/package/capnproto/capnproto.mk
> +++ b/package/capnproto/capnproto.mk
> @@ -21,5 +21,12 @@ endif
>  # The actual source to be compiled is within a 'c++' subdirectory
>  CAPNPROTO_SUBDIR = c++
>  
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +CAPNPROTO_CONF_OPTS += --with-openssl
> +CAPNPROTO_DEPENDENCIES += openssl
> +else
> +CAPNPROTO_CONF_OPTS += --without-openssl
> +endif
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> -- 
> 2.27.0
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
