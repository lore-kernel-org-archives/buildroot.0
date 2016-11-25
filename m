From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2016 09:56:14 +0100
Subject: [Buildroot] [PATCH 2/2] toolchain: simplify the conditions for
 BR2_TOOLCHAIN_ARM_HAS_SYNC_8
In-Reply-To: <47d66856-80eb-9c55-026d-3b74b44886b1@mind.be>
References: <20161121234340.30463-1-arnout@mind.be>
 <20161121234340.30463-2-arnout@mind.be>
 <20161122093515.6db0df30@free-electrons.com>
 <47d66856-80eb-9c55-026d-3b74b44886b1@mind.be>
Message-ID: <20161125095614.5ef13945@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 25 Nov 2016 00:13:16 +0100, Arnout Vandecappelle wrote:

>  Now I think about it again, I think the condition should simply be
> 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> 
>  Let me explain again my reasoning.
> 
>  For me, the toolchain conditions that we add to hide packages are only there to
> cover missing features in certain compiler versions, not to cover bugs. The
> incorrect sync_8 implementation in gcc < 5.2 is something I consider a bug: it's
> something that has been implemented, works correctly, but fails to link with a
> specific library. Therefore, I would say that sync_8 on ARM has been available
> since gcc 4.7. An external non-glibc toolchain with gcc < 5.2 will not actually
> work, but that's due to a compiler bug. People who need one of the 3 packages
> that fail because of this compiler bug should update their compiler - and the
> best way to tell them that is to make the build fail, not to hide the option.
> 
>  But that's my opinion. It's clearly not the rule that is currently followed in
> Buildroot. Just look at the number of packages with some kind of external
> toolchain specific dependency. Honestly, I think those things are giving us more
> work for no added benefit to the user.

That's fine with me, with just one question: how do we handle this from
an autobuilder perspective? Add more and more exceptions? Doesn't it
make more sense to have those exceptions in Buildroot itself (in the
form of Config.in dependencies) so that instead of benefiting the
autobuilders only, they also benefit to the user?

Or do we want our users to run into build failures, to have them
discover the hard way that toolchain X or Y is affected by gcc bug
XYZ ? Why not instead annotate packages like we do today, to make the
life our users easier ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
