From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 09:24:18 +0100
Subject: [Buildroot] [PATCH 05/23] uclibc: add avr32 special version
In-Reply-To: <20091215081809.071a009e@hcegtvedt.norway.atmel.com>
References: <cover.1260831891.git.thomas.petazzoni@free-electrons.com>
	<3a24927a0e6f041a018085b5a7fc50312001fddc.1260831891.git.thomas.petazzoni@free-electrons.com>
	<20091215081809.071a009e@hcegtvedt.norway.atmel.com>
Message-ID: <20091215092418.59c33ca8@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Tue, 15 Dec 2009 08:18:09 +0100,
Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> a ?crit :

> Huh? That version does not exist... Please just use the upstream
> release.

This was the version used by Buildroot until this external source
toolchain removal work. It used to download
ftp://www.at91.com/pub/buildroot/uClibc-0.9.30-avr32-2.1.5.tar.bz2,
which is still the uClibc version being used.

I didn't check how many differences they were between this version and
the upstream one. I just replicated the existing behaviour. If you tell
me that there aren't any differences between the upstream and the avr32
special versions, then we can just get rid of the avr32 special version.

> This patch 'uClibc-0.9.30-avr32-2.1.5-unifdef-getline.patch' does not
> sound AVR32 specific to me.

Not it isn't. But it was the patch available in the
toolchain/uClibc/ext_source/Atmel/avr32/0.9.30-avr32-2.1.5 directory
before my rework. Therefore I just kept it as it was.

As you can see I didn't modify the versions of the components or the
patches being applied to them. I only modified how this was integrated
into Buildroot. As I don't have any AVR32 hardware to make tests I
tried to be conservative.

> You only need one uClibc patch from an AVR32 point of view, the
> "fix-varargs-in-prctl-syscall.patch"

Do you have an up-to-date version of this patch ?

The version I found was NAKed by uClibc developers in December 2008
(http://lists.uclibc.org/pipermail/uclibc/2008-December/041592.html),
but later on, it seems they agreed but requested some change
(http://lists.busybox.net/pipermail/uclibc/2009-July/042812.html). Or
maybe the change requested only applies to uClibc git and not to uClibc
0.9.30 ?

Could you give a more precise status of this patch ?

> >  * Add the LINKRELAX=y configuration option to the uClibc .config
> > file in uclibc.mk
> 
> Good, does the generic uClibc configuration enable optimized string
> functions?

UCLIBC_HAS_STRING_ARCH_OPT is not set in the generic uClibc
configuration file, if it's the option you're refering to. But I think
we should change this to default to y, since the uClibc help text says:

config UCLIBC_HAS_STRING_ARCH_OPT
        bool "Use arch-specific assembly string functions (where available)"
        default y
        help
          Answer Y to use any archtecture-specific assembly language string
          functions available for this target plaform.

          Note that assembly implementations are not available for all string
          functions, so some generic (written in C) string functions may
          still be used.

          These are small and fast, the only reason _not_ to say Y here is
          for debugging purposes.

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
