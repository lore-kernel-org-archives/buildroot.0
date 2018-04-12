From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 11 Apr 2018 23:40:37 -0300 (BRT)
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-04-07
In-Reply-To: <20180411151910.21a71a99@windsurf>
References: <20180408060016.70C472084F@mail.bootlin.com>
 <147906727.2330850.1523328627127.JavaMail.zimbra@datacom.ind.br>
 <2112768662.2330896.1523329207650.JavaMail.zimbra@datacom.ind.br>
 <CAPi7W83rzsiFvM45AmafAP=TaF_xUqgjNY+crLNWBcbJbnb1Nw@mail.gmail.com>
 <CAPi7W80owYpotaCzQDA+dVuFxVGQtEdDuPe=zpFHdf0LZpoRdQ@mail.gmail.com>
 <345647775.2610070.1523450364355.JavaMail.zimbra@datacom.ind.br>
 <20180411151910.21a71a99@windsurf>
Message-ID: <1873592662.2762704.1523500837920.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: "Fabrice Fontaine" <fontaine.fabrice@gmail.com>, "buildroot" <buildroot@buildroot.org>
> Sent: Wednesday, April 11, 2018 10:19:10 AM
> Subject: Re: [Buildroot] [autobuild.buildroot.net] Your build results for 2018-04-07

> Hello,
> 
> On Wed, 11 Apr 2018 09:39:24 -0300 (BRT), Carlos Santos wrote:
> 
>> I investigated it a little bit more and it seems to be restricted to
>> the rather old GCC used in that build.
>> 
>> $ host/bin/powerpc-ctng_e500v2-linux-gnuspe-gcc --version
>> powerpc-ctng_e500v2-linux-gnuspe-gcc (crosstool-NG hg+-c65fcf8a34b7) 4.7.3
>> $ echo -e '#include <glib-object.h>\n' |
>> host/bin/powerpc-ctng_e500v2-linux-gnuspe-gcc -x c -I
>> staging/usr/include/glib-2.0 -I staging/usr/lib/glib-2.0/include -Wall -Werror
>> -c - -o /tmp/foo.o
>> In file included from staging/usr/include/glib-2.0/gobject/gbinding.h:29:0,
>>                  from staging/usr/include/glib-2.0/glib-object.h:23,
>>                  from <stdin>:1:
>> staging/usr/include/glib-2.0/gobject/gobject.h: In function 'g_set_object':
>> staging/usr/include/glib-2.0/gobject/gobject.h:725:5: error: value computed is
>> not used [-Werror=unused-value]
>> cc1: all warnings being treated as errors
>> 
>> Using newer GCC versions:
>> 
>> $ host/bin/powerpc-e500v2-linux-gnuspe-gcc --version
>> powerpc-e500v2-linux-gnuspe-gcc (crosstool-NG 1.20.0) 4.8.2
>> $ echo -e '#include <glib-object.h>\n' |
>> host/bin/powerpc-e500v2-linux-gnuspe-gcc -x c -I staging/usr/include/glib-2.0
>> -I staging/usr/lib/glib-2.0/include -Wall -Werror -c - -o /tmp/foo.o
>> [success]
>> 
>> $ host/bin/powerpc-buildroot-linux-uclibc-gcc --version
>> powerpc-buildroot-linux-uclibc-gcc.br_real (Buildroot
>> 2016.08-git-01162-g94c7298) 4.9.3
>> echo -e '#include <glib-object.h>\n' |
>> host/bin/powerpc-buildroot-linux-uclibc-gcc -x c -I
>> staging/usr/include/glib-2.0 -I staging/usr/lib/glib-2.0/include -Wall -Werror
>> -c - -o /tmp/foo.o
>> [success]
>> 
>> $ host/bin/powerpc-e500v2-linux-gnuspe-gcc --version
>> powerpc-e500v2-linux-gnuspe-gcc (crosstool-NG bf52f9a) 5.3.0
>> $ echo -e '#include <glib-object.h>\n' |
>> host/bin/powerpc-e500v2-linux-gnuspe-gcc -x c -I staging/usr/include/glib-2.0
>> -I staging/usr/lib/glib-2.0/include -Wall -Werror -c - -o /tmp/foo.o
>> [success]
>> 
>> $ host/bin/powerpc-linux-gcc --version
>> powerpc-linux-gcc.br_real (Buildroot 2017.08-git-01078-g95b1dae) 6.3.0
>> echo -e '#include <glib-object.h>\n' | host/bin/powerpc-linux-gcc -x c -I
>> staging/usr/include/glib-2.0 -I staging/usr/lib/glib-2.0/include -Wall -Werror
>> -c - -o /tmp/foo.o
>> [success]
>> 
>> So I think we should make libglib2 depend on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 if
>> the target architecture is PowerPC. Do you agree?
> 
> Is this problem really PowerPC specific ? Did you try other gcc 4.7
> toolchains for other architectures ?

I will try to find a museum from which I can get such toolchains.

> Also, adding new dependencies on libglib2 is an absolute nightmare: you
> have to propagate those new dependencies to gazillions of packages (all
> reverse dependencies of libglib2) :-/

Indeed it is. :-(

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
