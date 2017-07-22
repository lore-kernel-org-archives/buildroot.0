From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Jul 2017 12:00:41 +0200
Subject: [Buildroot] [PATCH v2] capnproto: new package
In-Reply-To: <201707121621.v6CGLFiv023177@mx1.sonologic.net>
References: <201707121621.v6CGLFiv023177@mx1.sonologic.net>
Message-ID: <20170722100041.GA9929@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Koen, All,

On 2017-07-22 08:16 +0200, Koen Martens spake thusly:
> Not going to be accepted i guess. No problem, we'll maintain it in our
> private branch then. Would've been nice to have had a short note
> though that it isn't going to be merged.

That's not that it won't be accepted, it's just that we have a *lot* of
pending patches, and we can't handle everything on a whim:
    https://patchwork.ozlabs.org/project/buildroot/list/

At the time of writing, that's 237 pending patches...

On 2017-07-12 18:21 +0200, Koen Martens spake thusly:
> Cap'n Proto is an insanely fast data interchange format
> and capability-based RPC system. Think JSON, except
> binary. Or think Protocol Buffers, except faster. In
> fact, in benchmarks, Cap?n Proto is INFINITY TIMES
> faster than Protocol Buffers.

No need in the commit log to repeat the help text. Instead, the commit
log should explain the packaging in Buildroot.

For example, the commit log should explain why the host variant is
needed. You exoplained it in the previous review, but for posterity in
the git log we need it.

> https://capnproto.org/index.html
> Signed-off-by: Koen Martens <gmc@sonologic.nl>

Empty line before your SoB line, pelase. And the url ius not needed,
since it is in the help text anyway.

[--SNIP--]
> diff --git a/package/capnproto/0001-Do-not-use-execinfo-h-with-uclibc.patch b/package/capnproto/0001-Do-not-use-execinfo-h-with-uclibc.patch
> new file mode 100644
> index 0000000..dddc923
> --- /dev/null
> +++ b/package/capnproto/0001-Do-not-use-execinfo-h-with-uclibc.patch
> @@ -0,0 +1,36 @@
> +From: Koen Martens <gmc@sonologic.nl>
> +Date: Thu, 11 Jul 2017 20:44:18 +0200
> +Subject: [PATCH] Do not use execinfo.h with uclibc
> +
> +Capnproto assumes that if __GLIBC__ is defined then
> +execinfo.h is available. uClibc does not implement
> +execinfo.h, but does define __GLIBC__ in features.h
> +(documented as an acceptable lie).
> +
> +uClibc also defines __UCLIBC__ in features.h, so we
> +check for that macro to be defined and skip the
> +features that depend on execinfo.h when it is
> +defined.

In fact, uClibc does have execinfo now, and it also even has backtrace
support. It's just that this is configurable and not enabled in the
default configuration.

A better check would be to actually detect presence of backtrace at
configure time. See for example:

    package/jack2/0003-Make-backtrace-support-depends-on-execinfo.h-existen.patch

But...

> +This patch has been submitted upstream.
> +
> +Because the directory structure of the release tarball
> +is different from the git repository, this patch has
> +not been generated with git format-patch.
> +
> +https://github.com/capnproto/capnproto/pull/511

... upstream has applied that patch now, so we can just state we
backport an upstream fix (for now):

    https://github.com/capnproto/capnproto/commit/e651ac5febc59e3e2b5d3365ededbe5362756da2

> +Signed-off-by: Koen Martens <gmc@sonologic.nl>
> +diff --git a/src/kj/exception.c++ b/src/kj/exception.c++
> +index 218f1db..d10ce8d 100644
> +--- a/src/kj/exception.c++
> ++++ b/src/kj/exception.c++
> +@@ -33,7 +33,7 @@
> + #endif
> + #include "io.h"
> + 
> +-#if (__linux__ && __GLIBC__) || __APPLE__
> ++#if (__linux__ && __GLIBC__ && !__UCLIBC__) || __APPLE__
> + #define KJ_HAS_BACKTRACE 1
> + #include <execinfo.h>
> + #endif
> diff --git a/package/capnproto/Config.in b/package/capnproto/Config.in
> new file mode 100644
> index 0000000..ef0e380
> --- /dev/null
> +++ b/package/capnproto/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_CAPNPROTO
> +	bool "capnproto"
> +	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU

We usually have the dependencies on the hardware features, like the MMU,
go first, followed by the software deepndencies (which the user actually
can act upon).

> +	help
> +	  Cap'n Proto is an insanely fast data interchange format
> +	  and capability-based RPC system. Think JSON, except
> +	  binary. Or think Protocol Buffers, except faster. In
> +	  fact, in benchmarks, Cap?n Proto is INFINITY TIMES
> +	  faster than Protocol Buffers.
> +
> +	  https://capnproto.org/index.html
> +
> +comment "capnproto needs host and target gcc >= 4.8 w/ C++, threads"
> +	depends on !BR2_HOST_GCC_AT_LEAST_4_8 || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
> +		!BR2_INSTALL_LIBSTDCPP || \
> +		!BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU

Ditto.

Otherwise, that looks good.

Regards,
Yann E. MORIN.

> diff --git a/package/capnproto/capnproto.hash b/package/capnproto/capnproto.hash
> new file mode 100644
> index 0000000..451baaa
> --- /dev/null
> +++ b/package/capnproto/capnproto.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256	8082040cd8c3b93c0e4fc72f2799990c72fdcf21c2b5ecdae6611482a14f1a04	capnproto-c++-0.6.1.tar.gz
> diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
> new file mode 100644
> index 0000000..6221d4e
> --- /dev/null
> +++ b/package/capnproto/capnproto.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# capnproto
> +#
> +################################################################################
> +
> +CAPNPROTO_VERSION = 0.6.1
> +CAPNPROTO_SOURCE = capnproto-c++-$(CAPNPROTO_VERSION).tar.gz
> +CAPNPROTO_SITE = https://capnproto.org
> +CAPNPROTO_LICENSE = MIT
> +CAPNPROTO_LICENSE_FILES = LICENSE.txt
> +CAPNPROTO_INSTALL_STAGING = YES
> +CAPNPROTO_AUTORECONF = YES
> +CAPNPROTO_CONF_OPTS = --with-external-capnp
> +CAPNPROTO_DEPENDENCIES = host-autoconf host-capnproto
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +CAPNPROTO_CONF_ENV += LIBS=-latomic
> +endif
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
