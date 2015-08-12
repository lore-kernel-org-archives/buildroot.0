From: Nikolay Dimitrov <picmaster@mail.bg>
Date: Wed, 12 Aug 2015 19:11:05 +0300
Subject: [Buildroot] [PATCH] linux: handle read-only dts files
In-Reply-To: <55CB6E20.5040206@mentor.com>
References: <1439338309-19690-1-git-send-email-hollis_blanchard@mentor.com>
 <55CB5F23.7000708@mail.bg> <55CB6E20.5040206@mentor.com>
Message-ID: <55CB7019.5080703@mail.bg>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Hollis,

On 08/12/2015 07:02 PM, Hollis Blanchard wrote:
> The DTS exists at $(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH) because that's
> where it lives. It's copied to $(KERNEL_ARCH_PATH)/boot/dts/ so that the
> kernel build process can build a DTB out of it (which is later copied to
> build/images/).
>
> Or did I misunderstand the question?

Sorry, I could've been probably more clear. My question was whether the
DTS needs to exist also at the destination ($(KERNEL_ARCH_PATH)/boot
/dts/) before the copying happens.

If it doesn't exist at the destination, the VCS wouldn't have checked
it out as r/o file, and the issue wouldn't happen in the first place
(e.g. the copy operation will succeed). Also, when we have 2 files with
the same name and content, this tends to create confusion with
developers (aka which file was the primary one).

>
> Hollis Blanchard
> Mentor Graphics Emulation Division
>
> On 08/12/2015 07:58 AM, Nikolay Dimitrov wrote:
>> Hi Holis,
>>
>> On 08/12/2015 03:11 AM, Hollis Blanchard wrote:
>>> Some fine version control systems make all files read-only. The
>>> custom DTS file
>>> may therefore be read-only, and that permission is preserved when
>>> copying into
>>> the Linux build directory. A subsequent rebuild tries to 'cp' again,
>>> which
>>> fails with a "Permission denied" error unless the -f option is used.
>>>
>>> Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
>>> ---
>>>   linux/linux.mk | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/linux/linux.mk b/linux/linux.mk
>>> index 375a9e1..a4c4733 100644
>>> --- a/linux/linux.mk
>>> +++ b/linux/linux.mk
>>> @@ -270,7 +270,7 @@ endif
>>>   # configuration has changed.
>>>   define LINUX_BUILD_CMDS
>>>       $(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
>>> -        cp $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH))
>>> $(KERNEL_ARCH_PATH)/boot/dts/)
>>> +        cp -f $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH))
>>> $(KERNEL_ARCH_PATH)/boot/dts/)
>>>       $(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D)
>>> $(LINUX_TARGET_NAME)
>>>       @if grep -q "CONFIG_MODULES=y" $(@D)/.config; then     \
>>>           $(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D)
>>> modules ;    \
>>>
>>
>> Is there a reason for the custom DTS to exist in both places?
>>
>> Regards,
>> Nikolay

Regards,
Nikolay
