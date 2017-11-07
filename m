From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 8 Nov 2017 00:49:07 +0100
Subject: [Buildroot] [RFCv1 3/4] toolchain: post-pone evaluation of
 TOOLCHAIN_EXTERNAL_BIN
In-Reply-To: <20171107223347.143e3642@windsurf>
References: <20171103160627.6468-1-thomas.petazzoni@free-electrons.com>
 <20171103160627.6468-4-thomas.petazzoni@free-electrons.com>
 <42689797-2392-a70c-16d4-eb96c6bcc8c0@mind.be>
 <20171107223347.143e3642@windsurf>
Message-ID: <8d8dbdfa-8e75-b6d3-a6b9-52db295c25c5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-11-17 22:33, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 7 Nov 2017 22:23:24 +0100, Arnout Vandecappelle wrote:
> 
>>> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
>>> index dc0588c536..b9ad1720a1 100644
>>> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
>>> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
>>> @@ -77,7 +77,7 @@ ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
>>>  TOOLCHAIN_EXTERNAL_BIN := $(dir $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
>>>  endif
>>>  else
>>> -TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/bin
>>> +TOOLCHAIN_EXTERNAL_BIN = $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/bin  
>>
>>  It gives me the shivers to see the same variable sometimes defined recursive
>> and sometimes defined immediate... But I can't find an elegant solution (other
>> than introducing an artificial extra variable, which is also ugly), so
>>
>> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> I also saw the other TOOLCHAIN_EXTERNAL_BIN assignment using := above,
> and didn't change it for now because that was not the case I was
> interested in testing/fixing. But my plan was to get back to this :=
> assignment at some point. However, it seems like you have concluded
> that we have to keep := here. Could you explain why?

 It's using $(shell which ...). That variable ends up in $(TARGET_CC), so it is
re-evaluated hundreds of times. I don't know if it really makes much of a
difference, but the rule of thumb is: think twice about using
recursively-expanded if it's used in many places and it contains $(shell ...)
constructs.

> 
> Note: I think keeping the := is OK, because TOOLCHAIN_EXTERNAL_PREFIX
> doesn't reference anything like HOST_DIR/STAGING_DIR/TARGET_DIR, so
> it's fine to have evaluation at the time of assignment for this case.
> 
> Perhaps a comment above would help clarify that it's intentional?

 Not really needed, the code speaks for itself. The $(shell) makes it quite easy
to see why immediate expansion is chosen there.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
