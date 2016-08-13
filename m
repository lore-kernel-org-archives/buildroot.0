From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Aug 2016 00:14:31 +0200
Subject: [Buildroot] Analysis of build results for 2016-08-09
In-Reply-To: <20160813215502.GC5734@free.fr>
References: <20160810063029.6F291102D04@stock.ovh.net>
 <20160810161455.142a6a19@free-electrons.com>
 <87lh00z80r.fsf@ketchup.mtl.sfl> <20160813215502.GC5734@free.fr>
Message-ID: <20160813221431.GD5734@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vivien, All,

On 2016-08-13 23:55 +0200, Yann E. MORIN spake thusly:
> On 2016-08-13 17:14 -0400, Vivien Didelot spake thusly:
> > Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> > 
> > >>     mips64el |                    lldpd-0.9.4 | NOK | http://autobuild.buildroot.net/results/c8a6001f437701ecc75f6c9252935645bda8a8c8/
[--SNIP--]
> > And this works. What am I doing wrong the reproduce the issue?
> 
> I was not able to reproduce it either, and all build failures occur on
> Peter's machine:
>     http://autobuild.buildroot.org/?reason=lldpd-0.9.4
> 
> However, the libevent issue is nto the real issue. The config.log hints
> at a much earlier issue:

And just because I don;t know how to read... Therer *is* an error...

>     [--SNIP--]
>     configure:22887: checking for library containing res_init
>     configure:22913: /home/peko/autobuild/instance-2/output/host/usr/bin/mips64el-linux-gcc -std=gnu99 -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -isystem /usr/include/bsd -DLIBBSD_OVERLAY   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c  -L/home/peko/autobuild/instance-2/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/lib -lbsd   >&5
                                                                                                                                                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^
On the line above     ----->     ----->     ----->     ----->     ----->     ----->     ----->     ----->     ----->     ----->     ----->     ----->     ----->     ----->     ----->    this is libssd being stupid...

We must fix it, obviously. Yet, that does not eventually prevent the
configure to finish for me.

Regards,
Yann E. MORIN.

>     In file included from /home/peko/autobuild/instance-2/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/include/sys/types.h:29:0,
>                      from /home/peko/autobuild/instance-2/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/include/resolv.h:56,
>                      from conftest.c:55:
>     /home/peko/autobuild/instance-2/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/include/bits/types.h:30:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'typedef'
>      typedef unsigned char __u_char;
>      ^
>     In file included from /home/peko/autobuild/instance-2/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/include/resolv.h:56:0,
>                      from conftest.c:55:
>     /home/peko/autobuild/instance-2/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/include/sys/types.h:33:9: error: unknown type name '__u_char'
>      typedef __u_char u_char;
>              ^
>     In file included from /home/peko/autobuild/instance-2/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/include/sys/types.h:132:0,
>                      from /home/peko/autobuild/instance-2/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/include/resolv.h:56,
>                      from conftest.c:55:
>     /home/peko/autobuild/instance-2/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/include/time.h:59:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'typedef'
>      typedef __clock_t clock_t;
>      ^
>     /home/peko/autobuild/instance-2/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/include/time.h:60:1: error: unknown type name '__END_NAMESPACE_STD'
>      __END_NAMESPACE_STD
>      ^
>     [--SNIP--]
> 
> 
> On my machine, I got:
> 
>     configure:22887: checking for library containing res_init
>     configure:22913: /home/ymorin/dev/buildroot/O/host/usr/bin/mips64el-ctng_n64-linux-gnu-gcc -std=gnu99 -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c  >&5
>     configure:22913: $? = 0
>     configure:22930: result: none required
> 
> This is really weird...
> 
> I diff-ed the config.log from the build failure with mine, and I saw a
> few differences.
> 
> Here's the procedure (libbsd is an implicit dependency, which was built
> before lldpd in the autobuild failure, so I built it explicitly):
> 
>     $ wget -O .config 'http://autobuild.buildroot.net/results/c8a/c8a6001f437701ecc75f6c9252935645bda8a8c8/config'
>     $ make O=/home/ymorin/dev/buildroot/O lldpd-depends libbsd
>     $ make O=/home/ymorin/dev/buildroot/O lldpd-configure
>     $ wget -O config.log.failed 'http://autobuild.buildroot.net/results/c8a6001f437701ecc75f6c9252935645bda8a8c8/lldpd-0.9.4/config.log'
>     $ sed -r -i -e 's:/home/peko/autobuild/instance-2/output/:/home/ymorin/dev/buildroot/O/:g'
>         # So that I get the same paths in both log files...
>     $ diff -du config.log.failed /home/ymorin/dev/buildroot/O/build/lldpd-0.9.4/config.log
> 
> But I can't find any interesting hunk before that failure...
> 
> Regards,
> Yann E. MORIN.
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
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
