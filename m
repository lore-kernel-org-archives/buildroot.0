From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 3 Aug 2016 07:43:09 +0200
Subject: [Buildroot] [RFC] toolchain: libatomic needs NTPL threads
	support
In-Reply-To: <20160802234521.5a77967c@free-electrons.com>
References: <1470158755-11455-1-git-send-email-romain.naour@gmail.com>
 <20160802234521.5a77967c@free-electrons.com>
Message-ID: <20160803054303.GA22524@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> On Tue,  2 Aug 2016 19:25:55 +0200, Romain Naour wrote:
> 
> >  	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 && \
> > -		BR2_TOOLCHAIN_HAS_THREADS
> > +		BR2_TOOLCHAIN_HAS_THREADS_NPTL
> 
> So, I had a closer look. The crux of the matter is in
> libatomic/configure.tgt. There you can see that if a platform uses the
> "linux" OS part of the target tuple, libatomic will be generated.
> However, if "uclinux" is used, libatomic will not be generated.
> 
> So it's not about having NPTL or not, it's about using BR2_BINFMT_FLAT
> or not.
> 
> Example: the Microblaze architecture does not support NPTL, but
> libatomic is generated:

This is not completely correct. Musl and GNU Libc support NPTL/TLS
for microblaze. uClibc-ng as of 1.0.17 does not. I am working ?n
syncing GNU libc support for microblaze NPTL/TLS into uClibc-ng,
but have found some issues running the testsuite. (only sjlj
exception handling in upstream gcc, but pthread_cancel requires
DWARF exception handling to work, no real runtime testing in GNU
libc, no active maintainer.)
 
> br-microblaze-full-2016.05-1162-g94c7298-build.log:checking for libatomic support... yes
> 
> However, on ARM Cortex-M4, and m68k noMMU, we see:
> 
> br-arm-cortex-m4-full-2016.05-1162-g94c7298-build.log:checking for libatomic support... no
> br-m68k-5208-full-2016.05-1162-g94c7298-build.log:checking for libatomic support... no
> 
> Note that it's also not about noMMU vs. MMU, because a noMMU platform
> can use FDPIC, in which case the OS part of the tuple would be "linux".
> 
> I've therefore updated your patch with this, and applied.
> 
> However, it is worth mentioning that changing the gcc code would be
> pretty simple: it's about adding *-uclinux-* in
> libatomic/configure.tgt. Indeed, libatomic provides a generic posix
> implementation, which simply relies on pthread mutex locks to emulate
> atomicity. This works on all platforms, as long as thread support is
> available, including BR2_BINFMT_FLAT platforms.
> 
> People interested in testing this are encouraged to submit patches :-)

Hmm. I always disable libatomic for uClibc-ng Linuxthreads and have
to enable it for NPTL/TLS. Isn't libatomic required for NPTL/TLS to
work? Are you sure Linuxthreads can be used for libatomic?
For m68k-noMMU we need to disable it, as it doesn't compile.
https://git.busybox.net/buildroot/tree/package/gcc/6.1.0/891-fix-m68k-uclinux.patch

best regards
 Waldemar
