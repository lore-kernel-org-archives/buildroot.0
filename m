From: Douglas RAILLARD <public.douglas.raillard@gmail.com>
Date: Sun, 6 Sep 2015 17:35:05 +0200
Subject: [Buildroot] [PATCH 3/3] Fix uClibc build for ARM-nommu
In-Reply-To: <20150906152558.6472329b@free-electrons.com>
References: <1441470824-23456-1-git-send-email-public.douglas.raillard@gmail.com>
 <20150906152558.6472329b@free-electrons.com>
Message-ID: <55EC5D29.9030708@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/09/2015 15:25, Thomas Petazzoni wrote:
> Dear Douglas RAILLARD,
> 
> On Sat,  5 Sep 2015 18:33:44 +0200, Douglas RAILLARD wrote:
> 
>> +# UCLIBC_HAS_CONTEXT_FUNCS is broken with Thumb and Thumb2
>> +ifeq (y,$(filter y,$(BR2_ARM_INSTRUCTIONS_THUMB) $(BR2_ARM_INSTRUCTIONS_THUMB2)))
> 
> Why such a complicated condition? BR2_ARM_INSTRUCTIONS_THUMB and
> BR2_ARM_INSTRUCTIONS_THUMB2 are in a "choice" ... "endchoice" block, so
> only one of the two can be set to 'y' at any given time. So you can do:
> 
> ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_ARM_INSTRUCTIONS_THUMB2),y)
> 
> instead.

Right, a general OR is not needed here

>> +define UCLIBC_ARM_THUMB_CONFIG
>> +	$(call KCONFIG_ENABLE_OPT,COMPILE_IN_THUMB_MODE,$(@D)/.config)
>> +	$(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_CONTEXT_FUNCS,$(@D)/.config)
>> +endef
>> +endif
> 
> Other than that, it looks good to me.

One thing that this patch does not reflect is that the only threading
backend which works (and compiles) on ARM Thumb is BR2_PTHREADS_OLD.
Should we warn the user or is its responsibility to choose what is
appropriate for this target ?


Thanks for the comments !

Douglas

-- 

Douglas RAILLARD
