From: Serj Kalichev <serj.kalichev@gmail.com>
Date: Fri, 13 Jul 2018 15:24:02 +0300
Subject: [Buildroot] BR2_LINUX_KERNEL_PATCH for linux-headers
In-Reply-To: <6189d2d4-c38c-34b0-d5b8-e37eb245f68d@mind.be>
References: <fea35efb-0134-f091-5cbd-30292f137b33@gmail.com>
 <60e837dd-e80e-c0c3-a5b4-7cb60e87f7f3@mind.be>
 <c9339544-608c-ef29-21cd-640f0552e63f@gmail.com>
 <6189d2d4-c38c-34b0-d5b8-e37eb245f68d@mind.be>
Message-ID: <bcaa3e35-ba14-c59f-12ce-a96bf38a7c15@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes, you are right. I have a several kernel versions in project and can 
store patches for different versions in different dirs. But additionally 
I have a conditional patches. For example - for kernel on virtual 
machine and for kernel on real hardware. And these patches are different 
for different kernel versions. I mean in my case it will be a 
directories mess if each variant have their own "patches/linux" structure.

My structure is:

..patches/linux/3.10.x
..patches/linux/4.9.x
etc.

I think this structure is better for complex projects with different 
kernel versions.
What do you think about it?
I can prepare a patch for linux and linux-headers packages to add 
patching dirs like 4.9.x to POST_PATCH_HOOKS. Is it useful for busybox 
project?

13.07.2018 13:01, Arnout Vandecappelle ?????:
>
> On 12-07-18 14:33, Serj Kalichev wrote:
>> Thanks for the answer.
>> I will use BR2_GLOBAL_PATCH_DIR but with enhancement.
>> It's not suitable for linux and linux-headers to create dirs like linux/4.9.80.
>   Well, you don't need to create a version-specific directory at all, just put
> your patches under linux/. Except if you want to use the same GLOBAL_PATCH_DIR
> for different configurations with different kernel versions. But even then, you
> can just have different patch directories. I typically have something like:
>
> board/project-foo/common/patches/busybox/....patch
>                    board1/patches/linux/.....patch
>                                   linux-headers -> linux
>                    board2/patches/linux/.....patch
>                                   ubuut/.....patch
>
> BR2_GLOBAL_PATCH_DIR="$(BR2_EXTERNAL_FOO_PATH)/board/project-foo/common/patches
> $(BR2_EXTERNAL_FOO_PATH)/board/project-foo/board1/patches"
>
>
>   Regards,
>   Arnout
>
>> Minor version number is not useful for kernel patches. The dirs like linux/4.0.x
>> is better.
>> So I create a file in my external tree:
>>
>> LINUX_VERSION_S := $(subst ., , $(strip $(LINUX_VERSION)))
>> LINUX_VERSION_X := $(word 1, $(LINUX_VERSION_S)).$(word 2, $(LINUX_VERSION_S)).x
>>
>> define LINUX_APPLY_MAJOR_PATCHES
>> <------>$(Q)( \
>> <------>for D in $(PATCH_BASE_DIRS); do \
>> <------>? if test -d $${D}/$($(PKG)_VERSION_X); then \
>> <------>??? $(APPLY_PATCHES) $(@D) $${D}/$($(PKG)_VERSION_X) \*.patch
>> \*.patch.$(ARCH) || exit 1; \
>> <------>? fi; \
>> <------>done; \
>> <------>)
>> endef
>>
>> LINUX_POST_PATCH_HOOKS += LINUX_APPLY_MAJOR_PATCHES
>>
>> The file for linux-headers is the same.
>> So buildroot will use dirs like "4.9.x" to patch linux and linux-headers. Maybe
>> it will be useful for someone.
>>
>> 12.07.2018 00:02, Arnout Vandecappelle ?????:
>>> On 11-07-18 16:32, Serj Kalichev wrote:
>>>> Hello.
>>>>
>>>> Both linux and linux-headers package use BR2_LINUX_KERNEL_PATCH. But
>>>> BR2_LINUX_KERNEL_PATCH is available if BR2_LINUX_KERNEL is selected. I want to
>>>> build toolchain only. And don't want to build linux kernel. So I deselect
>>>> BR2_LINUX_KERNEL and lose BR2_LINUX_KERNEL_PATCH for linux-headers.
>>>>
>>>> I think BR2_LINUX_KERNEL_PATCH must not depend on BR2_LINUX_KERNEL.
>>>  ? It's not easy to do that properly, because you'd still need to go to the kernel
>>> menu to set the kernel patch list.
>>>
>>>  ? Anyway, we consider BR2_LINUX_KERNEL_PATCH as deprecated. Use
>>> BR2_GLOBAL_PATCH_DIR instead, and add your patches in the linux-headers
>>> subdirectory of that directory.
>>>
>>>  ? Regards,
>>>  ? Arnout
>>>
