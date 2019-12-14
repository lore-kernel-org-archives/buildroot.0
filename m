From: Romain Naour <romain.naour@smile.fr>
Date: Sat, 14 Dec 2019 22:53:28 +0100
Subject: [Buildroot] [PATCH 03/12] package/pkg-utils.mk: rework
 implementation of extractor-system-dependency
In-Reply-To: <20191214214507.GC19349@scaer>
References: <20191210215952.902477-1-thomas.petazzoni@bootlin.com>
 <20191210215952.902477-4-thomas.petazzoni@bootlin.com>
 <65eac3bd-f2c5-124c-7448-541b8b0a525b@smile.fr>
 <20191214214507.GC19349@scaer>
Message-ID: <56f718d6-65d5-d1c0-3dce-a8a2874ec9bf@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Thomas,

Le 14/12/2019 ? 22:45, Yann E. MORIN a ?crit?:
> Romain, All,
> 
> On 2019-12-14 22:37 +0100, Romain Naour spake thusly:
>> Le 10/12/2019 ? 22:59, Thomas Petazzoni a ?crit?:
>>> Now that we have the EXTRACTOR_PKG_DEPENDENCY.* variables available,
>>> we can use them to implement extractor-system-dependency: if for a
>>> given archive type, the corresponding EXTRACTOR_PKG_DEPENDENCY.<type>
>>> variable is empty, then it means we need the corresponding extractor
>>> tool to be provided by the system.
>>>
>>> Following this, EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS is no
>>> longer used, so we can drop it from support/dependencies/.
>>>
>>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>>> ---
>>>  package/pkg-utils.mk                     | 4 ++--
>>>  support/dependencies/check-host-lzip.mk  | 1 -
>>>  support/dependencies/check-host-xzcat.mk | 1 -
>>>  3 files changed, 2 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
>>> index 35a441e0aa..d324934dba 100644
>>> --- a/package/pkg-utils.mk
>>> +++ b/package/pkg-utils.mk
>>> @@ -62,8 +62,8 @@ extractor-pkg-dependency = $(EXTRACTOR_PKG_DEPENDENCY$(suffix $(1)))
>>>  # $(firstword) is used here because the extractor can have arguments,
>>>  # like ZCAT="gzip -d -c", and to check for the dependency we only want
>>>  # 'gzip'.
>>> -extractor-system-dependency = $(firstword $(INFLATE$(filter-out \
>>> -	$(EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS),$(suffix $(1)))))
>>> +extractor-system-dependency = $(if $(EXTRACTOR_PKG_DEPENDENCY$(suffix $(1))),,\
>>
>> I would add a "." after EXTRACTOR_PKG_DEPENDENCY because we want to use
>> "EXTRACTOR_PKG_DEPENDENCY.$(suffix $(1))"
> 
> In a Makefile:
>     FOO = a.b
>     $(info $(suffix $(FOO)))
> 
> would yield:
>     .b
> 
> so we already have the dot.

Thanks, Indeed we already have the dot.
Sorry for the noise.

Best regards,
Romain


> 
> Regards,
> Yann E. MORIN.
> 
>> Best regards,
>> Romain
>>
>>
>>> +	$(firstword $(INFLATE$(suffix $(1)))))
>>>  
>>>  # check-deprecated-variable -- throw an error on deprecated variables
>>>  # example:
>>> diff --git a/support/dependencies/check-host-lzip.mk b/support/dependencies/check-host-lzip.mk
>>> index cdd784058c..98a4f42388 100644
>>> --- a/support/dependencies/check-host-lzip.mk
>>> +++ b/support/dependencies/check-host-lzip.mk
>>> @@ -1,5 +1,4 @@
>>>  ifeq (,$(call suitable-host-package,lzip,$(LZCAT)))
>>>  BR2_LZIP_HOST_DEPENDENCY = host-lzip
>>> -EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS += .lz
>>>  LZCAT = $(HOST_DIR)/bin/lzip -d -c
>>>  endif
>>> diff --git a/support/dependencies/check-host-xzcat.mk b/support/dependencies/check-host-xzcat.mk
>>> index e5d72f95dd..9a78a8f38a 100644
>>> --- a/support/dependencies/check-host-xzcat.mk
>>> +++ b/support/dependencies/check-host-xzcat.mk
>>> @@ -3,6 +3,5 @@
>>>  
>>>  ifeq (,$(call suitable-host-package,xzcat,$(XZCAT)))
>>>  BR2_XZCAT_HOST_DEPENDENCY = host-xz
>>> -EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS += .xz .lzma
>>>  XZCAT = $(HOST_DIR)/bin/xzcat
>>>  endif
>>>
>>
> 
