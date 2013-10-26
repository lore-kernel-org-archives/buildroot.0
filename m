From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Fri, 25 Oct 2013 22:12:09 -0500
Subject: [Buildroot] [PATCH 5/5] thrift: new package
In-Reply-To: <1382703323-31038-5-git-send-email-gustavo@zacarias.com.ar>
References: <1382703323-31038-1-git-send-email-gustavo@zacarias.com.ar>
 <1382703323-31038-5-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <OFFFC3A740.7C7B430A-ON86257C10.000F397E-86257C10.001197E6@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

Please see my comments below.

Gustavo Zacarias <gustavo@zacarias.com.ar> wrote on 10/25/2013 07:15:23 
AM:

> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in                             |  1 +
>  package/thrift/Config.in                      | 22 +++++++++++
>  package/thrift/thrift-01-libevent-cross.patch | 16 ++++++++
>  package/thrift/thrift-02-autoreconf.patch     | 22 +++++++++++
>  package/thrift/thrift-03-zlib-cross.patch     | 16 ++++++++
>  package/thrift/thrift.mk                      | 54 
+++++++++++++++++++++++++++
>  6 files changed, 131 insertions(+)
>  create mode 100644 package/thrift/Config.in
>  create mode 100644 package/thrift/thrift-01-libevent-cross.patch
>  create mode 100644 package/thrift/thrift-02-autoreconf.patch
>  create mode 100644 package/thrift/thrift-03-zlib-cross.patch
>  create mode 100644 package/thrift/thrift.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 16cb36d..319b7d5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -639,6 +639,7 @@ source "package/openpgm/Config.in"
>  source "package/ortp/Config.in"
>  source "package/slirp/Config.in"
>  source "package/snmppp/Config.in"
> +source "package/thrift/Config.in"
>  source "package/usbredir/Config.in"
>  source "package/wvstreams/Config.in"
>  source "package/zeromq/Config.in"
> diff --git a/package/thrift/Config.in b/package/thrift/Config.in
> new file mode 100644
> index 0000000..38a8897
> --- /dev/null
> +++ b/package/thrift/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_THRIFT
> +   bool "thrift"
> +   depends on BR2_INSTALL_LIBSTDCPP
> +   depends on BR2_USE_WCHAR
> +   depends on BR2_LARGEFILE
> +   depends on BR2_TOOLCHAIN_HAS_THREADS
> +   select BR2_PACKAGE_BOOST
> +   select BR2_PACKAGE_LIBEVENT
> +   select BR2_PACKAGE_OPENSSL
> +   help
> +     The Apache Thrift software framework, for scalable cross-language
> +     services development, combines a software stack with a
> +     code generation engine to build services that work
> +     efficiently and seamlessly between C++, Java, Python, PHP, Ruby,
> +     Erlang, Perl, Haskell, C#, Cocoa, JavaScript, Node.js, Smalltalk,
> +     OCaml and Delphi and other languages.
> +
> +     http://thrift.apache.org/
> +
> +comment "thrift needs a toolchain w/ C++, largefile, wchar, threads"
> +   depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || \
> +      !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/thrift/thrift-01-libevent-cross.patch 
b/package/thrift/thrift-01-libevent-cross.patch
> new file mode 100644
> index 0000000..f07caa7
> --- /dev/null
> +++ b/package/thrift/thrift-01-libevent-cross.patch
> @@ -0,0 +1,16 @@
> +Make it cross-compile happy the hard way, there's no clean way.
> +
> +Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> +
> +diff -Nura thrift-0.9.1.orig/aclocal/ax_lib_event.m4 
thrift-0.9.1/aclocal/ax_lib_event.m4
> +--- thrift-0.9.1.orig/aclocal/ax_lib_event.m4   2013-08-15 
11:04:29.000000000 -0300
> ++++ thrift-0.9.1/aclocal/ax_lib_event.m4   2013-10-07 
20:40:44.076435613 -0300
> +@@ -75,7 +75,7 @@
> +           AC_LANG_PUSH([C])
> +           dnl This can be changed to AC_LINK_IFELSE if you are 
cross-compiling,
> +           dnl but then the version cannot be checked.
> +-          AC_RUN_IFELSE([AC_LANG_PROGRAM([[
> ++          AC_LINK_IFELSE([AC_LANG_PROGRAM([[
> +           #include <sys/types.h>
> +           #include <event.h>
> +           ]], [[
> diff --git a/package/thrift/thrift-02-autoreconf.patch 
b/package/thrift/thrift-02-autoreconf.patch
> new file mode 100644
> index 0000000..d56212a
> --- /dev/null
> +++ b/package/thrift/thrift-02-autoreconf.patch
> @@ -0,0 +1,22 @@
> +Fillers to make autoreconf (automake) happy.
> +
> +Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> +
> +diff -Nura thrift-0.9.1.orig/AUTHORS thrift-0.9.1/AUTHORS
> +--- thrift-0.9.1.orig/AUTHORS   1969-12-31 21:00:00.000000000 -0300
> ++++ thrift-0.9.1/AUTHORS   2013-10-07 20:45:15.745315148 -0300
> +@@ -0,0 +1,2 @@
> ++
> ++
> +diff -Nura thrift-0.9.1.orig/ChangeLog thrift-0.9.1/ChangeLog
> +--- thrift-0.9.1.orig/ChangeLog   1969-12-31 21:00:00.000000000 -0300
> ++++ thrift-0.9.1/ChangeLog   2013-10-07 20:45:23.078554836 -0300
> +@@ -0,0 +1,2 @@
> ++
> ++
> +diff -Nura thrift-0.9.1.orig/NEWS thrift-0.9.1/NEWS
> +--- thrift-0.9.1.orig/NEWS   1969-12-31 21:00:00.000000000 -0300
> ++++ thrift-0.9.1/NEWS   2013-10-07 20:45:20.351465699 -0300
> +@@ -0,0 +1,2 @@
> ++
> ++
> diff --git a/package/thrift/thrift-03-zlib-cross.patch 
b/package/thrift/thrift-03-zlib-cross.patch
> new file mode 100644
> index 0000000..3af39c4
> --- /dev/null
> +++ b/package/thrift/thrift-03-zlib-cross.patch
> @@ -0,0 +1,16 @@
> +Make zlib version detection cross-compile happy.
> +
> +Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> +
> +diff -Nura thrift-0.9.1.orig/aclocal/ax_lib_zlib.m4 
thrift-0.9.1/aclocal/ax_lib_zlib.m4
> +--- thrift-0.9.1.orig/aclocal/ax_lib_zlib.m4   2013-08-15 
11:04:29.000000000 -0300
> ++++ thrift-0.9.1/aclocal/ax_lib_zlib.m4   2013-10-07 20:47:44.523177973 
-0300
> +@@ -73,7 +73,7 @@
> +           #   (defined in the library).
> +           AC_LANG_PUSH([C])
> +           dnl This can be changed to AC_LINK_IFELSE if you are 
cross-compiling.
> +-          AC_RUN_IFELSE([AC_LANG_PROGRAM([[
> ++          AC_LINK_IFELSE([AC_LANG_PROGRAM([[
> +           #include <zlib.h>
> +           #if ZLIB_VERNUM >= 0x$WANT_ZLIB_VERSION
> +           #else
> diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
> new file mode 100644
> index 0000000..53e1b97
> --- /dev/null
> +++ b/package/thrift/thrift.mk
> @@ -0,0 +1,54 @@
> 
+################################################################################
> +#
> +# thrift
> +#
> 
+################################################################################
> +
> +THRIFT_VERSION = 0.9.1
> +THRIFT_SITE = http://www.us.apache.org/dist/thrift/$(THRIFT_VERSION)
> +THRIFT_DEPENDENCIES = host-pkgconf host-thrift boost libevent openssl
> +HOST_THRIFT_DEPENDENCIES = host-boost host-libevent host-openssl 
host-pkgconf
> +THRIFT_CONF_OPT = --with-sysroot=$(STAGING_DIR) --with-tests=no \
> +   --with-boost=$(STAGING_DIR)
> +HOST_THRIFT_CONF_OPT = --with-sysroot=$(HOST_DIR) --with-tests=no
> +THRIFT_AUTORECONF = YES

Could you move the license to right below the site? It doesn't really 
matter but I guess I like to see version, site, license as the first 
things in a package. I guess there isn't any official standard to the way 
a package makefile should be in but I guess that is just my person 
preference. 

> +THRIFT_LICENSE = Apache 2.0
> +THRIFT_LICENSE_FILES = LICENSE
> +
> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +# openssl uses zlib, so we need to explicitly link with it when static
> +THRIFT_CONF_ENV += LIBS=-lz

Shouldn't you add a dependancy on libz then?

THRIFT_DEPENDCIES += zlib

> +endif
> +
> +# Language selection
> +# The generator (host tool) works with all of them regardless
> +# This is just for the libraries / bindings
> +THRIFT_LANG_CONF_OPT += --without-csharp --without-java 
--without-erlang \
> +   --without-python --without-perl --without-php 
--without-php_extension \
> +   --without-ruby --without-haskell --without-go --without-d
> +HOST_THRIFT_CONF_OPT += $(THRIFT_LANG_CONF_OPT) --without-c_glib
> +THRIFT_CONF_OPT += $(THRIFT_LANG_CONF_OPT)
> +
> +# C bindings
> +ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
> +THRIFT_DEPENDENCIES += libglib2
> +else
> +THRIFT_CONF_OPT += --without-c_glib
> +endif
> +
> +# De-hardcode THRIFT for cross compiling
> +define THRIFT_BUILD_CMDS
> +   for f in `find $(@D) -name Makefile -type f`; do \
> +      $(SED) "/^THRIFT =/d" $$f; \
> +   done
> +   $(SED) "s:top_builddir)/compiler/cpp/thrift:THRIFT):" 
$(@D)/tutorial/Makefile
> +   $(TARGET_MAKE_ENV) $(MAKE) THRIFT=$(HOST_DIR)/usr/bin/thrift -C 
$(@D)
> +endef
> +

I haven't tested this so I don't fully understand what exactly what you 
are doing here. I see that this is an autotools package but it doesn't 
appear to be building or installing using the autotools infrastructure. 
Could you please elaborate a little bit more of why exactly you can't use 
autotoools to build for this? I believe I understand what you are doing 
here but I guess I would like a few more details from you. 

Also it looks like thrift is a compiler, so wouldn't we want to have this 
available as a host tool because presumably there would be a need to to 
add custom user packages that utilize Thrift to compile their application. 
Again I haven't had time to read further what exactly thrift does but 
these are just the few things that are coming to my mind tonight.

I will try to investigate this a little bit more in the coming days (next 
week) but for now this are my initial reaction comments.

> +# Install runtime only
> +define THRIFT_INSTALL_TARGET_CMDS
> +   $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/lib DESTDIR=$(TARGET_DIR) 
install
> +endef
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> -- 
> 1.8.1.5

Thanks,
-Ryan
