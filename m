From: Alex Potapenko <opotapenko@gmail.com>
Date: Mon, 7 Sep 2015 17:53:19 +0300
Subject: [Buildroot] EOVERFLOW fstat() error on cortex-A9 android when
 trying to load shared library
In-Reply-To: <CAF5aO=LYm6GYVXv0gJW9fS3A8JXMAeZwnEokG0Htpac4SZuJVQ@mail.gmail.com>
References: <CAF5aO=Ko183BGatMakjXot=EsnXbaodOHZPRmnMa8nqH=vZkEw@mail.gmail.com>
 <55EDA03A.2070302@mind.be>
 <CAF5aO=LYm6GYVXv0gJW9fS3A8JXMAeZwnEokG0Htpac4SZuJVQ@mail.gmail.com>
Message-ID: <CAF5aO=LiY_3XBn+HgA8-nwJk51GQkgGQqbnpmdQoyS64zxDTWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you for your response, Arnout!
Unfortunately, that is not the reason here. I use Buildroot to build the
toolchain only. And then use modified Optware build system to cross-compile
the packages. armeabi feed is built with '
-Wl,--dynamic-linker=/opt/lib/ld-uClibc.so.0' ld flag, so they know where
the linker resides.
7 ???. 2015 17:33 "Arnout Vandecappelle" <arnout@mind.be> ????:

On 07-09-15 15:24, Alex Potapenko wrote:
> Dear all,
>
> I'm experiencing a very odd issue on which neither my knowledge, nor
googling
> don't shed any light. I am Optware-ng developer (Optware fork), and I use
> toolchains built using Buildroot to cross-compile packages for three
archs. One
> of them, armeabi (cortex-A9), was stated to work on AmLogic s812 android
box
> (cortex-A9 cpu) (https://github.com/alllexx88/Optware-ng/issues/6).
However,
> when I tried to reproduce a similar setup on my android phone Samsung
Galaxy SII
> I9100 (cortex-A9 as well), I encountered the issue of all dynamically
linked
> programs failing:
>
>     root at GT-I9100:/opt # /opt/bin/nano
>     /opt/bin/nano: can't load library 'libz.so.1'
>     root at GT-I9100:/opt # /opt/bin/file
>     /opt/bin/file: can't load library 'libmagic.so.1'

 Since you're calling /opt/bin/nano, I guess you have installed the
buildroot
rootfs in /opt/. However, the rootfs assumes it will be put in / so the
dynamic
linker is configured as /lib/ld-uClibc-1.0.5.so (or the glibc or musl
linker).
Since that doesn't exist, the kernel will fall back to the default dynamic
linker, which doesn't know about the shared libraries in /opt and probably
even
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
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150907/b417b21d/attachment.html>
