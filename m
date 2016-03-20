From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 20 Mar 2016 18:09:47 +0100
Subject: [Buildroot] [PATCH 3/3] package/multicat: fix build with
 external Blackfin uClibc toolchain
In-Reply-To: <20160320152212.54caaaa6@free-electrons.com>
References: <1458430906-8291-1-git-send-email-joerg.krause@embedded.rocks>
 <1458430906-8291-3-git-send-email-joerg.krause@embedded.rocks>
 <20160320152212.54caaaa6@free-electrons.com>
Message-ID: <1458493787.1998.14.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On So, 2016-03-20 at 15:22 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 20 Mar 2016 00:41:46 +0100, J?rg Krause wrote:
> > 
> > multicat uses clock_nanosleep() conditionally if HAVE_NANOSLEEP is
> > defined. The
> > bad is that multicat does not check for clock_nanosleep(), but
> > defines
> "bad .." ?

Oops, bad English.

> > 
> > HAVE_NANOSLEEP if __APPLE__ is not defined.
> > 
> > uClibc has clock_nanosleep() only if built with
> > UCLIBC_HAS_ADVANCED_REALTIME.
> > and the external Blackfin toolchain has no support for
> > clock_nanosleep().
> Are you sure? Here the Blackfin toolchain does have
> UCLIBC_HAS_ADVANCED_REALTIME:
> 
> $ grep ADVANCED_REALTIME
> output/staging/usr/include/bits/uClibc_config.h?
> #define __UCLIBC_HAS_ADVANCED_REALTIME__ 1
> 
> But indeed it doesn't have clock_nanosleep().

You're right! It has?__UCLIBC_HAS_ADVANCED_REALTIME__, but it does not
define?__UCLIBC_HAS_THREADS_NATIVE__ and clock_nanosleep() is only
defined if both are set in <time.h>:

#??ifdef __UCLIBC_HAS_THREADS_NATIVE__
#???if defined __USE_XOPEN2K && defined
__UCLIBC_HAS_ADVANCED_REALTIME__

extern int clock_nanosleep (clockid_t __clock_id, int __flags,
			????__const struct timespec *__req,
			????struct timespec *__rem);

However the Blackfin toolchain has __LINUXTHREADS_OLD__:
#define __LINUXTHREADS_OLD__ 1

Sorry, my bad!

> 
> When I saw your patch, I was hoping to be able to replace it with a
> patch that tests __UCLIBC__ and __UCLIBC_HAS_ADVANCED_REALTIME__ to
> determine whether we have clock_nanosleep() or not. But it seems like
> some other things on Blackfin has the consequence that we don't have
> clock_nanosleep(). I looked at uClibc 0.9.33.2 (which is used in the
> Blackfin toolchain, as far as I can see), and I couldn't see why
> clock_nanosleep() was not provided.
> 

I'll prepare a v2 with something like that testing for __UCLIBC__,
__UCLIBC_HAS_THREADS_NATIVE__ and __UCLIBC_HAS_ADVANCED_REALTIME__.

> > 
> > +# multicat does not test for HAVE_CLOCK_NANOSLEEP, but sets it if
> > __APPLE__ is
> > +# not defined. The external Blackfin toolchain is uClibc which has
> > +# clock_nanosleep() only if built with
> > UCLIBC_HAS_ADVANCED_REALTIME.
> > +# Use a hool to overwrite the definition of HAVE_CLOCK_NANOSLEEP
> > for this
> hool -> hook
> 
> > 
> > +# toolchain.
> > +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX),y)
> > +define MULTICAT_FIXUP_HAVE_CLOCK_NANOSLEEP
> > +$(SED) 's#define HAVE_CLOCK_NANOSLEEP#undef
> > HAVE_CLOCK_NANOSLEEP#g' $(@D)/util.h
> > +endef
> > +MULTICAT_POST_PATCH_HOOKS += MULTICAT_FIXUP_HAVE_CLOCK_NANOSLEEP
> > +endif
> I'll be OK to fix this with a hook, but I'd like to understand why we
> don't have clock_nanosleep() on Blackfin. It might affect a
> significant
> number of other packages I believe.

My guess is that uClibc was build with __LINUXTHREADS_OLD__ enabled,
but the toolchain ships libpthread instead. However, I am not a
toolchain expert.

Best regards
J?rg Krause
