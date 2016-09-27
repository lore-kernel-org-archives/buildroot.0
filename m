From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 27 Sep 2016 23:43:25 +0200
Subject: [Buildroot] pppd breaks build without libutils
In-Reply-To: <5cce18a6-b051-a6bf-17e0-e9fa82a1491e@mind.be>
References: <CAOoxthNVzy2PCz1tsACpxdhaoVO=RZgQR-A1dMB2u0HA3yXPqA@mail.gmail.com>
 <20160925205851.18f334ec@free-electrons.com>
 <CAOoxthNdJjSjiLS7PT_SguV7VSWxHrF8UiK0qtPz+D3bDEpnUA@mail.gmail.com>
 <5cce18a6-b051-a6bf-17e0-e9fa82a1491e@mind.be>
Message-ID: <20160927214325.GC8646@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-09-27 23:33 +0200, Arnout Vandecappelle spake thusly:
> On 26-09-16 01:39, Cassiano Martin wrote:
> > Sure, my fault not being version specific. 
> > Im currently running a git cloned version (Buildroot
> > 2016.08-git-01556-ge8c18f2-dirty)
> > and I'm using a pre-built toolchain from realtek. Target is MIPS32 bit LSB. 
> > So far, I get this when compiling.
> > 
> > ude '-DDESTDIR="/usr"' -DCHAPMS=1 -DMPPE=1 -DHAS_SHADOW -DHAVE_CRYPT_H=1
> > -DHAVE_LOGWTMP=1 -DUSE_CRYPT=1 -DHAVE_MULTILINK -DUSE_TDB=1 -DPLUGIN -DINET6=1
> > -DMAXOCTETS -Wl,-E -o pppd main.o magic.o fsm.o lcp.o ipcp.o upap.o chap-new.o
> > md5.o ccp.o ecp.o auth.o options.o demand.o utils.o sys-linux.o ipxcp.o tty.o
> > eap.o chap-md5.o session.o md4.o chap_ms.o sha1.o pppcrypt.o multilink.o tdb.o
> > spinlock.o ipv6cp.o eui64.o  -lcrypt -lutil -ldl
> > /home/cassiano/projects/oiw-2441apgn/realtek/rsdk-4.6.4-4181-EB-3.10-u0.9.33-m32-150324/bin/../lib/gcc/mips-linux-uclibc/4.6.4/../../../../mips-linux-uclibc/bin/ld:
> > cannot find -lutil
> 
>  Looks like the Realtek toolchain is not compatible with Buildroot assumptions.
> libutil is part of the toolchain. I guess Realtek configures uClibc without
> UCLIBC_HAS_LIBUTIL.

Which suddenly rings a bell here: the latest uClibc-ng version, 1.0.18,
now is one-lib, i.e. everything merged into libc.so like musl is, so
we could get external toolchains which will lack libutil.so because
there is no longer such a library now.

If uClibc-ng does like musl does, there will be a lot of empty static
versions of the libraries, libutil.a, libcrypt.a and so on, but there
will no longer be shared variants.

We'll have to account for that in our external toolchain handling.

Regards,
Yann E. MORIN.

>  Buildroot cannot support all possible uClibc configurations for all packages.
> Instead, we take minimal assumptions about the uClibc configuration - basically
> package/uclibc/uClibc-ng.config. If you have something less than that, then some
> packages may fail.
> 
>  The workaround you propose is basically disabling wtmp support. It's not really
> acceptable to do that for 95% of the users who actually do have this in their
> toolchain.
> 
>  We should probably add a FAQ entry for this kind of issue.
> 
>  Regards,
>  Arnout
> 
> > collect2: ld returned 1 exit status
> > Makefile:217: recipe for target 'pppd' failed
> > make[2]: *** [pppd] Error 1
> > make[2]: Leaving directory
> > '/home/cassiano/projects/oiw-2441apgn/output/build/pppd-2.4.7/pppd'
> > Makefile:13: recipe for target 'all' failed
> > make[1]: *** [all] Error 2
> > make[1]: Leaving directory
> > '/home/cassiano/projects/oiw-2441apgn/output/build/pppd-2.4.7'
> > package/pkg-generic.mk:201 <http://pkg-generic.mk:201>: recipe for target
> > '/home/cassiano/projects/oiw-2441apgn/output/build/pppd-2.4.7/.stamp_built' failed
> > 
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
