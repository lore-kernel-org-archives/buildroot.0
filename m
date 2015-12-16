From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 16 Dec 2015 08:10:10 +0100
Subject: [Buildroot] [PATCH v2] package/uclibc: Enable compile in thumb
 mode configuration option
In-Reply-To: <20151215230351.5dc6e91d@free-electrons.com>
References: <1449269795-17864-1-git-send-email-paul.enman@gmail.com>
 <1450056520-18750-1-git-send-email-paul.enman@gmail.com>
 <20151215230351.5dc6e91d@free-electrons.com>
Message-ID: <20151216071009.GW19876@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,
> Paul,
> 
> > +	$(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_CONTEXT_FUNCS,$(@D)/.config)
> 
> What is the relation between this and Thumb ?

The user context manipulation functions in uClibc are using
non-thumb instructions and result in a compile failure.
 
> Also, note that there is already some Thumb-related stuff in uclibc.mk,
> which precisely forces to *not* use Thumb (1):
> 
> # Thumb build is broken with threads, build in ARM mode
> ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
> UCLIBC_EXTRA_CFLAGS += -marm
> endif

This is no longer the case for uClibc-ng. There where fixes made,
even in uClibc master to allow building thumb-only builds with
threads enabled.

I can just not recall, if Linuxthreads or NPTL must be used for
that, or if both are working. May be Paul can check it? 
Paul, do you have a embedded system, where you test this?
Is it a noMMU cortex-m3/cortex-m4 or some MMU system?

best regards
 Waldemar
