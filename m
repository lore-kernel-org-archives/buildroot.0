From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 29 Jul 2012 17:16:37 +0200
Subject: [Buildroot] [PATCH 4/6] Add support for appended device tree
 blobs for arm
In-Reply-To: <20120728212951.1671073f@skate>
References: <1342528042-10038-1-git-send-email-maxime.ripard@free-electrons.com>
 <1342528042-10038-5-git-send-email-maxime.ripard@free-electrons.com>
 <5013FBFE.5030702@mind.be> <20120728212951.1671073f@skate>
Message-ID: <501553D5.1090405@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/28/12 21:29, Thomas Petazzoni wrote:
> Le Sat, 28 Jul 2012 16:49:34 +0200,
> Arnout Vandecappelle<arnout@mind.be>  a ?crit :
>
>>> @@ -66,10 +73,14 @@ LINUX_IMAGE_NAME=vmImage
>>>    else
>>>    LINUX_IMAGE_NAME=uImage
>>>    endif
>>> +else ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
>>> +LINUX_IMAGE_NAME=uImage
>>>    else ifeq ($(BR2_LINUX_KERNEL_BZIMAGE),y)
>>>    LINUX_IMAGE_NAME=bzImage
>>>    else ifeq ($(BR2_LINUX_KERNEL_ZIMAGE),y)
>>>    LINUX_IMAGE_NAME=zImage
>>> +else ifeq ($(BR2_LINUX_KERNEL_APPENDED_ZIMAGE),y)
>>> +LINUX_IMAGE_NAME=zImage
>>>    else ifeq ($(BR2_LINUX_KERNEL_VMLINUX_BIN),y)
>>>    LINUX_IMAGE_NAME=vmlinux.bin
>>>    else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
>>
>>    I think this whole blob should move to Config.in, like we
>> do it for many other strings...  But that's of course unrelated
>> to this patch.
>
> I don't necessarily agree here. Generally speaking my preference is to
> not use too much kconfig to define a bunch of strings when those are
> not related to visible options.

  Putting it in Config.in is more concise. Imagine what the Makefile would
look like if all the target/Config.in.arch strings would have to be put
in "else ifeq" statements...

  Also, these strings are directly related to visible options: they are
the string representation of the BR2_LINUX_KERNEL_XXX option (well, it's
not a 1-to-1 mapping but it comes close).


>> ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
>> define LINUX_APPEND_DTB
>> 	cat ...
>> ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
>> 	$(MAKE) ... uImage
>> endif
>> endef
>> endif
>>
>> (I'm not sure if you can still use an ifeq inside a define.)
>
> No, you can't, and it's a shame :-(

  Darn.

  This would work I think:
ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
define LINUX_APPEND_DTB
	cat ...
endef
endif
ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
LINUX_APPEND_DTB += $(MAKE) ... uImage
endif

  Or else, define a LINUX_REBUILD_UIMAGE macro for the appended uImage.
But neither is much better than the original (especially if the cat-rm-mv
chain is replaced by a single cat) so let's keep it as it was proposed
by Maxime.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
