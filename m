From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 20 Oct 2014 00:50:30 +0200
Subject: [Buildroot] [PATCH] intltool: fix build
In-Reply-To: <1413571681-27963-1-git-send-email-francois.perrad@gadz.org>
References: <1413571681-27963-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <54444036.4090906@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/10/14 20:48, Francois Perrad wrote:
> fix various build failures caused by host-perl serie
> 
> Currently, the variables PERL & PERL2LIB are available
> only during the configure step of host-intltool.
> There are also needed when running host-intltool,
> in all package which depends on host-intltool.
> 
> So, there are now global, but in the perl infrastructure,
> we cannot use them.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Makefile.in          | 9 +++++++--
>  package/intltool/intltool.mk | 3 ---
>  package/pkg-perl.mk          | 2 +-
>  3 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index ab59b54..b5d407c 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -232,6 +232,9 @@ HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/
>  HOSTCC_VERSION := $(shell $(HOSTCC_NOCCACHE) --version | \
>  	sed -n 's/^.* \([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)[ ]*.*$$/\1\2\3/p')
>  
> +export PERL=$(shell which perl)

 Isn't this the default, i.e. redundant?

> +export PERL5LIB=$(HOST_DIR)/usr/lib/perl

 This one is probably needed indeed.

> +
>  TARGET_CONFIGURE_OPTS = PATH=$(BR_PATH) \
>  		AR="$(TARGET_AR)" \
>  		AS="$(TARGET_AS)" \
> @@ -267,7 +270,8 @@ TARGET_CONFIGURE_OPTS = PATH=$(BR_PATH) \
>  		LDFLAGS="$(TARGET_LDFLAGS)" \
>  		FCFLAGS="$(TARGET_FCFLAGS)" \
>  		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
> -		STAGING_DIR="$(STAGING_DIR)"
> +		STAGING_DIR="$(STAGING_DIR)" \
> +		INTLTOOL_PERL=$(PERL)

 This will only be used by intltool itself (to replace the @INTLTOOL_PERL@
stanza in the intltool-*.in files), so it should move to the host-intltool package.

 Actually, I even think that it's quite wrong for the TARGET_CONFIGURE_OPTS
because it would only be used by the target intltool, which shouldn't use
whatever path the system's perl is in.

>  
>  TARGET_MAKE_ENV = PATH=$(BR_PATH)
>  
> @@ -292,7 +296,8 @@ HOST_CONFIGURE_OPTS = PATH=$(BR_PATH) \
>  		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
>  		PKG_CONFIG_SYSROOT_DIR="/" \
>  		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig" \
> -		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)"
> +		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)" \
> +		INTLTOOL_PERL=$(PERL)

 So it's this one that should move to intltool


 Regards,
 Arnout.

>  
>  HOST_MAKE_ENV = PATH=$(BR_PATH) \
>  		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)" \
> diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
> index a7afe0d..549cb3b 100644
> --- a/package/intltool/intltool.mk
> +++ b/package/intltool/intltool.mk
> @@ -10,9 +10,6 @@ INTLTOOL_LICENSE = GPLv2+
>  INTLTOOL_LICENSE_FILES = COPYING
>  
>  HOST_INTLTOOL_DEPENDENCIES = host-gettext host-libxml-parser-perl
> -HOST_INTLTOOL_CONF_OPTS = \
> -	PERL=`which perl` \
> -	PERL5LIB=$(HOST_DIR)/usr/lib/perl
>  
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
> index f41a2f9..6577588 100644
> --- a/package/pkg-perl.mk
> +++ b/package/pkg-perl.mk
> @@ -20,7 +20,7 @@
>  ################################################################################
>  
>  PERL_ARCHNAME = $(ARCH)-linux
> -PERL_RUN = $(HOST_DIR)/usr/bin/perl
> +PERL_RUN = PERL5LIB= $(HOST_DIR)/usr/bin/perl
>  
>  ################################################################################
>  # inner-perl-package -- defines how the configuration, compilation and
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
