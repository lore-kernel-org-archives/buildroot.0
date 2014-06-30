From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jun 2014 16:42:16 +0200
Subject: [Buildroot] [PATCH] uclibc: disable parallel build for uClibc
	0.9.31
In-Reply-To: <1404138620-7929-1-git-send-email-abrodkin@synopsys.com>
References: <1404138620-7929-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20140630164216.601d4429@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Mon, 30 Jun 2014 18:30:20 +0400, Alexey Brodkin wrote:

> +# In uClibc 0.9.31 parallel building is broken so we have to disable it
> +# Fortunately uClibc 0.9.31 is only used by AVR32 and in its turn AVR32 is
> +# about to be removed from buildroot.
> +#
> +# So as soon as AVR32 is removed please revert this patch so instead of
> +# MAKE_UCLIBC normal "MAKE" is used in UCLIBC_BUILD_CMDS
> +ifeq ($(BR2_UCLIBC_VERSION_0_9_31),y)
> +	MAKE_UCLIBC = $(MAKE1)
> +else
> +	MAKE_UCLIBC = $(MAKE)
> +endif

Sorry to nitpick, but I'd prefer to use UCLIBC_MAKE as the variable
name. We use <PKG>_<SOMETHING> for all variables, so it would make more
sense to do the same.

>  define UCLIBC_BUILD_CMDS
> -	$(MAKE) -C $(@D) \
> +	$(MAKE_UCLIBC) -C $(@D) \

Your original patch changing MAKE1 -> MAKE changed two places, and
you're changing only one place here. To be sure, we should probably
change back both places, no?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
