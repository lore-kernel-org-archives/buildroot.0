From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Nov 2016 15:42:20 +0100
Subject: [Buildroot] mplayer issue due to toolchain wrapper
In-Reply-To: <1788f3a4-3ad3-9b22-d5fb-a1f8971f1fef@mind.be>
References: <1788f3a4-3ad3-9b22-d5fb-a1f8971f1fef@mind.be>
Message-ID: <20161120154220.647f7e89@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Nov 2016 14:49:42 +0100, Arnout Vandecappelle wrote:

>  So, we need to remove the -Wl,-elf2flt from the wrapper. Here are the options I
> see - none are satisfactory...
> 
> * Detect this specific gcc invocation and remove -Wl,-elf2flt. Yikes.
> 
> * Just remove if and pass -Wl,-elf2flt through LDFLAGS. We already know however
> that the way that package build systems use LDFLAGS is very unreliable. The good
> news is that (AFAIU) failing to pass this option will lead to build failures
> when linking programs (but I think it won't for linking libraries, so all leaf
> libraries remain untested).
> 
> * Create an ld wrapper. However, this ld wrapper will have to add the -elf2flt
> even when called from gcc, so it's not just the one in host/usr/bin that has to
> be wrapped, but also the one in $CC -print-prog-name=ld. And it's likely that
> some packages (kernel, bootloader, ...) do NOT want this option.
> 
> * Fix individual packages that behave this way. Two problems with that: the
> patches will never be upstreamable (this is really a buildroot issue), and it's
> hard to find these situations - in the mplayer case, for example, it falls back
> to the host compiler and that could have given a successful build. It's just
> because also -marm is passed that we get a build failure.
> 
>  Does anyone have better ideas?

Disable mplayer on ARMv7-M ?

If you fix this gcc -v problem, does it then successfully builds? I'm
honestly unsure who would want to use mplayer on a slow Cortex-M
micro-controller. I believe it's simply not worth the effort fixing
this problem. And the problem is caused by how the non-autoconf
configure script of mplayer detects gcc, and most likely, no other
package is going to detect gcc in the same way.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
