From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 13 Dec 2015 23:24:30 +0100
Subject: [Buildroot] [PATCH] erlang: disable for sparc
In-Reply-To: <20151213225630.50edd839@free-electrons.com>
References: <20151206151004.GA23217@waldemar-brodkorb.de>
 <20151213225630.50edd839@free-electrons.com>
Message-ID: <20151213222430.GR19876@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Waldemar,
> 
> On Sun, 6 Dec 2015 16:10:04 +0100, Waldemar Brodkorb wrote:
> > Required atomic operations not available for sparc.
> > Fixes autobuild failures:
> > http://autobuild.buildroot.net/results/688278236e6d5bcd63b7d4413303eb115a38f3a7/
> > http://autobuild.buildroot.net/results/7875a7425bfe1f43d46c9a1db9f96b54f7a99b19/
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> 
> While I agree that this would fix the problem, I am not too happy with
> this solution. We have lots of packages that are affected by atomic
> operations issues, not only on SPARC, so I'd prefer to have a better
> understanding of the handling of those atomic operations and add proper
> dependencies.

Sure.
 
> For example, we have BR2_ARCH_HAS_ATOMICS. What does this Config.in
> option means exactly ?

It seems to declare a architecture as having atomic operations.
Should we depend on BR2_ARCH_HAS_ATOMICS instead?

There is another symbol for packages using libatomic_ops:
BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS

Interesting is that bdwgc at least is compilable for sparc. I
have not done any runtime testing. But I think erlang does not
only use libatomic_ops, but also they are using sync* builtins from
gcc.
 
> There are some __sync_*() builtins and __atomic_*() builtins. There is
> libatomic on some architectures.

GCC documentation states that _atomic_*() builtins should be used
for new code.
 
> This is a rather big mess, and to me adding one more "depends
> on !BR2_sparc" is just a band-aid rather than a proper solution.

Right. It seems to even get more complicated. I started hacking on
leon3/leon4 support. It seems leon3/leon4 have some sparcv8
extensions, which allow to use atomic operations, so that depending
on !BR2_sparc would be wrong.

best regards
 Waldemar
