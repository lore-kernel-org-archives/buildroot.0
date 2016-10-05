From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Wed, 5 Oct 2016 08:38:47 +0200
Subject: [Buildroot] [PATCH v3] package/linux-tools: add gpio
In-Reply-To: <9bbb47e0-3da3-f735-9a79-3d26b1515e09@mind.be>
References: <20161003122548.2477-1-m.niestroj@grinn-global.com>
 <20161003170644.GB3924@free.fr>
 <3c84132d-9e2b-5e9c-83bb-b43e8acdf1db@grinn-global.com>
 <20161004154254.GA3806@free.fr>
 <9bbb47e0-3da3-f735-9a79-3d26b1515e09@mind.be>
Message-ID: <5df6ddc1-c2e7-c623-62b7-9df19d61193a@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05.10.2016 00:05, Arnout Vandecappelle wrote:
>
>
> On 04-10-16 17:42, Yann E. MORIN wrote:
>> Marcin, All,
>>
>> On 2016-10-04 08:53 +0200, Marcin Niestroj spake thusly:
>>> On 03.10.2016 19:06, Yann E. MORIN wrote:
>>>> On 2016-10-03 14:25 +0200, Marcin Niestroj spake thusly:
>>>>> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
>> [--SNIP--]
>>>>> diff --git a/package/linux-tools/linux-tool-gpio.mk b/package/linux-tools/linux-tool-gpio.mk
>>>>> new file mode 100644
>>>>> index 0000000..db0094a
>>>>> --- /dev/null
>>>>> +++ b/package/linux-tools/linux-tool-gpio.mk
>>>>> @@ -0,0 +1,28 @@
>>>>> +################################################################################
>>>>> +#
>>>>> +# gpio
>>>>> +#
>>>>> +################################################################################
>>>>> +
>>>>> +LINUX_TOOLS += gpio
>>>>> +
>>>>> +GPIO_MAKE_OPTS = CROSS_COMPILE=$(TARGET_CROSS)
>>>>
>>>> Any reason not to use $(LINUX_MAKE_FLAGS) in the first place?
>>>>
>>>>    GPIO_MAKE_OPTS = $(LINUX_MAKE_FLAGS)
>>>>
>>>> LINUX_MAKE_FLAGS shall contain all the required variable definitions
>>>> needed to build for the target.
>>>>
>>>> Yes, cpupower directly defines CROSS_COMPILE et al., but perf and
>>>> selftests do use LINUX_MAKE_FLAGS, and I think we should use that unless
>>>> there is a good reason not to.
>>>>
>>>> This would allow use to easily update the compile options/variables.
>>>
>>> I just did it similar to cpupower package. But using LINUX_MAKE_FLAGS
>>> looks like a better option.
>>>
>>> What about specifying also DESTDIR together:
>>> GPIO_MAKE_OPTS = $(LINUX_MAKE_FLAGS) DESTDIR=$(TARGET_DIR)
>>> so we can simplify GPIO_INSTALL_TARGET_CMDS?
>>> This would be similar to perf package.
>>
>> No, please specify DESTDIR only at install time.
>
>  This is because in general, there may also be installation to staging or
> images, and in those cases DESTDIR should be STAGING_DIR resp. IMAGES_DIR. So
> adding DESTDIR to the general _MAKE_OPTS is semantically incorrect.

Thanks for clarifying that!

>
>  Regards,
>  Arnout
>
>>
>> Regards,
>> Yann E. MORIN.
>>
>>>> (Sorry, I forgot to point that out in the previous review...)
>>>>
>>>> Regards,
>>>> Yann E. MORIN.
>>>>
>>>>> +define GPIO_BUILD_CMDS
>>>>> +	$(Q)if ! grep install $(LINUX_DIR)/tools/gpio/Makefile >/dev/null 2>&1 ; then \
>>>>> +		echo "Your kernel version is too old and does not have the gpio tools." ; \
>>>>> +		echo "At least kernel 4.8 must be used." ; \
>>>>> +		exit 1 ; \
>>>>> +	fi
>>>>> +
>>>>> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
>>>>> +		$(GPIO_MAKE_OPTS) \
>>>>> +		gpio
>>>>> +endef
>>>>> +
>>>>> +define GPIO_INSTALL_TARGET_CMDS
>>>>> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
>>>>> +		$(GPIO_MAKE_OPTS) \
>>>>> +		DESTDIR=$(TARGET_DIR) \
>>>>> +		gpio_install
>>>>> +endef
>>>>> --
>>>>> 2.10.0
>>>>>
>>>>> _______________________________________________
>>>>> buildroot mailing list
>>>>> buildroot at busybox.net
>>>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>>>
>>>
>>> --
>>> Marcin Niestroj
>>
>

-- 
Marcin Niestroj
