From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 29 Jun 2011 18:14:37 +0200
Subject: [Buildroot] problems compiling uclibc for Geode (i386)
In-Reply-To: <20110629164330.1f5780a7@skate>
References: <1309291371.21632.5.camel@bender> <1309350574.17457.5.camel@sven>
 <20110629164330.1f5780a7@skate>
Message-ID: <201106291814.38165.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sven, Thomas, All,

On Wednesday 29 June 2011 16:43:30 Thomas Petazzoni wrote:
> Le Wed, 29 Jun 2011 14:29:34 +0200,
> Sven Neumann <s.neumann@raumfeld.com> a ?crit :
> 
> > >   LD libuClibc-0.9.32.so
> > > libc/libc_so.a(err.os):(.text.vwarn_work+0x127): undefined
> > > reference to `__lll_unlock_wake_private'
> > > collect2: ld returned 1 exit status
> > > make[1]: *** [lib/libc.so] Error 1
> > > make[1]: Leaving directory
> > > `/home/sven/git/buildroot/output/toolchain/uClibc-0.9.32'
> > 
> > Looks like NPTL support is broken for the generic 386 target. I've
> > changed the uclibc configuration to i586 now (in the hope that this
> > will work for a Geode processor) and that has fixed above problem for
> > me.
> 
> This function is implemented in
> libpthread/nptl/sysdeps/unix/sysv/linux/i386/i486/lowlevellock.S, so
> presumably, i386 does not work, but i486 should.
> 
> My understanding is that the futex mechanism uses the cmpxchgl
> instruction, which is only available on 486+ processors.

I confirm Thomas' explanations.

NPTL on x86 requires i486+ because of the cmpxchg opcode.
NPTL will never be implemented for i386.

IIRC, Geode is at least an i586, so you should be OK by selecting i586
instead of generic i386.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
