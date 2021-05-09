From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 9 May 2021 11:44:12 +0200
Subject: [Buildroot] [PATCH v3, 1/1] Config.in: enable FORTIFY_SOURCE,
 PIC/PIE, RELRO, SSP by default
In-Reply-To: <CAPi7W80hOGjSnan3hWSugr-H6SYb587YaAa6Zy7rBx3oBK=ORw@mail.gmail.com>
References: <20210503182241.38713-1-fontaine.fabrice@gmail.com>
 <20210503204151.GJ2137340@scaer>
 <f534b723-70bd-50ef-9611-a0bf734e1e43@gmail.com>
 <CAPi7W80hOGjSnan3hWSugr-H6SYb587YaAa6Zy7rBx3oBK=ORw@mail.gmail.com>
Message-ID: <d04f8645-96f6-3dcc-a2c3-64795104999c@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

Le 09/05/2021 ? 11:22, Fabrice Fontaine a ?crit?:
> Hi Romain,
> 
> Thanks for warning me about these failures.

You're welcome.

> 
> Le sam. 8 mai 2021 ? 17:37, Romain Naour <romain.naour@gmail.com> a ?crit :
>>
>> Le 03/05/2021 ? 22:41, Yann E. MORIN a ?crit :
>>> Fabrice, All,
>>>
>>> On 2021-05-03 20:22 +0200, Fabrice Fontaine spake thusly:
>>>> Enhance security by enabling FORTIFY_SOURCE, PIC/PIE, RELRO and SSP by
>>>> default.
>>>>
>>>> This could help making IoT more secure and fight against the assumption
>>>> that buildroot does not support binary hardening (see
>>>> https://cyber-itl.org/2019/08/26/iot-data-writeup.html)
>>>>
>>>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>>> ---
>> [...]
>>>> diff --git a/Config.in b/Config.in
>>>> index e35a78fb71..6d954e1e0f 100644
>>>> --- a/Config.in
>>>> +++ b/Config.in
>>>> @@ -715,6 +715,7 @@ comment "Security Hardening Options"
>>>>
>>>>  config BR2_PIC_PIE
>>>>      bool "Build code with PIC/PIE"
>>>> +    default y
>>>>      depends on BR2_SHARED_LIBS
>>>>      depends on BR2_TOOLCHAIN_SUPPORTS_PIE
>>>>      help
>>>> @@ -727,7 +728,7 @@ comment "PIC/PIE needs a toolchain w/ PIE"
>>>>
>>>>  choice
>>>>      bool "Stack Smashing Protection"
>>>> -    default BR2_SSP_ALL if BR2_ENABLE_SSP # legacy
>>>> +    default BR2_SSP_ALL
>>>
>>> While discussing this with Matt on IRC, we noticed that SSP-all can have
>>> quite a significant impact on performance, and that SSP-strong (when
>>> available) would be a better default (resorting to SSP-regular
>>> otherwise).
>>>
>>> Yes, this decreases the security level Buildroot wil use by default. But
>>> security is always to be balanced against performance, and this is always
>>> a tricky choice to make; I believe relaxing SSP was striking a good
>>> balance (especially since, today, most gcc versions should have
>>> SSP-strong available).
>>>
>>> Applied to master, thank you!
>>>
>>
>> It seems that some defconfigs are failing to build with this option by default:
>> https://gitlab.com/kubu93/buildroot/-/pipelines/299584088
>>
>> At least:
>> qemu_riscv32_virt_defconfig
>> https://gitlab.com/kubu93/buildroot/-/jobs/1247043359
> This one should be fixed by
> https://patchwork.ozlabs.org/project/buildroot/patch/20210508194155.3678473-2-fontaine.fabrice at gmail.com/
>>
>> qemu_s390x_defconfig
>> https://gitlab.com/kubu93/buildroot/-/jobs/1247043361
> This one should be fixed by
> https://patchwork.ozlabs.org/project/buildroot/patch/20210509091800.708933-1-fontaine.fabrice at gmail.com/
> 
> Do you think there are other failures that are related to the activation of SSP?

I did another test with master branch and there are the same issues:
https://gitlab.com/kubu93/buildroot/-/pipelines/299615886

For nios2, the system doesn't boot as soon as BR2_PIC_PIE is set.

I started to look at ppc e500mc if the issue is also related to BR2_PIC_PIE
option but I need time to investigate.

Best regards,
Romain


>>
>> (I was testing the new qemu 6.0.0)
>>
>> Best regards,
>> Romain
>>
>>
>>> Regards,
>>> Yann E. MORIN.
>>>
> Best Regards,
> 
> Fabrice
> 
