From: Nuno Mota <nrmmota@gmail.com>
Date: Fri, 9 Nov 2018 18:07:48 +0000
Subject: [Buildroot] ELFCLASS issue on building Perl module Term::ReadKey
In-Reply-To: <CALURroTxezqCSbrMG0O0-=MBEtDa4-im_Z+-_rd7YQhBSrZ2Pw@mail.gmail.com>
References: <CAAnJVhCshyo-nHCVo303qLJiXJd8c7xh91-mDHgFsDn4VyYoVw@mail.gmail.com>
 <CALURroTxezqCSbrMG0O0-=MBEtDa4-im_Z+-_rd7YQhBSrZ2Pw@mail.gmail.com>
Message-ID: <CAAnJVhCBZfv96DE1zZk6uNed5QAuPf_Fr2d1C923xvSf5AyxeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It worked :D.
Thank you very much for your support.

Best regards,
Nuno Mota

Christopher McCrory <chrismcc@gmail.com> escreveu no dia quinta, 8/11/2018
?(s) 16:43:

>
>
> On Wed, Oct 31, 2018 at 1:53 PM Nuno Mota <nrmmota@gmail.com> wrote:
>
>> Hi,
>> I'm using buildroot for a project and so far so good. I've added a lot of
>> perl modules, but a new one just failed. I have no clue how to fix this.
>> I simply cloned this git project to use swupdate
>> https://github.com/Trellis-Logic/buildroot-external/tree/swupdate
>>
>> >>> perl-termreadkey 2.37 Building
>> cd
>> /opt/home/nrm/ubuntudocker/GS_Gateway/buildroot/output/build/perl-termreadkey-2.37/
>> && if [ -f Build.PL ] && [ MB != "EUMM" ] ; then PERL5LIB=
>> PERL_USE_UNSAFE_INC=1
>> /opt/home/nrm/ubuntudocker/GS_Gateway/buildroot/output/host/bin/perl Build
>> build; else /usr/bin/make -j1
>> PERL_INC=/opt/home/nrm/ubuntudocker/GS_Gateway/buildroot/output/host/i686-buildroot-linux-uclibc/sysroot/usr/lib/perl5/5.26.2/i686-linux/CORE
>> FIXIN=:  pure_all; fi
>> "/opt/home/nrm/ubuntudocker/GS_Gateway/buildroot/output/host/bin/perl"
>> -MExtUtils::Command::MM -e 'cp_nonempty' -- ReadKey.bs
>> blib/arch/auto/Term/ReadKey/ReadKey.bs 644
>> "/opt/home/nrm/ubuntudocker/GS_Gateway/buildroot/output/host/bin/perl"
>> "-Iblib/arch" "-Iblib/lib" ReadKey_pm.PL ReadKey.pm
>> Creating ReadKey.pm
>> Can't load 'blib/arch/auto/Term/ReadKey/ReadKey.so' for module
>> Term::ReadKey: blib/arch/auto/Term/ReadKey/ReadKey.so: wrong ELF class:
>> ELFCLASS32 at
>> /opt/home/nrm/ubuntudocker/GS_Gateway/buildroot/output/host/lib/perl5/5.26.2/x86_64-linux/DynaLoader.pm
>> line 193.
>>  at
>> /opt/home/nrm/ubuntudocker/GS_Gateway/buildroot/output/host/lib/perl5/5.26.2/x86_64-linux/DynaLoader.pm
>> line 95.
>> DynaLoader::croak("Can't load 'blib/arch/auto/Term/ReadKey/ReadKey.so'
>> for modul"...) called at
>> /opt/home/nrm/ubuntudocker/GS_Gateway/buildroot/output/host/lib/perl5/5.26.2/x86_64-linux/DynaLoader.pm
>> line 193
>> DynaLoader::bootstrap("Term::ReadKey") called at ReadKey_pm.PL line 515
>> Bootstrapping the XS for blockoptions: make[2]: *** [ReadKey.pm] Error 255
>> make[1]: ***
>> [/opt/home/nrm/ubuntudocker/GS_Gateway/buildroot/output/build/perl-termreadkey-2.37/.stamp_built]
>> Error 2
>> make: *** [_all] Error 2
>> make: Leaving directory `/opt/home/nrm/ubuntudocker/GS_Gateway/buildroot'
>>
>>
> Try this (I used toolchain-external-linaro-armeb-2018.05 to test)
>
>
>  cat Config.in
> config BR2_PACKAGE_PERL_TERMREADKEY
>     bool "perl-termreadkey"
>     depends on !BR2_STATIC_LIBS
>     help
>       Change terminal modes, and perform non-blocking reads.
>
>       https://metacpan.org/release/TermReadKey
>
> comment "perl-termreadkey needs a toolchain w/ dynamic library"
>     depends on BR2_STATIC_LIBS
>
> cat perl-termreadkey.mk
>
> ################################################################################
> #
> # perl-termreadkey
> #
>
> ################################################################################
>
> PERL_TERMREADKEY_VERSION = 2.37
> PERL_TERMREADKEY_SOURCE = TermReadKey-$(PERL_TERMREADKEY_VERSION).tar.gz
> PERL_TERMREADKEY_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JS/JSTOWE
> #
> # The License for this package is, (air quotes) complicated
> # https://github.com/jonathanstowe/TermReadKey/issues/11
> #
> # Fedora lists it as
> # (Copyright only) and (Artistic or GPL+)
> #
> https://src.fedoraproject.org/rpms/perl-TermReadKey/blob/master/f/perl-TermReadKey.spec
> #
> # Debian lists it as
> # License: Artistic or GPL-1+
> #
> https://sources.debian.org/src/libterm-readkey-perl/2.37-1/debian/copyright/
> #
> # OpenEmbedded lists it as
> # License     Artistic-1.0 | GPLv1+
> # https://layers.openembedded.org/layerindex/recipe/67518/
> #`
> PERL_TERMREADKEY_LICENSE = Artistic or GPL-1.0+ ?
> PERL_TERMREADKEY_LICENSE_FILES = README
>
> PERL_TERMREADKEY_DEPENDENCIES = host-perl-termreadkey
>
> # At compile time, the makefile wants to use the compiled
> # ./blib/arch/auto/Term/ReadKey/ReadKey.so , but when cross-compiling this
> # fails. So build host variant and use that.  The correct ReadKey.so file
> is
> # still installed in TARGET_DIR.
> # Adapted from the OpenEmbeded script at:
> #
> http://cgit.openembedded.org/meta-openembedded/tree/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb
> #
> define PERL_TERMREADKEY_POST_CONFIGURE_SED
>     $(SED)
> "s#-I\$$(INST_ARCHLIB)#-I$(HOST_DIR)/lib/perl5/site_perl/$(PERL_VERSION)/$(PERL_ARCHNAME)#"
> $(@D)/Makefile
> endef
>
> PERL_TERMREADKEY_POST_CONFIGURE_HOOKS +=
> PERL_TERMREADKEY_POST_CONFIGURE_SED
>
> $(eval $(perl-package))
> $(eval $(host-perl-package))
>
>
>
> --
> Christopher McCrory
> To the optimist, the glass is half full.
> To the pessimist, the glass is half empty.
> To the engineer, the glass is twice as big as it needs to be.
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181109/88136a4c/attachment.html>
