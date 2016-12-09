From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Fri, 9 Dec 2016 10:21:03 +0100
Subject: [Buildroot] [PATCH] package/reactcpp: new package
In-Reply-To: <6ac12a67-ac26-9f93-d458-747e95e866ca@grinn-global.com>
References: <20161206132643.27141-1-m.niestroj@grinn-global.com>
 <20161206163136.23d44f9f@free-electrons.com>
 <6ac12a67-ac26-9f93-d458-747e95e866ca@grinn-global.com>
Message-ID: <f636e87b-01cc-2719-c845-004604a702a6@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 07.12.2016 11:55, Marcin Niestroj wrote:
>
> On 06.12.2016 16:31, Thomas Petazzoni wrote:
>> Hello,
>>
>> Thanks for this contribution! See some comments below.
>>
>
> <snip>
>
>>> diff --git a/package/reactcpp/reactcpp.mk b/package/reactcpp/reactcpp.mk
>>> new file mode 100644
>>> index 0000000..e198c3d
>>> --- /dev/null
>>> +++ b/package/reactcpp/reactcpp.mk
>>> @@ -0,0 +1,34 @@
>>> +################################################################################
>>>
>>> +#
>>> +# reactcpp
>>> +#
>>> +################################################################################
>>>
>>> +
>>> +REACTCPP_VERSION_MAJOR = 1.0
>>> +REACTCPP_VERSION_RAW = $(REACTCPP_VERSION_MAJOR).3
>>> +REACTCPP_VERSION = v$(REACTCPP_VERSION_RAW)
>>
>> Just define the version as v$(REACTCPP_VERSION_MAJOR).3
>>
>>> +REACTCPP_SITE = $(call
>>> github,CopernicaMarketingSoftware,REACT-CPP,$(REACTCPP_VERSION))
>>> +REACTCPP_LICENSE = Apache-2.0
>>> +REACTCPP_LICENSE_FILES = LICENSE
>>> +REACTCPP_DEPENDENCIES = c-ares libev
>>> +REACTCPP_INSTALL_STAGING = YES
>>> +
>>> +define REACTCPP_BUILD_CMDS
>>> +    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
>>
>> Please pass $(TARGET_MAKE_ENV) in the environment.
>
> Should I simply add $(TARGET_MAKE_ENV) before $(MAKE)?
>
> Can you explain a little when I should use $(TARGET_MAKE_ENV), when
> $(TARGET_CONFIGURE_OPTS) and when both? In Buildroot manual examples
> they never exist together. And what I see in package/Makefile.in
> $(TARGET_CONFIGURE_OPTS) contains $(TARGET_MAKE_ENV).
>

Propably you missed my question above.

Regards,
Marcin

>>
>>> +endef
>>> +
>>> +define REACTCPP_INSTALL_STAGING_CMDS
>>> +    $(MAKE) $(TARGET_CONFIGURE_OPTS) PREFIX=$(STAGING_DIR)/usr -C
>>> $(@D) install
>>
>> Ditto.
>>
>>> +endef
>>> +
>>> +REACTCPP_SO = libreactcpp.so.$(REACTCPP_VERSION_RAW)
>>> +
>>> +ifeq ($(BR2_STATIC_LIBS),)
>>> +define REACTCPP_INSTALL_TARGET_CMDS
>>> +    $(INSTALL) -D -m 0755 $(@D)/src/$(REACTCPP_SO)
>>> $(TARGET_DIR)/usr/lib/$(REACTCPP_SO)
>>> +    ln -sf $(REACTCPP_SO)
>>> $(TARGET_DIR)/usr/lib/libreactcpp.so.$(REACTCPP_VERSION_MAJOR)
>>> +    ln -sf $(REACTCPP_SO) $(TARGET_DIR)/usr/lib/libreactcpp.so
>>> +endef
>>> +endif
>>
>> Why are you doing this instead of calling "make install" for
>> $(TARGET_DIR) ?
>>
>> Thanks,
>>
>> Thomas
>>
>

-- 
Marcin Niestroj
