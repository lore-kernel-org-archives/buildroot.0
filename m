From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 15 Oct 2014 14:08:20 +0200
Subject: [Buildroot] [PATCH 1/1 v3] ubus: new package
In-Reply-To: <543E62F2.3010608@gmail.com>
References: <1413280007-16819-1-git-send-email-swexru@gmail.com>
 <CAHXCMMKOZ16ePJpq-pvzRTht1RsuTmqpMXSuLTgO7WamP9-GAQ@mail.gmail.com>
 <543E62F2.3010608@gmail.com>
Message-ID: <CAHXCMMKPCx2=Pmp42RHSb+3CqsPkDXdg_xNbQWwKdqRJfvAgyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexey,

On Wed, Oct 15, 2014 at 2:05 PM, Alexey Mednyy <swexru@gmail.com> wrote:
> Thank you for reviews!
>
> On 10/14/2014 11:22 PM, Samuel Martin wrote:
>>> ++
>>> + ADD_EXECUTABLE(cli cli.c)
>>> + SET_TARGET_PROPERTIES(cli PROPERTIES OUTPUT_NAME ubus)
>>> +-TARGET_LINK_LIBRARIES(cli ubus ubox blobmsg_json ${json})
>>> ++TARGET_LINK_LIBRARIES(cli ubus ubox blobmsg_json)
>> I didn't check in the previous review, but blobmsg_json is provided by
>> another project, so either it is a required dependency that should be
>> integrated in Buildroot too, or this is an optional dependency and you
>> should disable it (something similar to what you've done for json-c,
>> but always forcing its option to OFF in the _CONF_OPTS).
>>
> No, blobmsg_json provided by libubox which already in Buildroot.

Ok, my bad, i didn't look at libubox.

>>> ++IF(JSONC_FOUND)
>>> ++  TARGET_LINK_LIBRARIES(cli ${JSONC_LIBRARIES})
>>> ++ENDIF()
>> Same here (no if/endif lines). So, ${JSONC_LIBRARIES} can go back with
>> the others libs (in the first targte_link_library call.
>>
>>> +
>>> + ADD_SUBDIRECTORY(lua)
>>> + ADD_SUBDIRECTORY(examples)
>> Also, while checking the upstream project, I noticed that:
>> - "-Werror" is added to the cflags.
>>   Please remove it, otherwise it may/will fail in a number of build
>> configuration.
>>   Usually, -Werror is good during the development but bad/PITA for integration.
>> - BUILD_EXAMPLES is ON by default, consider disabling it or add an
>> option driving it.
>>
>>> diff --git a/package/ubus/ubus.mk b/package/ubus/ubus.mk
>>> new file mode 100644
>>> index 0000000..652ab48
>>> --- /dev/null
>>> +++ b/package/ubus/ubus.mk
>>> @@ -0,0 +1,28 @@
>>> +################################################################################
>>> +#
>>> +# UBUS
>>> +#
>>> +################################################################################
>>> +
>>> +UBUS_VERSION = 4c4f35cf2230d70b9ddd87638ca911e8a563f2f3
>>> +UBUS_SITE = git://nbd.name/luci2/ubus.git
>>> +UBUS_LICENSE = LGPLv2.1
>>> +UBUS_DEPENDENCIES = json-c libubox
>>> +
>>> +ifeq ($(BR2_USE_MMU)$(BR2_PACKAGE_LUA_5_1),yy)
>> Why BR2_USE_MMU?
> Not sure, just took it from libubox.mk which is mandatory dependency.. I
> think I must disable it. There is no such requirement.

Then the dependency should be put in the Config.in, not in the *.mk
file (check how it's done for other packages, there are plenty of them
depending on !BR2_USE_MMU)

Regards,

>
> --
> _________________________________
> Best regards, Mednyy Alexey.
>



-- 
Samuel
