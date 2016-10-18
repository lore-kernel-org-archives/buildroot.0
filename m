From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Oct 2016 21:53:10 +0200
Subject: [Buildroot] [PATCH 1/2] X11/odroidc2-driver: New Package.
In-Reply-To: <trinity-1310d2bf-8c3b-45fa-991f-bdfe4076c3af-1476777721158@3capp-mailcom-bs14>
References: <20161013174124.9639-1-daggs@gmx.com>
 <9fe82330-7c8d-0f31-e777-db4e5014cf5f@mind.be>
 <trinity-122b1f64-5a75-4714-b1e0-471c25487584-1476738693195@3capp-mailcom-bs01>
 <5c997397-22ef-70f1-9a92-c1b7466de872@mind.be>
 <trinity-1310d2bf-8c3b-45fa-991f-bdfe4076c3af-1476777721158@3capp-mailcom-bs14>
Message-ID: <33ce6fd6-016f-6654-ed86-e7098025cd3d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-10-16 10:02, daggs wrote:
> Greetings Arnout,
> 
>> On 17-10-16 23:11, daggs wrote:
>>

>> [snip]
>>>>> +XDRIVER_XF86_VIDEO_ODROIDC2_LICENSE_FILES = README.txt 
>>>>> +XDRIVER_XF86_VIDEO_ODROIDC2_DEPENDENCIES = \
>>>>> +	odroid-mali \
>>>>> +	xproto_fontsproto \
>>>>> +	xproto_xproto \
>>>>
>>>>  You also select dri2proto, is that not needed? But actually, I don't see any
>>>> inclusion of either of these three proto packages, only of xserver stuff (and a
>>>> few that I can't place, like ump.h)
>>> ump.h is part of the x11 egl pkg.
>>> I've added the above deps based on compilation errors I've got.
>>
>>  I suspect that it actually comes from the headers of odroid-mali. If that is
>> the case, it would be better to put the dependency in odroid-mali itself
>> (conditional on using the X11 version, of course).
> I don't understand one thing, the existence of dri2proto does affects odroid-mali, why should I depend odroid-mali dri2proto it when there is no logic to do so?

 I'm sorry but I couldn't parse your sentence. So I'll just re-explain.

 I suspect that xproto_fontsproto and xproto_xproto are not included by the
video driver itself, but are included by odroid-mali headers. So I checked and
indeed, the odroid-mali headers include X11/Xlib.h and X11/Xutil.h. So, in
odroid-mali.mk you should add something like

ifeq ($(BR2_PACKAGE_ODROID_MALI_X11),y)
# The X11 version of the headers include X11/Xlib.h and X11/Xutil.h
ODROID_MALI_DEPENDENCIES += xlib_libX11
endif

and in Config.in:
	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_ODROID_MALI_X11


 For the video driver, the required packages seem to be:

xserver_xorg-server (for damage.h, dri2.h, exa.h, micmap.h, ...)
libdrm (for xf86drm.h)

 But I haven't actually tried building it so I'm not sure.



 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
