From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 May 2018 21:34:58 +0200
Subject: [Buildroot] [PATCH 1/1] aircrack-ng: bump to version 1.2
In-Reply-To: <20180529171409.8794-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 29 May 2018 19:14:09 +0200")
References: <20180529171409.8794-1-fontaine.fabrice@gmail.com>
Message-ID: <87d0xe5k7x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Remove patch (already in version)
 > - Add three patches (first one sent and merged upstream, second and
 >   third patchs retrieved upstream)
 > - Move to autotools-package
 > - Remove workaround for static handling of pthread as it isn't needed
 >   anymore
 > - Remove deactivation of libnl in static build as it isn't needed
 >   anymore
 > - Update workaround for static handling of libpcap
 > - Add hash for license file

[snip]

> +++ b/package/aircrack-ng/Config.in
 > @@ -3,9 +3,7 @@ config BR2_PACKAGE_AIRCRACK_NG
 >  	depends on BR2_USE_MMU # uses fork()
 >  	depends on BR2_TOOLCHAIN_HAS_THREADS
 >  	depends on BR2_INSTALL_LIBSTDCPP
 > -	# libnl has issues when linking statically
 > -	# they need fixing in libnl itself
 > -	select BR2_PACKAGE_LIBNL if !BR2_STATIC_LIBS
 > +	select BR2_PACKAGE_LIBNL

Looking at the m4 files, it looks as if libnl is supposed to be
optional. If so, then we shouldn't force it here.

 >  	select BR2_PACKAGE_OPENSSL

It also looks as if libgcrypt can be used instead of openssl.

 >  	select BR2_PACKAGE_ZLIB

And zlib looks to be optional as well.

> +++ b/package/aircrack-ng/aircrack-ng.mk
 > @@ -4,69 +4,42 @@
 >  #
 >  ################################################################################
 
 > -AIRCRACK_NG_VERSION = 1.2-rc4
 > +AIRCRACK_NG_VERSION = 1.2
 >  AIRCRACK_NG_SITE = http://download.aircrack-ng.org
 >  AIRCRACK_NG_LICENSE = GPL-2.0+
 >  AIRCRACK_NG_LICENSE_FILES = LICENSE
 > -AIRCRACK_NG_DEPENDENCIES = openssl zlib host-pkgconf
 > +AIRCRACK_NG_DEPENDENCIES = \
 > +	libnl \
 > +	openssl \
 > +	$(if $(BR2_PACKAGE_PCRE),pcre) \
 > +	zlib \
 > +	host-pkgconf
 > +AIRCRACK_NG_AUTORECONF = YES
 >  # Enable buddy-ng, easside-ng, tkiptun-ng, wesside-ng
 > -AIRCRACK_NG_MAKE_OPTS = unstable=true
 > -
 > -# Account for libpthread in static
 > -AIRCRACK_NG_LDFLAGS = $(TARGET_LDFLAGS) \
 > -	$(if $(BR2_STATIC_LIBS),-lpthread -lz)
 > -
 > -# libnl support has issues when building static
 > -ifeq ($(BR2_STATIC_LIBS),y)
 > -AIRCRACK_NG_MAKE_OPTS += libnl=false
 > -else
 > -AIRCRACK_NG_MAKE_OPTS += libnl=true
 > -AIRCRACK_NG_DEPENDENCIES += libnl
 > -endif
 > +AIRCRACK_NG_CONF_OPTS = --with-experimental

Is this the replacement for unstable=true? According to the m4 files,
this defaults to off.


 >  ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
 > -AIRCRACK_NG_MAKE_OPTS += STACK_PROTECTOR=true
 > +AIRCRACK_NG_CONF_OPTS += --with-opt
 >  else
 > -AIRCRACK_NG_MAKE_OPTS += STACK_PROTECTOR=false
 > +AIRCRACK_NG_CONF_OPTS += --without-opt

Hmm, --with-opt seems to be related to adding -O3 to CFLAGS or not:

AC_ARG_WITH(opt,
    [AS_HELP_STRING([--without-opt],
        [disable -O3 optimizations])])

AS_IF([test "x$enable_code_coverage" = "xno"], [
    case $with_opt in
        yes | "")
            AX_CHECK_COMPILE_FLAG([-O3], [
                AX_APPEND_FLAG(-O3, [opt_[]_AC_LANG_ABBREV[]flags])
            ])
        ;;
    esac
])

There also seems to be a check for ethtool. This by default looks if
ethtool is available in the path on the host. We should detect if
BR2_PACKAGE_ETHTOOL is enabled and point it to it.

-- 
Bye, Peter Korsgaard
