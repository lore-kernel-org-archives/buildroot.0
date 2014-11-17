From: Volker Krause <volker.krause@kdab.com>
Date: Mon, 17 Nov 2014 21:00:16 +0100
Subject: [Buildroot] [PATCH v2] pkg-cmake.mk: Set CMAKE_SYSTEM_PROCESSOR.
In-Reply-To: <20141116232342.2ae8cce9@free-electrons.com>
References: <1416138927-7857-1-git-send-email-volker.krause@kdab.com>
 <20141116232342.2ae8cce9@free-electrons.com>
Message-ID: <3699446.aCFlAc4tJo@vkpc9>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 16 November 2014 23:23:42 Thomas Petazzoni wrote:
> On Sun, 16 Nov 2014 12:55:27 +0100, Volker Krause wrote:
> > +# CMAKE_SYSTEM_PROCESSOR should match uname -m
> > +ifeq ($(BR2_ARM_CPU_ARMV5),y)
> > +CMAKE_SYSTEM_PROCESSOR = armv5
> > +endif
> > +ifeq ($(BR2_ARM_CPU_ARMV6),y)
> > +CMAKE_SYSTEM_PROCESSOR = armv6l
> > +endif
> > +ifeq ($(BR2_ARM_CPU_ARMV7A),y)
> > +CMAKE_SYSTEM_PROCESSOR = armv7l
> 
> I believe armv6l and armv7l is only valid on little-endian ARM systems,
> not big endian ones.

you are right, and armv5 is missing the endianess suffix. Fixed in the next 
version.

> > +endif
> > +ifndef CMAKE_SYSTEM_PROCESSOR
> > +CMAKE_SYSTEM_PROCESSOR = $(BR2_ARCH)
> > +endif
> 
> Are we sure that $(BR2_ARCH) is valid for all other cases?

It is correct for x86 (32 and 64 bit), as discussed previously. Besides that I 
only have access to armv6 and armv7a devices for testing.

I looked at the kernel code, but unfortunately it's not exactly 
straightforward to determine what the machine name will be in which case. So, 
no, I can't provide a complete $(BR2_ARCH) -> uname -m mapping for all 
platforms.

That's of course sub-optimal, but IMHO not necessarily a blocker. This value 
is kinda unreliable from a CMake POV anyway (as it's provided by the system, 
especially when also considering non-Linux), and is therefore only useful for 
a very basic distinction between a fixed set of known architectures, if no 
better check is available, by means of some fuzzy comparison (see e.g. the x86 
vs. i686 discussion earlier). You'd not use this for details like endianess or 
pointer sizes for example, there's more robust ways to check for that (e.g. 
CMAKE_SIZEOF_VOID_P). But an "is MIPS?" check would work no matter if the 
exact value might be "mips", "mipsel", "mips64" or "mips64l".

I therefore think that $(BR2_ARCH) is a sufficient approximation for all 
platforms where we do not know the exact mapping to uname -m.

Impact on existing packages is also worth looking at. There is very few 
actually making use of CMAKE_SYSTEM_PROCESSOR to begin with. I think it's safe 
to assume the case that a package breaks if the variable is set but worked 
with an empty one before is reasonably unlikely. So the ones making use of 
this are currently doing their own mapping and set CMAKE_SYSTEM_PROCESSOR via 
the command line (which is where the first version of the mapping for this 
patch came from). Those should not see a difference at all, they'd still be 
overriding it manually. 

And anyone targeting a platform with a currently possibly wrong mapping with a 
new/updated package would need to sort that out in any case, while at least 
some platforms would work out of the box already with this patch.

So, IMHO still a step into the right direction, even if we cannot complete the 
$(BR2_ARCH) -> uname -m mapping entirely.

> Also, please use the following construct instead:
> 
> ifeq (....)
> ...
> else ifeq (....)
> ...
> else ifeq (....)
> ...
> else
> ....
> endif

fixed

regards,
Volker
