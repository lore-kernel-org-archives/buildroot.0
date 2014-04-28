From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Apr 2014 19:51:32 +0200
Subject: [Buildroot] [PATCH 1/9] boot/syslinux: needs an ia32-capable
 compiler
In-Reply-To: <535DED52.20500@mind.be>
References: <cover.1398378217.git.yann.morin.1998@free.fr>
 <74ac3236bb1595c30d9fd230352e96ef29e0b3ad.1398378217.git.yann.morin.1998@free.fr>
 <535DED52.20500@mind.be>
Message-ID: <20140428175132.GE3501@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-04-28 07:55 +0200, Arnout Vandecappelle spake thusly:
> On 25/04/14 00:29, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Frank Hunleth <fhunleth@troodon-software.com>
> 
>  It would be good to mention in the commit log and/or the Config.in why
> this dependency is needed.  I thought it was because it uses -m32, but
> now I see that it doesn't...

Yes, it does:
    /usr/bin/gcc -idirafter /home/ymorin/dev/buildroot/O/host/usr/include
        -L/home/ymorin/dev/buildroot/O/host/lib
        -L/home/ymorin/dev/buildroot/O/host/usr/lib
        -Wl,-rpath,/home/ymorin/dev/buildroot/O/host/usr/lib
        -Wp,-MT,cpio.o,-MD,./.cpio.o.d
        -std=gnu99
-->     -m32                <----- Here. ;-)
        -march=i386
        -mpreferred-stack-boundary=2 -fno-stack-protector -fwrapv
        -freg-struct-return -Os -fPIC
        -fno-exceptions -fno-asynchronous-unwind-tables -fno-strict-aliasing
        -falign-functions=0 -falign-jumps=0 -falign-labels=0 -falign-loops=0
        -mregparm=3 -DREGPARM=3
        -W -Wall -Wstrict-prototypes -fomit-frame-pointer
        -D__COM32__
        -nostdinc
        -iwithprefix include
        -I/home/ymorin/dev/buildroot/O/build/syslinux-6.02/com32/libutil/include
        -I/home/ymorin/dev/buildroot/O/build/syslinux-6.02/com32/include
        -I/home/ymorin/dev/buildroot/O/build/syslinux-6.02/com32/include/sys
        -I/home/ymorin/dev/buildroot/O/build/syslinux-6.02/com32/gplinclude
        -c -o cpio.o
        /home/ymorin/dev/buildroot/O/build/syslinux-6.02/com32/libupload/cpio.c

If not, then I get the usual 'bits/predefs.h' problem that is solved by
installing gcc-multilib.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
