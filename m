From: Nicolas =?utf-8?B?TcOpbsOpZ2FsZQ==?= <nicolas.menegale@openwide.fr>
Date: Wed, 24 Jul 2013 16:51:03 +0200 (CEST)
Subject: [Buildroot] [PATCH 1/1] cppcms: new package
In-Reply-To: <1674420667.688777.1373542968823.JavaMail.root@openwide.fr>
Message-ID: <1427118541.2999984.1374677463212.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Any news ?

Thanks a lot,
Nicolas.

----- Mail original -----
> De: "Nicolas M?n?gale" <nicolas.menegale@openwide.fr>
> ?: buildroot at busybox.net
> Cc: "Nicolas Menegale" <nicolas.menegale@openwide.fr>
> Envoy?: Jeudi 11 Juillet 2013 13:42:48
> Objet: [PATCH 1/1] cppcms: new package
> 
> Signed-off-by: Nicolas M?n?gale <nicolas.menegale@openwide.fr>
> ---
> v2: iconv/icu related modifications
> The user can now choose if he want's to build cppcms using icu for
> having
> advanced localization features or using iconv.
> Also in the case that the user uses iconv, if the toolchains already
> integrate
> it, iconv won't be compiled.
> Sorry for the long time it took me to do this modification.
> CppCMS is a C++ web framework. The cppcms.mk also copy into the host
> after
> staging install two scripts needed when you compile an application
> using the
> web framework (cppcms_tmpl_cc).
> As discussed on IRC it's not worth creating an host-cppcms package
> for one
> script.
> ---
>  package/Config.in        |    1 +
>  package/cppcms/Config.in |   30 ++++++++++++++++++++++++++++++
>  package/cppcms/cppcms.mk |   24 ++++++++++++++++++++++++
>  3 files changed, 55 insertions(+)
>  create mode 100644 package/cppcms/Config.in
>  create mode 100644 package/cppcms/cppcms.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index b588a0c..7036e24 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -591,6 +591,7 @@ source "package/apr/Config.in"
>  source "package/apr-util/Config.in"
>  source "package/libcofi/Config.in"
>  source "package/classpath/Config.in"
> +source "package/cppcms/Config.in"
>  source "package/elfutils/Config.in"
>  source "package/fftw/Config.in"
>  source "package/libargtable2/Config.in"
> diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
> new file mode 100644
> index 0000000..b6e3f9a
> --- /dev/null
> +++ b/package/cppcms/Config.in
> @@ -0,0 +1,30 @@
> +config BR2_PACKAGE_CPPCMS
> +	bool "cppcms"
> +	select BR2_PACKAGE_ZLIB
> +	select BR2_PACKAGE_PCRE
> +	select BR2_PACKAGE_LIBGCRYPT
> +	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE &&
> !BR2_PACKAGE_CPPCMS_ICU
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_USE_WCHAR
> +	help
> +	  CppCMS is a Free High Performance Web Development Framework
> +	  (not a CMS) aimed for Rapid Web Application Development.
> +	  It differs from most of other web development frameworks
> +	  like: Python Django, Java Servlets in following:
> +	  It is designed and tuned to handle extremely high loads.
> +	  It uses modern C++ as primary development language in order to
> achieve first
> +	  goal.
> +	  It is aimed on development of both Web Sites and Web Services.
> +
> +	  http://cppcms.com
> +
> +config BR2_PACKAGE_CPPCMS_ICU
> +	bool "use icu instead of iconv"
> +	depends on BR2_PACKAGE_CPPCMS
> +	select BR2_PACKAGE_ICU
> +	help
> +	  Using ICU allows advanced localization features into CppCMS,
> +	  in another hand ICU is heavier than iconv.
> +
> +comment "cppcms requires a toolchain with C++ & WCHAR support
> enabled"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
> diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
> new file mode 100644
> index 0000000..af9e573
> --- /dev/null
> +++ b/package/cppcms/cppcms.mk
> @@ -0,0 +1,24 @@
> +#############################################################
> +#
> +# CppCMS
> +#
> +#############################################################
> +
> +CPPCMS_VERSION = 1.0.3
> +CPPCMS_SOURCE = cppcms-$(CPPCMS_VERSION).tar.bz2
> +CPPCMS_LICENSE = LGPLv3
> +CPPCMS_LICENSE_FILE = COPYING.TXT
> +CPPCMS_SITE =
> http://downloads.sourceforge.net/project/cppcms/cppcms/$(CPPCMS_VERSION)
> +CPPCMS_INSTALL_STAGING = YES
> +CPPCMS_CONF_OPT = $(if
> $(BR2_PACKAGE_CPPCMS_ICU),-DDISABLE_ICONV=ON,)
> +CPPCMS_DEPENDENCIES = zlib pcre $(if
> $(BR2_PACKAGE_CPPCMS_ICU),icu,$(if $(BR2_ENABLE_LOCALE),,libiconv))
> libgcrypt
> +
> +# We copy cppcms_tmpl_cc from staging to host because this file can
> be needed
> +# for compiling packages using cppcms. And it is not worth creating
> a host
> +# package just for a python script.
> +define CPPCMS_INSTALL_HOST_TOOLS
> +	cp $(STAGING_DIR)/usr/bin/cppcms_tmpl_cc
> $(HOST_DIR)/usr/bin/cppcms_tmpl_cc
> +endef
> +CPPCMS_POST_INSTALL_STAGING_HOOKS += CPPCMS_INSTALL_HOST_TOOLS
> +
> +$(eval $(cmake-package))
> --
> 1.7.9.5
> 
