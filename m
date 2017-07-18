From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Jul 2017 21:48:51 +0200
Subject: [Buildroot] [PATCH] core/legal-info: use hash file from version
 sub-dir
In-Reply-To: <20170714083801.GA3373@scaer>
References: <20170713221924.12021-1-yann.morin.1998@free.fr>
 <c5635e76-c4fe-bf03-1215-a77cca5fa143@microchip.com>
 <20170714083801.GA3373@scaer>
Message-ID: <d7c7d9a1-b7b7-f492-e98a-407a0b60fb22@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-07-17 10:38, Yann E. MORIN wrote:
> Joshua, All,
> 
> On 2017-07-13 16:32 -0700, Joshua Henderson spake thusly:
>> On 07/13/2017 03:19 PM, Yann E. MORIN wrote:
>>
>>> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
>>> index accf48c464..f285395267 100644
>>> --- a/package/pkg-utils.mk
>>> +++ b/package/pkg-utils.mk
>>> @@ -86,9 +86,12 @@ endef
>>>  define legal-license-file # pkgname, pkgname-pkgver, pkgdir, filename, file-fullpath, {HOST|TARGET}
>>>  	mkdir -p $(LICENSE_FILES_DIR_$(6))/$(2)/$(dir $(4)) && \
>>>  	{ \
>>> -		support/download/check-hash $(3)/$(1).hash $(5) $(4); \
>>> -		ret=$${?}; \
>>> -		case $${ret} in (0|3) ;; (*) exit 1;; esac; \
>>> +		if [ -d $(3)/$($(PKG)_VERSION) ]; then \
>>> +			support/download/check-hash $(3)/$($(PKG)_VERSION)/$(1).hash $(5) $(4); \
>>> +		else \
>>> +			support/download/check-hash $(3)/$(1).hash $(5) $(4); \
>>> +		fi; \
>>> +		case $${?} in (0|3) ;; (*) exit 1;; esac; \
>>>  	} && \
>>>  	cp $(5) $(LICENSE_FILES_DIR_$(6))/$(2)/$(4)
>>>  endef
>>>
>>
>> I think this has unintended side effects.  If there is already a $(PKG)_VERSION directory for patches, 
>> it will look for the hash file there even if there are no hash file differences, which results in missing
>> license file hash.
> 
> This is the intended behaviour, yes: if there is a version choice, then
> we _want_ the license hashes to be per version, even if they are the
> same across versions. We do not want them in the 'main' hash file.
> 
> Yes, this means duplicated entries.
> 
> I was also wondering if we should also move the hashes for the
> downlaoded files to be per-version as well, to keep things together.
> 
> Ie., we would have something like:
> 
>     package/qt5/qt5base/Config.in
>     package/qt5/qt5base/qt5base.mk
>     package/qt5/qt5base/5.6.2/*.patch
>     package/qt5/qt5base/5.6.2/qt5base.hash
>     package/qt5/qt5base/5.8.0/*.patch
>     package/qt5/qt5base/5.8.0/qt5base.hash

 This indeed sounds like the right approach. But then both uses of the hash file
(download and legal-info) should use the same approach, as you say.

 In fact, this can be a workaround for cases where we often don't have a hash
because of custom version specification, like the kernel...


 Perhaps the nicest approach is to move the intelligence down into check-hash
itself (the less shell code in the makefiles the better). So check-hash would
not get a hash file as argument, but it would get package directory and version.


 Note by the way that pkg-stats should probably be updated as well.


 Sorry to give you more work :-)


 Regards,
 Arnout

> 
> 
> 
>> I believe it would work if you test -f on the actual .hash file instead of just the directory.
> 
> Again, if the directory exists, I intended that the main hash file was
> not used at all.
> 
>>  But, do note
>> that if there are multiple license files per package, and only one of them is different, this still results
>> in putting all hashes including duplicate ones in separate hash files.
> 
> Yes, this is what I had in mind in this case.
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
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
