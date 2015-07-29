From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jul 2015 23:37:25 +0200
Subject: [Buildroot] [PATCH] package/golang: new package
In-Reply-To: <20150729212003.GB3722@free.fr>
References: <1438202101-5106-1-git-send-email-yann.morin.1998@free.fr>
 <20150729231228.0a59fcde@free-electrons.com>
 <20150729212003.GB3722@free.fr>
Message-ID: <20150729233725.60512298@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 29 Jul 2015 23:20:03 +0200, Yann E. MORIN wrote:

> > Are you sure using VFPV3/VFPV2 is correct here? Looking at the GOARM
> > values, it seems really like you're trying to check if we're building
> > for ARMv5, ARMv6 or ARMv7. So what about using BR2_ARM_CPU_ARMV5,
> > BR2_ARM_CPU_ARMV6 and BR2_ARM_CPU_ARMV7 instead ?
> 
> No, that really is the way it goes. See;
>     https://golang.org/doc/install/source#environment
> 
> ---8<---
> * $GOARM (for arm only; default is auto-detected if building on the target
>   processor, 6 if not)
> 
>   - This sets the ARM floating point co-processor architecture version the
>     run-time should target. If you are compiling on the target system, its
>     value will be auto-detected.
> 
>     . GOARM=5: use software floating point; when CPU doesn't have VFP
>       co-processor
>     . GOARM=6: use VFPv1 only; default if cross compiling; usually ARM11
>       or better cores (VFPv2 or better is also supported)
>     . GOARM=7: use VFPv3; usually Cortex-A cores 
> ---8<---
> 
> So, what it really wants to know ifs what kind of FPU it can use.

Alright, then a short comment above this might be useful.


> > > +# We must install both the src/ and include/ subdirs because they
> > > +# contain the go "runtime".
> > > +define GOLANG_INSTALL_TARGET_CMDS
> > > +	$(INSTALL) -D -m 0755 $(@D)/bin/linux_$(GOLANG_ARCH)/go $(TARGET_DIR)/usr/bin/go
> > > +	$(INSTALL) -D -m 0755 $(@D)/bin/linux_$(GOLANG_ARCH)/gofmt $(TARGET_DIR)/usr/bin/gofmt
> > > +	rm -rf $(TARGET_DIR)/usr/lib/go/
> > 
> > Why this rm -rf ?
> 
> To remove any pre-existing intall, in case one does golang-reinstall or
> golang-rebuild...

We're not doing this for any other package, so why should we be doing
this for golang?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
