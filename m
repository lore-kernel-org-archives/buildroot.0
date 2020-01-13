From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 13 Jan 2020 23:15:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/olsr: use make foreach loops
In-Reply-To: <CAPi7W819rDx7o3H6UHfSS0W9g5xzwmc1HK8RL4ovDT4GoeJrMw@mail.gmail.com>
References: <20200113180856.787063-1-fontaine.fabrice@gmail.com>
 <20200113211754.02aff2c1@windsurf>
 <CAPi7W819rDx7o3H6UHfSS0W9g5xzwmc1HK8RL4ovDT4GoeJrMw@mail.gmail.com>
Message-ID: <5ace9bf2-9de4-a48a-0c5d-6a18c8d62b5b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/01/2020 21:32, Fabrice Fontaine wrote:
> Dear Thomas,
> 
> Le lun. 13 janv. 2020 ? 21:17, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> a ?crit :
>>
>> On Mon, 13 Jan 2020 19:08:56 +0100
>> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>>
>>> Replace shell for loops by make foreach loops
>>>
>>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>> ---
>>>  package/olsr/olsr.mk | 14 +++++++-------
>>>  1 file changed, 7 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
>>> index e643a0cfb3..3533e2a1fd 100644
>>> --- a/package/olsr/olsr.mk
>>> +++ b/package/olsr/olsr.mk
>>> @@ -18,19 +18,19 @@ OLSR_DEPENDENCIES = host-flex host-bison
>>>
>>>  define OLSR_BUILD_CMDS
>>>       $(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) -C $(@D) olsrd
>>> -     for p in $(OLSR_PLUGINS) ; do \
>>> -             $(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) -C $(@D)/lib/$$p ; \
>>> -     done
>>> +     $(foreach p,$(OLSR_PLUGINS),
>>
>> Did you test this? To me, it seems like a backslash is missing at the end of this line.
> Yes, it builds fine. I decided to skip the backslash as some packages
> (ltp-testsuite, selinux-python, policycoreutils, python-pyqt5) don't
> add it while others (systemd, sunxi-tools) do.
> But I can add a backslash if you want, I don't know what is the "best practice".

 It works because it's within a define:

-------------
# This works, because 'define' creates a multiline "statement"
define test1
$(foreach i,1 2 3,
  $(info $(i)))
endef

$(test1)

# The following fail without backslash, because it's interpreted line-by-line
all:
	$(foreach i,4 5,
	  $(info $(i)))

$(foreach i,7 8,
  $(info $(i)))
-------------


 For consistency, I think it makes sense to always use a backslash.

 Regards,
 Arnout




>>
>>> +             $(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) -C $(@D)/lib/$(p)
>>> +     )
>>>  endef
>>>
>>>  define OLSR_INSTALL_TARGET_CMDS
>>>       $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
>>>               prefix="/usr" install_bin
>>> -     for p in $(OLSR_PLUGINS) ; do \
>>> -             $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/lib/$$p \
>>> +     $(foreach p,$(OLSR_PLUGINS),
>>
>> Same here.
>>
>>> +             $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/lib/$(p) \
>>>                       LDCONFIG=/bin/true DESTDIR=$(TARGET_DIR) \
>>> -                     prefix="/usr" install ; \
>>> -     done
>>> +                     prefix="/usr" install
>>> +     )
>>
>> Best regards,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
> Best Regards,
> 
> Fabrice
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
