From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Dec 2010 00:14:57 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch
 for-2011.02/fix-ccache-support
In-Reply-To: <874oarx2r5.fsf@macbook.be.48ers.dk>
References: <cover.1291403746.git.thomas.petazzoni@free-electrons.com>
	<874oarx2r5.fsf@macbook.be.48ers.dk>
Message-ID: <20101207001457.56309418@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 05 Dec 2010 23:40:14 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Thomas> The ccache cache is kept in ~/.buildroot-ccache/, so that it can be
>  Thomas> shared between different builds.
> 
> Why here and not in the default ~/.ccache? Is the ~/.ccache directory
> content ccache-version dependent?

I don't know how ccache-version dependent are the contents of the cache
directory. In the previous ccache integration, the cache was inside
Buildroot build directory (which I thought was stupid since you then
couldn't share the cache between different Buildroot builds), but I
kept the idea of having a Buildroot-specific location for the cache.

I don't have strong opinion/arguments on that, so if you say we should
use the default cache location, I'll just do it.

> Is that working everywhere?

Everywhere I don't know, I obviously haven't compiled all our packages
with ccache support enabled.

> I remember we had some problems back when we added --sysroot= to TARGET_CC.
> The qt package in particular is stripping the --sysroot argument because
> of this.

I just tried Qt, and it built fine. It does not use ccache for the
parts compiled for the host (since we don't tell Qt about $(HOSTCXX)),
but it definitely uses the cache for parts compiled for the target.

Here are the results for a Busybox + Qt build, with a CodeSourcery glibc
ARM external toolchain.

Cold cache
==========

real    7m41.319s
user    37m53.620s
sys     1m31.660s

Hot cache
=========

real    3m4.738s
user    5m34.480s
sys     0m36.160s

And in the hot cache case, a quite significant time is spent rebuilding
the host tools, as ccache is not used there. So we could probably speed
this up a bit further.

I am not strongly advocating the usage of the "ccache /path/to/gcc"
solution compared to the symbolic link solutions, but if the first
solution works, I find it better because: 1) it's nicer and 2) it's
easier to implement with external toolchains.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
