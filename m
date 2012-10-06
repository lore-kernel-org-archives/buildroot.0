From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 06 Oct 2012 14:12:50 +0200
Subject: [Buildroot] [PATCH v8 02/11] perl: new package
In-Reply-To: <1348593508-14254-2-git-send-email-francois.perrad@gadz.org>
References: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
 <1348593508-14254-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <50702042.1070702@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/09/12 19:18, Francois Perrad wrote:
> Signed-off-by: Francois Perrad<francois.perrad@gadz.org>

  Perl build system is way beyond my understanding, so here are just some generic
comments.

  It may still take a while before your patches make it into the
repository, so please hang on!

[snip]

> diff --git a/package/perl/perl-make-ext.patch b/package/perl/perl-make-ext.patch
> new file mode 100644
> index 0000000..e0195e7
> --- /dev/null
> +++ b/package/perl/perl-make-ext.patch
> @@ -0,0 +1,24 @@
> +Don't use RUN with make (only for perl)

  As Thomas wrote, this patch description is not enough to understand it.
In particular, describe why a patch is needed in the first place.

> +
> +Signed-off-by: Francois Perrad<francois.perrad@gadz.org>
> +
> +Index: b/make_ext.pl
> +===================================================================
> +--- a/make_ext.pl
> ++++ b/make_ext.pl
> +@@ -458,11 +458,13 @@
> + 	# Give makefile an opportunity to rewrite itself.
> + 	# reassure users that life goes on...
> + 	my @args = ('config', @$pass_through);
> +-	system(@run, @make, @args) and print "@run @make @args failed, continuing anyway...\n";
> ++#	system(@run, @make, @args) and print "@run @make @args failed, continuing anyway...\n";
> ++	system(@make, @args) and print "@make @args failed, continuing anyway...\n";

  Since any future maintenance will be based on the patch itself, it's
not necessary to keep the original statement around in a comment -
it's already there in the patch itself.

[snip]
> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
> new file mode 100644
> index 0000000..7d60ca7
> --- /dev/null
> +++ b/package/perl/perl.mk
> @@ -0,0 +1,99 @@
> +#############################################################
> +#
> +# perl
> +#
> +#############################################################
> +
> +PERL_VERSION_MAJOR = 16
> +PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
> +PERL_SITE = http://www.cpan.org/src/5.0
> +PERL_SOURCE = perl-$(PERL_VERSION).tar.bz2
> +PERL_LICENSE = Artistic
> +PERL_LICENSE_FILES = Artistic
> +PERL_INSTALL_STAGING = YES
> +PERL_DEPENDENCIES = host-qemu
> +
> +ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
> +    PERL_USE_DEVEL=-Dusedevel
> +endif

  This one certainly deserves some explanation...

> +
> +ifneq ($(BR2_LARGEFILE),y)
> +    PERL_NO_LARGEFILE=-Uuselargefiles
> +endif
> +
> +PERL_ARCH=$(ARCH)
> +ifeq ($(PERL_ARCH),i686)
> +    PERL_ARCH=i386
> +endif
> +PERL_QEMU_USER_MODE=$(HOST_DIR)/usr/bin/qemu-$(PERL_ARCH)
> +
> +define PERL_CONFIGURE_CMDS
> +	rm -f $(@D)/config.sh
> +	(cd $(@D); ./Configure -des \
> +		-Dusecrosscompile \
> +		-Dtargetrun=$(PERL_QEMU_USER_MODE) \
> +		-Dqemulib=$(STAGING_DIR) \
> +		-Dtargethost=dummy \
> +		-Dar="$(TARGET_AR)" \
> +		-Dcc="$(TARGET_CC)" \
> +		-Dcpp="$(TARGET_CC)" \
> +		-Dld="$(TARGET_LD)" \
> +		-Dnm="$(TARGET_NM)" \
> +		-Dranlib="$(TARGET_RANLIB)" \
> +		-Dccflags="$(TARGET_CFLAGS)" \
> +		-Dldflags="$(TARGET_LDFLAGS) -l gcc_s" \
> +		-Dlddlflags="-shared" \
> +		-Dlibc=$(TARGET_HOST)/usr/$(GNU_TARGET_NAME)/sysroot/lib/libc.so \
> +		-Duseshrplib \
> +		-Dprefix=/usr \
> +		-Uoptimize \

  It would be nicer to define a variable PERL_CONF_OPT that contains
all these configure options.  Then you can also use += to extended
it instead of defining PERL_USE_DEVEL etc.

> +		$(PERL_USE_DEVEL) \
> +		$(PERL_NO_LARGEFILE))
> +	echo "# patched values">>$(@D)/config.sh
> +	$(SED) '/^myarchname=/d' \
> +		-e '/^mydomain=/d' \
> +		-e '/^myhostname=/d' \
> +		-e '/^myuname=/d' \
> +		-e '/^osname=/d' \
> +		-e '/^osvers=/d' \
> +		-e '/^perladmin=/d' \
> +		$(@D)/config.sh
> +	echo "myarchname='$(GNU_TARGET_NAME)'">>$(@D)/config.sh
> +	echo "mydomain=''">>$(@D)/config.sh
> +	echo "myhostname='$(BR2_TARGET_GENERIC_HOSTNAME)'">>$(@D)/config.sh
> +	echo "myuname='Buildroot $(BR2_VERSION_FULL)'">>$(@D)/config.sh
> +	echo "osname='linux'">>$(@D)/config.sh
> +	echo "osvers='$(BR2_LINUX_KERNEL_VERSION)'">>$(@D)/config.sh
> +	echo "perladmin='root'">>$(@D)/config.sh
> +	(cd $(@D); ./Configure -S)
> +	cp $(@D)/config.h $(@D)/xconfig.h
> +	$(SED) 's/UNKNOWN-/Buildroot $(BR2_VERSION_FULL) /' $(@D)/patchlevel.h
> +endef
> +
> +define PERL_BUILD_CMDS
> +	echo "#!/bin/sh">  $(@D)/Cross/miniperl
> +	echo "$(PERL_QEMU_USER_MODE) $(@D)/miniperl \"\$$@\"">>$(@D)/Cross/miniperl
> +	chmod +x $(@D)/Cross/miniperl

  Wouldn't it make more sense to create miniperl as part of the configure step?
I mean, when you rebuild perl, there's no need to recreate miniperl, right?

> +	PERL_MM_OPT="PERL=$(@D)/Cross/miniperl" \
> +	$(MAKE) -C $(@D) all

  Minor nit: I prefer to see indentation if you continue a line like this.

> +endef
> +
> +define PERL_INSTALL_STAGING_CMDS
> +	$(MAKE) INSTALL_DEPENDENCE= \
> +		INSTALLFLAGS= \
> +		DESTDIR="$(STAGING_DIR)" \
> +		-C $(@D) install.perl
> +endef
> +
> +define PERL_INSTALL_TARGET_CMDS
> +	$(MAKE) INSTALL_DEPENDENCE= \
> +		INSTALLFLAGS=-p \
> +		DESTDIR="$(TARGET_DIR)" \
> +		-C $(@D) install.perl
> +endef
> +
> +define PERL_CLEAN_CMDS
> +	-$(MAKE) -C $(@D) clean
> +endef
> +
> +$(eval $(generic-package))

  All in all, looks pretty good!  Not tested, though.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
