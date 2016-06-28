From: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
Date: Tue, 28 Jun 2016 21:14:54 +0900
Subject: [Buildroot] qt5wayland: new package
In-Reply-To: <36dee109-2377-f34b-2cc3-160bf0193ce2@stu.hosei.ac.jp>
References: <20160626055917.3371-1-akihiko.odaki.4i@stu.hosei.ac.jp>
 <20160627203819.GB3714@free.fr>
 <36dee109-2377-f34b-2cc3-160bf0193ce2@stu.hosei.ac.jp>
Message-ID: <40b20a03-4fb4-ddbc-731e-07b6b7104bc5@stu.hosei.ac.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Morin, Peter,

On 2016-06-28 15:14, Akihiko Odaki wrote:
>>>  QT5BASE_CONFIGURE_OPTS += $(if
>>> $(BR2_PACKAGE_OPENSSL),-openssl,-no-openssl)
>>>  QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_OPENSSL),openssl)
>>>
>>> diff --git a/package/qt5/qt5wayland/Config.in
>>> b/package/qt5/qt5wayland/Config.in
>>> new file mode 100644
>>> index 0000000..acfff15
>>> --- /dev/null
>>> +++ b/package/qt5/qt5wayland/Config.in
>>> @@ -0,0 +1,16 @@
>>> +config BR2_PACKAGE_QT5WAYLAND
>>> +    bool "qt5wayland"
>>> +    select BR2_PACKAGE_QT5BASE
>>> +    select BR2_PACKAGE_QT5DECLARATIVE
>>> +    select BR2_PACKAGE_QT5JSBACKEND
>>> +    select BR2_PACKAGE_LIBXKBCOMMON
>>> +    select BR2_PACKAGE_XKEYBOARD_CONFIG
>>> +    depends on BR2_PACKAGE_WAYLAND
>>> +    depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
>>
>> First, we prefer depends before select; it's more logical:
>>   - first, what do I require?  --> depends on
>>   - then when all I require is available, what do I need?  --> select
>>
>> Also, as Peter and I replied onyour previous iteration, you probably
>> need to depend on a libegl provider. But libegl is not enough, you also
>> need a wayland-egl provider, for which we currently have only mesa3d as
>> a provider.
>>
>> So, please, could you first add a new virtual package, named
>> libwayland-egl, that can act as a midddle-man between the providers and
>> qt5waylnd?
>>
>>  1- add the libwayland-egl virtual package
>>  2- make mesa3d a p[rovider of it (when the correct options are enabled
>>     in mesa3d)
>>  3- add qt5wayland which depends on libwayland-egl.
>>
>> But as Peter found, qt5wayland has backends for non wayland-egl
>> providers, like the Raspberry Pi. So we'd need ad-hoc dependencies in
>> this case.
>>
>> However, for the specific case of the RPi, the global directions is now
>> to use the VC4 driver in mesa3d and drop specific code in upstream
>> projects. This will take a bit of time before VC4 is up to the job,
>> though, so we'll probably need to carry thos specific ad-hoc
>> dependencies. They can be added in later patches, though; it is not
>> necessary that your submission covers all the cases from the onset.
>>
>> So I would be perfectly fine with a qt5wayland that only supports a
>> libwayland-egl for now.
>>
>> Concerning dependencies, please see Peter's comments on your previous
>> iteration, too.
>
> It doesn't seem to depend on libwayland-egl. Probably you can use
> wayland-generic QPA. So you may pass `-platform wayland-generic` for
> your application or set `wayland-generic` to
> BR2_PACKAGE_QT5BASE_DEFAULT_QPA.
>
> By the way, I found that the package depends on
> BR2_PACKAGE_QT5BASE_OPENGL while investigating the issue. I'll add the
> dependency to BR2_PACKAGE_QT5WAYLAND.

I found that actually it doesn't use EGL if it uses xcomposite-glx for 
the Wayland client. It has multiple client types: brcm-egl, 
drm-egl-server, libhybris-egl-server, wayland-egl, xcomposite-egl, and 
xcomposite-glx. It would be messed if you try to check for all 
dependencies of those clients.

Regards,
Akihiko
