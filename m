From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jul 2020 22:18:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/libest: add package
In-Reply-To: <20200713122313.40333-1-aleksandr.o.makarov@gmail.com>
References: <20200713122313.40333-1-aleksandr.o.makarov@gmail.com>
Message-ID: <20200713201843.GH18825@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Aleksandr, All,

On 2020-07-13 06:23 -0600, Aleksandr Makarov spake thusly:
> libest is a C implementation of RFC 7030 (Enrollment over
> Secure Transport).
> 
> It can be used to provision public key certificates from
> a certificate authority (CA) or registration authority (RA)
> to end-user devices and network infrastructure devices.
> 
> https://github.com/cisco/libest

Thanks for this patch. There are hower a few issues with it; let's walk
them down one by one.

First, it is nice that the commit log briefly explains what the pacjage
does. But the most important infromation that must be present in the
commit log, are the technical details about the packaging, not the
package.

For example, you would have to explain why you need to patch it. Maybe
seomthing along the lines of:

    libest bundles a stubbed version of libsafec, and has no provision
    to build against a system-installed full (non-stubbed) libsafec.
    We add a patch to make that possible.

Ditto for the other patches: a little blurb would be welcome.

Speaking of patches: it would be nice if you could submit them upstream,
so that we do not have to carry them next tie we update (but given how
active upstream seems to be, updating is probably not for tomorrow). And
add a reference to the upstream submission (PR, email thread...) in the
patches themselves.

[--SNIP--]
> diff --git a/package/Config.in b/package/Config.in
> index aafaa312a1..df71e1b677 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1683,6 +1683,7 @@  menu "Networking"
> 	source "package/libcpprestsdk/Config.in"
> 	source "package/libcurl/Config.in"
> 	source "package/libdnet/Config.in"
> +	source "package/libest/Config.in"
> 	source "package/libeXosip2/Config.in"

libeXosip2 sorts before libest (uppercase go before lowercase)L

    $ make check-package
    package/Config.in:1687: Packages in: menu "Networking",
                            are not alphabetically ordered;
                            correct order: '-', '_', digits, capitals, lowercase;
                            first incorrect package: libeXosip2

[--SNIP--]
> ++AC_MSG_CHECKING(which libsafec to use)
> ++AM_CONDITIONAL([WITH_SYSTEM_LIBSAFEC], [test "$with_system_libsafec" = "yes"])
> ++AM_COND_IF([WITH_SYSTEM_LIBSAFEC], AC_MSG_RESULT([system]), AC_MSG_RESULT([built-in]))
> ++AM_COND_IF([WITH_SYSTEM_LIBSAFEC], [
> ++            PKG_CHECK_MODULES([libsafec], [libsafec])
> ++            LIBS="$LIBS $libsafec_LIBS"
> ++            CFLAGS="$CFLAGS $libsafec_CFLAGS"
> ++            CPPFLAGS="$CPPFLAGS $libsafec_CFLAGS"
> ++            AC_CHECK_HEADER(safe_lib.h,,AC_MSG_WARN(missing header: safe_lib.h))
> ++            AC_CHECK_HEADER(safe_lib_errno.h,,AC_MSG_WARN(missing header: safe_lib_errno.h))
> ++            AC_CHECK_HEADER(safe_mem_lib.h,,AC_MSG_WARN(missing header: safe_mem_lib.h))
> ++            AC_CHECK_HEADER(safe_str_lib.h,,AC_MSG_WARN(missing header: safe_str_lib.h))

Not a safec expert here, but what happens if any of those header is
indeed missing?

Also, why would they be missing if pkg-config did find the library in
the first place?

[--SNIP--]
> +From d4f742d8b1e9ffd8f686cc18d4602c04b2824897 Mon Sep 17 00:00:00 2001
> +From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
> +Date: Sun, 12 Jul 2020 20:27:37 +0000
> +Subject: [PATCH] Compile java/jni only if configured with --enable-jni
> +
> +Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
> +---
> + Makefile.am  | 6 +++++-
> + configure.ac | 5 +++--
> + 2 files changed, 8 insertions(+), 3 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 82354d6..2aa4892 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -8,6 +8,10 @@ if ! ENABLE_CLIENT_ONLY
> + examples_extra = example/server example/proxy
> + endif
> + 
> +-SUBDIRS = $(builtin_libsafec) src java/jni example/client example/client-simple example/client-brski $(examples_extra)
> ++if ENABLE_JNI
> ++libest_jni = java/jni
> ++endif

This actually looks like an actual error, indeed. Probably this should
be the first patch in the stack (first, fix issues, then add feautres).

[--SNIP--]
> diff --git a/package/libest/0003-Ditch-examples-compilation.patch b/package/libest/0003-Ditch-examples-compilation.patch
> new file mode 100644
> index 0000000000..59d54b3a63
> --- /dev/null
> +++ b/package/libest/0003-Ditch-examples-compilation.patch
> @@ -0,0 +1,47 @@
> +From 746aeaedd22e8f716b85b31c96059d1d54ecbb46 Mon Sep 17 00:00:00 2001
> +From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
> +Date: Sun, 12 Jul 2020 20:34:33 +0000
> +Subject: [PATCH] Ditch examples compilation

You would need to explain why we should "ditch" the examples (also,
"exclude" would be better).

And this would be much better is that were an upstreamable patch, with
probably an ---enable-examples/--disable-examples configure option.

[--SNIP--]
> diff --git a/package/libest/Config.in b/package/libest/Config.in
> new file mode 100644
> index 0000000000..e9ec18e243
> --- /dev/null
> +++ b/package/libest/Config.in
> @@ -0,0 +1,32 @@
> +comment "libest needs a glibc toolchain"
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC
> +
> +config BR2_PACKAGE_LIBEST
> +	bool "libest"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	select BR2_PACKAGE_OPENSSL
> +	help
> +	  libest is a C implementation of RFC 7030 (Enrollment over
> +	  Secure Transport).
> +
> +	  It can be used to provision public key certificates from
> +	  a certificate authority (CA) or registration authority (RA)
> +	  to end-user devices and network infrastructure devices.
> +
> +	  https://github.com/cisco/libest
> +
> +if BR2_PACKAGE_LIBEST
> +
> +config BR2_PACKAGE_LIBEST_LIBCURL
> +	bool "libcurl support"
> +	select BR2_PACKAGE_LIBCURL

We usually do not add per-feature subopitons, but instead rely on the
dependency being enabled to enable the feature (see below).

> +config BR2_PACKAGE_LIBEST_LIBURIPARSER
> +	bool "liburiparser support"
> +	select BR2_PACKAGE_LIBURIPARSER

Ditto.

> +config BR2_PACKAGE_LIBEST_LIBSAFEC
> +	bool "libsafec support"
> +	select BR2_PACKAGE_SAFECLIB

Ditto.

> +endif # BR2_PACKAGE_LIBEST
> diff --git a/package/libest/libest.hash b/package/libest/libest.hash
> new file mode 100644
> index 0000000000..51dd1fccc0
> --- /dev/null
> +++ b/package/libest/libest.hash
> @@ -0,0 +1,3 @@
> +# Computed locally
> +sha256  324b3a2b16cd14ea4234d75fa90f08b29509bac9cd3795c44268e22f906ee0ad  r3.2.0.tar.gz
> +sha256  fbdb055f98babf8d86095d6f9b9e34d2ff21a8212e442b8f18bdcb403e44366c  LICENSE
> diff --git a/package/libest/libest.mk b/package/libest/libest.mk
> new file mode 100644
> index 0000000000..5c939f96b9
> --- /dev/null
> +++ b/package/libest/libest.mk
> @@ -0,0 +1,40 @@
> +################################################################################
> +#
> +# libest
> +#
> +################################################################################
> +
> +LIBEST_VERSION = 3.2.0
> +LIBEST_SOURCE = r$(LIBEST_VERSION).tar.gz
> +LIBEST_SITE = https://github.com/cisco/libest/archive

You want to use the github helper here (do not set LBESTSOURCE):

    LIBEST_VERSION = 3.2.0
    LIBEST_SITE = $(call github,cisco,libest,$(LIBEST_VERSION))

> +LIBEST_LICENSE = MIT
> +LIBEST_LICENSE_FILES = LICENSE
> +LIBEST_INSTALL_STAGING = YES
> +LIBEST_AUTORECONF = YES
> +LIBEST_DEPENDENCIES = openssl
> +LIBEST_CONF_OPTS = --with-ssl-dir=$(STAGING_DIR)/usr \
> +		$(if $(BR2_TOOLCHAIN_HAS_THREADS),,--disable-pthreads)

As soon as there are more than one line, put all the options on a line
by themselves:

    LIBEST_CONF_OPTS = \
        --with-ssl-dir=$(STAGING_DIR)/usr \
        $(if $(BR2_TOOLCHAIN_HAS_THREADS),,--disable-pthreads)

However, the test in configure.ac is flawed:

    AC_ARG_ENABLE([pthreads],
            [AS_HELP_STRING([--disable-pthreads],
                            [Disable support for pthreads])],
            [pthreads_on=1],
            [pthreads_on=0])

The third argument is "action-if-given" and the fourthe argument is
"action-if-not-given" [0]. Which means that, whether you pass
--enable-pthreads or --disable-pthreads, the third argument will be
executed, that is "pthreads_on=1". And if you pass neither, the fourth
argument will be executed, i.e. "pthreads_on=0".

So, what you wrote above does exactly the opposite of what you expect:
it disables pthread on toolchains that has them, and enables pthreads on
toolchains that don't.

[0] https://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.69/autoconf.html#Package-Options

> +ifeq ($(BR2_PACKAGE_LIBEST_LIBCURL),y)
> +LIBEST_CONF_OPTS += --with-libcurl-dir=$(STAGING_DIR)/usr
> +LIBEST_DEPENDENCIES += libcurl
> +endif

So here, we would enable the libcurl support if libcurl is enabled.
Also, we want to be explicit about disabling libcurl as well.

    ifeq ($(BR2_PACKAGE_LIBCURL),y)
    LIBEST_DEPENDENCIES += libcurl
    LIBEST_CONF_OPTS += --with-libcurl-dir=$(STAGING_DIR)/usr
    else
    LIBEST_CONF_OPTS += --without-libcurl-dir
    endif

> +ifeq ($(BR2_PACKAGE_LIBEST_LIBURIPARSER),y)
> +LIBEST_CONF_OPTS += --with-uriparser-dir=$(STAGING_DIR)/usr
> +LIBEST_DEPENDENCIES += liburiparser
> +endif

Ditto.

> +ifeq ($(BR2_PACKAGE_LIBEST_LIBSAFEC),y)
> +LIBEST_CONF_OPTS += --with-system-libsafec
> +LIBEST_DEPENDENCIES += safeclib
> +endif

Ditto.

> +define LIBEST_INSTALL_PC
> +	$(INSTALL) -c -m 0644 $(LIBEST_PKGDIR)/libest.pc \
> +			$(STAGING_DIR)/usr/lib/pkgconfig/libest.pc
> +endef
> +
> +LIBEST_POST_INSTALL_STAGING_HOOKS += LIBEST_INSTALL_PC
> +
> +$(eval $(autotools-package))
> diff --git a/package/libest/libest.pc b/package/libest/libest.pc
> new file mode 100644
> index 0000000000..8e59170baa
> --- /dev/null
> +++ b/package/libest/libest.pc
> @@ -0,0 +1,10 @@
> +prefix=/usr
> +exec_prefix=${prefix}
> +libdir=${exec_prefix}/lib
> +includedir=${prefix}/include
> +
> +Name: libest
> +Description: implementation of RFC 7030 (Enrollment over Secure Transport) 
> +Version: 2.1.0
> +Libs: -L${libdir} -lest

I'm not sure if the -L${libdir} is needed or not: it is the default
search path, so it should not be needed.

Care to look into the avbove, and respin an updated patch, please?

Thanks!

Regards,
Yann E. MORIN.

> +Cflags: -I${includedir}/est
> -- 
> 2.17.1
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
