From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Feb 2014 21:39:03 +0100
Subject: [Buildroot] Bugs cleanup (input requested)
In-Reply-To: <20140210154305.0db0bb01@skate>
References: <CAAXf6LX719WwMSZUGShzANA22z0g+zo5hYNbFYwfHG3ZEGBioQ@mail.gmail.com>
 <20140210154305.0db0bb01@skate>
Message-ID: <52F938E7.8010101@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/10/14 15:43, Thomas Petazzoni wrote:
> Dear Thomas De Schampheleire,
> 
> On Mon, 10 Feb 2014 11:21:24 +0100, Thomas De Schampheleire wrote:
> 
[snip]
>> https://bugs.busybox.net/show_bug.cgi?id=4339
>> Allow override of DL_DIR in extract step
>>
>> I have requested the author of the problem for additional info, which
>> was provided. They are using a custom dl dir for company packages, by
>> adding the following in these packages' .mk file:
>> $($(PKG)_BUILD_DIR)/.stamp_% : DL_DIR=$(OUR_SPECIAL_DL_DIR)
>> In order to make this work, they need the following change in
>> package/pkg-generic.mk:
>>
>>   # default extract command
>>   $(2)_EXTRACT_CMDS ?= \
>> -     $$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE)))
>> $(DL_DIR)/$$($(2)_SOURCE) | \
>> +     $$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE)))
>> $$(DL_DIR)/$$($(2)_SOURCE) | \
>>       $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $$($(2)_DIR) $(TAR_OPTIONS) -)
>>
>>   # post-steps hooks
>>
>> Although the usage is pretty funky, the patch is not very invasive and
>> I don't have a strong objection.  But I could understand that other
>> people don't like this. I think there are three alternatives:
>> - accept the patch
>> - reject the patch
>> - reject the patch but propose another solution
> 
> Reject the patch, with the following explanations:
> 
>  * The "file" site method can be used to "download" tarballs from a
>    local directory, when needed.
> 
>  * The licensing infrastructure allows to create a directory with all
>    the open-source tarballs, keeping them separate from proprietary
>    bits, for delivery to customers.
> 
> I would also add that supporting highly-specific use cases in the
> package infrastructure is not a good idea, because we might very easily
> break them in the future if they are too specific and therefore not
> used by enough people to be tested when we make changes.

 It is true that their use case should be solved with the legal-info
infrastructure - and if that doesn't work for them, it should be fixed there.

 However, the patch is still valid for a different reason: it makes
things more consistent. We use $$ almost everywhere within
generic-package, so ideally it should be done there as well.


 Regards,
 Arnout


> 
> Best regards,
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
