From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 01 May 2015 17:45:43 +0200
Subject: [Buildroot] [PATCH 2/7] pkg-infra: assign BR_NO_CHECK_HASH_FOR
 so it is recursively-expanded
In-Reply-To: <20150501152648.GA4206@free.fr>
References: <cover.1430260630.git.yann.morin.1998@free.fr>
 <e8cce5d9bbb1b75dbf02c0f9ee44ee23a0314d38.1430260630.git.yann.morin.1998@free.fr>
 <55437A92.3060007@mind.be> <20150501152648.GA4206@free.fr>
Message-ID: <55439FA7.1010807@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/05/15 17:26, Yann E. MORIN wrote:
> arnout, All,
> 
> On 2015-05-01 15:07 +0200, Arnout Vandecappelle spake thusly:
>> On 29/04/15 00:39, Yann E. MORIN wrote:
>>> Currently, assigning to BR_NO_CHECK_HASH_FOR in conditionals, but
>>> referencing vairaible assigned to later, fails. Here's a failing
>>               variable
>>
>>> test-case, which is the reduced test-case of how we handle
>>> BR_NO_CHECK_HASH_FOR for now:
>>>
>>>     export FOO
>>>
>>>     ifeq ($(BAR_V),)
>>>     BAR_V=1
>>>     else
>>>     FOO += $(BAR_S)
>>>     endif
>>
>>  I think the test case is too complicated - in fact the conditional construct
>> has nothing to do with it.
> 
> Yup, right, I know. However, I wanted a reduced test-case that still
> ressembled our current code base.
> 
>> The culprit is appending to it, which means we never
>> explicitly set it to recursively expanded. Exported variables that are not
>> defined explicitly for some reason default to be immediately expanded rather
>> than recursively.
> 
> Exactly. However, there's nothing like so explained in the make manual.

 So patch the make manual :-)

> 
>> export FOO
>> FOO += $(BAR)
>> $(warning FOO='$(FOO)' BAR='$(BAR)')
>> BAR = BAR
>> $(warning FOO='$(FOO)' BAR='$(BAR)')
>> default:
>>
>> Will give
>>
>> /tmp/Makefile:3: FOO=' ' BAR=''
>> /tmp/Makefile:5: FOO=' ' BAR='BAR'
>>
>> while explicitly setting FOO to be recursively expanded:
>>
>> export FOO =
>>
>> will give
>>
>> /tmp/Makefile:3: FOO=' ' BAR=''
>> /tmp/Makefile:5: FOO=' BAR' BAR='BAR'
> 
> Do you prefere I use your even-more-simplified test-case, or may I keep
> the reduced test-case I provided that ressemble our current code-path?

 Well, the relevant part of our current code path (taking your example) is:

export FOO
FOO += $(BAR_S)
BAR_S = bar.tar

 Whether or not BAR_V and FOO are defined in two separate conditional branches
and whether or not BAR_S contains a reference to BAR_V is really irrelevant.

 If you want to make it resemble our code path more, then just use the real
variable names:

export BR_NO_CHECK_HASH_FOR
BR_NO_CHECK_HASH_FOR += $(XENOMAI_SOURCE)
XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2

[snip]
>>>  # Expressly do not check hashes for those files
>>> -export BR_NO_CHECK_HASH_FOR
>>> +# It needs to be assigned so as to be a recursively-expanded variable, and
>>> +# so that it can be assigned inside conditionals.
>>
>> # Exported variables default to immediately expanded,
> 
> I would avoid stating that. That's the behaviour we observed, but
> nothing is said about that in the make manual. If a future version of
> make changes that behaviour, the comment would be wrong.

 Then say "in some versions of make".

 Regards,
 Arnout

> 
> However, I'll ditch the comment about conditionals.
> 
>> # but we need it to be
>> # recursively-epxanded, so explicitly define it.
>>
>>
>>  With all that,
>>
>>   Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
