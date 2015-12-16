From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 16 Dec 2015 22:49:09 +0100
Subject: [Buildroot] [PATCH v2] package/uclibc: Enable compile in thumb
 mode configuration option
In-Reply-To: <20151216071009.GW19876@waldemar-brodkorb.de>
References: <1449269795-17864-1-git-send-email-paul.enman@gmail.com>
 <1450056520-18750-1-git-send-email-paul.enman@gmail.com>
 <20151215230351.5dc6e91d@free-electrons.com>
 <20151216071009.GW19876@waldemar-brodkorb.de>
Message-ID: <5671DC55.2010508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16-12-15 08:10, Waldemar Brodkorb wrote:
> Hi,
> Thomas Petazzoni wrote,
>> Paul,
>>
>>> +	$(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_CONTEXT_FUNCS,$(@D)/.config)
>>
>> What is the relation between this and Thumb ?
> 
> The user context manipulation functions in uClibc are using
> non-thumb instructions and result in a compile failure.

 Some packages need context functions, that's why they are enabled in our
default uClibc config. Cfr. d01aaa7 (by you, Waldemar).

 So if you do this, you'll need to make some packages depend on !THUMB. While
they actually did work before this commit.

 Can't uClibc be fixed to enable interworking for the context functions so they
will work even if the rest of the library is compiled in thumb mode?


>> Also, note that there is already some Thumb-related stuff in uclibc.mk,
>> which precisely forces to *not* use Thumb (1):

 But this patch is only concerned with thumb2, not thumb1. This patch will
actually explicitly disable the COMPILE_IN_THUMB uClibc option for thumb1 (which
is usually no difference with the current situation, since it is not enabled in
the default config). So this looks OK to me.

>>
>> # Thumb build is broken with threads, build in ARM mode
>> ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
>> UCLIBC_EXTRA_CFLAGS += -marm
>> endif
> 
> This is no longer the case for uClibc-ng. There where fixes made,
> even in uClibc master to allow building thumb-only builds with
> threads enabled.

 As I commented in v1 of this patch, as long as 0.9.33 is not killed, we can't
do this. We could however add a condition on -ng.


 Regards,
 Arnout

> I can just not recall, if Linuxthreads or NPTL must be used for
> that, or if both are working. May be Paul can check it? 
> Paul, do you have a embedded system, where you test this?
> Is it a noMMU cortex-m3/cortex-m4 or some MMU system?
> 
> best regards
>  Waldemar
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
