From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 3 Nov 2018 16:11:07 +0100
Subject: [Buildroot] [PATCH 1/4] llvm: fix build of host-llvm
In-Reply-To: <20181103153559.43c5277e@windsurf>
References: <20181103122758.10578-1-fontaine.fabrice@gmail.com>
 <83cfc6de-40c3-9c92-1f6e-fcc0bf13ff4e@gmail.com>
 <20181103153559.43c5277e@windsurf>
Message-ID: <CAPi7W82fNEGdA2RsiefNqBcF7C1p_pme7kG2Y-Uu3oyWGjM2WA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,
Le sam. 3 nov. 2018 ? 15:36, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello,
>
> On Sat, 3 Nov 2018 15:15:30 +0100, Romain Naour wrote:
>
> > > @@ -10,6 +10,7 @@ config BR2_PACKAGE_LLVM_TARGET_ARCH
> > >     default "AArch64" if BR2_aarch64
> > >     default "ARM" if BR2_arm || BR2_armeb
> > >     default "X86" if BR2_i386 || BR2_x86_64
> > > +   default "host"
> >
> > I'm not sure this is the correct thing to do since BR2_PACKAGE_LLVM_TARGET_ARCH
> > will be used for the target variant.
> >
> > "host" stand for "automatic detection"
> >
> > Maybe you want to add "X86" along with LLVM_TARGETS_TO_BUILD for host-llvm ?
> >
> > Something like:
> >
> > HOST_LLVM_TARGETS_TO_BUILD = $(LLVM_TARGETS_TO_BUILD) X86
>
> For the host, it makes sense to use "automatic detection", so what
> about:
>
> HOST_LLVM_TARGETS_TO_BUILD = $(LLVM_TARGETS_TO_BUILD) host
>
> i.e, have support for the target architecture, but also the
> architecture ?
The issue is not with LLVM_TARGETS_TO_BUILD but with LLVM_TARGET_ARCH.
LLVM_TARGET_ARCH can't be empty and it can only contain a single
value. That why I put a new default value of "host" for
BR2_PACKAGE_LLVM_TARGET_ARCH if no other values are provided.
>
> However, presumably, LLVM may not have support for all host
> architectures, so this calls for a BR2_PACKAGE_HOST_LLVM_ARCH_SUPPORTS ?
Indeed, that would make sense. From what I can read here:
https://llvm.org/docs/GettingStarted.html#hardware, it seems that llvm
should build on x86, ARM, powerpc.
I would suggest to add this new variable:
config BR2_PACKAGE_HOST_LLVM_ARCH_SUPPORTS
        bool
        default y if BR2_HOSTARCH = "x86_64"
        default y if BR2_HOSTARCH = "x86"
        default y if BR2_HOSTARCH = "powerpc"
        default y if BR2_HOSTARCH = "arm"
        default y if BR2_HOSTARCH = "aarch64"

and do:

config BR2_PACKAGE_LLVM_TARGET_ARCH
        string
        default "AArch64" if BR2_aarch64
        default "ARM" if BR2_arm || BR2_armeb
        default "X86" if BR2_i386 || BR2_x86_64
        default "host" if BR2_PACKAGE_HOST_LLVM_ARCH_SUPPORTS

Does it make sense?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
