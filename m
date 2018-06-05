From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 5 Jun 2018 17:43:32 +0200
Subject: [Buildroot] [PATCHv2] linux: may fail to boot for binutils
 2.29+ even without armv7m
In-Reply-To: <b6e193cb-d79d-3758-859a-e8c80933947f@gezedo.com>
References: <20180601180157.759-1-yann.morin.1998@free.fr>
 <b3672758-0d2b-51cd-7eac-cc06158a995b@mind.be>
 <20180605074932.668ae4e7@windsurf>
 <b6e193cb-d79d-3758-859a-e8c80933947f@gezedo.com>
Message-ID: <20180605154332.GC2503@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Laurent, All,

On 2018-06-05 09:23 +0200, Laurent GONZALEZ spake thusly:
> On 05/06/2018 07:49, Thomas Petazzoni wrote:
> > On Tue, 5 Jun 2018 00:10:30 +0200, Arnout Vandecappelle wrote:
> >>>  comment "Linux kernel may fail to boot with binutils >= 2.29"
> >>> -	depends on BR2_ARM_CPU_ARMV7M
> >>> +	depends on BR2_arm || BR2_armeb  
> >>  I have a bit of a problem with this patch. IMO it's rather unlikely that people
> >> build the kernel in THUMB mode on non-M CPUs.
> > Are you sure ? There is definitely support for building a Thumb2 kernel
> > on ARMv7-A, and I think it's a popular way to reduce a bit the size of
> > the kernel, no?
> I gently remember the list that we can alternatively fix the kernel with a patch.

Not really, because we don;t know where the kernel is coming from, and
if it is already patched or not, or if it has a similar construct
elsewhere in the code.

A lot of users, especially enterprise-class citizen, have their own
internal git tree(s) with their own kernel patched for their own
bioard(s), to which they may also apply various unknown sets of patches,
so they may already have that patch applied in those internal trees.

Granted, we could have a conditional patch, like the perl deprecated
stuff, but I don;t much like that idea, because it is not bullet-proof
(e.g. their tree already has a patch that touches close to where our
patch would be applied, so they conflict, so our patch does not apply,
so we believe their kernl is OK while it is not, and the runtime fails,
and we're back to square-one).

Granted, this is very unlikely, but the more unlikely things tend to be 
in theory, the more they tend to happen in the real world! ;-)

> This solution will allow any version of binutils to work with any version of the kernel, and can be easily reverted.
> 
> What about using:
> 
> http://lists.infradead.org/pipermail/linux-arm-kernel/2018-March/565390.html

That patch has still not been applied in v4.17, so I'd be wary of using
a patch that is not a backport anyway... And BTW, v4.17 is still unfixed
as far as I can see...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
