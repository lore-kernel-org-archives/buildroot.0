From: Phil Edworthy <Phil.Edworthy@renesas.com>
Date: Fri, 10 Sep 2010 16:25:37 +0100
Subject: [Buildroot] [PATCH] Fix 'make source' when used with external
	toolchains
In-Reply-To: <1284129272.3193.279.camel@dubciaranr1.verifone.com>
References: <AB12B32E73474741A2C5361C433A44DE021912DD@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
	<1284129272.3193.279.camel@dubciaranr1.verifone.com>
Message-ID: <AB12B32E73474741A2C5361C433A44DE0219146B@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> Ar Aoine, 2010-09-10 ag 13:59 +0100, scr?obh Phil Edworthy:
> > When you do 'make source', Buildroot unconditionally downloads gcc and
> > binutils/mpfr. When using an external toolchain, BR2_GCC_VERSION isn't
> set
> > so the download fails.
> >
> > This patch makes the download conditional.
> 
> This is great and does seem to work.  I had done a long and rambling
> diagnosis and had figured out that this was the problem.
> I was about to send to the list for proposed solutions because I feared
> that just disabling the specific lines wasn't the right approach.

It seemed like the simplest approach at the time!


> The one observation I have is that if I patch like this:
> 
> diff --git a/Makefile b/Makefile
> index 462d974..88e17d1 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -437,6 +437,10 @@ endif
> 
>  source: $(TARGETS_SOURCE) $(HOST_SOURCE)
> 
> +show-source-targets:
> +	@echo Targets: $(TARGETS_SOURCE)
> +	@echo Host: $(HOST_SOURCE)
> +
>  _source-check:
>  	$(MAKE) $(EXTRAMAKEARGS) SPIDER=--spider source
> 
> 
> and do "make show-source-targets", I get this
> 
> $ make show-targets show-source-targets
> busybox target-finalize target-generic-hostname target-generic-issue ext2-
> root erase-fakeroots
> Targets: busybox-source target-finalize-source target-generic-hostname-
> source target-generic-issue-source ext2-root-source erase-fakeroots-source
> uclibc-source
> Host:
> 
> i.e. uclibc-source is in the target list for "make source".
> 
> Does this have the potential to cause a problem?

Hmm, I only tested this against glibc... 

uclibc-source is only used in uclibc.mk & this is entirely enclosed by 'ifeq
($(BR2_TOOLCHAIN_BUILDROOT),y)' so I don?t think this will be a problem.

Unfortunately I'm not around for the next week so I can't check this. I also
don?t have a uclibc external toolchain... 

Phil
