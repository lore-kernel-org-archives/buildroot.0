From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 12 Apr 2018 11:27:19 -0300 (BRT)
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-04-07
In-Reply-To: <20180412090641.0bda08c5@windsurf>
References: <20180408060016.70C472084F@mail.bootlin.com>
 <2112768662.2330896.1523329207650.JavaMail.zimbra@datacom.ind.br>
 <CAPi7W83rzsiFvM45AmafAP=TaF_xUqgjNY+crLNWBcbJbnb1Nw@mail.gmail.com>
 <CAPi7W80owYpotaCzQDA+dVuFxVGQtEdDuPe=zpFHdf0LZpoRdQ@mail.gmail.com>
 <345647775.2610070.1523450364355.JavaMail.zimbra@datacom.ind.br>
 <20180411151910.21a71a99@windsurf>
 <1873592662.2762704.1523500837920.JavaMail.zimbra@datacom.ind.br>
 <20180412090641.0bda08c5@windsurf>
Message-ID: <1285703624.2923407.1523543239898.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: "Fabrice Fontaine" <fontaine.fabrice@gmail.com>, "buildroot" <buildroot@buildroot.org>
> Sent: Thursday, April 12, 2018 4:06:41 AM
> Subject: Re: [Buildroot] [autobuild.buildroot.net] Your build results for 2018-04-07

> Hello,
> 
> On Wed, 11 Apr 2018 23:40:37 -0300 (BRT), Carlos Santos wrote:
> 
>> > Is this problem really PowerPC specific ? Did you try other gcc 4.7
>> > toolchains for other architectures ?
>> 
>> I will try to find a museum from which I can get such toolchains.
> 
> Old Sourcery toolchains can typically be used for that, and
> http://sources.buildroot.net/ is a good museum to find them. For
> example:
> 
> http://sources.buildroot.net/arm-2009q1-203-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
> http://sources.buildroot.net/arm-2009q3-67-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
> http://sources.buildroot.net/arm-2010.09-50-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
> http://sources.buildroot.net/arm-2010q1-202-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
> etc.

I generated toolchains with ct-NG 1.20 for i686 and ARM. Here are
the results:

$ i686-nptl-linux-gnu-gcc --version
i686-nptl-linux-gnu-gcc (crosstool-NG 1.20.0) 4.7.4
$ echo '#include <glib-object.h>' | i686-nptl-linux-gnu-gcc -x c -I staging/usr/include/glib-2.0 -I staging/usr/lib/glib-2.0/include -Wall -Werror -c - -o /tmp/foo.o
In file included from staging/usr/include/glib-2.0/gobject/gbinding.h:29:0,
                 from staging/usr/include/glib-2.0/glib-object.h:23,
                 from <stdin>:1:
staging/usr/include/glib-2.0/gobject/gobject.h: In function 'g_set_object':
staging/usr/include/glib-2.0/gobject/gobject.h:725:5: error: value computed is not used [-Werror=unused-value]
cc1: all warnings being treated as errors

$ arm-unknown-linux-gnueabi-gcc --version
arm-unknown-linux-gnueabi-gcc (crosstool-NG 1.20.0) 4.7.4
$ echo '#include <glib-object.h>' | arm-unknown-linux-gnueabi-gcc -x c -I staging/usr/include/glib-2.0 -I staging/usr/lib/glib-2.0/include -Wall -Werror -c - -o /tmp/foo.o
In file included from staging/usr/include/glib-2.0/gobject/gbinding.h:29:0,
                 from staging/usr/include/glib-2.0/glib-object.h:23,
                 from <stdin>:1:
staging/usr/include/glib-2.0/gobject/gobject.h: In function 'g_set_object':
staging/usr/include/glib-2.0/gobject/gobject.h:725:5: error: value computed is not used [-Werror=unused-value]
cc1: all warnings being treated as errors

> 
>> > Also, adding new dependencies on libglib2 is an absolute nightmare: you
>> > have to propagate those new dependencies to gazillions of packages (all
>> > reverse dependencies of libglib2) :-/
>> 
>> Indeed it is. :-(
> 
> Hence we should try to avoid this if possible :-)

I will change in the tpm2-abrmd recipe but will try to restrict it to
GCC 4.7.x and below.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
