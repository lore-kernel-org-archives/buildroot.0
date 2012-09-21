From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 21 Sep 2012 23:29:57 +0200
Subject: [Buildroot] [UNSURE]Re:  [PATCH 01/13] perl: new package v6
In-Reply-To: <20120920215636.6d86b7b5@skate>
References: <1347107325-4163-1-git-send-email-francois.perrad@gadz.org>
 <20120920215636.6d86b7b5@skate>
Message-ID: <CAB0FRsu9fyH_9+QtLgbXrTMA=zqmR1io5vCO6cEYFQfwgtNcxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/9/20 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Francois Perrad,
>
> Thanks for your continued work on this. Some comments below.
>
> First, do not put the patch version in the patch title. If you want to
> have a version, it should be between the [] at the beginning of the
> title. Here is how you can do that with git:
>
> git format-patch --subject-prefix="PATCH v7" <yourbasebranch>
>
> On Sat,  8 Sep 2012 14:28:33 +0200, Francois Perrad wrote:
>> ---
>>  package/Config.in                      |    1 +
>>  package/perl/Config.in                 |   17 +++++
>>  package/perl/perl-configure-qemu.patch |   32 +++++++++
>>  package/perl/perl-make-ext.patch       |   24 +++++++
>>  package/perl/perl-mkppport.patch       |   37 ++++++++++
>>  package/perl/perl.mk                   |  121 ++++++++++++++++++++++++++++++++
>>  6 files changed, 232 insertions(+)
>>  create mode 100644 package/perl/Config.in
>>  create mode 100644 package/perl/perl-configure-qemu.patch
>>  create mode 100644 package/perl/perl-make-ext.patch
>>  create mode 100644 package/perl/perl-mkppport.patch
>>  create mode 100644 package/perl/perl.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index f308de7..00a79ab 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -262,6 +262,7 @@ source "package/wsapi/Config.in"
>>  source "package/xavante/Config.in"
>>  endmenu
>>  endif
>> +source "package/perl/Config.in"
>>  source "package/microperl/Config.in"
>>  source "package/php/Config.in"
>>  source "package/python/Config.in"
>> diff --git a/package/perl/Config.in b/package/perl/Config.in
>> new file mode 100644
>> index 0000000..286b09e
>> --- /dev/null
>> +++ b/package/perl/Config.in
>> @@ -0,0 +1,17 @@
>> +config BR2_PACKAGE_PERL
>> +     bool "perl"
>> +     help
>> +       Larry Wall's Practical Extraction and Report Language
>> +       An interpreted scripting language, known among some as "Unix's Swiss
>> +       Army Chainsaw".
>> +
>> +       http://www.perl.org/
>> +
>> +if BR2_PACKAGE_PERL
>> +
>> +config BR2_PACKAGE_PERL_CUSTOM_CONFIGURE
>> +     string "configuration flags"
>> +     help
>> +       Allows to add some flags to Configure.
>
> We don't typically offer such choice for packages. Is there a good
> reason for doing so in the case of Perl, rather than providing a few
> additional kconfig configuration options if needed?
>
>> +endif
>> diff --git a/package/perl/perl-configure-qemu.patch b/package/perl/perl-configure-qemu.patch
>> new file mode 100644
>> index 0000000..00f7539
>> --- /dev/null
>> +++ b/package/perl/perl-configure-qemu.patch
>> @@ -0,0 +1,32 @@
>> +Add qemu support
>> +
>
> Please explain in more details what this means, and whether this patch
> has a chance of being upstream or not.
>
> Also, it seems to imply that the build process of Perl would require
> Qemu. Or, Qemu is not amongst the requirements of Buildroot, and there
> is no host-qemu package in the dependencies of your package (and we
> don't have a host-qemu package). Yann E. Morin has posted a target
> package for qemu a while ago, but it hasn't been merged so far.
>
> That said, even so it is certainly possible to create a host-qemu
> package, I am a bit annoyed to see the build process of a package
> requiring qemu. Is there really no other way? I guess it uses qemu to
> run a bunch of tests on the target system. Is there no way to provide
> pre-defined values for those tests, on a per-architecture basis, rather
> than running those test applications in Qemu?
>

Qemu is not used for test, but for the configure and build step.
Perl is 'bootstrapped' by miniperl (a perl without any extension module),
during the build process, miniperl is running via qemu (user mode).

Perl doesn't use the "standard" autotools, Perl has a limited support
for cross-compiling
where the target executables are running on a real target through a
ssh connection.
The use of qemu (user mode) removes the need of a real target and the
ssh connection.

BR is shipped with 12 configs/qemu_*_defconfig files,
many users have already run 'apt-get install qemu-kvm qemu-kvm-extras'.

A host-qemu package (with the latest version) could be nice in the future.


>> diff --git a/package/perl/perl-make-ext.patch b/package/perl/perl-make-ext.patch
>> new file mode 100644
>> index 0000000..e0195e7
>> --- /dev/null
>> +++ b/package/perl/perl-make-ext.patch
>> @@ -0,0 +1,24 @@
>> +Don't use RUN with make (only for perl)
>> +
>> +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>
> Sorry, but the patch description is insufficient to understand what is
> going on here.
>
>> +
>> +Index: b/make_ext.pl
>> +===================================================================
>> +--- a/make_ext.pl
>> ++++ b/make_ext.pl
>> +@@ -458,11 +458,13 @@
>> +     # Give makefile an opportunity to rewrite itself.
>> +     # reassure users that life goes on...
>> +     my @args = ('config', @$pass_through);
>> +-    system(@run, @make, @args) and print "@run @make @args failed, continuing anyway...\n";
>> ++#   system(@run, @make, @args) and print "@run @make @args failed, continuing anyway...\n";
>> ++    system(@make, @args) and print "@make @args failed, continuing anyway...\n";
>> +     }
>> +     my @targ = ($target, @$pass_through);
>> +     print "Making $target in $ext_dir\n at run @make @targ\n";
>> +-    my $code = system(@run, @make, @targ);
>> ++#    my $code = system(@run, @make, @targ);
>> ++    my $code = system(@make, @targ);
>> +     die "Unsuccessful make($ext_dir): code=$code" if $code != 0;
>> +
>> +     chdir $return_dir || die "Cannot cd to $return_dir: $!";
>> diff --git a/package/perl/perl-mkppport.patch b/package/perl/perl-mkppport.patch
>> new file mode 100644
>> index 0000000..97f27a2
>> --- /dev/null
>> +++ b/package/perl/perl-mkppport.patch
>> @@ -0,0 +1,37 @@
>> +Add RUN
>> +
>> +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>
> Ditto.
>
>> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
>> new file mode 100644
>> index 0000000..2a8da79
>> --- /dev/null
>> +++ b/package/perl/perl.mk
>> @@ -0,0 +1,121 @@
>> +#############################################################
>> +#
>> +# perl
>> +#
>> +#############################################################
>> +
>> +PERL_VERSION_MAJOR = 16
>> +PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
>> +PERL_SITE = http://www.cpan.org/src/5.0
>> +PERL_SOURCE = perl-$(PERL_VERSION).tar.bz2
>> +PERL_LICENSE = Artistic
>> +PERL_LICENSE_FILES = Artistic
>> +PERL_INSTALL_STAGING = YES
>> +
>> +ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
>> +    PERL_USE_DEVEL=-Dusedevel
>> +endif
>> +
>> +ifneq ($(BR2_LARGEFILE),y)
>> +    PERL_NO_LARGEFILE=-Uuselargefiles
>> +endif
>> +
>> +PERL_ARCH=$(call qstrip,$(BR2_ARCH))
>
> You can use ARCH directly, it is already qstripped.

ok.

>
>> +ifeq ($(PERL_ARCH),i686)
>> +    PERL_ARCH=i386
>> +endif
>> +PERL_QEMU_USER_MODE=qemu-$(PERL_ARCH)
>> +
>> +define PERL_CONFIGURE_CMDS
>> +     rm -f $(@D)/config.sh
>> +     cd $(@D); ./Configure -des \
>
> We generally like to put such commands into parenthesis, i.e:
>
>         (cd $(@D); .... \
>                 .....   \
>                 .....)
>

ok.

>> +             -Dusecrosscompile \
>> +             -Dtargetrun=$(PERL_QEMU_USER_MODE) \
>> +             -Dqemulib=$(STAGING_DIR) \
>> +             -Dtargethost=dummy \
>> +             -Dar="$(TARGET_AR)" \
>> +             -Dcc="$(TARGET_CC)" \
>> +             -Dcpp="$(TARGET_CC)" \
>> +             -Dld="$(TARGET_LD)" \
>> +             -Dnm="$(TARGET_NM)" \
>> +             -Dranlib="$(TARGET_RANLIB)" \
>> +             -Dccflags="$(TARGET_CFLAGS)" \
>> +             -Dldflags="$(TARGET_LDFLAGS) -l gcc_s" \
>> +             -Dlddlflags="-shared" \
>> +             -Dlibc=$(TARGET_HOST)/usr/$(GNU_TARGET_NAME)/sysroot/lib/libc.so \
>> +             -Duseshrplib \
>> +             -Dprefix=/usr \
>> +             -Uoptimize \
>> +             $(PERL_USE_DEVEL) \
>> +             $(PERL_NO_LARGEFILE) \
>> +             $(call qstrip,$(BR2_PACKAGE_PERL_CUSTOM_CONFIGURE))
>> +     echo "# patched values"                 >>$(@D)/config.sh
>> +     $(SED) '/^myarchname=/d' \
>> +             -e '/^mydomain=/d' \
>> +             -e '/^myhostname=/d' \
>> +             -e '/^myuname=/d' \
>> +             -e '/^osname=/d' \
>> +             -e '/^osvers=/d' \
>> +             -e '/^perladmin=/d' \
>> +             $(@D)/config.sh
>> +     echo "myarchname='$(GNU_TARGET_NAME)'"                  >>$(@D)/config.sh
>> +     echo "mydomain=''"                                      >>$(@D)/config.sh
>> +     echo "myhostname='$(BR2_TARGET_GENERIC_HOSTNAME)'"      >>$(@D)/config.sh
>> +     echo "myuname='Buildroot $(BR2_VERSION_FULL)'"          >>$(@D)/config.sh
>> +     echo "osname='linux'"                                   >>$(@D)/config.sh
>> +     echo "osvers='$(BR2_LINUX_KERNEL_VERSION)'"             >>$(@D)/config.sh
>> +     echo "perladmin='root'"                                 >>$(@D)/config.sh
>> +     cd $(@D); ./Configure -S
>> +     cp $(@D)/config.h $(@D)/xconfig.h
>> +     $(SED) 's/UNKNOWN-/Buildroot $(BR2_VERSION_FULL) /' $(@D)/patchlevel.h
>> +endef
>> +
>> +define PERL_BUILD_CMDS
>> +     echo "#!/bin/sh"                                                        > $(@D)/Cross/miniperl
>> +     echo "$(PERL_QEMU_USER_MODE) -L $(STAGING_DIR) $(@D)/miniperl \"\$$@\"" >>$(@D)/Cross/miniperl
>> +     chmod +x $(@D)/Cross/miniperl
>> +     PERL_MM_OPT="PERL=$(@D)/Cross/miniperl" \
>> +     $(MAKE) -C $(@D) all
>> +endef
>> +
>> +define PERL_INSTALL_STAGING_CMDS
>> +     $(MAKE) INSTALL_DEPENDENCE= \
>
> Is it really INSTALL_DEPENDENCE ?

yes.
Makefile contains these 2 lines :
    # Set this to an empty string to avoid an attempt of rebuild before install
    INSTALL_DEPENDENCE = all

>
>> +             INSTALLFLAGS= \
>> +             DESTDIR="$(STAGING_DIR)" \
>> +             -C $(@D) install.perl
>> +     $(INSTALL) -m 755 $(@D)/libperl.so $(STAGING_DIR)/usr/lib/libperl.so
>
> Maybe just a comment above on why the manual installation of this .so
> file is needed.
>

In fact useless, so removed.

>> +endef
>> +
>> +define PERL_INSTALL_TARGET_CMDS
>> +     $(MAKE) INSTALL_DEPENDENCE= \
>> +             INSTALLFLAGS=-p \
>> +             DESTDIR="$(TARGET_DIR)" \
>> +             -C $(@D) install.perl
>> +endef
>> +
>> +define PERL_CLEAN_CMDS
>> +     -$(MAKE) -C $(@D) clean
>> +endef
>> +
>> +define HOST_PERL_CONFIGURE_CMDS
>> +     cd $(@D); ./Configure -des \
>> +             -Dcc="$(HOSTCC)" \
>> +             -Dprefix="$(HOST_DIR)/usr" \
>> +             $(PERL_USE_DEVEL)
>> +endef
>> +
>> +define HOST_PERL_BUILD_CMDS
>> +     $(MAKE) -C $(@D) all
>> +endef
>> +
>> +define HOST_PERL_INSTALL_CMDS
>> +     $(MAKE) INSTALL_DEPENDENCE= \
>> +             -C $(@D) install
>> +endef
>> +
>> +define HOST_PERL_CLEAN_CMDS
>> +     -$(MAKE) -C $(@D) clean
>> +endef
>> +
>> +$(eval $(generic-package))
>> +$(eval $(host-generic-package))
>
> The host variant of perl seems to be here only as a build dependency of
> microperl, which your patch set is deprecating. Is it really necessary
> to have this host variant?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
