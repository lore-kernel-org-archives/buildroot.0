From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Jul 2017 22:03:53 +0200
Subject: [Buildroot] [PATCH 12/23] arch/xtensa: add macros to generate
 hooks
In-Reply-To: <20170326214444.1a893177@free-electrons.com>
References: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
 <1489516252-3803-13-git-send-email-jcmvbkbc@gmail.com>
 <20170326214444.1a893177@free-electrons.com>
Message-ID: <4a47eae6-e568-fff8-a358-5c159855d5d8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Max,

On 26-03-17 21:44, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 14 Mar 2017 11:30:41 -0700, Max Filippov wrote:
> 
>> +################################################################################
>> +# arch-xtensa-overlay-inner -- generates the make targets needed to extract
>> +# the xtensa overlay
>> +#
>> +# argument 1 is the uppercase package name, including a HOST_ prefix
>> +#            for host packages
>> +#
>> +# Packages that call that macro shall define FOO_ARCH_XTENSA_OVERLAY_COMPONENT
>> +# and set it to one of the component to extract, one of: binutils, gcc, gdb.
>> +#
>> +################################################################################
>> +define arch-xtensa-overlay-inner
>> +
>> +ifneq ($$(ARCH_XTENSA_CORE_NAME),)
>> +
>> +define $(1)_XTENSA_OVERLAY_EXTRACT
>> +	$$(call arch-xtensa-overlay-extract,$$(@D),$$($(1)_ARCH_XTENSA_OVERLAY_COMPONENT))
>> +endef
>> +$(1)_POST_EXTRACT_HOOKS += $(1)_XTENSA_OVERLAY_EXTRACT
>> +
>> +endif # ARCH_XTENSA_CORE_NAME != ""
>> +
>> +endef # arch-xtensa-overlay-inner
>> +
>> +################################################################################
>> +# arch-xtensa-overlay -- the target generator macro for the Xtensa overlay
>> +################################################################################
>> +arch-xtensa-overlay = $(call arch-xtensa-overlay-inner,$(call UPPERCASE,$(pkgname)))
>> +host-arch-xtensa-overlay = $(call arch-xtensa-overlay-inner,HOST_$(call UPPERCASE,$(pkgname)))
> 
> I must say I am not entirely convinced by this macro. It really makes
> thing less obvious to read, and doesn't really remove a lot of code
> duplication.
> 
> So I'm still hesitating on this one. It's not a big no, but an
> hesitation. However, I'm clearly interested by the following stuff that
> allows to download the overlay tarball instead of having it in
> Buildroot itself.

 We discussed this again at the BR Summer Camp, and decided that the 2-3 lines
that you save with this macro in only 3 packages are really not worth defining
this macro. So, could you respin this series without the addition of these macros?

 I've marked the patches as Changes Requested in patchwork.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
