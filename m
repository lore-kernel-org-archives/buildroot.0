From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Oct 2016 16:45:50 +0200
Subject: [Buildroot] [PATCH 06/51] ed: use $(TARGET_MAKE_ENV) when
 calling $(MAKE)
In-Reply-To: <19e5c882-c643-c09d-86b3-2a16673c06cc@mind.be>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1476396838-12276-7-git-send-email-gustavo.zacarias@free-electrons.com>
 <19e5c882-c643-c09d-86b3-2a16673c06cc@mind.be>
Message-ID: <da642ca8-45f8-10e7-a4e9-cf7b09538193@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-10-16 16:41, Arnout Vandecappelle wrote:
> 
> 
> On 14-10-16 00:13, gustavo.zacarias at free-electrons.com wrote:
>> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
>>
>> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
>> ---
>>  package/botan/botan.mk | 6 +++---
> 
>  botan sneaked in into the same patch.
> 
>  Regards,
>  Arnout
> 
>>  package/ed/ed.mk       | 4 ++--
>>  2 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/package/botan/botan.mk b/package/botan/botan.mk
>> index 69c973e..4da557a 100644
>> --- a/package/botan/botan.mk
>> +++ b/package/botan/botan.mk
>> @@ -48,15 +48,15 @@ define BOTAN_CONFIGURE_CMDS

 Also, I think you should pass it in CONFIGURE_CMDS as well - even if botan
configure doesn't look at staging dir, it's better for symmetry and for the future.

 Regards,
 Arnout

>>  endef
>>  
>>  define BOTAN_BUILD_CMDS
>> -	$(MAKE) -C $(@D) AR="$(TARGET_AR) crs"
>> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) AR="$(TARGET_AR) crs"
>>  endef
>>  
>>  define BOTAN_INSTALL_STAGING_CMDS
>> -	$(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)/usr" install
>> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)/usr" install
>>  endef
>>  
>>  define BOTAN_INSTALL_TARGET_CMDS
>> -	$(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)/usr" install
>> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)/usr" install
>>  endef
>>  
>>  $(eval $(generic-package))
>> diff --git a/package/ed/ed.mk b/package/ed/ed.mk
>> index f3bcb74..101be0e 100644
>> --- a/package/ed/ed.mk
>> +++ b/package/ed/ed.mk
>> @@ -21,11 +21,11 @@ define ED_CONFIGURE_CMDS
>>  endef
>>  
>>  define ED_BUILD_CMDS
>> -	$(MAKE)	-C $(@D)
>> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
>>  endef
>>  
>>  define ED_INSTALL_TARGET_CMDS
>> -	$(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
>> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
>>  endef
>>  
>>  $(eval $(generic-package))
>>
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
