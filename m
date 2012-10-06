From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 6 Oct 2012 15:44:28 +0200
Subject: [Buildroot] [PATCH v8 07/11] cpanminus: new package
In-Reply-To: <20121004230105.53ac1b54@skate>
References: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
 <1348593508-14254-7-git-send-email-francois.perrad@gadz.org>
 <20121004230105.53ac1b54@skate>
Message-ID: <CAB0FRsu=ObqFU+a2na_hHjgVG6RtYUw7gM1nTDx8SYD+xOG3wg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/10/4 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Fran?ois,
>
> Some other questions...
>
> On Tue, 25 Sep 2012 19:18:23 +0200, Francois Perrad wrote:
>
>> +if BR2_PACKAGE_CPANMINUS
>> +
>> +config BR2_PACKAGE_CPANMINUS_MIRROR
>> +     string "mirror"
>> +     help
>> +       Specifies the base URL for the CPAN mirror to use,
>> +       such as http://cpan.cpantesters.org/.
>> +
>> +config BR2_PACKAGE_CPANMINUS_MODULES
>> +     string "Perl modules from CPAN"
>> +     help
>> +       List of space-separated Perl modules to install from CPAN.
>> +
>> +       Examples: Try::Tiny Dancer YAML Moo
>> +
>> +       Install the listed modules and their dependencies.
>> +
>> +config BR2_PACKAGE_CPANMINUS_NATIVE_DEPENDENCIES
>> +     string "native dependencies"
>> +     help
>> +       Some XS modules require native libraries.
>
> I'm wondering if those options shouldn't have some default values, at
> least for BR2_PACKAGE_CPANMINUS_MODULES and
> BR2_PACKAGE_CPANMINUS_NATIVE_DEPENDENCIES, so that when our
> autobuilders will enable this package, it will actually build
> something. Of course, we can't test all possibilities, but at least
> testing a basic module that has a native dependency would be a good
> test.
>
>> +define CPANMINUS_INSTALL_TARGET_CMDS
>> +     echo "#!/bin/sh"                                                        > $(@D)/run_perl
>> +     echo "PERL5LIB=$(CPANMINUS_PERL5LIB) $(CPANMINUS_RUN_PERL) \"\$$@\""    >>$(@D)/run_perl
>> +     chmod +x $(@D)/run_perl
>> +     PERL5LIB=$(CPANMINUS_PERL5LIB) \
>> +     PERL_MM_OPT="DESTDIR=$(TARGET_DIR) PERL=$(@D)/run_perl PERL_LIB=$(CPANMINUS_PERL_LIB) PERL_ARCHLIB=$(CPANMINUS_PERL_ARCHLIB)" \
>> +     PERL_MB_OPT="--destdir $(TARGET_DIR)" \
>> +     RUN_PERL="$(@D)/run_perl" \
>> +     $(CPANMINUS_RUN_PERL) $(@D)/cpanm \
>> +             --perl=$(@D)/run_perl \
>> +             --notest \
>> +             --no-man-pages \
>> +             $(CPANMINUS_MIRROR) \
>> +             $(call qstrip,$(BR2_PACKAGE_CPANMINUS_MODULES))
>> +endef
>
> Will this work if $(BR2_PACKAGE_CPANMINUS_MODULES) is empty?

Now, fixed.

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
