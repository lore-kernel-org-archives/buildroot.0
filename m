From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Oct 2012 22:40:01 +0200
Subject: [Buildroot] [PATCH v8 02/11] perl: new package
In-Reply-To: <1348593508-14254-2-git-send-email-francois.perrad@gadz.org>
References: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
 <1348593508-14254-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <20121004224001.5e1ef233@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois,

On Tue, 25 Sep 2012 19:18:18 +0200, Francois Perrad wrote:

> diff --git a/package/perl/Config.in b/package/perl/Config.in
> new file mode 100644
> index 0000000..6b7a986
> --- /dev/null
> +++ b/package/perl/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_PERL
> +	bool "perl"
> +	select BR2_PACKAGE_HOST_QEMU

As per my suggestion on the host-qemu package, you can remove this
select statement.

> +	help
> +	  Larry Wall's Practical Extraction and Report Language
> +	  An interpreted scripting language, known among some as "Unix's Swiss
> +	  Army Chainsaw".
> +
> +	  http://www.perl.org/
> diff --git a/package/perl/perl-configure-qemu.patch b/package/perl/perl-configure-qemu.patch
> new file mode 100644
> index 0000000..921ac0b
> --- /dev/null
> +++ b/package/perl/perl-configure-qemu.patch
> @@ -0,0 +1,43 @@
> +Add qemu support
> +
> +see https://rt.perl.org/rt3//Public/Bug/Display.html?id=114798
> +
> +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> +
> +Index: b/Configure
> +===================================================================
> +--- a/Configure
> ++++ b/Configure
> +@@ -2868,7 +2868,7 @@
> + 	case "$targetfrom" in
> + 	'') targetfrom=scp ;;
> + 	esac
> +-    	run=$run-$targetrun
> ++    	run=$run-`basename $targetrun`
> +     	to=$to-$targetto
> +     	from=$from-$targetfrom
> + 	case "$targetdir" in
> +@@ -2908,6 +2908,14 @@
> + $targetrun -l $targetuser $targethost "cd \$cwd && ./\$exe \$@"
> + EOF
> + 	    ;;
> ++	*qemu*)
> ++	    to=:
> ++	    from=:
> ++	    cat >$run <<EOF
> ++#!/bin/sh
> ++$targetrun -L $qemulib "\$@"
> ++EOF
> ++	    ;;
> + 	*)  echo "Unknown targetrun '$targetrun'" >&4
> + 	    exit 1
> + 	    ;;
> +@@ -5048,7 +5056,7 @@
> + echo " ";
> + echo "Checking if your compiler accepts $flag" 2>&1;
> + echo "int main(void) { return 0; }" > gcctest.c;
> +-if $cc -O2 $flag -o gcctest gcctest.c 2>gcctest.out && ./gcctest; then
> ++if $cc -O2 $flag -o gcctest gcctest.c 2>gcctest.out && $run ./gcctest; then
> +     echo "Yes, it does." 2>&1;
> +     if $test -s gcctest.out ; then
> +         echo "But your platform does not like it:";
> diff --git a/package/perl/perl-make-ext.patch b/package/perl/perl-make-ext.patch
> new file mode 100644
> index 0000000..e0195e7
> --- /dev/null
> +++ b/package/perl/perl-make-ext.patch
> @@ -0,0 +1,24 @@
> +Don't use RUN with make (only for perl)
> +
> +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

I would really to see a bit more details in the patch descriptions.
This is probably enough for you to understand what's going on, but not
for people reviewing your code, or people that will end up maintaining
this if you move away from Buildroot :-)

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

Same comments as the QEMU_ARCH definition. And it should clearly be
shared with the host-qemu package.

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

Doh, what is target host? Why aren't you simply using:

		-Dlibc="$(STAGING_DIR)/lib/libc.so" ?

> +		-Duseshrplib \
> +		-Dprefix=/usr \
> +		-Uoptimize \
> +		$(PERL_USE_DEVEL) \
> +		$(PERL_NO_LARGEFILE))
> +	echo "# patched values"                 >>$(@D)/config.sh
> +	$(SED) '/^myarchname=/d' \
> +		-e '/^mydomain=/d' \
> +		-e '/^myhostname=/d' \
> +		-e '/^myuname=/d' \
> +		-e '/^osname=/d' \
> +		-e '/^osvers=/d' \
> +		-e '/^perladmin=/d' \
> +		$(@D)/config.sh
> +	echo "myarchname='$(GNU_TARGET_NAME)'"                  >>$(@D)/config.sh
> +	echo "mydomain=''"                                      >>$(@D)/config.sh
> +	echo "myhostname='$(BR2_TARGET_GENERIC_HOSTNAME)'"      >>$(@D)/config.sh
> +	echo "myuname='Buildroot $(BR2_VERSION_FULL)'"          >>$(@D)/config.sh
> +	echo "osname='linux'"                                   >>$(@D)/config.sh
> +	echo "osvers='$(BR2_LINUX_KERNEL_VERSION)'"             >>$(@D)/config.sh
> +	echo "perladmin='root'"                                 >>$(@D)/config.sh
> +	(cd $(@D); ./Configure -S)
> +	cp $(@D)/config.h $(@D)/xconfig.h
> +	$(SED) 's/UNKNOWN-/Buildroot $(BR2_VERSION_FULL) /' $(@D)/patchlevel.h
> +endef
> +
> +define PERL_BUILD_CMDS
> +	echo "#!/bin/sh"                                        > $(@D)/Cross/miniperl
> +	echo "$(PERL_QEMU_USER_MODE) $(@D)/miniperl \"\$$@\""   >>$(@D)/Cross/miniperl
> +	chmod +x $(@D)/Cross/miniperl
> +	PERL_MM_OPT="PERL=$(@D)/Cross/miniperl" \
> +	$(MAKE) -C $(@D) all
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

That's all I have for now on this patch.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
