From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Mar 2019 09:52:59 +0100
Subject: [Buildroot] [PATCH 1/4] toolchain: set the ssp gcc option in
 kconfig
In-Reply-To: <27512_1552370795_5C874C6B_27512_48_1_20190312060632.GA4924@r-lnx-nyma7486-2>
References: <cover.1552286891.git.yann.morin@orange.com>
 <8928_1552286905_5C8604B9_8928_92_1_1b5ea6bb-0d36-4857-888c-c65dd93bff8b@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
 <309c4824-97d8-e946-79b2-7e4c722ed601@mind.be>
 <27512_1552370795_5C874C6B_27512_48_1_20190312060632.GA4924@r-lnx-nyma7486-2>
Message-ID: <d24bdf97-bea5-f64a-6664-b4c5a356aeb3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/03/2019 07:06, yann.morin at orange.com wrote:
> Arnout, All,
> 
> On 2019-03-12 01:02 +0100, Arnout Vandecappelle spake thusly:
>> On 11/03/2019 07:48, yann.morin at orange.com wrote:
>> [snip]
> [--SNIP--]
>>> +ifneq ($(BR2_SSP_OPTION),)
>>> +TOOLCHAIN_WRAPPER_ARGS += -DBR_SSP_OPTION='$(BR2_SSP_OPTION)'
>>>  endif
>>  I'd really like to use the BR_ADDITIONAL_CFLAGS instead, by changing the
>> definition in the .mk file to something like:
>>
>> TOOLCHAIN_WRAPPER_OPTS = \
>>         $(call qstrip,$(BR2_TARGET_OPTIMIZATION)) \
>> 	$(call qstrip,$(BR2_SSP_OPTION))
>>
>> TOOLCHAIN_WRAPPER_ARGS += \
>>  	-DBR_ADDITIONAL_CFLAGS='$(foreach f,$(TOOLCHAIN_WRAPPER_OPTS),"$(f)"$(comma))'
> 
> OK, will do.

 Note that we don't have a runtime test for BR2_TRGET_OPTIMIZATION so some
manual testing will be needed.


>> (note that I preferred the qstrip instead of the ifdef here, and adding quotes
>> explicitly in the foreach, but you may want to implement it differently).
> 
> Yeah, I tried to avoid the qstriop-then-strip-anyway dance, but it is
> indeed nicer the way you wrote it.

 I like the qstrip-then-quote dance, because it makes things consistent.

 Note that this is a very special case because we want to quote each
space-separated option here; in general we actually want to make sure the spaces
are quoted when we do a qstrip-then-quote dance.

 Regards,
 Arnout
