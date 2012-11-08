From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 8 Nov 2012 19:02:31 +0100
Subject: [Buildroot] [PATCH v11 2/9] perl: new package
In-Reply-To: <CAB0FRsvVa1x9Lp+x0P+YSnBG2eqWNd0bchtmQrWDnhqHUxx=Cw@mail.gmail.com>
References: <1350652434-32020-1-git-send-email-francois.perrad@gadz.org>
 <1350652434-32020-2-git-send-email-francois.perrad@gadz.org>
 <upcp6k.3q9.ln@bernd-kuhls.de>
 <CAB0FRsvaWPoSfSOv1uyPjpzHMU4a_hxPF_jB4XEhuVUFg4KcSQ@mail.gmail.com>
 <CAB0FRsv058=3G7qbFPS6xrSr_TG5=QDhRKcOU8O6mCot_dCuMQ@mail.gmail.com>
 <CAB0FRsvVa1x9Lp+x0P+YSnBG2eqWNd0bchtmQrWDnhqHUxx=Cw@mail.gmail.com>
Message-ID: <CAB0FRsvzwv66cC1fG9OaDCXS9kA3z0iuHYPGZiniWHogThGFTw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/11/6 Fran?ois Perrad <francois.perrad@gadz.org>:
> 2012/11/6 Fran?ois Perrad <francois.perrad@gadz.org>:
>> 2012/11/5 Fran?ois Perrad <francois.perrad@gadz.org>:
>>> 2012/10/30 Bernd Kuhls <berndkuhls@hotmail.com>:
>>>> Hi,
>>>>
>>>> Francois Perrad <fperrad@gmail.com> wrote in
>>>> news:1350652434-32020-2-git-send-email-francois.perrad at gadz.org:
>>>>
>>>> currently I am testing your patchset, but I found problems during
>>>> compiling, some I could solve myself:
>>>>
>>>>> +PERL_CONF_OPT = -des \
>>>>
>>>> [...]
>>>>
>>>>> +          -Dlibc=$(STAGING_DIR)/lib/libc.so \
>>>>
>>>> I had to change this line to
>>>>
>>>>              -Dlibc=$(STAGING_DIR)/usr/lib/libc.so.0 \
>>>>
>>>> for usage with uClibc 0.9.33.2
>>>>
>>>> [...]
>>>>
>>>>> +          -Uoptimize
>>>>
>>>> Here I had to add "-Ud_eaccess" to avoid a compilation bug.
>>>>
>>>> Perl will still not finish to compile, stopping with this error message:
>>>>
>>>>> LD_LIBRARY_PATH=/home/bernd/.fbr/build/output/build/perl-5.16.1
>>>> /home/bernd/.fbr/build/output/build/perl-5.16.1/Cross/run-qemu-i386
>>>> ./miniperl -Ilib make_ext.pl cpan/Archive-Extract/pm_to_blib
>>>> MAKE=/home/bernd/.fbr/build/output/host/usr/bin/make LIBPERL_A=libperl.so
>>>>>         Making Archive::Extract (all)
>>>>>
>>>>> Creating Makefile.PL in cpan/Archive-Extract for Archive::Extract
>>>>>
>>>>> Running Makefile.PL in cpan/Archive-Extract
>>>>> /home/bernd/.fbr/build/output/build/perl-5.16.1/Cross/run-qemu-i386
>>>> ../../miniperl -I../../lib Makefile.PL INSTALLDIRS=perl INSTALLMAN1DIR=none
>>>> INSTALLMAN3DIR=none PERL_CORE=1 LIBPERL_A=libperl.so
>>>>> -1 from cpan/Archive-Extract's Makefile.PL at make_ext.pl line 409.
>>>>> Warning: No Makefile!
>>>>> /home/bernd/.fbr/build/output/host/usr/bin/make config PERL_CORE=1
>>>> LIBPERL_A=libperl.so failed, continuing anyway...
>>>>> Making all in cpan/Archive-Extract
>>>>> /home/bernd/.fbr/build/output/build/perl-5.16.1/Cross/run-qemu-i386
>>>> /home/bernd/.fbr/build/output/host/usr/bin/make all PERL_CORE=1
>>>> LIBPERL_A=libperl.so
>>>>> Unsuccessful make(cpan/Archive-Extract): code=-1 at make_ext.pl line 468.
>>>>> make[1]: *** [cpan/Archive-Extract/pm_to_blib] Fehler 22
>>>>> make[1]: Leaving directory `/home/bernd/.fbr/build/output/build/perl-
>>>> 5.16.1'
>>>>> make: *** [/home/bernd/.fbr/build/output/build/perl-5.16.1/.stamp_built]
>>>> Fehler 2
>>>>
>>>> Executing the last command alone provides this error hinting at a problem
>>>> with host-qemu, which I was able to solve yet.
>>>>
>>>> $ /home/bernd/.fbr/build/output/build/perl-5.16.1/Cross/run-qemu-i386
>>>> /home/bernd/.fbr/build/output/host/usr/bin/make all PERL_CORE=1
>>>> LIBPERL_A=libperl.so
>>>> qemu: Unsupported syscall: 240
>>>> qemu: Unsupported syscall: 240
>>>>
>>>> First I got this error message with Debian Squeeze i386 (virtualbox guest,
>>>> Win XP host), but also on Debian wheezy amd64 running non-virtualized.
>>>>
>>>> My .config can be found here: http://pastebin.com/yz1SzeB2
>>>> I am using buildroot as part of the FLI4L source package[1].
>>>>
>>>> Kind regards, Bernd
>>>>
>>>
>>> I could reproduce the lastest problem on the HEAD of Buildroot with
>>> qemu_x86_defconfig (which is a smaller config than your FLI4L config).
>>>
>>
>> first, before manually running a command in the build tree, you must
>> set PERL_MM_OPT
>>    $ export PERL_MM_OPT="PERL=`pwd`/Cross/miniperl"
>>
>> the error
>>     -1 from cpan/Archive-Extract's Makefile.PL at make_ext.pl line 409.
>> comes from miniperl which fails with a 'system' call.
>>
>> this problem could be reproduced with a simple one-liner :
>>
>> $ perl -e "my \$code = system( q(echo), q(hello) ); print(\$code);"
>> hello
>> 0
>>
>> $ Cross/miniperl -e "my \$code = system( q(echo), q(hello) ); print(\$code);"
>> -1
>>
>> Fran?ois
>>
>
> after an installation on the target, this 'miniperl' works fine.
> so, the problem comes from Qemu.
>
> I write a small C example :
>
> $ cat sys.c
> #include <stdio.h>
> #include <stdlib.h>
>
> int main()
> {
>         int ret = system("echo hello");
>         printf("%d\n", ret);
> }
>
> $ ../../host/usr/bin/i686-buildroot-linux-uclibc-gcc -o sys sys.c
> $ file sys
> sys: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV),
> dynamically linked (uses shared libs), not stripped
> $ ../../host/usr/bin/qemu-i386 ./sys
> -1
>
> I also try on various architecture.
> I build Perl successfully with qemu-arm and qemu-mips,
> the problem occurs with qemu-i386 and qemu-x86_64,
> with a qemu-i386 version 1.2.0 built with Buildroot and with a
> qemu-i386 version 1.0.50 which comes my distro Ubuntu 12.04 LTS.
>
> Other bad new, these days, the homepage of Qemu (http://wiki.qemu.org) is down.
>

bug report filled, see https://bugs.launchpad.net/qemu/+bug/1076445

Fran?ois

> Fran?ois
>
>>> Fran?ois
>>>
>>>> [1] http://www.fli4l.de/download/tarball-version/aktuell.html
>>>>
>>>> _______________________________________________
>>>> buildroot mailing list
>>>> buildroot at busybox.net
>>>> http://lists.busybox.net/mailman/listinfo/buildroot
