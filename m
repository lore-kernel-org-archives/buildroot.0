From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 02 Jul 2012 21:52:23 +0200
Subject: [Buildroot] [PATCH] Add some support for device tree kernels
 with appended trees
In-Reply-To: <4FF1BE8A.1090208@free-electrons.com>
References: <1340615122-6006-1-git-send-email-maxime.ripard@free-electrons.com>
 <4FEF4A9C.7020901@mind.be> <4FF1BE8A.1090208@free-electrons.com>
Message-ID: <4FF1FBF7.2040902@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/02/12 17:30, Maxime Ripard wrote:
> Hi Arnout,
>
> Thanks for the review!
>
> Le 30/06/2012 20:51, Arnout Vandecappelle a ?crit :
[snip]
>>   I have a use case where I want several dtb's to be generated
>> in a single buildroot config.  Now I do it by calling dtc outside
>> of buildroot, but it would be nice if this use case were supported
>> as well.  Of course, that would be impossible to combine with the
>> BR2_LINUX_KERNEL_APPENDED_DTB option.
>
> How would you integrate it ? Through a "additionnal device tree sources"
> options ? or in these same options?
>
> Anyway, maybe we can get this merge and build on top of that later?

  Good idea.

  Anyway, maybe it's a bit of a corner case to have two device trees for a single
buildroot config...

[snip]
>> On 06/25/12 11:05, Maxime Ripard wrote:
>>   I've had at least one kernel where I had to build dtc explicitly:
>>
>>      $(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) ./scripts/dtc/
>
> Hmmm, I'm pretty sure that it is built when the device tree is enabled.
> Do you remember in what case you had to do this ?

  Now I do: I tried to build the dtb and the kernel image in one parallel
make invocation.  In that case, the dtc is not necessarily built before
it is invoked to create the dtb.  In this case, however, you do the
dtb in a separate make after the kernel image, so dtc is definitely there.
So you can safely ignore my comment.

>
>>> +    $(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D)
>>> $(KERNEL_DTS_NAME).dtb
>>> +endef
>>> +endif
>>> +
>>> +ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
>>> +ifeq ($(BR2_LINUX_KERNEL_UBOOT_IMAGE),y)
>>> +define LINUX_APPEND_DTB
>>> +    cat $(KERNEL_ARCH_PATH)/boot/zImage
>>> $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb>
>>> $(KERNEL_ARCH_PATH)/boot/zImage_dtb
>>
>>   A space before the>  would make things more readable.
>
> Hmmm, it's there in the patch. Maybe some weird wrapping on your side ?

  Heh, yep, Thunderbird removes in when quoting the reply (as you can see in
my quoted text before :-)


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
