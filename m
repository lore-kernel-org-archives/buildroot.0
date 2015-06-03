From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 04 Jun 2015 00:28:18 +0200
Subject: [Buildroot] [PATCH 3/3] kyua: new package
In-Reply-To: <1433357276-7083-4-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
References: <1433357276-7083-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
 <1433357276-7083-4-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <556F7F82.4070802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/03/15 20:47, Sebastien Bourdelin wrote:
> Kyua is a testing framework for infrastructure software, originally
> designed to equip BSD-based operating systems with a test suite. This
> means that Kyua is lightweight and simple, and that Kyua integrates
> well with various build systems and continuous integration frameworks.
> 
> https://github.com/jmmv/kyua
> 
> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
> ---
>  package/Config.in      |  1 +
>  package/kyua/Config.in | 18 ++++++++++++++++++
>  package/kyua/kyua.hash |  2 ++
>  package/kyua/kyua.mk   | 26 ++++++++++++++++++++++++++
>  4 files changed, 47 insertions(+)
>  create mode 100644 package/kyua/Config.in
>  create mode 100644 package/kyua/kyua.hash
>  create mode 100644 package/kyua/kyua.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 628f36c..3b2a886 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -73,6 +73,7 @@ menu "Debugging, profiling and benchmark"
>  	source "package/kexec/Config.in"
>  	source "package/kexec-lite/Config.in"
>  	source "package/ktap/Config.in"
> +	source "package/kyua/Config.in"
>  	source "package/latencytop/Config.in"
>  	source "package/lmbench/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> diff --git a/package/kyua/Config.in b/package/kyua/Config.in
> new file mode 100644
> index 0000000..8f86918
> --- /dev/null
> +++ b/package/kyua/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_KYUA
> +	bool "kyua"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_PACKAGE_HAS_LUAINTERPRETER # lutok
> +	select BR2_PACKAGE_ATF
> +	select BR2_PACKAGE_LUTOK
> +	select BR2_PACKAGE_SQLITE
> +	help
> +	  Kyua is a testing framework for infrastructure software,
> +	  originally designed to equip BSD-based operating systems
> +	  with a test suite. This means that Kyua is lightweight
> +	  and simple, and that Kyua integrates well with various build
> +	  systems and continuous integration frameworks.
> +
> +	  https://github.com/jmmv/kyua
> +
> +comment "kyua needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP

 Repeat depends on BR2_PACKAGE_HAS_LUAINTERPRETER

> diff --git a/package/kyua/kyua.hash b/package/kyua/kyua.hash
> new file mode 100644
> index 0000000..1c9e055
> --- /dev/null
> +++ b/package/kyua/kyua.hash
> @@ -0,0 +1,2 @@
> +# Locally Calculted
> +sha256 55a2e1c5ab28748392cfed3b2783ed381ffe2d0247bca9a9ac19ae94fe029172 kyua-0.11.tar.gz
> diff --git a/package/kyua/kyua.mk b/package/kyua/kyua.mk
> new file mode 100644
> index 0000000..e467d99
> --- /dev/null
> +++ b/package/kyua/kyua.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# kyua
> +#
> +################################################################################
> +
> +KYUA_VERSION = 0.11
> +KYUA_SOURCE = kyua-$(KYUA_VERSION).tar.gz

 This is the default so not needed (actually for the other two packages as well,
forgot to mention).

> +KYUA_SITE = https://github.com/jmmv/kyua/archive

 Again, there's a release tarball for it.

> +KYUA_DEPENDENCIES = host-pkgconf atf lutok sqlite
> +KYUA_AUTORECONF = YES
> +KYUA_LICENSE = BSD

 BSD-3c

> +KYUA_LICENSE_FILES = COPYING
> +KYUA_CONF_ENV = \
> +	kyua_cv_attribute_noreturn=yes \
> +	kyua_cv_getcwd_dyn=yes \
> +	kyua_cv_lchmod_works=no \
> +	kyua_cv_getopt_gnu=yes \
> +	kyua_cv_getopt_optind_reset_value=0 \
> +	kyua_cv_signals_lastno=15
> +
> +define KYUA_INSTALL_TARGET_CMDS

 So, you spend all this time building and then don't install anything? I guess
you meant to use a POST_INSTALL_HOOK instead?

 Regards,
 Arnout

> +	$(INSTALL) -D -m 644 $(@D)/examples/kyua.conf $(TARGET_DIR)/etc/kyua/kyua.conf
> +endef
> +
> +$(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
