From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 5 Nov 2012 17:41:20 +0100
Subject: [Buildroot] [PATCH v11 2/9] perl: new package
In-Reply-To: <upcp6k.3q9.ln@bernd-kuhls.de>
References: <1350652434-32020-1-git-send-email-francois.perrad@gadz.org>
 <1350652434-32020-2-git-send-email-francois.perrad@gadz.org>
 <upcp6k.3q9.ln@bernd-kuhls.de>
Message-ID: <CAB0FRsvaWPoSfSOv1uyPjpzHMU4a_hxPF_jB4XEhuVUFg4KcSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/10/30 Bernd Kuhls <berndkuhls@hotmail.com>:
> Hi,
>
> Francois Perrad <fperrad@gmail.com> wrote in
> news:1350652434-32020-2-git-send-email-francois.perrad at gadz.org:
>
> currently I am testing your patchset, but I found problems during
> compiling, some I could solve myself:
>
>> +PERL_CONF_OPT = -des \
>
> [...]
>
>> +          -Dlibc=$(STAGING_DIR)/lib/libc.so \
>
> I had to change this line to
>
>              -Dlibc=$(STAGING_DIR)/usr/lib/libc.so.0 \
>
> for usage with uClibc 0.9.33.2
>
> [...]
>
>> +          -Uoptimize
>
> Here I had to add "-Ud_eaccess" to avoid a compilation bug.
>
> Perl will still not finish to compile, stopping with this error message:
>
>> LD_LIBRARY_PATH=/home/bernd/.fbr/build/output/build/perl-5.16.1
> /home/bernd/.fbr/build/output/build/perl-5.16.1/Cross/run-qemu-i386
> ./miniperl -Ilib make_ext.pl cpan/Archive-Extract/pm_to_blib
> MAKE=/home/bernd/.fbr/build/output/host/usr/bin/make LIBPERL_A=libperl.so
>>         Making Archive::Extract (all)
>>
>> Creating Makefile.PL in cpan/Archive-Extract for Archive::Extract
>>
>> Running Makefile.PL in cpan/Archive-Extract
>> /home/bernd/.fbr/build/output/build/perl-5.16.1/Cross/run-qemu-i386
> ../../miniperl -I../../lib Makefile.PL INSTALLDIRS=perl INSTALLMAN1DIR=none
> INSTALLMAN3DIR=none PERL_CORE=1 LIBPERL_A=libperl.so
>> -1 from cpan/Archive-Extract's Makefile.PL at make_ext.pl line 409.
>> Warning: No Makefile!
>> /home/bernd/.fbr/build/output/host/usr/bin/make config PERL_CORE=1
> LIBPERL_A=libperl.so failed, continuing anyway...
>> Making all in cpan/Archive-Extract
>> /home/bernd/.fbr/build/output/build/perl-5.16.1/Cross/run-qemu-i386
> /home/bernd/.fbr/build/output/host/usr/bin/make all PERL_CORE=1
> LIBPERL_A=libperl.so
>> Unsuccessful make(cpan/Archive-Extract): code=-1 at make_ext.pl line 468.
>> make[1]: *** [cpan/Archive-Extract/pm_to_blib] Fehler 22
>> make[1]: Leaving directory `/home/bernd/.fbr/build/output/build/perl-
> 5.16.1'
>> make: *** [/home/bernd/.fbr/build/output/build/perl-5.16.1/.stamp_built]
> Fehler 2
>
> Executing the last command alone provides this error hinting at a problem
> with host-qemu, which I was able to solve yet.
>
> $ /home/bernd/.fbr/build/output/build/perl-5.16.1/Cross/run-qemu-i386
> /home/bernd/.fbr/build/output/host/usr/bin/make all PERL_CORE=1
> LIBPERL_A=libperl.so
> qemu: Unsupported syscall: 240
> qemu: Unsupported syscall: 240
>
> First I got this error message with Debian Squeeze i386 (virtualbox guest,
> Win XP host), but also on Debian wheezy amd64 running non-virtualized.
>
> My .config can be found here: http://pastebin.com/yz1SzeB2
> I am using buildroot as part of the FLI4L source package[1].
>
> Kind regards, Bernd
>

I could reproduce the lastest problem on the HEAD of Buildroot with
qemu_x86_defconfig (which is a smaller config than your FLI4L config).

Fran?ois

> [1] http://www.fli4l.de/download/tarball-version/aktuell.html
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
