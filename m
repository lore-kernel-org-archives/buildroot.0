From: Dan Pattison <dan.pattison@ethertek.ca>
Date: Thu, 08 Nov 2012 19:01:01 -0800
Subject: [Buildroot] [PATCH] perl: build with perlcross instead of qemu
In-Reply-To: <1352425626-10628-1-git-send-email-arnout@mind.be>
References: <1352425626-10628-1-git-send-email-arnout@mind.be>
Message-ID: <509C71ED.9010906@ethertek.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 11/8/2012 5:47 PM, Arnout Vandecappelle (Essensium/Mind) wrote:
> The perlcross project makes it possible to properly cross-compile
> perl.  It creates a host-miniperl that is configured for the target
> and uses that to cross-compile the perl modules.
>
> Unfortunately there are still a few hacks needed to make it work.
> Proper fixes can be developed and upstreamed later.
>
> Since there is no longer a dependency on qemu, it works on all
> architectures again.
>
> Also removed some config options:
> - BR2_PACKAGE_PERL_CUSTOM_INSTALL just allows a selection of modules;
> this can also be encoded by an empty BR2_PACKAGE_PERL_MODULES.
> - BR2_PACKAGE_PERL_DB_FILE and BR2_PACKAGE_PERL_GDBM_FILE can be
> derived automatically from the package configs.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> This is still a bit RFC.  I've tested in on a glibc x86_64, on a
> minimal internal powerpc and a glibc ARM.  I haven't tested with any
> of the autobuilder configurations, but I expect it will at least be
> better than what we get now...
>
> Francois, can you check if it also runs?  I've only done build tests.
>
> Peter, if Francois confirms that the perl binary actually runs and if
> he has no other concerns, then I'd commit this patch quickly and wait
> for the autobuilder fallout.
>   package/perl/Config.in |   40 +++----------
>   package/perl/perl.mk   |  153 ++++++++++++++++++++----------------------------
>   2 files changed, 71 insertions(+), 122 deletions(-)
>
> diff --git a/package/perl/Config.in b/package/perl/Config.in
> index 0642deb..b2991b0 100644
> --- a/package/perl/Config.in
> +++ b/package/perl/Config.in
> @@ -1,12 +1,5 @@
>   config BR2_PACKAGE_PERL
>   	bool "perl"
> -	depends on !BR2_avr32
> -	depends on !BR2_bfin
> -	depends on !BR2_sh2
> -	depends on !BR2_sh2a
> -	depends on !BR2_sh3
> -	depends on !BR2_sh3eb
> -	depends on !BR2_sh64
>   	help
>   	  Larry Wall's Practical Extraction and Report Language
>   	  An interpreted scripting language, known among some as "Unix's Swiss
> @@ -16,35 +9,18 @@ config BR2_PACKAGE_PERL
>   
>   if BR2_PACKAGE_PERL
>   
> -config BR2_PACKAGE_PERL_CUSTOM_INSTALL
> -	bool "custom install"
> -	help
> -	  Don't use the full install target
> -	  Install only a selection of modules (like microperl).
> -
>   config BR2_PACKAGE_PERL_MODULES
> -	string "additional modules"
> -	depends on BR2_PACKAGE_PERL_CUSTOM_INSTALL
> +	string "custom module selection"
>   	help
> -	  List of space-separated perl modules to copy to the rootfs.
> -
> -	  Examples: constant.pm Getopt/Std.pm Time/Local.pm
> +	  List of space-separated perl modules (without .pm) to copy to the
> +	  rootfs.
>   
> -	  Module dependencies are not automatic so check your needs.
> +	  Examples: constant Getopt/Std Time/Local
>   
> -config BR2_PACKAGE_PERL_DB_FILE
> -	bool "DB_File"
> -	select BR2_PACKAGE_BERKELEYDB
> -	help
> -	  Build the DB_File module.
> +	  Module dependencies on external libraries are not automatic so
> +	  check your needs.
>   
> -config BR2_PACKAGE_PERL_GDBM_FILE
> -	bool "GDBM_File"
> -	select BR2_PACKAGE_GDBM
> -	help
> -	  Build the GDBM_File module.
> +	  Leave empty for all modules (as far as the external libraries
> +	  are available).
>   
>   endif
> -
> -comment "perl requires an architecture supported by qemu"
> -	depends on BR2_avr32 || BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh3 || BR2_sh3eb || BR2_sh64
> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
> index 81dff04..f3c73dd 100644
> --- a/package/perl/perl.mk
> +++ b/package/perl/perl.mk
> @@ -12,7 +12,26 @@ PERL_LICENSE = Artistic
>   PERL_LICENSE_FILES = Artistic
>   PERL_INSTALL_STAGING = YES
>   
> -PERL_DEPENDENCIES = host-qemu
> +PERL_CROSS_VERSION = 0.7
> +PERL_CROSS_SITE    = http://download.berlios.de/perlcross
> +PERL_CROSS_SOURCE  = perl-5.$(PERL_VERSION_MAJOR).0-cross-$(PERL_CROSS_VERSION).tar.gz
> +
> +# We use the perlcross hack to cross-compile perl. It should
> +# be extracted over the perl sources, so we don't define that
> +# as a separate package. Instead, it is downloaded and extracted
> +# together with perl
> +
> +define PERL_CROSS_DOWNLOAD
> +	$(call DOWNLOAD,$(PERL_CROSS_SITE)/$(PERL_CROSS_SOURCE))
> +endef
> +PERL_POST_DOWNLOAD_HOOKS += PERL_CROSS_DOWNLOAD
> +
> +define PERL_CROSS_EXTRACT
> +	$(INFLATE$(suffix $(PERL_CROSS_SOURCE))) $(DL_DIR)/$(PERL_CROSS_SOURCE) | \
> +	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
> +endef
> +PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
> +
>   ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
>       PERL_DEPENDENCIES += berkeleydb
>   endif
> @@ -20,23 +39,31 @@ ifeq ($(BR2_PACKAGE_GDBM),y)
>       PERL_DEPENDENCIES += gdbm
>   endif
>   
> -PERL_CONF_OPT = -des \
> -		-Dusecrosscompile \
> -		-Dtargetrun=$(QEMU_USER) \
> -		-Dqemulib=$(STAGING_DIR) \
> -		-Dar="$(TARGET_AR)" \
> -		-Dcc="$(TARGET_CC)" \
> -		-Dcpp="$(TARGET_CC)" \
> -		-Dld="$(TARGET_LD)" \
> -		-Dnm="$(TARGET_NM)" \
> -		-Dranlib="$(TARGET_RANLIB)" \
> -		-Dccflags="$(TARGET_CFLAGS)" \
> -		-Dldflags="$(TARGET_LDFLAGS) -lgcc_s -lm" \
> -		-Dlddlflags="-shared" \
> -		-Dlibc=$(STAGING_DIR)/lib/libc.so \
> -		-Duseshrplib \
> -		-Dprefix=/usr \
> -		-Uoptimize
> +# Normally, --mode=cross should automatically do the two steps
> +# below, but it doesn't work for some reason.
> +PERL_HOST_CONF_OPT = \
> +	--mode=buildmini \
> +	--target=$(GNU_TARGET_NAME) \
> +	--target-arch=$(GNU_TARGET_NAME) \
> +	--set-target-name=$(GNU_TARGET_NAME)
> +
> +# We have to override LD, because an external multilib toolchain ld is not
> +# wrapped to provide the required sysroot options.  We also can't use ccache
> +# because the configure script doesn't support it.
> +PERL_CONF_OPT = \
> +	--mode=target \
> +	--target=$(GNU_TARGET_NAME) \
> +	--target-tools-prefix=$(TARGET_CROSS) \
> +	--prefix=/usr \
> +	-Dld="$(TARGET_CC_NOCCACHE)" \
> +	-A ccflags="$(TARGET_CFLAGS)" \
> +	-A ldflags="$(TARGET_LDFLAGS) -lm" \
> +	-A mydomain="" \
> +	-A myhostname="$(BR2_TARGET_GENERIC_HOSTNAME)" \
> +	-A myuname="Buildroot $(BR2_VERSION_FULL)" \
> +	-A osname=linux \
> +	-A osvers=$(LINUX_VERSION) \
> +	-A perlamdin=root
>   
>   ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
>       PERL_CONF_OPT += -Dusedevel
> @@ -46,93 +73,39 @@ ifneq ($(BR2_LARGEFILE),y)
>       PERL_CONF_OPT += -Uuselargefiles
>   endif
>   
> +PERL_MODULES = $(call qstrip,$(BR2_PACKAGE_PERL_MODULES))
> +ifneq ($(PERL_MODULES),)
> +PERL_CONF_OPT += --only-mod=$(subst $(space),$(comma),$(PERL_MODULES))
> +endif
> +
>   define PERL_CONFIGURE_CMDS
> -	rm -f $(@D)/config.sh
> -	(cd $(@D); ./Configure $(PERL_CONF_OPT))
> -	echo "# patched values"                                 >>$(@D)/config.sh
> -	$(SED) '/^myarchname=/d' \
> -		-e '/^mydomain=/d' \
> -		-e '/^myhostname=/d' \
> -		-e '/^myuname=/d' \
> -		-e '/^osname=/d' \
> -		-e '/^osvers=/d' \
> -		-e '/^perladmin=/d' \
> -		$(@D)/config.sh
> -	echo "myarchname='$(GNU_TARGET_NAME)'"                  >>$(@D)/config.sh
> -	echo "mydomain=''"                                      >>$(@D)/config.sh
> -	echo "myhostname='$(BR2_TARGET_GENERIC_HOSTNAME)'"      >>$(@D)/config.sh
> -	echo "myuname='Buildroot $(BR2_VERSION_FULL)'"          >>$(@D)/config.sh
> -	echo "osname='linux'"                                   >>$(@D)/config.sh
> -	echo "osvers='$(BR2_LINUX_KERNEL_VERSION)'"             >>$(@D)/config.sh
> -	echo "perladmin='root'"                                 >>$(@D)/config.sh
> -	(cd $(@D); ./Configure -S)
> -	cp $(@D)/config.h $(@D)/xconfig.h
> +	(cd $(@D); HOSTCC='$(HOSTCC_NOCACHE)' ./configure $(PERL_HOST_CONF_OPT))
> +	(cd $(@D); ./configure $(PERL_CONF_OPT))
>   	$(SED) 's/UNKNOWN-/Buildroot $(BR2_VERSION_FULL) /' $(@D)/patchlevel.h
>   endef
>   
> +# perlcross's miniperl_top forgets base, which is required by mktables.
> +# Instead of patching, it's easier to just set PERL5LIB
>   define PERL_BUILD_CMDS
> -	echo "#!/bin/sh"                                > $(@D)/Cross/miniperl
> -	echo "$(QEMU_USER) $(@D)/miniperl \"\$$@\""     >>$(@D)/Cross/miniperl
> -	chmod +x $(@D)/Cross/miniperl
> -	PERL_MM_OPT="PERL=$(@D)/Cross/miniperl" \
> -		$(MAKE) -C $(@D) all
> +	PERL5LIB=$(@D)/dist/base/lib $(MAKE1) -C $(@D) perl modules
>   endef
>   
>   define PERL_INSTALL_STAGING_CMDS
> -	$(MAKE) INSTALL_DEPENDENCE= \
> -		INSTALLFLAGS= \
> -		DESTDIR="$(STAGING_DIR)" \
> -		-C $(@D) install.perl
> +	PERL5LIB=$(@D)/dist/base/lib $(MAKE1) -C $(@D) DESTDIR="$(STAGING_DIR)" install.perl
>   endef
>   
> -PERL_RUN_PERL = $(QEMU_USER) $(@D)/perl -Ilib
> -PERL_ARCHNAME = $(shell $(PERL_RUN_PERL) -MConfig -e "print Config->{archname}")
> -PERL_LIB = $(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)
> -PERL_ARCHLIB = $(PERL_LIB)/$(PERL_ARCHNAME)
> -PERL_MODS = $(call qstrip,$(BR2_PACKAGE_PERL_MODULES))
> -# Minimal set of modules required for 'perl -V' to work
> -PERL_ARCH_MODS = Config.pm Config_git.pl Config_heavy.pl
> -PERL_BASE_MODS = strict.pm vars.pm warnings.pm warnings/register.pm
> -
> -define PERL_INSTALL_MODULES
> -	for i in $(PERL_ARCH_MODS); do \
> -		$(INSTALL) -m 0644 -D $(@D)/lib/$$i $(PERL_ARCHLIB)/$$i; \
> -	done
> -	for i in $(PERL_BASE_MODS); do \
> -		$(INSTALL) -m 0644 -D $(@D)/lib/$$i $(PERL_LIB)/$$i; \
> -	done
> -	for i in $(PERL_MODS); do \
> -		j=`echo $$i|cut -d : -f 1` ; \
> -		if [ -d $(@D)/lib/$$j ] ; then \
> -			cp -af $(@D)/lib/$$j $(PERL_LIB) ; \
> -		fi ; \
> -		if [ -f $(@D)/lib/$$i ] ; then \
> -			$(INSTALL) -m 0644 -D $(@D)/lib/$$i $(PERL_LIB)/$$i; \
> -		fi ; \
> -	done
> -	# Remove test files
> -	find $(PERL_LIB) -type f -name *.t -exec rm -f {} \;
> -endef
> +PERL_INSTALL_TARGET_GOALS = install.perl
> +ifeq ($(BR2_HAVE_DOCUMENTATION),y)
> +PERL_INSTALL_TARGET_GOALS += install.man
> +endif
> +
>   
> -ifeq ($(BR2_PACKAGE_PERL_CUSTOM_INSTALL),y)
> -define PERL_INSTALL_TARGET_CMDS
> -	$(INSTALL) -m 0755 -D $(@D)/perl $(TARGET_DIR)/usr/bin/perl
> -	$(INSTALL) -m 0755 -D $(@D)/libperl.so $(PERL_ARCHLIB)/CORE/libperl.so
> -	$(PERL_INSTALL_MODULES)
> -endef
> -else
>   define PERL_INSTALL_TARGET_CMDS
> -	$(MAKE) INSTALL_DEPENDENCE= \
> -		INSTALLFLAGS=-p \
> -		DESTDIR="$(TARGET_DIR)" \
> -		-C $(@D) install.perl
> -	rm -f $(PERL_ARCHLIB)/CORE/*.h
> -	find $(PERL_ARCHLIB) -type f -name *.bs -exec rm -f {} \;
> +	PERL5LIB=$(@D)/dist/base/lib $(MAKE1) -C $(@D) DESTDIR="$(TARGET_DIR)" $(PERL_INSTALL_TARGET_GOALS)
>   endef
> -endif
>   
>   define PERL_CLEAN_CMDS
> -	-$(MAKE) -C $(@D) clean
> +	-$(MAKE1) -C $(@D) clean
>   endef
>   
>   $(eval $(generic-package))
Hello,

In the perlcross Makefile, if you change perl5160delta.pod   to 
perl5162delta.pod in three places then you can compile the newest 
perl-5.16.2. Tested for arm, confirmed working.

Regards,

Dan Pattison
Ethertek Circuits
