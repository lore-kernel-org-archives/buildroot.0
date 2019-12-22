From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2019 22:18:49 +0100
Subject: [Buildroot] [PATCH v3 1/2] package/avro-c: new package
In-Reply-To: <20191214174206.161446-2-titouan.christophe@railnova.eu>
References: <20191214174206.161446-1-titouan.christophe@railnova.eu>
 <20191214174206.161446-2-titouan.christophe@railnova.eu>
Message-ID: <20191222211849.GM26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Titouan, All,

On 2019-12-14 18:42 +0100, Titouan Christophe spake thusly:
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
[--SNIP--]
> diff --git a/package/avro-c/0001-Compile-on-musl.patch b/package/avro-c/0001-Compile-on-musl.patch
> new file mode 100644
> index 0000000000..d6df6e83c2
> --- /dev/null
> +++ b/package/avro-c/0001-Compile-on-musl.patch
> @@ -0,0 +1,39 @@
> +From 4ada709e44e26a329d11359f10ab208ce758d863 Mon Sep 17 00:00:00 2001
> +From: Titouan Christophe <titouan.christophe@railnova.eu>
> +Date: Sun, 8 Dec 2019 01:55:59 +0100
> +Subject: [PATCH] Allow avro C to be built on musl based systems.
> +
> +The type 'ssize_t' is defined in sys/types.h, and nowhere else
> +in the musl standard C library, so it should be included for the
> +compilation to succeed.
> +
> +This fixes several errors like:
> +
> +    In file included from src/generic.c:29:0:
> +    src/generic.c: In function 'avro_generic_value_new':
> +    src/avro_generic_internal.h:63:39:
> +        error: 'ssize_t' undeclared (first use in this function);
> +               did you mean 'size_t'?
> +
> +Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> +[Upstream status: https://github.com/apache/avro/pull/740]

Which has been accepted now. :-)

[--SNIP--]
> diff --git a/package/avro-c/avro-c.mk b/package/avro-c/avro-c.mk
> new file mode 100644
> index 0000000000..01fc97f33d
> --- /dev/null
> +++ b/package/avro-c/avro-c.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# avro-c
> +#
> +################################################################################
> +
> +AVRO_C_VERSION = 1.9.1
> +AVRO_C_SITE = https://www-eu.apache.org/dist/avro/avro-$(AVRO_C_VERSION)/c
> +AVRO_C_LICENSE = Apache-2.0
> +AVRO_C_LICENSE_FILES = LICENSE
> +AVRO_C_INSTALL_STAGING = YES
> +AVRO_C_DEPENDENCIES = jansson

It also use pkg-config, so needs host-pkgconf.

> +ifeq ($(BR2_PACKAGE_SNAPPY),y)
> +AVRO_C_DEPENDENCIES += snappy
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +AVRO_C_DEPENDENCIES += zlib
> +endif

While you are at it at adding compression libraries, avro-c may also
optionally use liblzma, so may depend on xz.

Care to respin, please?

Regards,
Yann E. MORIN.

> +$(eval $(cmake-package))
> -- 
> 2.23.0
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
