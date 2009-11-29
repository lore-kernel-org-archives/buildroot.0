From: Michael S. Zick <minimod@morethan.org>
Date: Sun, 29 Nov 2009 10:50:53 -0600
Subject: [Buildroot] BB update Was:  Build jobbing
In-Reply-To: <200911290453.34368.minimod@morethan.org>
References: <200911271522.58858.minimod@morethan.org>
	<87iqct39zz.fsf@macbook.be.48ers.dk>
	<200911290453.34368.minimod@morethan.org>
Message-ID: <200911291050.56277.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun November 29 2009, Michael S. Zick wrote:
> If Erik had put in a "use compiler default model" / "use setjmp-longjmp"
> 

I thought that we had agreed the above was the meaning of that option -
only effects the compiler's model of stack unwind information.
**NOT** user space. (unless you count gdb - which has to understand it).

> > In general, we try to use sensible defaults - If you don't understand an
> > option, just leave it at default.
> > 

guess what, the "sensible defaults" results are in:

/ # uname -a
Linux Venus 2.6.12.6-VENUS #13 Wed Jul 15 17:57:07 CST 2009 mips unknown
/ # chroot /tmp/work
/ # lua
Lua 5.1.4  Copyright (C) 1994-2008 Lua.org, PUC-Rio
> print(math.sin(12))
-0.53657291800043
> print(math.sin(garbage))
stdin:1: bad argument #1 to 'sin' (number expected, got nil)
stack traceback:
        [C]: in function 'sin'
        stdin:1: in main chunk
        [C]: ?
> os.exit()
/ #

1) The computation of math.sin(12) (as a double) is incorrect - -
That is because I didn't know about the "sort-of-Hard-Float" yesterday.
I should be able to fix that once I get the math options corrected.

2) It didn't trap, just produced an erroneous value (?wrong fp options?).

3) I now have a stack traceback (implemented in Lua as setjmp/longjmp)!

Number three is the one specific to this discussion.

That 2004-Eric option is affecting the use of setjmp/longjmp *in application
code*.  
I think we are agreed that was not the intent, 
regardless of the wording of the help message.

So I will continue with translating this 0.5Gbytes of MIPS documentation into
a menuconfig file - - - (number 1 & 2 above).

Somebody familiar with the build system take a look at how this option is being
used please.  Assign it a bug-tracking number if no "quick fix" is seen.

*) it shouldn't be needed by gcc-4.x for MIPS; "compiler default" should work.
*) if it leads to a "--disable-setjmp" option being passed to applications;
that needs to be sorted out.

Mike
