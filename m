From: Michael S. Zick <minimod@morethan.org>
Date: Sun, 29 Nov 2009 03:16:18 -0600
Subject: [Buildroot] BB update Was:  Build jobbing
In-Reply-To: <87r5rh3e8w.fsf@macbook.be.48ers.dk>
References: <200911271522.58858.minimod@morethan.org>
	<200911281650.44375.minimod@morethan.org>
	<87r5rh3e8w.fsf@macbook.be.48ers.dk>
Message-ID: <200911290316.20688.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun November 29 2009, Peter Korsgaard wrote:
> >>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:
> 
> Hi,
> 
>  Michael> Try:
> 
>  Michael> Lua 5.1.4  Copyright (C) 1994-2008 Lua.org, PUC-Rio
>  >> print(math.sin(garbage))
>  Michael> stdin:1: bad argument #1 to 'sin' (number expected, got nil)
>  Michael> stack traceback:
>  Michael>         [C]: in function 'sin'
>  Michael>         stdin:1: in main chunk
>  Michael>         [C]: ?
> 
> 
> I get exactly the same on BR:
> 
> sudo chroot /tmp/blah /bin/sh
> / # lua
> Lua 5.1.4  Copyright (C) 1994-2008 Lua.org, PUC-Rio
> > print(math.sin(garbage))
> stdin:1: bad argument #1 to 'sin' (number expected, got nil)
> stack traceback:
>         [C]: in function 'sin'
>         stdin:1: in main chunk
>         [C]: ?
> 

Found what might lead to the references I need:
http://www.mips.com/products/processors/32-64-bit-cores/mips32-24k/index.cfm#specifications

Which immediately shows that I made an error - about mid-page;
Just because the core has "core extend" does not mean it has 
hardware floating point.
duh...
It would seem that if you have enough gates for a pair of DSP
cores, you would have enough to "waste" a few thousand on H.F.P.

I'll dig into the problem and try to sort it all out today.
Will also try to figure out why I didn't get a backtrace from
a NaN error in Lua.  The "no backtrace" is a separate problem
from "no double" number type.

At first glance, it looks like a case for a Config.in.mips sub-menu.
Just to get all of the gcc options and core options to match up.

Mike
