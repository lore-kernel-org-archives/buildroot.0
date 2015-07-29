From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 29 Jul 2015 23:20:03 +0200
Subject: [Buildroot] [PATCH] package/golang: new package
In-Reply-To: <20150729231228.0a59fcde@free-electrons.com>
References: <1438202101-5106-1-git-send-email-yann.morin.1998@free.fr>
 <20150729231228.0a59fcde@free-electrons.com>
Message-ID: <20150729212003.GB3722@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-07-29 23:12 +0200, Thomas Petazzoni spake thusly:
> On Wed, 29 Jul 2015 22:35:01 +0200, Yann E. MORIN wrote:
> > diff --git a/package/golang/golang.hash b/package/golang/golang.hash
> > new file mode 100644
> > index 0000000..146e39c
> > --- /dev/null
> > +++ b/package/golang/golang.hash
> > @@ -0,0 +1 @@
> 
> Origin of the hash?

Right.

> > +GOLANG_ARCH =
> 
> Defining a variable to nothing is not very useful I believe.

Right.

> > +GOLANG_ENV = \
> > +	CC_FOR_TARGET="$(TARGET_CC)" \
> > +	LD_FOR_TARGET="$(TARGET_LD)" \
> > +	GOOS=linux
> > +
> > +ifeq ($(BR2_i386),y)
> > +GOLANG_ARCH = 386
> > +ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
> > +GOLANG_ENV += GO386=sse2
> > +else
> > +GOLANG_ENV += GO386=387
> > +endif
> > +endif # i386
> > +
> > +ifeq ($(BR2_x86_64),y)
> > +GOLANG_ARCH = amd64
> > +endif # x86_64
> > +
> > +# For ARM, the selection of the instruciton set is a bit unusual,
> > +# and is decided on whether the CPU has an FPU, and which one.
> > +ifeq ($(BR2_arm),y)
> > +GOLANG_ARCH = arm
> > +ifeq ($(BR2_ARM_CPU_HAS_VFPV3),y)
> > +GOLANG_ENV += GOARM=7
> > +else ifeq ($(BR2_ARM_CPU_HAS_VFPV2),y)
> > +GOLANG_ENV += GOARM=6
> > +else
> > +GOLANG_ENV += GOARM=5
> 
> Are you sure using VFPV3/VFPV2 is correct here? Looking at the GOARM
> values, it seems really like you're trying to check if we're building
> for ARMv5, ARMv6 or ARMv7. So what about using BR2_ARM_CPU_ARMV5,
> BR2_ARM_CPU_ARMV6 and BR2_ARM_CPU_ARMV7 instead ?

No, that really is the way it goes. See;
    https://golang.org/doc/install/source#environment

---8<---
* $GOARM (for arm only; default is auto-detected if building on the target
  processor, 6 if not)

  - This sets the ARM floating point co-processor architecture version the
    run-time should target. If you are compiling on the target system, its
    value will be auto-detected.

    . GOARM=5: use software floating point; when CPU doesn't have VFP
      co-processor
    . GOARM=6: use VFPv1 only; default if cross compiling; usually ARM11
      or better cores (VFPv2 or better is also supported)
    . GOARM=7: use VFPv3; usually Cortex-A cores 
---8<---

So, what it really wants to know ifs what kind of FPU it can use.

No, I never said that buildsystem was sane... :-[

> > +define GOLANG_BUILD_CMDS
> > +	cd $(@D)/src/; \
> > +	$(GOLANG_ENV) \
> > +	GOROOT_FINAL="/usr/lib/go" \
> > +	GO_NO_HOST=1 \
> > +	./make.bash --no-banner
> 
> Indent the lines after the cd, maybe, and do not excessively split
> lines.
> 
> 	cd $(@D)/src && \
> 		$(GOLANG_ENV) GOROOT_FINAL="/usr/lib/go" GO_NO_HOST=1 \
> 			./make.bash --no-banner

OK.

> > +# We must install both the src/ and include/ subdirs because they
> > +# contain the go "runtime".
> > +define GOLANG_INSTALL_TARGET_CMDS
> > +	$(INSTALL) -D -m 0755 $(@D)/bin/linux_$(GOLANG_ARCH)/go $(TARGET_DIR)/usr/bin/go
> > +	$(INSTALL) -D -m 0755 $(@D)/bin/linux_$(GOLANG_ARCH)/gofmt $(TARGET_DIR)/usr/bin/gofmt
> > +	rm -rf $(TARGET_DIR)/usr/lib/go/
> 
> Why this rm -rf ?

To remove any pre-existing intall, in case one does golang-reinstall or
golang-rebuild...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
