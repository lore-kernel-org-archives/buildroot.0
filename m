From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Aug 2016 09:22:14 +0200
Subject: [Buildroot] [RFC] toolchain: libatomic needs NTPL threads
 support
In-Reply-To: <20160803054303.GA22524@waldemar-brodkorb.de>
References: <1470158755-11455-1-git-send-email-romain.naour@gmail.com>
 <20160802234521.5a77967c@free-electrons.com>
 <20160803054303.GA22524@waldemar-brodkorb.de>
Message-ID: <20160803092214.10130101@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 3 Aug 2016 07:43:09 +0200, Waldemar Brodkorb wrote:

> > Example: the Microblaze architecture does not support NPTL, but
> > libatomic is generated:  
> 
> This is not completely correct. Musl and GNU Libc support NPTL/TLS
> for microblaze. uClibc-ng as of 1.0.17 does not. I am working ?n
> syncing GNU libc support for microblaze NPTL/TLS into uClibc-ng,
> but have found some issues running the testsuite. (only sjlj
> exception handling in upstream gcc, but pthread_cancel requires
> DWARF exception handling to work, no real runtime testing in GNU
> libc, no active maintainer.)

Right, sorry. I should have said "Our uClibc-based Microblaze
toolchain". It does not have NPTL support, but still libatomic is
generated.

> Hmm. I always disable libatomic for uClibc-ng Linuxthreads and have
> to enable it for NPTL/TLS. Isn't libatomic required for NPTL/TLS to
> work?

I don't think it's related. libatomic is needed to provide the
__atomic_*() built-ins when there are not provided directly by the
architecture support. (See my previous work on __sync and __atomic
builtins).

> Are you sure Linuxthreads can be used for libatomic?
> For m68k-noMMU we need to disable it, as it doesn't compile.
> https://git.busybox.net/buildroot/tree/package/gcc/6.1.0/891-fix-m68k-uclinux.patch

The build failure at https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53833
is *NOT* about libatomic, it's about building
libgcc/config/m68k/linux-atomic.c, which is a completely different
thing.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
