From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 18 Jul 2016 22:51:26 +0200
Subject: [Buildroot] [PATCH] package/acpitool: not available for bfin
In-Reply-To: <20160718222903.562311d5@free-electrons.com>
References: <1468778160-32413-1-git-send-email-yann.morin.1998@free.fr>
 <CAK4VdL1HipqOpg5CuYi+KDZiyrLBZQvNLYcDsECLHNC+pqsAiA@mail.gmail.com>
 <20160718183059.GA12720@free.fr>
 <20160718215151.4948f20d@free-electrons.com>
 <20160718202336.GB12720@free.fr>
 <20160718222903.562311d5@free-electrons.com>
Message-ID: <20160718205126.GC12720@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-07-18 22:29 +0200, Thomas Petazzoni spake thusly:
> On Mon, 18 Jul 2016 22:23:36 +0200, Yann E. MORIN wrote:
> 
> > Ok, so nothing in autoconf states that AC_PROG_CC should be before
> > AC_PROG_CXX.
> > 
> > So, I tried to autoreconf acpitool without changing the ordering. And it
> > still breaks at the same location, but for another reason:
> > 
> >     [...]
> >     checking host system type... bfin-buildroot-linux-uclibc
> >     checking whether the C++ compiler works... no
> >     configure: error: in `/home/ymorin/dev/buildroot/O/build/acpitool-0.5.1':
> >     configure: error: C++ compiler cannot create executables
> >     See `config.log' for more details
> > 
> > And config.log says:
> > 
> >     configure:3032: checking whether the C++ compiler works
> >     configure:3054: /home/ymorin/dev/buildroot/O/host/usr/bin/bfin-linux-g++ -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.cpp  >&5
> >     /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/../../../../bfin-buildroot-linux-uclibc/bin/ld: a.out: hidden symbol `___udivsi3' in /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/libgcc.a(_udivsi3.o) is referenced by DSO
> >     /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/../../../../bfin-buildroot-linux-uclibc/bin/ld: final link failed: Bad value
> >     collect2: error: ld returned 1 exit status
> >     configure:3058: $? = 1
> >     configure:3096: result: no
> > 
> > So. Their configure file is borked. It was generated with autoconf 2.63,
> > if that is of any importance.
> 
> I'm probably missing something, but what makes you conclude that their
> configure file is borked? What I'm seeing here is a compiler issue, not
> a configure script issue.

OK, so I am starting to loose my sanity here...

So, my working assumption was that, with the bundled configure script,
the configure failure was different than if autoreconfiguring.

I checked again. It is not different; it is the same ___udivsi3 hidden
symbol issue.

Still, I don't understand why calling AC_PROG_CC before AC_PROG_CXX
does not exhibit the issue. Is autoconf happy enough to see that the C
compiler works that it does not check the C++ compiler?

OK, I'll back off hacking complex stuff for tonight... It's 35?C here,
so that's probably the reason why I'm all weird tonight... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
