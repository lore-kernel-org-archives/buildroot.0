From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 18 Jul 2015 20:57:35 +0200
Subject: [Buildroot] [PATCH V4] sdl2: new package
In-Reply-To: <559A71C7.6080804@oliseo.fr>
References: <20150629222241.GF3669@free.fr>
 <1435824981-6312-1-git-send-email-guillaume.gardet@oliseo.fr>
 <559975AD.9030004@openwide.fr> <559A71C7.6080804@oliseo.fr>
Message-ID: <55AAA19F.60905@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guillaume,

Le 06/07/2015 14:17, Guillaume GARDET - Olis?o a ?crit :
> Hi,
> 
> Le 05/07/2015 20:21, Romain Naour a ?crit :
>> Hi Guillaume,
>>
>> Le 02/07/2015 10:16, Guillaume GARDET a ?crit :
>>> Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
>>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>> Cc: Romain Naour <romain.naour@openwide.fr>
>>> Cc: Yann E. Morin <yann.morin.1998@free.fr>
>>>
>>> ---
>>>
>>> Changes in V4:
>>> * Fix comments places in Config.in
>>>
>>> Changes in V3:
>>> * Add dependenies comments for DirectFB and X11 options
>>> * Fix license filename
>>> * Add explicit enable/disable options for libudev
>>> * Fix typo: s/succesful/successful/
>>> * Add more X11 dependencies: x11-xcursor, x11-xinerama, x11-xinput,
>>> x11-scrnsaver
>>> * Disbale opengl/opengles video diver explicitly
>>> * Use --disable-rpath option option instead of manual fix
>>>
>>> Changes in V2:
>>> * Fix SDL2 case: s/SDL2/sdl2/
>>> * Add dependency on toolchain with dynamic library
>>> * Remove unneeded 'SDL2' in sub-options names
>>> * Remove unneeded space after comma in if statement
>>> * Add explicit enable/disable options for tslib and alsa
>>> * Remove Mesa3D optional part
>>> * Move unconditionnal SDL2_CONF_OPTS upper
>>> * Remove host build
>>>
>>>
>>>   package/Config.in      |  1 +
>>>   package/sdl2/Config.in | 32 ++++++++++++++++++++++++
>>>   package/sdl2/sdl2.mk   | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++
>>>   3 files changed, 101 insertions(+)
>>>   create mode 100644 package/sdl2/Config.in
>>>   create mode 100644 package/sdl2/sdl2.mk
>>>
>> [snip]
>>
>>> +SDL2_DEPENDENCIES += \
>>> +    xlib_libX11 xlib_libXext \
>>> +    $(if $(BR2_PACKAGE_XLIB_LIBXRENDER),xlib_libXrender) \
>>> +    $(if $(BR2_PACKAGE_XLIB_LIBXRANDR),xlib_libXrandr) \
>>> +    $(if $(BR2_PACKAGE_XLIB_LIBXCURSOR,xlib_libXcursor) \
>>> +    $(if $(BR2_PACKAGE_XLIB_LIBXINERAMA,xlib_libXinerama) \
>>> +    $(if $(BR2_PACKAGE_XPROTO_INPUTPROTO,xproto_inputproto) \
>>> +    $(if $(BR2_PACKAGE_XPROTO_SCRNSAVERPROTO,xproto_scrnsaverproto)
>> There are missing ',' and ')' here.
> 
> Ok for ')', it is clearly a typo, but why do you want to add an extra comma? It
> is not the case for other packages.

Ok, my mistake.

> 
>>
>> This part should look like:
>>
>> SDL2_DEPENDENCIES += \
>>     xlib_libX11 xlib_libXext \
>>     $(if $(BR2_PACKAGE_XLIB_LIBXRENDER),xlib_libXrender,) \
>>     $(if $(BR2_PACKAGE_XLIB_LIBXRANDR),xlib_libXrandr,) \
>>     $(if $(BR2_PACKAGE_XLIB_LIBXCURSOR),xlib_libXcursor,) \
>>     $(if $(BR2_PACKAGE_XLIB_LIBXINERAMA),xlib_libXinerama,) \
>>     $(if $(BR2_PACKAGE_XPROTO_INPUTPROTO),xproto_inputproto,) \
>>     $(if $(BR2_PACKAGE_XPROTO_SCRNSAVERPROTO),xproto_scrnsaverproto,)

Actually it's not correct ether...

We prefer also add autotools --enable-*/--disable-* options to explicitly
enable/disable the optional package.

Something like:
ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
SDL2_DEPENDENCIES += xlib_libXcursor
SDL2_CONF_OPTS += --enable-video-x11-xcursor
else
SDL2_CONF_OPTS += --disable-video-x11-xcursor
endif

>>
>> sdl2 is seems complicated package, I think it would be easier to review if you
>> add it progressively by using a patch series:
>>
>> PATCH1: sdl2 new package (all mandatory dependencies enabled)
>> PATCH2: sdl2 add X11 support
>> PATCH3: sdl2 add directfb support
> 
> No, I won't. It is extra work for nothing. I think it is not so complicated to
> review only 2 files to add a new package.

This is not only review two files, the review process is also to check the
package build system to avoid build failures. Especially, when a package depends
on X11 or OpenGL (from my point of view).

Until now, I had no time to review deeply the sdl2 package. Even during the
hackaton this week.

So, I reviewed your package today and checked for missing package/toolchains
dependencies, and made several changes:

    [Romain:
      - Wrap Config.in help text at 72 columns.
      - Move sdl2 package after sdl modules in Config.in. (Arnout)
      - Explicitly disable dbus and wayland.
      - Remove double underscore (SDL2__*).
      - Unify autotools options to use --enable/--disable.
      - Use x-includes and x-libraries to avoid path poisoning.
      - Remove xlib_libXrender, xproto_inputproto and xproto_scrnsaverproto
        dependencies since the build system doesn't depend on them.
      - Add Xlib_libXi, xlib_libScrnSaver and xlib_libXxf86vm dependencies.
      - Handle autotools options (--enable/--disable) for each X11
        dependencies.]

I'll send an updated version, care to take a look and review please ?

 Splitting packages for u-boot or Linux
> kernel make sense most of the time, but, here, clearly no.
> Buildroot maintainers/reviewers should send their comments from the 1st version,
> not 1 guy comments on V1, someone else on V2 etc., again the first guy for V3 on
> another part of the patch which was not commented the 1st time.
> 
> I contribute to lots of open source / free software and contributing to
> Buildroot is really painful compared to other projects. So please, all send your
> comments at the same time.

I have nothing to say to complete Thomas's and Arnout's answers.
Feel free to come to the Buildroot Developer Days and see how patches are
discussed and reviewed:

http://elinux.org/Buildroot:DeveloperDaysELCE2015

> For SDL2, please send your comments this week, and I will send a V5 next week
> fixing the remaining bits and if it does not fit to another guy again, I will
> stop sending patches to Buildroot.
> Now, I understand better why some people are maintaining a buildroot fork
> instead of upstreaming their patches. So, please improve your patch
> submission/review process.

Yes, upstreaming is difficult but the final result is really better.
See changes that have been made to your c-icap and c-icap-modules packages.

Best regards,
Romain

> 
> 
> Guillaume
> 
> 
>> ...
>>
>> I'll review your patch latter new week end.
>>
>> Best regards,
>> Romain
>>
>>
> 
