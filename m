From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 9 Jun 2016 23:17:43 +0200
Subject: [Buildroot] [uclibc-ng-devel] Static + PIE support
In-Reply-To: <20160609231005.6b289f42@free-electrons.com>
References: <20160609000939.63366906@free-electrons.com>
 <20160609210130.GP6825@waldemar-brodkorb.de>
 <20160609231005.6b289f42@free-electrons.com>
Message-ID: <20160609211743.GR6825@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> On Thu, 9 Jun 2016 23:01:30 +0200, Waldemar Brodkorb wrote:
> 
> > > It would be good if you could investigate why uClibc doesn't produce
> > > Scrt1.o when HAVE_SHARED is disabled.  
> > 
> > At the moment Scrt1.o is only build under following condition:
> > ifeq ($(HAVE_SHARED)$(UCLIBC_FORMAT_SHARED_FLAT),y)
> > 
> > I tried to compile a simple hello world as static PIE for ARM and
> > this is not really straight forward. You need at least binutils 2.26
> > to use -W,--no-dynamic-linker otherwise PT_INTERP is added to the
> > resulting executable. After that I tried to run it in Qemu (system
> > and user level tried) and the binary fails to execute with a
> > segmentation fault.
> > So even if we add Scrt1.o somehow to the toolchains, the binaries
> > will not work on the target. Scrt1.o is just PIC version of crt1.c.
> > So the PIC assembly in uClibc-ng might be just broken.
> > 
> > Is it really required for flannel to work to use static PIE?
> 
> flannel is written in Go, so it's always built statically. So even when
> a dynamically-linked capable toolchain is used (which provides
> Scrt1.o), flannel is built as a static binary. Why would it work in
> this case, and not a fully static toolchain ?

I mean "Why flannel requires static PIE?"
In any case, if a fully static toolchain or a dynamic toolchain is
used, the static PIE ARM binary will not be working until a ARM
assembly expert make a fix.
 
> > In my point of view it is some kind of security feature used on
> > Linux together with address space layout randomization.
> > I don't know flannel, but security related software as OpenSSH
> > does allow to build with and without PIE.
> 
> I agree that PIE should be optional, but I'm not sure if it's flannel
> itself that decides to be built with PIE, or just the whole Go stuff.

Okay.
The short-term solution is to ask the go people to make pie
optional.

best regards
 Waldemar
