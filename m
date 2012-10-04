From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Oct 2012 22:46:41 +0200
Subject: [Buildroot] [PATCH v8 07/11] cpanminus: new package
In-Reply-To: <1348593508-14254-7-git-send-email-francois.perrad@gadz.org>
References: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
 <1348593508-14254-7-git-send-email-francois.perrad@gadz.org>
Message-ID: <20121004224641.622486b8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois,

On Tue, 25 Sep 2012 19:18:23 +0200, Francois Perrad wrote:
> diff --git a/package/cpanminus/cpanminus.mk b/package/cpanminus/cpanminus.mk
> new file mode 100644
> index 0000000..1b2857a
> --- /dev/null
> +++ b/package/cpanminus/cpanminus.mk
> @@ -0,0 +1,44 @@
> +#############################################################
> +#
> +# cpanminus
> +#
> +#############################################################
> +
> +CPANMINUS_VERSION = 1.5018
> +CPANMINUS_SOURCE = miyagawa-cpanminus-$(CPANMINUS_VERSION)-0-gee6cd30.tar.gz
> +CPANMINUS_SITE = https://github.com/miyagawa/cpanminus/tarball/$(CPANMINUS_VERSION)
> +CPANMINUS_DEPENDENCIES = perl $(call qstrip,$(BR2_PACKAGE_CPANMINUS_NATIVE_DEPENDENCIES))
> +
> +CPANMINUS_ARCH=$(ARCH)
> +ifeq ($(CPANMINUS_ARCH),i686)
> +    CPANMINUS_ARCH=i386
> +endif

Same comment: not complete, and please share all those Qemu definitions
in the host-qemu package. It should probably define TARGET_QEMU_USER to
$(HOST_DIR)/usr/bin/qemu-$(QEMU_ARCH). Unless of course they are not
related to Qemu.

> +CPANMINUS_QEMU_USER_MODE=$(HOST_DIR)/usr/bin/qemu-$(CPANMINUS_ARCH)
> +CPANMINUS_RUN_PERL=$(CPANMINUS_QEMU_USER_MODE) $(STAGING_DIR)/usr/bin/perl
> +CPANMINUS_ARCHNAME=$(shell $(CPANMINUS_RUN_PERL) -MConfig -e "print Config->{archname}")
> +CPANMINUS_PERL_LIB=$(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)
> +CPANMINUS_PERL_ARCHLIB=$(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(CPANMINUS_ARCHNAME)

CPANMINUS_PERL_ARCHLIB = $(CPANMINUS_PERL_LIB)/$(CPANMINUS_ARCHNAME)

> +CPANMINUS_PERL_SITELIB=$(TARGET_DIR)/usr/lib/perl5/site_perl/$(PERL_VERSION)
> +CPANMINUS_PERL_SITEARCH=$(TARGET_DIR)/usr/lib/perl5/site_perl/$(PERL_VERSION)/$(CPANMINUS_ARCHNAME)

CPANMINUS_PERL_SITEARCH = $(CPANMINUS_PERL_SITELIB)/$(CPANMINUS_ARCHNAME) 

> +CPANMINUS_PERL5LIB=$(CPANMINUS_PERL_SITEARCH):$(CPANMINUS_PERL_SITELIB):$(CPANMINUS_PERL_ARCHLIB):$(CPANMINUS_PERL_LIB)


> +ifneq ($(BR2_PACKAGE_CPANMINUS_MIRROR),"")
> +    CPANMINUS_MIRROR=--mirror $(call qstrip,$(BR2_PACKAGE_CPANMINUS_MIRROR)) --mirror-only
> +endif

CPANMINUS_MIRROR = $(call qstrip,$(BR2_PACKAGE_CPANMINUS_MIRROR)
ifneq ($(CPANMINUS_MIRROR),y)
	CPANMINUS_CONF_OPT += --mirror $(CPANMINUS_MIRROR) --mirror-only
endif

And also, put space before and after equal sign when defining make variables.

> +define CPANMINUS_INSTALL_TARGET_CMDS
> +	echo "#!/bin/sh"                                                        > $(@D)/run_perl
> +	echo "PERL5LIB=$(CPANMINUS_PERL5LIB) $(CPANMINUS_RUN_PERL) \"\$$@\""    >>$(@D)/run_perl
> +	chmod +x $(@D)/run_perl
> +	PERL5LIB=$(CPANMINUS_PERL5LIB) \
> +	PERL_MM_OPT="DESTDIR=$(TARGET_DIR) PERL=$(@D)/run_perl PERL_LIB=$(CPANMINUS_PERL_LIB) PERL_ARCHLIB=$(CPANMINUS_PERL_ARCHLIB)" \
> +	PERL_MB_OPT="--destdir $(TARGET_DIR)" \
> +	RUN_PERL="$(@D)/run_perl" \
> +	$(CPANMINUS_RUN_PERL) $(@D)/cpanm \
> +		--perl=$(@D)/run_perl \
> +		--notest \
> +		--no-man-pages \
> +		$(CPANMINUS_MIRROR) \
> +		$(call qstrip,$(BR2_PACKAGE_CPANMINUS_MODULES))
> +endef
> +
> +$(eval $(generic-package))
> diff --git a/package/perl/perl-fix-Module-Build.patch b/package/perl/perl-fix-Module-Build.patch
> new file mode 100644
> index 0000000..26b15e4
> --- /dev/null
> +++ b/package/perl/perl-fix-Module-Build.patch
> @@ -0,0 +1,16 @@
> +
> +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Patch description please.

> +
> +Index: b/cpan/Module-Build/lib/Module/Build/Base.pm
> +===================================================================
> +--- a/cpan/Module-Build/lib/Module/Build/Base.pm
> ++++ b/cpan/Module-Build/lib/Module/Build/Base.pm
> +@@ -456,7 +456,7 @@
> +   my $proto = shift;
> +   my $c     = ref($proto) ? $proto->{config} : 'Module::Build::Config';
> + 
> +-  my $perl  = $^X;
> ++  my $perl  = $ENV{RUN_PERL} || $^X;
> +   my $perl_basename = File::Basename::basename($perl);
> + 
> +   my @potential_perls;

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
