From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Mar 2012 22:55:08 +0100
Subject: [Buildroot] [PATCH] ext-toolchain: Automatically set -m64 if
	the architecture is x86_64
In-Reply-To: <20120305111246.68ec6324@skate>
References: <1327169083-15538-1-git-send-email-arnout@mind.be>
 <20120305111246.68ec6324@skate>
Message-ID: <201203132255.09448.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 05 March 2012 11:12:46 Thomas Petazzoni wrote:
> Hello Arnout,
> 
> Coming back to this patch, I had a closer look this week-end as I
> wanted to integrate it, but I have some comments.

 This mail slipped through the cracks somehow...

> > --- a/toolchain/toolchain-external/Config.in
> > +++ b/toolchain/toolchain-external/Config.in
> > @@ -341,16 +341,8 @@ config
> > BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109 Sourcery CodeBench
> > toolchain for the x86/x86_64 architectures, from Mentor Graphics. It
> > uses gcc 4.6.1, binutils 2.21.53, glibc 2.13, gdb 7.2.50 and kernel
> > headers
> > -	  3.0.1. It has support for the following variants:
> > -	    - Intel Pentium 4, glibc, 32 bits
> > -              Default, nothing special to do.
> > -            - Intel Atom, glibc, 32 bits
> > -              Select an Atom core
> > -            - Intel Xeon, glibc, 64 bits
> > -              Set BR2_TARGET_OPTIMIZATION to -m64
> > -            - Intel Core 2, glibc, 64 bits
> > -              Select a Core 2 core
> > -              Set BR2_TARGET_OPTIMIZATION to -m64
> > +	  3.0.1. It has support for all the i386 and x86_64 variants
> > +	  mentioned in the Target Architecture Variant menu.
> 
> I disagree with this change. If you select "i386" or "i486" as the
> Target Architecture Variant, then this Sourcery CodeBench toolchain
> will not work: it only has libc variants for Pentium 4, Atom, Xeon and
> Core 2, so if you try to use it on something older than Pentium 4, it
> might use nonexistent instructions.

 Ah, I hadn't thought of the pre-P4 variants.

> Can you explain why you made this change, or revert it?

 My customer, after reading this help text, thought that it wouldn't work
on his Athlon processor.  And the same would go for Celerons and whatnot.
So instead of enumerating all of them, I thought I'd simplify the help 
text.  And the second part of the patch removed the necessity of the
-m64 option so that didn't need to be mentioned anymore either.


> > +ifeq ($(call qstrip,$(BR2_ARCH_IS_64)),y)
> > +TOOLCHAIN_EXTERNAL_CFLAGS += -m64
> > +TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_64
> > +endif
> 
> I don't agree here. -m64 is not an option that exists for all
> 64-bits architectures. For example, it does not exist on MIPS. -m64 is
> part of the architecture-specific options of gcc, so your change should
> rather be:
> 
> ifeq ($(BR2_x86_64),y)
> TOOLCHAIN_EXTERNAL_CFLAGS += -m64
> TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_64
> endif

 OK.


> (The 'qstrip' is useless)

 Didn't know that then, but I know it now :-)


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120313/0cdc179f/attachment-0001.html>
