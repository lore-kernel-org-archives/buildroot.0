From: Gilles Talis <gilles.talis@gmail.com>
Date: Tue, 10 Dec 2019 20:46:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/avro: new package
In-Reply-To: <20191208202503.220908-1-titouan.christophe@railnova.eu>
References: <20191208202503.220908-1-titouan.christophe@railnova.eu>
Message-ID: <CAKcgs2zA9NHEePquvM7FVoOn38f46d4YCPbhM8xzsG6m_xsCSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christophe,

Thanks for your contribution

Le dim. 8 d?c. 2019 ? 21:26, Titouan Christophe
<titouan.christophe@railnova.eu> a ?crit :
>
> Avro is a data serialization system, somewhat similar to protobuff or
> cap'n proto. Unlike them however, Avro schemas can be distributed in
> json files to be loaded at runtime, rather than language-specific
> generated code to use at compile time.
>
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
>  DEVELOPERS                                    |  1 +
>  package/Config.in                             |  1 +
>  package/avro/Config.in                        | 20 ++++++++++
>  .../avro/avro-c/0001-Compile-on-musl.patch    | 39 +++++++++++++++++++
>  package/avro/avro-c/Config.in                 |  4 ++
>  package/avro/avro-c/avro-c.mk                 | 18 +++++++++
>  package/avro/avro-py3/Config.in               |  3 ++
>  package/avro/avro-py3/avro-py3.mk             | 17 ++++++++
>  package/avro/avro.hash                        |  7 ++++
>  package/avro/avro.mk                          | 14 +++++++
>  10 files changed, 124 insertions(+)
>  create mode 100644 package/avro/Config.in
>  create mode 100644 package/avro/avro-c/0001-Compile-on-musl.patch
>  create mode 100644 package/avro/avro-c/Config.in
>  create mode 100644 package/avro/avro-c/avro-c.mk
>  create mode 100644 package/avro/avro-py3/Config.in
>  create mode 100644 package/avro/avro-py3/avro-py3.mk
>  create mode 100644 package/avro/avro.hash
>  create mode 100644 package/avro/avro.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d5fd6e0e93..d4a002c886 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2392,6 +2392,7 @@ F:        package/fbgrab/
>  N:     Titouan Christophe <titouan.christophe@railnova.eu>
>  F:     package/mosquitto/
>  F:     package/redis/
> +F:     package/avro/
>
>  N:     Trent Piepho <tpiepho@impinj.com>
>  F:     package/libp11/
> diff --git a/package/Config.in b/package/Config.in
> index 9e2b78fe6a..19f4f2d1ab 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1707,6 +1707,7 @@ menu "Other"
>         source "package/argp-standalone/Config.in"
>         source "package/armadillo/Config.in"
>         source "package/atf/Config.in"
> +       source "package/avro/Config.in"
>         source "package/bctoolbox/Config.in"
>         source "package/bdwgc/Config.in"
>         source "package/boost/Config.in"
> diff --git a/package/avro/Config.in b/package/avro/Config.in
> new file mode 100644
> index 0000000000..fbaa34d5b0
> --- /dev/null
> +++ b/package/avro/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_AVRO
> +       bool "avro"
> +       depends on !BR2_STATIC_LIBS
> +       help
> +         Apache Avro is a data serialization system.
> +         Avro provides:
> +         - Rich data structures.
> +         - A compact, fast, binary data format.
> +         - A container file, to store persistent data.
> +         - Remote procedure call (RPC).
> +         - Simple integration with dynamic languages.
> +         - Code generation is not required to read or write data
> +           files nor to use or implement RPC protocols.
> +         - Code generation as an optional optimization,
> +           only worth implementing for statically typed languages.
> +
> +if BR2_PACKAGE_AVRO
> +source "package/avro/avro-c/Config.in"
> +source "package/avro/avro-py3/Config.in"
> +endif
> diff --git a/package/avro/avro-c/0001-Compile-on-musl.patch b/package/avro/avro-c/0001-Compile-on-musl.patch
> new file mode 100644
> index 0000000000..188a3ac790
> --- /dev/null
> +++ b/package/avro/avro-c/0001-Compile-on-musl.patch
> @@ -0,0 +1,39 @@
> +From 55a5ad94c77896eb25e2c7ed024d78a0a2c09007 Mon Sep 17 00:00:00 2001
> +From: Titouan Christophe <titouan.christophe@railnova.eu>
> +Date: Sun, 8 Dec 2019 01:55:59 +0100
> +Subject: [PATCH 1/1] Allow avro C to be built on musl based systems.
> +
> +The type `ssize_t` is defined in sys/types.h, and nowhere else
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
> +---
> + lang/c/src/avro_generic_internal.h | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/lang/c/src/avro_generic_internal.h b/lang/c/src/avro_generic_internal.h
> +index 709403c0..9843ed65 100644
> +--- a/lang/c/src/avro_generic_internal.h
> ++++ b/lang/c/src/avro_generic_internal.h
> +@@ -24,6 +24,8 @@ extern "C" {
> + #define CLOSE_EXTERN
> + #endif
> +
> ++#include <sys/types.h>
> ++
> + #include "avro/generic.h"
> + #include "avro/schema.h"
> + #include "avro/value.h"
> +--
> +2.21.0
> +
> diff --git a/package/avro/avro-c/Config.in b/package/avro/avro-c/Config.in
> new file mode 100644
> index 0000000000..b6dc40a1d0
> --- /dev/null
> +++ b/package/avro/avro-c/Config.in
> @@ -0,0 +1,4 @@
> +config BR2_PACKAGE_AVRO_C
> +       bool "c language bindings and avroappend, avrocat, avromod, avropipe"
> +       default y
> +       select BR2_PACKAGE_JANSSON
> diff --git a/package/avro/avro-c/avro-c.mk b/package/avro/avro-c/avro-c.mk
> new file mode 100644
> index 0000000000..77ba2764fa
> --- /dev/null
> +++ b/package/avro/avro-c/avro-c.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# avro-c
> +#
> +################################################################################
> +
> +AVRO_C_VERSION = $(AVRO_VERSION)
> +AVRO_C_SITE = $(AVRO_SITE)
> +AVRO_C_SOURCE = $(AVRO_SOURCE)
> +AVRO_C_DL_SUBDIR = $(AVRO_DL_SUBDIR)
> +AVRO_C_LICENSE_FILES = $(AVRO_LICENSE_FILES)
> +AVRO_C_LICENSE = $(AVRO_LICENSE)
> +
> +AVRO_C_INSTALL_STAGING = YES
> +AVRO_C_SUBDIR = lang/c
> +AVRO_C_DEPENDENCIES = jansson
> +
> +$(eval $(cmake-package))
> diff --git a/package/avro/avro-py3/Config.in b/package/avro/avro-py3/Config.in
> new file mode 100644
> index 0000000000..d6ab981b2c
> --- /dev/null
> +++ b/package/avro/avro-py3/Config.in
> @@ -0,0 +1,3 @@
> +config BR2_PACKAGE_AVRO_PY3
> +       bool "python3 language bindings and avro"
> +       depends on BR2_PACKAGE_PYTHON3
> diff --git a/package/avro/avro-py3/avro-py3.mk b/package/avro/avro-py3/avro-py3.mk
> new file mode 100644
> index 0000000000..0f0596c1e7
> --- /dev/null
> +++ b/package/avro/avro-py3/avro-py3.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# avro-py3
> +#
> +################################################################################
> +
> +AVRO_PY3_VERSION = $(AVRO_VERSION)
> +AVRO_PY3_SITE = $(AVRO_SITE)
> +AVRO_PY3_SOURCE = $(AVRO_SOURCE)
> +AVRO_PY3_DL_SUBDIR = $(AVRO_DL_SUBDIR)
> +AVRO_PY3_LICENSE_FILES = $(AVRO_LICENSE_FILES)
> +AVRO_PY3_LICENSE = $(AVRO_LICENSE)
> +
> +AVRO_PY3_SUBDIR = lang/py3
> +AVRO_PY3_SETUP_TYPE = setuptools
> +
> +$(eval $(python-package))
> diff --git a/package/avro/avro.hash b/package/avro/avro.hash
> new file mode 100644
> index 0000000000..57d871ca56
> --- /dev/null
> +++ b/package/avro/avro.hash
> @@ -0,0 +1,7 @@
> +# Locally calculated after checking signature from key
> +# CEF487F848109B4C8B8AC18DE4AE0EB72D112483
> +sha256 11335cd0bc230e60ec55ca56bdf22c723b7e83f812dbe9b4d734ccdf17d4e8c6  avro-src-1.9.1.tar.gz
> +
> +# License files
> +sha256 6cfbabf86855b02809016458b172ba0eae4812a5ab72e045b0939dfc44dd9f56  LICENSE.txt
> +sha256 3f2d808d11c9e5b82f5a77757538c787cbc09c838c235424fd726577c54adbf9  NOTICE.txt
> diff --git a/package/avro/avro.mk b/package/avro/avro.mk
> new file mode 100644
> index 0000000000..deea56ff81
> --- /dev/null
> +++ b/package/avro/avro.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# avro
> +#
> +################################################################################
> +
> +AVRO_VERSION = 1.9.1
> +AVRO_SITE = https://www-eu.apache.org/dist/avro/avro-$(AVRO_VERSION)
> +AVRO_SOURCE = avro-src-$(AVRO_VERSION).tar.gz
> +AVRO_DL_SUBDIR = avro
> +AVRO_LICENSE = Apache-2.0
> +AVRO_LICENSE_FILES = LICENSE.txt NOTICE.txt
> +
> +include $(sort $(wildcard package/avro/avro-*/avro-*.mk))
> --
> 2.21.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

I would be very interested to have other people's opinion on this one,
but I think it'd be neater to follow the protobuf "architecture":
- one package for protobuf
- one package for python-protobuf

Similarly, you could create:
- one package for avro-c
- one package for python-avro
(another package for avro-cpp eventually)

Moreover, these packages seem to have been nicely separated upstream:
- avro-c: https://www-eu.apache.org/dist/avro/avro-1.9.1/c/avro-c-1.9.1.tar.gz
- avro-python3:
https://www-eu.apache.org/dist/avro/avro-1.9.1/py3/avro-python3-1.9.1.tar.gz

I have not run an exact diff between the avro-src-xxx.tar.gz and the
other source packages, but if they match, I would recommend using the
"protobuf" method.

Thanks
Gilles.
