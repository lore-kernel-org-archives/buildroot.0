From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Apr 2014 15:46:27 +0200
Subject: [Buildroot] Patchwork cleanup #7: submitter notification
 (feedback deadline: April 12)
In-Reply-To: <CAAXf6LXikqyc=E84BFYGo1uX1TBiyDRJuUKTPLSQtsTacu0tKg@mail.gmail.com>
References: <CAAXf6LW5stEOk84f-SiPvnYSxazu7vBgM-cNpQStV7j+dcMrbw@mail.gmail.com>
 <CAAXf6LUAvi_C5NvSa6=mEhcipkBYM6XwPLHhRCZtxBccq05i0g@mail.gmail.com>
 <CD43324F-6F9A-40AE-94AD-DD25A435DF7C@armadeus.org>
 <20140331171204.GB5004@free.fr> <533EDC3F.9060101@mind.be>
 <CAAXf6LXikqyc=E84BFYGo1uX1TBiyDRJuUKTPLSQtsTacu0tKg@mail.gmail.com>
Message-ID: <5360FEB3.8000803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/04/14 21:52, Thomas De Schampheleire wrote:
> Arnout, Yann, Luca,
> 
> On Fri, Apr 4, 2014 at 6:22 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 31/03/14 19:12, Yann E. MORIN wrote:
>>> On 2014-03-31 10:58 +0200, Eric Jarrige spake thusly:
>>>> Hi Thomas,
>>>>
>>>>>> [v2,1/1] u-boot: allow to pass a custom configuration file
>>>>>> http://patchwork.ozlabs.org/patch/276286/
>>>>>> Eric Jarrige
>>>>>> Yann Morin gave the feedback that this patch allows to overwrite
>>>>>> u-boot sources, rendering the declared license possible invalid.
>>>>
>>>> AFAIK this feature cannot overwrite the U-Boot license files and
>>>> according to the U-Boot licenses/README - "You can redistribute
>>>> U-Boot  and/or modify it under the terms of version 2 of the GNU
>>>> General Public License as published by the Free Software
>>>> Foundation."
>>>> So, it should not be an issue as long as the new config file respects
>>>> the terms of the version 2 of the GNU GPL license.
>>>
>>> Hmm. There was maybe a bit of misunderstanding in what I said. Lemme
>>> quote it here again:
>>>
>>>     ---
>>>     This is likely to overwrite a uboot source file
>>>     with a local file, so we won't be able to generate conpliant
>>>     legal-info when a custom comnfig file is used.
>>>     ---
>>>
>>> What I meant was, when running 'make legal-info', we will end up copying
>>> the tarball of the sources, and we will miss this file (since Buildroot
>>> is not recreating the tarballs from the build dir, but just copies what
>>> was downloaded.)
>>>
>>> So, this indeed can not overwrite the license file, but the sources in
>>> legal-info will not be the exact sources used to build U-Boot, so the
>>> legal-info will not create a compliant distribution.
>>
>>  Note that this is the same for the kernel (although a bit more vague).
>> One could easily argue that the .config file is part of the
>> infrastructure needed to build the kernel (if you've ever tried to
>> reverse engineer a kernel config you will know what I mean). With U-Boot
>> it's more obvious because the config file is a header file, but the
>> semantics are really the same.
>>
>>  That said, this shouldn't be a reason to do the wrong thing in U-Boot.
>>
>>>
>>> That's why I oppposed the change as-is.
>>>
>>>>>> Eric: are you still interested in pursuing this patch? If so, I think
>>>>>> some further discussion on it should be ignited.
>>>>
>>>> I submitted this patch because I think it is generic enough to support
>>>> custom U-Boot configuration file for any board without using a patch
>>>> but I can understand I am the only one customizing bootloader for
>>>> my boards.
>>>> So feel free to reject this patch if there is no interest to manage
>>>> U-Boot configuration files within BuildRoot.
>>>
>>> I did not say we did not want to be able to provide a custom config
>>> file. I just said we need to be careful on the impact.
>>>
>>> However, I see that it is possible to declare post-legal-info hooks in
>>> packages.
>>>
>>> So you could complement your patch with something like:
>>>
>>>     UBOOT_CUSTOM_CONFIG = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE))
>>>     ifneq ($(UBOOT_CUSTOM_CONFIG_FILE),)
>>>     define UBOOT_COPY_CUSTOM_CONFIG_FILE
>>>         $(INSTALL) -m 0644 -D $(UBOOT_CUSTOM_CONFIG_FILE) \
>>>                    $(SOMEWHERE)
>>>     endef
>>>     UBOOT_POST_LEGAL_INFO_HOOKS += UBOOT_COPY_CUSTOM_CONFIG_FILE
>>>     endif
>>>
>>> I'll leave it to you as an exercise to find what $(SOMEWHERE) should be.
>>> ;-)
>>
>>  Perhaps we should add legal-info infrastructure to support this kind of
>> thing. Something like
>>
>> PKG_LICENSE_EXTRA_SOURCE = list of files relative to BR dir
>>
>>
>>
>>  By the way, since this config.h copying is only useful for changing the
>> configuration of existing boards, I think this should be explicitly
>> mentioned in the help text of the option.
>>
>>  BTW, note that this patch has become more useful since the deprecation
>> of BR2_TARGET_UBOOT_IPADDR and friends.
>>
>>
> 
> What should we do with this issue now?

 For me:

* the legal-info argument is not a showstopper because it's the same for
many other buildroot features;

* the approach is not great, because it _looks_ like it makes it possible
to create a new board, which is not true;

* the patch is still very useful, and I like it much more than sedding
the config file.

 So for me, this is an A-class. However, I still have some comments on
the patch (see that thread).

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
