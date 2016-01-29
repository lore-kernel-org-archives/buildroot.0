From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Fri, 29 Jan 2016 11:55:30 +1100
Subject: [Buildroot] PowerPC64 toolchain not building
In-Reply-To: <20160128102044.53877287@free-electrons.com>
References: <20160123150731.1c1db4b0@free-electrons.com>
 <20160124191236.GQ17143@waldemar-brodkorb.de>
 <20160124213607.6e3b1257@free-electrons.com>
 <20160127043858.GB6719@tungsten.ozlabs.ibm.com>
 <20160127093256.77169e7d@free-electrons.com>
 <20160128024442.GA5589@tungsten.ozlabs.ibm.com>
 <20160128091742.45cad80d@free-electrons.com>
 <20160128102044.53877287@free-electrons.com>
Message-ID: <20160129005530.GA4314@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 28, 2016 at 10:20:44AM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 28 Jan 2016 09:17:42 +0100, Thomas Petazzoni wrote:
> 
> > I've restarted a build on my laptop, which has a more modern distro,
> > I'll let you know the results.
> 
> The following defconfig:
> 
> BR2_powerpc64=y
> BR2_powerpc_power8=y
> 
> fails to build on my machine, with the same error:
> 
> /tmp/ccZgjbrm.s: Assembler messages:
> /tmp/ccZgjbrm.s:19: Error: operand out of domain (7 is not a multiple of 2)
> 
> Here is the offending assembly file:
> 
> 	.file	"exch_n.c"
> 	.section	".toc","aw"
> 	.section	".text"
> 	.align 2
> 	.globl libat_exchange_16
> 	.hidden	libat_exchange_16
> 	.section	".opd","aw"
> 	.align 3
> libat_exchange_16:
> 	.quad	.L.libat_exchange_16,.TOC. at tocbase,0
> 	.previous
> 	.type	libat_exchange_16, @function
> .L.libat_exchange_16:
> 	sync
> 	mr 9,3
> 	mr 11,5
> 	mr 10,4
> .L2:
> 	lqarx 7,0,9
> 	mr 3,7
> 	mr 4,8
> 	stqcx. 10,0,9
> 	bne- 0,.L2
> 	isync
> 	blr
> 	.long 0
> 	.byte 0,0,0,0,0,0,0,0
> 	.size	libat_exchange_16,.-.L.libat_exchange_16
> 	.globl __atomic_exchange_16
> 	.set	__atomic_exchange_16,libat_exchange_16
> 	.ident	"GCC: (Buildroot 2016.02-git-00995-g390d559) 4.9.3"
> 
> So the instruction "lqarx 7,0,9" is at fault.
> 
> Best regards,
> 
> Thomas

I've managed to replicate your problem!

The key to reproducing it seems to be to optimise for size: I compared your
compile line to mine, and the only difference was -Os vs. -O3 :-)

So try optimizing for speed instead: this obviously works around it for me ;-)

And yes, it's the lqarx instruction causing the problem: it's first argument must
be even but it's 7, so this looks like a bug in gcc.

I did some searching around and it looks like this has been a problem in the
past and it's been fixed, but it looks like optimizing for size causes it to
re-appear. There's a bit of related info here:

http://comments.gmane.org/gmane.comp.gcc.bugs/388637

Would you like to raise it on https://gcc.gnu.org/bugzilla/ ?
Alternativly, it's no problem for me handle it if you like (I work on PowerKVM
:-).

Cheers,
Sam.
