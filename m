From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 00:18:21 +0200
Subject: [Buildroot] [PATCH v2 06/17] uclibc: gcc >= 4.9 can build a
 thumb/thread uclibc
In-Reply-To: <56ED75EC.7050409@mind.be>
References: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458335299-27409-7-git-send-email-thomas.petazzoni@free-electrons.com>
 <56ED75EC.7050409@mind.be>
Message-ID: <20160330001821.482163e7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 Mar 2016 16:53:16 +0100, Arnout Vandecappelle wrote:

> > -# Thumb build is broken with threads, build in ARM mode
> > -ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
> > +# Thumb1 build is broken with threads with old gcc versions (4.7 and
> > +# 4.8). Since all cores supporting Thumb1 also support ARM, we use ARM
> > +# code in this case.
> > +ifeq ($(BR2_GCC_VERSION_4_7_X)$(BR2_GCC_VERSION_4_8_X):$(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_TOOLCHAIN_HAS_THREADS),y:yy)
> 
>   This line is a bit long so would be nicer to split off into separate 
> variables. This kind of logic is also much easier to do (and certainly easier to 
> understand) in Kconfig than in the make language - like we had for BX before you 
> removed it.

I agree this line is a bit long. But how would be named this Config.in
option? BR2_PACKAGE_UCLIBC_FORCE_ARM ?

config BR2_PACKAGE_UCLIBC_FORCE_ARM
	bool
	depends on BR2_ARM_INSTRUCTIONS_THUMB
	depends on BR2_TOOLCHAIN_HAS_THREADS
	default y if BR2_GCC_VERSION_4_7_X
	default y if BR2_GCC_VERSION_4_8_X

Something like that?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
