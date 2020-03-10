From: Howard Mitchell <hm@hmbedded.co.uk>
Date: Tue, 10 Mar 2020 10:16:43 +0000
Subject: [Buildroot] [PATCH 2/2] package/mesa3d: get glxgears working
 for v3d/vc4 minimal builds
In-Reply-To: <20200309214644.21e5204f@gmx.net>
References: <20200306092504.30340-1-hm@hmbedded.co.uk>
 <20200306092504.30340-2-hm@hmbedded.co.uk> <20200306153854.06a840c3@gmx.net>
 <b49a5bc6-c01a-1a5a-6674-4939759d8edd@hmbedded.co.uk>
 <20200306192710.0bbc4b68@gmx.net>
 <d74401e8-d9c1-a6e4-a07d-47362f89bc7c@hmbedded.co.uk>
 <20200309214644.21e5204f@gmx.net>
Message-ID: <f0973012-efbd-2459-9fad-066a7771cca0@hmbedded.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On 09/03/2020 20:46, Peter Seiderer wrote:
> Hello Howard,
>
> On Mon, 9 Mar 2020 19:52:12 +0000, Howard Mitchell<hm@hmbedded.co.uk>  wrote:
>
>> Hello Peter,
>>
>> On 06/03/2020 18:27, Peter Seiderer wrote:
>>> Hello Howard,
>>>
>>> On Fri, 6 Mar 2020 17:22:28 +0000, Howard Mitchell<hm@hmbedded.co.uk>  wrote:
>>>
>>>> Hello Peter,
>>>>
>>>> On 06/03/2020 14:38, Peter Seiderer wrote:
>>>>> Hello Howard,
>>>>>
>>>>> On Fri,  6 Mar 2020 09:25:04 +0000, Howard Mitchell<hm@hmbedded.co.uk>  wrote:
>>>>>
>>>>>> Currently a minimal build for rpi2/3/4 (i.e. only v3d and/or vc4
>>>>>> selected, no dri drivers selected) results in working X11 except that
>>>>>> glxgears shows a blank window. This commit effectively results in the
>>>>>> following conf options being added: -Dglx-direct=true -Ddri3=true
>>>>>>
>>>>>> Signed-off-by: Howard Mitchell<hm@hmbedded.co.uk>
>>>>>> ---
>>>>>>     package/mesa3d/Config.in | 1 +
>>>>>>     1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
>>>>>> index 3950170533..59b8f60773 100644
>>>>>> --- a/package/mesa3d/Config.in
>>>>>> +++ b/package/mesa3d/Config.in
>>>>>> @@ -274,6 +274,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
>>>>>>     	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
>>>>>>     	select BR2_PACKAGE_LIBDRM_VC4
>>>>>>     	select BR2_PACKAGE_MESA3D_OPENGL_EGL
>>>>>> +	select BR2_PACKAGE_MESA3D_DRI_DRIVER
>>>>> On rpi4 v3d/vc4 work definitely for the Qt/eglfs case without
>>>>> MESA3D_DRI_DRIVER, so this should at minimum depend on X11 (or
>>>>> only be selected by x11/glxgears)?
>>>> In fact the '-Ddri3=true' option is already dependent on X11 (in mesa3d.mk)
>>>> so only '-Dglx-direct=true' would be left without X. Do you think that is
>>>> likelyto break Qt/eglfs?
>>> Its not so much about breaking the Qt/eglfs case, but about being minimal and
>>> not enabling un-needed/-wanted options...
>>>
>>> Your list of options above is not very precise when looking
>>> at package/mesa3d/mesa3d.mk (missing -Dshared-glapi=true -Ddri-drivers=,
>>> and -Ddri3=true/false dependent on BR2_PACKAGE_XLIB_LIBXSHMFENCE)...
>> The options I specified are the difference between before and after
>> applying the
>> patch. I used 'make printvars VARS=MESA3D_CONF_OPTS' to verify. Looking at
>> mesa3d.mk, -Dshared_glapi=true is already included because
>> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER=y and is therefore repeated.
>> -Ddri-drivers=
>> is an empty list with or without the patch. So as I stated before only
>> -Dglx-direct=true is additional if you're building without X11. When
>> building
>> with X11 then additionally -Ddri3 changes from false to true when the
>> patch is
>> applied.
> But not dependent on X11 but dependent on BR2_PACKAGE_MESA3D_DRI_DRIVER=y/BR2_PACKAGE_XLIB_LIBXSHMFENCE=y?
>
> I still state that forcing BR2_PACKAGE_MESA3D_DRI_DRIVER=y to gain -Ddri=true
> (or toggle between true/false via random other dependencies) to satisfy glxgears needs
> feels like the wrong approach...

Maybe, but as I'm building for an OpenGL platform I'd expect glxgears to 
work correctly.
The fact that it didn't suggested that mesa3d was incorrectly 
configured. Without my patch
to get a 'minimal' build in which glxgears works you need to select one 
of the dri drivers.
Any one will do. You then get, for example:
-Dglx-direct=true -Ddri3=true -Ddri-drivers=swrast as additional/changed 
options. So all
my patch effectively does is reduce -Ddri-drivers to an empty list.
