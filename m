From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 07 Apr 2015 01:24:42 +0200
Subject: [Buildroot] [PATCH 5/6 v3] toolchain/external: ignore missing
 hash for custom downloaded toolchain
In-Reply-To: <20150406212001.GI4369@free.fr>
References: <cover.1428322317.git.yann.morin.1998@free.fr>
 <2e8ef15e2d2d729ffe1bb5f77aabeb525554c407.1428322317.git.yann.morin.1998@free.fr>
 <5522F4AF.7000409@mind.be> <20150406212001.GI4369@free.fr>
Message-ID: <552315BA.3010605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/04/15 23:20, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2015-04-06 23:03 +0200, Arnout Vandecappelle spake thusly:
>> On 06/04/15 14:13, Yann E. MORIN wrote:
>>> We will *always* be missing a hash file for custom external toolchains
>>> that are downloaded.
>>>
>>> So, just ignore that failure.
>>>
>>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
>>>
>>> ---
>>> Changes v1 -> v2:
>>>   - fix typoes in title
>>> ---
>>>  toolchain/toolchain-external/toolchain-external.mk | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
>>> index c0429bb..3659511 100644
>>> --- a/toolchain/toolchain-external/toolchain-external.mk
>>> +++ b/toolchain/toolchain-external/toolchain-external.mk
>>> @@ -400,6 +400,8 @@ else
>>>  # Custom toolchain
>>>  TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
>>>  TOOLCHAIN_EXTERNAL_SOURCE = $(notdir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
>>> +# Magic value to tell the download helper to avoid failling on missing hash
>>> +export BR_MISSING_HASH_OK := $(call ignore-missing-hash-magic,$(TOOLCHAIN_EXTERNAL_SOURCE))
>>
>>  Urgh - this disables the hash check for all packages, not just the toolchain.
> 
> No, that disable the check only for that one file, because we're not
> chcking whether it is set, but whether it is set to the correct value
> (i.e. the sha1 of the filename).

 Ah of course, that's probably why you introduced that.

 But it does mean that only a single file can ever be bypassed...

> 
>> So NACK for exporting it.
> 
> OK, this is indeed fishy.
> 
>>  But I see that it's not so simple to get it into the environment of the
>> download step...
>>
>>
>>  Perhaps instead we should add a global variable with the files that should not
>> be hash-checked:
>>
>> NOHASH_FILES += $(TOOLCHAIN_EXTERNAL_SOURCE)
>>
>> and in pkg-download.mk
>>
>> hasharg = $(if $(filter-out $(TOOLCHAIN_EXTERNAL_SOURCE),$(1)),
> 
> You probably meant s/TOOLCHAIN_EXTERNAL_SOURCE/NOHASH_FILES/ ?

 Untested and all :-)

> 
>> 	-H $(PKGDIR)/$($(PKG)_RAWNAME).hash)
>>
>> define DOWNLOAD_WGET
>>         $(EXTRA_ENV) $(DL_WRAPPER) -b wget \
>>                 -o $(DL_DIR)/$(2) \
>>                 $(call hasharg,$(2)) \
>>                 $(QUIET) \
>>                 -- \
>>                 '$(call qstrip,$(1))'
>> endef
>>
>> (all completely untested, obviously :-)
> 
> Well, that sounds a bit better than my proposal.
> 
> Still, I prefer:
> 
>   - we offload the check in the dl-wrapper so we can do the check in a
>     single place, rather than re-add extra code in each download macros
>     (the dl-wrapper was added because the Makefile macros were too
>     complex to handle);

 Ack that, though I don't immediately see a way to do that.

> 
>   - we pass obscur values (like a sha1), rather than the filenames, to
>     make it even less easy to use.

 I really don't see the point of that... If it's not documented, you have to
look at the source code to find out which variable to set. And when you look at
the source code, you immediately see how this obscure value is calculated so it
makes no real difference.


 Regards,
 Arnout

> 
> I'll respin a series taking into account your comments. Thanks! :-)
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
