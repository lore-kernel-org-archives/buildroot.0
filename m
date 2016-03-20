From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 15:22:12 +0100
Subject: [Buildroot] [PATCH 3/3] package/multicat: fix build with
 external Blackfin uClibc toolchain
In-Reply-To: <1458430906-8291-3-git-send-email-joerg.krause@embedded.rocks>
References: <1458430906-8291-1-git-send-email-joerg.krause@embedded.rocks>
 <1458430906-8291-3-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160320152212.54caaaa6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Mar 2016 00:41:46 +0100, J?rg Krause wrote:
> multicat uses clock_nanosleep() conditionally if HAVE_NANOSLEEP is defined. The
> bad is that multicat does not check for clock_nanosleep(), but defines

"bad .." ?

> HAVE_NANOSLEEP if __APPLE__ is not defined.
> 
> uClibc has clock_nanosleep() only if built with UCLIBC_HAS_ADVANCED_REALTIME.
> and the external Blackfin toolchain has no support for clock_nanosleep().

Are you sure? Here the Blackfin toolchain does have
UCLIBC_HAS_ADVANCED_REALTIME:

$ grep ADVANCED_REALTIME output/staging/usr/include/bits/uClibc_config.h 
#define __UCLIBC_HAS_ADVANCED_REALTIME__ 1

But indeed it doesn't have clock_nanosleep().

When I saw your patch, I was hoping to be able to replace it with a
patch that tests __UCLIBC__ and __UCLIBC_HAS_ADVANCED_REALTIME__ to
determine whether we have clock_nanosleep() or not. But it seems like
some other things on Blackfin has the consequence that we don't have
clock_nanosleep(). I looked at uClibc 0.9.33.2 (which is used in the
Blackfin toolchain, as far as I can see), and I couldn't see why
clock_nanosleep() was not provided.


> +# multicat does not test for HAVE_CLOCK_NANOSLEEP, but sets it if __APPLE__ is
> +# not defined. The external Blackfin toolchain is uClibc which has
> +# clock_nanosleep() only if built with UCLIBC_HAS_ADVANCED_REALTIME.
> +# Use a hool to overwrite the definition of HAVE_CLOCK_NANOSLEEP for this

hool -> hook

> +# toolchain.
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX),y)
> +define MULTICAT_FIXUP_HAVE_CLOCK_NANOSLEEP
> +$(SED) 's#define HAVE_CLOCK_NANOSLEEP#undef HAVE_CLOCK_NANOSLEEP#g' $(@D)/util.h
> +endef
> +MULTICAT_POST_PATCH_HOOKS += MULTICAT_FIXUP_HAVE_CLOCK_NANOSLEEP
> +endif

I'll be OK to fix this with a hook, but I'd like to understand why we
don't have clock_nanosleep() on Blackfin. It might affect a significant
number of other packages I believe.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
