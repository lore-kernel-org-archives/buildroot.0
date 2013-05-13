From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 13 May 2013 17:21:28 +0200
Subject: [Buildroot] [PATCH 1/1] cppcms: new package
In-Reply-To: <1366817732-27616-1-git-send-email-nicolas.menegale@openwide.fr>
References: <1366817732-27616-1-git-send-email-nicolas.menegale@openwide.fr>
Message-ID: <CAHXCMMKk_9+Dkf5N1-6vESLEb1K6dT+UOc1qD_jkh5CKn-K9Kw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nicolas,

2013/4/24 nmenegale <nicolas.menegale@openwide.fr>:
> Signed-off-by: Nicolas M?n?gale <nicolas.menegale@openwide.fr>
> ---
> v0: initial commit
> CppCMS is a C++ web framework. The cppcms.mk also copy into the host after staging install two
> scripts needed when you compile an application using the web framework (cppcms_tmpl_cc and cppcms_run)
> As discussed on IRC it's not worth creating an host-cppcms package for two script.
> Signed-off-by: nmenegale <nicolas.menegale@openwide.fr>
> ---
>  package/Config.in        |  1 +
>  package/cppcms/Config.in | 21 +++++++++++++++++++++
>  package/cppcms/cppcms.mk | 23 +++++++++++++++++++++++
>  3 files changed, 45 insertions(+)
>  create mode 100644 package/cppcms/Config.in
>  create mode 100644 package/cppcms/cppcms.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index ab514c7..3ade087 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -556,6 +556,7 @@ source "package/apr/Config.in"
>  source "package/apr-util/Config.in"
>  source "package/libcofi/Config.in"
>  source "package/classpath/Config.in"
> +source "package/cppcms/Config.in"
>  source "package/elfutils/Config.in"
>  source "package/fftw/Config.in"
>  source "package/libargtable2/Config.in"
> diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
> new file mode 100644
> index 0000000..b53ba18
> --- /dev/null
> +++ b/package/cppcms/Config.in
> @@ -0,0 +1,21 @@
> +config BR2_PACKAGE_CPPCMS
> +       bool "cppcms"
> +       select BR2_PACKAGE_ZLIB
> +       select BR2_PACKAGE_PCRE
> +       select BR2_PACKAGE_ICU
> +       select BR2_PACKAGE_LIBGCRYPT
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       depends on BR2_USE_WCHAR
> +       help
> +         CppCMS is a Free High Performance Web Development Framework
> +         (not a CMS) aimed for Rapid Web Application Development.
> +         It differs from most of other web development frameworks
> +         like: Python Django, Java Servlets in following:
> +         It is designed and tuned to handle extremely high loads.
> +         It uses modern C++ as primary development language in order to achieve first goal.
> +         It is aimed on development of both Web Sites and Web Services.
> +
> +         http://cppcms.com
> +
> +comment "cppcms requires a toolchain with C++ & WCHAR support enabled"
> +       depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
> diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
> new file mode 100644
> index 0000000..b3319c2
> --- /dev/null
> +++ b/package/cppcms/cppcms.mk
> @@ -0,0 +1,23 @@
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
> +CPPCMS_SITE = http://downloads.sourceforge.net/project/cppcms/cppcms/$(CPPCMS_VERSION)
> +CPPCMS_INSTALL_STAGING = YES
> +CPPCMS_INSTALL_TARGET = YES
useless, *_INSTALL_TARGET is YES by default.

> +CPPCMS_CONF_OPT = -DDISABLE_ICONV=ON
> +CPPCMS_DEPENDENCIES = zlib pcre icu libgcrypt
> +
> +define CPPCMS_INSTALL_HOST_TOOLS
> +       cp $(STAGING_DIR)/usr/bin/cppcms_tmpl_cc $(HOST_DIR)/usr/bin/cppcms_tmpl_cc
> +       cp $(STAGING_DIR)/usr/bin/cppcms_run $(HOST_DIR)/usr/bin/cppcms_run
Dubious...
This means the host-cppcms package should depend on the cppcms one;
usually that's the other way!

Also, if cppcms_{run,tmpl_cc} are binaries, this may only be valid if
the target system is compatible
with the host one... which is usually not the case.
However, if they're just bash or python scripts, it's ok; though I'd
prefer you copy them from the package
build directory rather than from the staging tree.


> +endef
> +CPPCMS_POST_INSTALL_STAGING_HOOKS += CPPCMS_INSTALL_HOST_TOOLS
> +
> +$(eval $(cmake-package))
> --
> 1.8.1.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel
