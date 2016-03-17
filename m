From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Mar 2016 12:08:36 +0100
Subject: [Buildroot] [PATCH 02/16] arch/arm: Cortex-M3 provides only
	Thumb-2
In-Reply-To: <20160317090326.3dbeffb1@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 17 Mar 2016 09:03:26 +0100")
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <56E9E177.5000606@mind.be>
 <20160317090326.3dbeffb1@free-electrons.com>
Message-ID: <874mc5745n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> I do agree about the change itself, but I also think that HAS_THUMB2 should 
 >> select HAS_THUMB instead. Also, I think the BR2_ARM_INSTRUCTIONS_THUMB2 option 
 >> should be removed, because in the end it's just compiling in thumb mode. In arm 
 >> mode, we also don't have separate options for armv5, armv6, armv7.

 > I originally started to remove BR2_ARM_INSTRUCTIONS_THUMB2, and have a
 > single BR2_ARM_INSTRUCTIONS_THUMB that simply says "use Thumb for that
 > core", which would be Thumb1 for old ARM cores, and Thumb2 for ARMv7.

 > However, there are cases where packages really need to know whether
 > Thumb1 or Thumb2 is used. For example, glibc or musl don't build in
 > Thumb1, so we force ARM instructions. This is fine for Thumb1, because
 > all cores that support Thumb1 also support the ARM instruction set.

 > However, glibc and musl build fine in Thumb2, so there's no reason to
 > force using the ARM instruction set. And Thumb2 is different than
 > Thumb1 in that respect: there are some cores that implement *only*
 > Thumb2 and not ARM (basically, the ARMv7-M ones).

 > So, if we remove BR2_ARM_INSTRUCTIONS_THUMB, we will have to change:

 > ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 > GLIBC_EXTRA_CFLAGS += -marm
 > endif

 > to something like:

 > ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB):$(BR2_CPU_HAS_THUMB2),y:)
 > GLIBC_EXTRA_CFLAGS += -marm
 > endif

 > And so on everywhere where we need to do things depending on whether
 > Thumb1 or Thumb2 is used.

Yes. A quick grep shows that we only need to do this in a few places:

git grep 'ifeq.*BR2_ARM_INSTRUCTIONS_THUMB),y'
package/dmalloc/dmalloc.mk:ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
package/glibc/glibc.mk:ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
package/libglib2/libglib2.mk:ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
package/qt/qt.mk:ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)

Notice that we don't seem to do it for musl?

 > So, while using Thumb1 or Thumb2 is just a matter of passing -mthumb to
 > gcc and would therefore lead us to think that a single options is
 > sufficient, I found it clearer to keep two separate options.

Is there any other situations where we want to know the difference
between thumb1 and thumb2? It might make sense to default to thumb
instructions for systems supporting thumb2, but not for systems using
thumb1 and the tradeoff is less clear - But that is also simple to do in
kconfig with:

default BR2_ARM_INSTRUCTIONS_THUMB if BR2_ARM_CPU_HAS_THUMB2

It is really a question about trading off complexity in one place vs
adding it somewhere else, so I'm not sure. You could argue that having a
single thumb kconfig option would be simpler for users though (on the
other hand, having explicit thumb1/thumb2 is perhaps clearer).

-- 
Bye, Peter Korsgaard
