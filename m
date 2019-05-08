From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 8 May 2019 13:19:00 +0000
Subject: [Buildroot] [PATCH] linux-tools/perf: Respect TARGET_CFLAGS
In-Reply-To: <20190427175603.GA27252@scaer>
References: <20190418093902.41835-1-abrodkin@synopsys.com>
 <20190418114336.61f3f404@windsurf>
 <ea5f11a1-a7cb-4cee-dfda-64d55d550d83@mind.be>
 <CY4PR1201MB01207D3F0C5E488EACEBA5DAA13E0@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <ed9e89cc-3f7e-1a05-0d1e-6c6da6a3eb38@mind.be> <20190427175603.GA27252@scaer>
Message-ID: <CY4PR1201MB012025B382EBDE4883CA80B8A1320@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

> -----Original Message-----
> From: Yann E. MORIN <yann.morin.1998@gmail.com> On Behalf Of Yann E. MORIN
> Sent: Saturday, April 27, 2019 8:56 PM
> To: Arnout Vandecappelle <arnout@mind.be>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>; Thomas Petazzoni <thomas.petazzoni@bootlin.com>;
> buildroot at busybox.net; ARC Buildroot mailing list <arc-buildroot@synopsys.com>
> Subject: Re: [Buildroot] [PATCH] linux-tools/perf: Respect TARGET_CFLAGS
> 
> Arnout, Alexey, All,
> 
> On 2019-04-27 19:39 +0200, Arnout Vandecappelle spake thusly:
> > On 26/04/2019 08:30, Alexey Brodkin wrote:
> [--SNIP--]
> > >>> The change is OK, but I believe that if -matomic is really a
> > >>> core/important CFLAGS on ARC, then we should ideally pass it through
> > >>> the toolchain wrapper, so that we are sure it is always passed.
> > >>> Arnout, what do you think?
> > >>  +1.
> > >>  Thomas, last year we made a beginning of deciding what should go through the
> > >> wrapper and what through CFLAGS, but I'm not sure if we ever got to a conclusion?
> > > So are we going to wait for some infrastructure changes or
> > > shall we first fix the problem at hand with broken perf build to ARC700?
> >
> >  It's not really infrastructure changes. Rather, it is a better way to fix the
> > issue.
> >
> >  You just need to move the -matomic from TARGET_ABI to TOOLCHAIN_WRAPPER_OPTS.
> >
> >  The only tricky part is where that should be done. I think arch/arch.mk.arc
> > would be the right place. But that indeed requires an infrastructural change,
> > because the TOOLCHAIN_WRAPPER_OPTS = ... in toolchain-wrapper.mk has to change
> > into a +=.
> 
> I'm not too fond of this, but what about the following:
> 
> diff --git a/arch/arch.mk.arc b/arch/arch.mk.arc
> new file mode 100644
> index 0000000000..83503841b6
> --- /dev/null
> +++ b/arch/arch.mk.arc
> @@ -0,0 +1,3 @@
> +ifeq ($(BR2_arcle),y)
> +ARCH_TOOLCHAIN_WRAPPER_OPTS = -matomic
> +endif
> diff --git a/toolchain/toolchain-wrapper.mk
> b/toolchain/toolchain-wrapper.mk
> index ca66fa7ba4..8f872506ec 100644
> --- a/toolchain/toolchain-wrapper.mk
> +++ b/toolchain/toolchain-wrapper.mk
> @@ -17,6 +17,7 @@ TOOLCHAIN_WRAPPER_ARGS =
> $($(PKG)_TOOLCHAIN_WRAPPER_ARGS)
>  TOOLCHAIN_WRAPPER_ARGS += -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
> 
>  TOOLCHAIN_WRAPPER_OPTS = \
> +   $(ARCH_TOOLCHAIN_WRAPPER_OPTS) \
>     $(call qstrip,$(BR2_SSP_OPTION)) \
>     $(call qstrip,$(BR2_TARGET_OPTIMIZATION))

That looks good to me with only one change: prefer generic "BR2_arc"
instead of little-endian only "BR2_arcle".

Care to send-out a patch?

-Alexey
