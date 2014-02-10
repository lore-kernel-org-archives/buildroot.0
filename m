From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Feb 2014 08:16:15 +0100
Subject: [Buildroot] [pkg-perl infra V5 2/8] pkg-perl: new infrastructure
In-Reply-To: <1391763337-30660-3-git-send-email-francois.perrad@gadz.org>
References: <1391763337-30660-1-git-send-email-francois.perrad@gadz.org>
 <1391763337-30660-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <52F87CBF.4030205@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/07/14 09:55, Francois Perrad wrote:
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  Config.in           |   10 +++
>  package/Makefile.in |    4 +-
>  package/pkg-perl.mk |  198 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 211 insertions(+), 1 deletion(-)
>  create mode 100644 package/pkg-perl.mk
> 
> diff --git a/Config.in b/Config.in
> index 7ec7c2a..678fe8d 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -225,6 +225,16 @@ config BR2_LUAROCKS_MIRROR
>  
>  	  See http://luarocks.org
>  
> +config BR2_CPAN_MIRROR
> +	string "CPAN mirror"
> +	default "http://search.cpan.org/CPAN"
> +	help
> +	  CPAN has multiple software mirrors scattered around the world.
> +	  This option allows you to select a mirror.
> +
> +	  The list of mirrors is available at:
> +	  http://search.cpan.org/mirror
> +
>  endmenu
>  
>  config BR2_JLEVEL
> diff --git a/package/Makefile.in b/package/Makefile.in
> index d0b1cfd..41f73cb 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -206,7 +206,8 @@ HOST_PATH=$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(PATH)
>  HOSTCC_VERSION:=$(shell $(HOSTCC_NOCCACHE) --version | \
>  	sed -n 's/^.* \([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)[ ]*.*$$/\1\2\3/p')
>  
> -HOST_PERL5LIB = $(HOST_DIR)/usr/lib/perl
> +HOST_PERL_ARCHNAME := $(shell perl -MConfig -e "print Config->{archname}")
> +HOST_PERL5LIB = $(HOST_DIR)/usr/lib/perl5/$(HOST_PERL_ARCHNAME):$(HOST_DIR)/usr/lib/perl5
>  
>  TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
>  		AR="$(TARGET_AR)" \
> @@ -376,4 +377,5 @@ include package/pkg-autotools.mk
>  include package/pkg-cmake.mk
>  include package/pkg-luarocks.mk
>  include package/pkg-python.mk
> +include package/pkg-perl.mk

 perl comes before python.

>  include package/pkg-generic.mk
> diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
> new file mode 100644
> index 0000000..bf9fddf
> --- /dev/null
> +++ b/package/pkg-perl.mk
> @@ -0,0 +1,198 @@
> +################################################################################
> +# Perl package infrastructure
> +#
> +# This file implements an infrastructure that eases development of
> +# package .mk files for Perl packages.
> +#
> +# See the Buildroot documentation for details on the usage of this
> +# infrastructure
> +#
> +# In terms of implementation, this perl infrastructure requires
> +# the .mk file to only specify metadata information about the
> +# package: name, version, download URL, etc.
> +#
> +# We still allow the package .mk file to override what the different
> +# steps are doing, if needed. For example, if <PKG>_BUILD_CMDS is
> +# already defined, it is used as the list of commands to perform to
> +# build the package, instead of the default perl behaviour. The
> +# package can also define some post operation hooks.
> +#
> +################################################################################
> +
> +PKG_PERL_ARCHNAME	= $(ARCH)-linux

 This one should just be PERL_ARCHNAME.

 However, I don't think it's very relevant to define this variable. Just
use $(ARCH)-linux directly.

> +
> +################################################################################
> +# inner-perl-package -- defines how the configuration, compilation and
> +# installation of a perl package should be done, implements a
> +# few hooks to tune the build process for perl specifities and
> +# calls the generic package infrastructure to generate the necessary
> +# make targets
> +#
> +#  argument 1 is the lowercase package name
> +#  argument 2 is the uppercase package name, including an HOST_ prefix
> +#             for host packages
> +#  argument 3 is the uppercase package name, without the HOST_ prefix
> +#             for host packages
> +#  argument 4 is the type (target or host)
> +################################################################################
> +
> +define inner-perl-package
> +
> +$(2)_CONF_OPT			?=
> +$(2)_BUILD_OPT			?=
> +$(2)_INSTALL_OPT		?=
> +$(2)_INSTALL_TARGET_OPT		?=

 As I wrote in my last review: you can just remove these, they're useless.


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
