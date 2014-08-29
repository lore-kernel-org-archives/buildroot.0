From: =?windows-1252?Q?J=F6rg_Krause?= <jkrause@posteo.de>
Date: Fri, 29 Aug 2014 22:24:38 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-08-26
In-Reply-To: <53FDBF5D.408@posteo.de>
References: <20140827063010.1F56610167A@stock.ovh.net>
 <53FDACA0.7080501@posteo.de> <53FDBC5C.7030603@imgtec.com>
 <53FDBF5D.408@posteo.de>
Message-ID: <5400E186.2040001@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 08/27/2014 01:22 PM, J?rg Krause wrote:
>
> On 08/27/2014 01:09 PM, Vicente Olivert Riera wrote:
>> On 08/27/2014 11:02 AM, J?rg Krause wrote:
>>>
>>> On 08/27/2014 08:30 AM, Thomas Petazzoni wrote:
>>>> Build statistics for 2014-08-26
>>>> ===============================
>>>>
>>>>
>>>>        bfin | libshairplay-139d5ef5556451... | NOK |
>>>> http://autobuild.buildroot.net/results/7b13728386da6179608a1c7607565bd9bc357d86/ 
>>>>
>>>>
>>>
>>> This is a problem with missing or not finding libdl. This is what my
>>> libshairplay/config.log shows:
>>>
>>> configure:11508:
>>> /home/joerg/Freescale/buildroot/output/host/usr/bin/bfin-uclinux-gcc -o
>>> conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
>>> -D_FILE_OFFSET_BITS=64  -pipe -Os   -Wl,-elf2flt -static
>>> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
>>> -elf2flt -static conftest.c -ldl   >&5
>>> /home/joerg/Freescale/buildroot/output/host/opt/ext-toolchain/bfin-uclinux/bfin-uclinux/bin/ld.real: 
>>>
>>> cannot find -ldl
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>> Could be something related with this?:
>>
>> (static linking is broken with -ldl)
>>
>> http://lists.uclibc.org/pipermail/uclibc/2010-September/044300.html
>>
>
> Don't think so. In 
> libshairplay-139d5ef55564514c31f02dd82cef91236c9ff523/src/lib/dnssd.c 
> the macro USE_LIBDL is defined:
>
> #define USE_LIBDL (defined(HAVE_LIBDL) && !defined(__APPLE__))
>
> #if defined(WIN32) || USE_LIBDL
> [..]
> #else
> # include <dns_sd.h>
> # define DNSSD_STDCALL
> #endif
>
> In this build HAVE_LIBDL is not defined and so is USE_LIBDL not 
> defined. Finally, there is no header file dns_sd.h, which breaks the 
> build process.
>
> I guess, the problem is that configure does not find libdl.
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

I took a closer look at this build failure.

If for the Blackfin target the FLAT binary format is choosen, the 
bfin-uclinux-uclibc toolchain is used. This toolchain does not come with 
a libdl library. With dynamic linking shairplay uses the libdns_sd.so" 
which is an mDSN backend.

If libdl is not supported the user has to provide an external mDNS 
backend himself. This is not done by the libshairplay package so the 
compiler complains about the missing dns_sd.h header file.

One solution would be to add the dns_sd.h header file which is
a) part of the mDNSResponder project from Apple licensed under the terms 
of the Apache License, Version 2.0
b) part of the avahi-compat-libdns_sd plugin
c) anything else which is compatible to the DNS Service Discovery API

Maybe a comment in the menuconfig of the package about this issue would 
be the best solution?
