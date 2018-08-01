From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Aug 2018 17:39:04 +0200
Subject: [Buildroot] [PATCH] linux: kconfig needs the toolchain
In-Reply-To: <d703b5fb-a3e9-6398-c5e8-bf63c25ba106@mind.be>
References: <20180731201617.20829-1-yann.morin.1998@free.fr>
 <d703b5fb-a3e9-6398-c5e8-bf63c25ba106@mind.be>
Message-ID: <20180801153904.GA2294@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-08-01 00:21 +0200, Arnout Vandecappelle spake thusly:
> On 31-07-18 22:16, Yann E. MORIN wrote:
> > Starting with linux-4.18, the kconfig from the kernel can call
> > to the compiler to test its capabilities; see:
> > 
> >     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/Kconfig.include
> > 
> > Like is done in the kconfig-package infra for the dependency on
> > $(1)-patch, we use an order-only prerequisites on the toolchain,
> > to guarantee the compiler is available before we can display the
> > kconfig of the kernel.
>  You actually want to say here why an order-only dependency and not a normal
> dependency: "Since 'toolchain' is a phony target and therefore always out of
> date, a normal dependency would cause the .config target to be rebuilt on each
> invocation of make."

ACK

> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > ---
> >  linux/linux.mk | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/linux/linux.mk b/linux/linux.mk
> > index 7527b11673..63c649ce83 100644
> > --- a/linux/linux.mk
> > +++ b/linux/linux.mk
> > @@ -510,6 +510,13 @@ endif # BR_BUILDING
> >  
> >  $(eval $(kconfig-package))
> >  
> > +# Starting with linux-4.18, the kconfig in the kernel calls
> > +# the cross-compiler to check its capabilities. So we need
> > +# the toolchain before we can call our configurators.
> > +# Also, since we need LINUX_DIR, we must be after the call
> > +# to kconfig-package, above.
> > +$(LINUX_DIR)/.config: | toolchain
> 
>  I think we want to avoid using LINUX_DIR, and instead use LINUX_SRCDIR or
> LINUX_BUILDDIR, no? For the eventual source/build directory split?

Well, LINUX_DIR is already used below, for the rules doing the rebuild
with the initramfs.

And I don't want to mix-n-match the variables just yet...

But if the consensus from others point toward using LINUX_BUILDDIR, then
I'll change.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > +
> >  # Support for rebuilding the kernel after the cpio archive has
> >  # been generated.
> >  .PHONY: linux-rebuild-with-initramfs
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
