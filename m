From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Oct 2016 16:56:53 +0200
Subject: [Buildroot] [PATCH 06/51] ed: use $(TARGET_MAKE_ENV) when
 calling $(MAKE)
In-Reply-To: <da642ca8-45f8-10e7-a4e9-cf7b09538193@mind.be>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1476396838-12276-7-git-send-email-gustavo.zacarias@free-electrons.com>
 <19e5c882-c643-c09d-86b3-2a16673c06cc@mind.be>
 <da642ca8-45f8-10e7-a4e9-cf7b09538193@mind.be>
Message-ID: <4882d678-6ed1-7120-13ab-d8ebe0326b48@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[I'm sorry for reviewing this in pieces...]

On 14-10-16 16:45, Arnout Vandecappelle wrote:
> 
> 
> On 14-10-16 16:41, Arnout Vandecappelle wrote:
>>
>>
>> On 14-10-16 00:13, gustavo.zacarias at free-electrons.com wrote:
>>> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
>>>
>>> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
[snip]
>>> diff --git a/package/ed/ed.mk b/package/ed/ed.mk
>>> index f3bcb74..101be0e 100644
>>> --- a/package/ed/ed.mk
>>> +++ b/package/ed/ed.mk
>>> @@ -21,11 +21,11 @@ define ED_CONFIGURE_CMDS
>>>  endef

 ED_CONFIGURE_CMDS should also get TARGET_MAKE_ENV. It does already get
TARGET_CONFIGURE_OPTS, but only as arguments to configure and as far as I can
see that script doesn't load the assignment arguments in its environment.
Admittedly, the configure script doesn't try to compile anything so it's not
strictly needed to export the corrected staging dir, but for consistency it
would be better to pass it anyway.

 Regards,
 Arnout

>>>  
>>>  define ED_BUILD_CMDS
>>> -	$(MAKE)	-C $(@D)
>>> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
>>>  endef
>>>  
>>>  define ED_INSTALL_TARGET_CMDS
>>> -	$(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
>>> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
>>>  endef
>>>  
>>>  $(eval $(generic-package))
>>>
>>
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
