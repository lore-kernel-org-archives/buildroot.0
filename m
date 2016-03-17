From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Mar 2016 14:06:24 +0100
Subject: [Buildroot] [PATCH 02/16] arch/arm: Cortex-M3 provides only
	Thumb-2
In-Reply-To: <874mc5745n.fsf@dell.be.48ers.dk>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <56E9E177.5000606@mind.be>
 <20160317090326.3dbeffb1@free-electrons.com>
 <874mc5745n.fsf@dell.be.48ers.dk>
Message-ID: <20160317140624.1b692813@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Mar 2016 12:08:36 +0100, Peter Korsgaard wrote:

>  > ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB):$(BR2_CPU_HAS_THUMB2),y:)
>  > GLIBC_EXTRA_CFLAGS += -marm
>  > endif
> 
>  > And so on everywhere where we need to do things depending on whether
>  > Thumb1 or Thumb2 is used.
> 
> Yes. A quick grep shows that we only need to do this in a few places:
> 
> git grep 'ifeq.*BR2_ARM_INSTRUCTIONS_THUMB),y'
> package/dmalloc/dmalloc.mk:ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
> package/glibc/glibc.mk:ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
> package/libglib2/libglib2.mk:ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
> package/qt/qt.mk:ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)

Correct.

> Notice that we don't seem to do it for musl?

See patch 07/16.

>  > So, while using Thumb1 or Thumb2 is just a matter of passing -mthumb to
>  > gcc and would therefore lead us to think that a single options is
>  > sufficient, I found it clearer to keep two separate options.
> 
> Is there any other situations where we want to know the difference
> between thumb1 and thumb2? It might make sense to default to thumb
> instructions for systems supporting thumb2, but not for systems using
> thumb1 and the tradeoff is less clear - But that is also simple to do in
> kconfig with:
> 
> default BR2_ARM_INSTRUCTIONS_THUMB if BR2_ARM_CPU_HAS_THUMB2
> 
> It is really a question about trading off complexity in one place vs
> adding it somewhere else, so I'm not sure. You could argue that having a
> single thumb kconfig option would be simpler for users though (on the
> other hand, having explicit thumb1/thumb2 is perhaps clearer).

I also find it clearer to have separate thumb1/thumb2 options for the
user. I tried something like:

config BR2_ARM_INSTRUCTIONS_THUMB
	bool "thumb" if BR2_ARM_CPU_HAS_THUMB
	bool "thumb2" if BR2_ARM_CPU_HAS_THUMB2

but it wasn't working. And if we make BR2_ARM_CPU_HAS_THUMB2 select
BR2_ARM_CPU_HAS_THUMB as suggested by Arnout, it would have to be:

config BR2_ARM_INSTRUCTIONS_THUMB
	bool "thumb" if BR2_ARM_CPU_HAS_THUMB && !BR2_ARM_CPU_THUMB2
	bool "thumb2" if BR2_ARM_CPU_HAS_THUMB2

Hence my suggestion to keep both BR2_ARM_INSTRUCTIONS_THUMB and
BR2_ARM_INSTRUCTIONS_THUMB2.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
