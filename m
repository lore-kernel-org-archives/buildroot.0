From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 20 Oct 2018 13:26:47 +0100
Subject: [Buildroot] [PATCH 4/4] webkitgtk: explicitly set
 USE_GSTREAMER_GL build option
In-Reply-To: <20181019202544.GC941@momiji>
References: <20181009220852.4309-1-aperez@igalia.com>
 <20181009220852.4309-5-aperez@igalia.com> <20181010212630.7f47270e@windsurf>
 <20181010202425.GN2869@scaer> <40fb0474-283f-4b73-78e6-45ea99a1bb65@mind.be>
 <87in281h7o.fsf@dell.be.48ers.dk> <20181011192343.GA31509@scaer>
 <b93c6915-8190-c39a-9251-d2530d8e136d@mind.be> <20181019202544.GC941@momiji>
Message-ID: <ff71e37a-8bb8-9ed7-084f-a26f28790af5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/10/2018 19:25, Adrian Perez de Castro wrote:
> Hi everybody,
> 
> I have some comments more about this topic, please read below...
> 
> On Thu, 11 Oct 2018 23:56:36 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>> On 11/10/18 21:23, Yann E. MORIN wrote:
>>> Peter, Arnout, All,
>>>
>>> On 2018-10-11 20:16 +0200, Peter Korsgaard spake thusly:
>>>>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>>>>  >  'imply' is syntactic sugar for 'default y if ...'. The *only* thing it changes
>>>>  > is the place where you put the imply. (To be exact, it is the same as 'default
>>>>  > ...' because it propagates the m/y/n state to the default, not just y/n. But
>>>>  > since we don't use m, it doesn't matter.)
>>>>
>>>>  >  For this specific case, it is pretty obvious that putting a 'default y if
>>>>  > BR2_PACKAGE_WEBKITGTK_MULTIMEDIA' on BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
>>>
>>> As the submitter said "in general it is preferred due to better
>>> performance", why don't we just have, in webkitgtk:
>>>
>>>     select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL if BR2_PACKAGE_GST1_PLUGINS_BAD
>>>
>>> Or even further:
>>>
>>>     select BR2_PACKAGE_GST1_PLUGINS_BAD
>>>     select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
>>>
>>> Of course, that requires propagating the required dependencies...
>>> But since webkitgtk already depends on libgtk3, which itself depends on
>>> LIBEGL_WAYLAND or LIBGL, we're not too far off...
>>
>>  For this specific case, that's a very good idea indeed. Something like (to be
>> tested!):
> 
> While something like this would probably work, there can be cases in which
> GStreamer-GL cannot be built (for example when there is no windowing system
> supported by GStreamer-GL), but WebKitGTK+ may still build and work fine with
> GL support enabled and GStreamer-GL support disabled. The GL code in WebKit
> has a few different methods used at runtime as fall-back to create the GL
> context [1].  On the other hand GStreamer-GL has a few more requirements on
> the GL implementation than WebKit for building [2] ? so I do see value in
> allowing to build without GStreamer-GL ?\_(?)_/? 
> 
>> config BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
>>         bool "multimedia support"
>>         select BR2_PACKAGE_GSTREAMER1
>>         select BR2_PACKAGE_GST1_PLUGINS_BAD
>>         select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL if
>> BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
>>         ...
>>
>>  Ideally we would also select the plugins that make sure HAS_LIB_OPENGL becomes
>> true, but unfortunately that's really complicated. Selecting
>> BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL would help, but that has the
>> disadvantage that it might not actually make the GL plugin available (depending
>> on the state of X11/wayland/...
> 
> I am a bit reluctant of doing this, due to the complications in making sure
> that ?BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL? gets selected for all
> configuration where it's supported, and the also complicated alternative of
> using ?BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL?.
> 
> There's one more issue, though: I can't remember right now the precise case
> (driver, GPU, GStreamer versions, etc), but some work mates from Igalia found
> a couple of cases where using GStreamer-GL in WebKit results in garbled and/or
> tinted video output, so it can actually be handy if we allow to manually
> disable using it. So I'm leaning towards:
> 
>   if BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
> 
>   config BR2_PACKAGE_WEBKITGTK_USE_GSTREAMER_GL
>       bool "use gstreamer-gl"

 Sounds good to me.

> 	  default y
> 	  depends on BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL

 But here, I'd prefer to have

	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL

to make it slightly easier for the user to do the right thing.


 Regards,
 Arnout

> 
>   comment "using gstreamer-gl needs gst1-plugins-bad with the gl element enabled"
>       depends on !BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
> 
>   endif
> 
> WDYT?
> 
>>>>  > would be crazy. On the other hand, adding the imply in webkitgtk looks nice,
>>>>  > concise and clear.
>>>
>>> Sorry, I am still not convinced that using 'imply' in Buildroot is a
>>> good idea overall... :-(
>>>
>>>> Exactly, which is why I suggested it to Adrian.
>>
>>  Apparently our BDFL disagrees :-)
> 
> I guess we will stay away from using ?imply? for now :)
> 
> Best regards,
> 
> 
> -Adri?n
> 
> 
> ---
> [1] In some cases it can even be enough that the driver supports Pbuffer
>     contexts which with many drivers do not even require any windowing
> 	system running.
> [2] Now that it's going to be Halloween, I could tell you some horror stories
>     about how we have managed to run WebKit on some GL/EGL ?frankendriver?
> 	implementations :D
> 
