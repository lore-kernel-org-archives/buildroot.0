From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Nov 2016 13:02:48 +0100
Subject: [Buildroot] genconfig/unconditonally include external.mk
In-Reply-To: <fce79a1a961dd6b6df31fbdca3166af2@walle.cc>
References: <66befb0a3a9cb7c98c7a011aa985fb2f@walle.cc>
 <ebbb33ee-6c3c-8be4-0e3e-ffdd136d6ad7@mind.be>
 <fce79a1a961dd6b6df31fbdca3166af2@walle.cc>
Message-ID: <102f4cbd-15e3-8293-4fec-5d83b8eaa109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-11-16 11:59, Michael Walle wrote:
> Am 2016-11-08 02:22, schrieb Arnout Vandecappelle:
>> On 07-11-16 10:49, Michael Walle wrote:
>>> Hi,
>>>
>>> there was a discussion (and rejected patches) [1] about adding support for
>>> buildroot config fragments. The conclusion was that this should not be part of
>>> buildroot and should stay external.
>>
>>  With "stay external", the idea was not that it would be handled in external.mk,
>> but rather that you have a script that merges the defconfigs to a temporary file
>> and the calls 'make defconfig BR2_DEFCONFIG=...' on it.
> 
> mhh, ok, but i guess having additional make targets would be more appealing.
> Esp. if you need some variables defined by buildroot.

 What variables defined by Buildroot could you possibly need? Since you're
making a defconfig, you have no .config available. The only variable that you
may want to use is $(O), but that one you anyway have to pass on the command
line. So pass it as an argument to your merge script. Something like

./genconfig <config-spec> [<path-to-output>]

 It would actually be great if we would have a script like that in Buildroot
that can be used generically.


>>> But an integration would need unconditonal
>>> inclusion of the external.mk. The last mail about this subject was in July [2].
>>> Are there any news on this topic?
>>
>>  Nobody ever posted a patch :-)
>>
>>  But I can already tell you that you won't be able to just move the include
>> outside of the conditional: it can go up over the definition of the package
>> infras, and it can't go down over the target-finalize: $(PACKAGES) rule. So it
>> has to stay where it is, and the conditional has to be split up.
>>
>>  It should be analyzed then what the effect is of including package .mk files
>> when the package infra is not defined.
> 
> mhh I see.. yann wrote that the correct solution would be to include external.mk
> unconditionally. 

 That's not what he wrote. Samuel suggested that it could be done through
external.mk, Patrick said that it was not, and then Yann explained in more
detail why not, and what would need to be changed in order to use external.mk
during configuration. He nowhere said that that would be a good solution. OK, he
wrote "The correct solution would be ..." but (I think) he meant the correct
solution for including external.mk for config, not the correct solution for the
genconfig problem.


> I'm not so sure about this anymore after your comment above. I
> think we should treat the internal and external package makefiles the same. That
> is, either include both if BR2_HAVE_DOT_CONFIG is not set or include none of
> them. But I guess there is are reasons not include the package files if
> BR2_HAVE_DOT_CONFIG is not set. So why should be external package .mk files be
> special..

 That is a very good remark.


> You could include external.mk unconditonally, but put the package .mk files in a
> BR2_HAVE_DOT_CONFIG block, which is not backwards compatible and doesn't really
> fit simplicity. So I'm not sure. I know you were already down that route, but a
> second external.mk which is included unconditonally?

 The problem is that we don't see a sensible use case for it. When we make
changes we want to make sure that we don't break any use cases, so we really
need to know what the use cases are. And use cases that can be solved
differently don't count :-)


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
