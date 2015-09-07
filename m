From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 7 Sep 2015 16:33:30 +0200
Subject: [Buildroot] EOVERFLOW fstat() error on cortex-A9 android when
 trying to load shared library
In-Reply-To: <CAF5aO=Ko183BGatMakjXot=EsnXbaodOHZPRmnMa8nqH=vZkEw@mail.gmail.com>
References: <CAF5aO=Ko183BGatMakjXot=EsnXbaodOHZPRmnMa8nqH=vZkEw@mail.gmail.com>
Message-ID: <55EDA03A.2070302@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07-09-15 15:24, Alex Potapenko wrote:
> Dear all,
> 
> I'm experiencing a very odd issue on which neither my knowledge, nor googling
> don't shed any light. I am Optware-ng developer (Optware fork), and I use
> toolchains built using Buildroot to cross-compile packages for three archs. One
> of them, armeabi (cortex-A9), was stated to work on AmLogic s812 android box
> (cortex-A9 cpu) (https://github.com/alllexx88/Optware-ng/issues/6). However,
> when I tried to reproduce a similar setup on my android phone Samsung Galaxy SII
> I9100 (cortex-A9 as well), I encountered the issue of all dynamically linked
> programs failing:
> 
>     root at GT-I9100:/opt # /opt/bin/nano
>     /opt/bin/nano: can't load library 'libz.so.1'
>     root at GT-I9100:/opt # /opt/bin/file
>     /opt/bin/file: can't load library 'libmagic.so.1'

 Since you're calling /opt/bin/nano, I guess you have installed the buildroot
rootfs in /opt/. However, the rootfs assumes it will be put in / so the dynamic
linker is configured as /lib/ld-uClibc-1.0.5.so (or the glibc or musl linker).
Since that doesn't exist, the kernel will fall back to the default dynamic
linker, which doesn't know about the shared libraries in /opt and probably even
has a different ABI, so it fails miserably.

 Solution: install stuff in /. Since all of the Android stuff is in /system,
there shouldn't be any conflict with the Android install.

 Regards,
 Arnout


> 
> 
> Static binaries work fine:
> 
>     root at GT-I9100:/opt # /opt/bin/ipkg -h
>     /opt/bin/ipkg: unrecognized option `-h'
>     ipkg: ipkg must have one sub-command argument
>     ipkg version 0.99.163
>     usage: ipkg [options...] sub-command [arguments...]
>     where sub-command is one of:
> 
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
