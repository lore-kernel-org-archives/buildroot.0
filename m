From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 23 Nov 2016 00:12:05 +0100
Subject: [Buildroot] [v3,
	2/2] package/efl: add Evas GL DRM Engine support
In-Reply-To: <61cdc8ed-e5a0-e295-c625-eb2619a0244e@gmail.com>
References: <1479668387-6549-1-git-send-email-devpfl@gmail.com>
 <1479668387-6549-3-git-send-email-devpfl@gmail.com>
 <c6c7cec2-76ea-f9b9-69ca-e1586d94e85b@gmail.com>
 <86f19677-dc1b-a546-c79d-ad5f08faf559@gmail.com>
 <61cdc8ed-e5a0-e295-c625-eb2619a0244e@gmail.com>
Message-ID: <9c412166-78b7-401a-2275-9836afaddde6@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Pierre,

Le 21/11/2016 ? 00:29, pierre a ?crit :
> Hi Romain,
> 
> 
> On 11/20/2016 10:49 PM, Romain Naour wrote:
>> Hi Pierre,
>>
>> Le 20/11/2016 ? 20:30, Romain Naour a ?crit :
>>> Hi Pierre,
>>>
>>> Le 20/11/2016 ? 19:59, pierre floury a ?crit :
>>>> From: Romain Naour <romain.naour@gmail.com>
>>>>
>>>> This support is required for Enlightenment wayland support [1].
>>>>
>>>> As stated in configure, Evas GL DRM Engine needs OpenGL ES with EGL and
>>>> wayland (wayland-client >= 1.8.0)
>>    ^^^^^^^
>> :)
>>
>>>>
>>>> [1] https://www.enlightenment.org/about-wayland
>>>>
>>>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>>>> Signed-off-by: Pierre Floury <devpfl@gmail.com>
>>>>
>>>> ---
>>>> v2: rename the option to BR2_PAKCAGE_EFL_GLES_DRM (ThomasP)
>>>>     fix the help text (ThomasP)
>>>> ---
>>>> v3: rebase v2 on top of master
>>>>     Signed-off-by: Pierre Floury <devpfl@gmail.com>
>>>
>>> As suggested by Thomas [1], enable gl-drm only if all dependencies are available
>>> without using another Kconfig symbol (BR2_PAKCAGE_EFL_GLES_DRM)
>>>
>>> This series is ok for me :)
>>
>> Humm, I missed something in my initial patch... the Evas GL DRM doesn't build
>> without Wayland package.
>>
>> From config.log:
>> configure:42726: checking whether to enable OpenGL Drm rendering backend
>> configure:42728: result: yes
>> configure:42747: $PKG_CONFIG --exists --print-errors "egl ${gl_library} libdrm
>> gbm wayland-client >= 1.11.0"
>> Package wayland-client was not found in the pkg-config search path.
>> Perhaps you should add the directory containing `wayland-client.pc'
>> to the PKG_CONFIG_PATH environment variable
>> Package 'wayland-client', required by 'world', not found
>> configure:42750: $? = 1
>> configure:42875: error: OpenGL Drm dependencies not found
>>
>> In a previous local version I added a dependency to wayland to elput support but
>> I finally dropped it in the final patch submission. I forgot to add it for the
>> GL DRM support.
> 
> you are right, I miss the wayland-client dependency..
> But, I do not get why this is requested.. efl are running well without wayland,
> just with drm..

wayland-client dependency was added to enable EGL wayland extensions to Evas_GL
as far I understand: see https://phab.enlightenment.org/D1507

> 
> I've got an other error :
> 
> arm-linux-gnueabihf/bin/ld: cannot find -lGL
> this is due to
> configure.ac:2624:evas_engine_gl_common_libs="-lGL"
> 
> on my side, I replace "-lGL" with "" in configure.ac :

Humm, weird. can you share your defconfig ?
I'm testing gl-drm with either X11 or Wayland support enabled. I'll test it
without them.

> 
> --- a/configure.ac
> +++ b/configure.ac
> @@ -2621,7 +2621,7 @@ evas_engine_gl_common_cflags=""
>  if test "x${have_egl}" = "xyes"; then
>     evas_engine_gl_common_libs="-lEGL"
>  else
> -   evas_engine_gl_common_libs="-lGL"
> +   evas_engine_gl_common_libs=""
>  fi
> 
> and regenerate configure.
> 
> What would be the best solution to fix that ? just add a patch on the configure
> file ? or patch theses 3 files :

If a patch modify configure.ac or a m4 file, you need to regenerate the
configure script by setting EFL_AUTORECONF = YES. Also you need to regenerate
the gettext files with EFL_GETTEXTIZE = YES.

If you look at the efl package git history, I did that for the efl 1.15.3.

> 
> configure               | 26 +++++++++++++-------------configure.ac       |  2 +-
> m4/evas_check_engine.m4 | 12 ++++++------
> 
>>
>> I guess we should re-add BR2_PAKCAGE_EFL_GLES_DRM to define the wayland,
>> efl-drm, opengl-es dependencies otherwise gl-drm would be enabled by:
>>
>> ifeq
>> ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_EFL_OPENGLES)$(BR2_PACKAGE_EFL_DRM),yyy)
>> EFL_CONF_OPTS += --enable-gl-drm
>> else
>> EFL_CONF_OPTS += --disable-gl-drm
>> endif
>>
>> which is not really nice.
>>
>> I prefer:
>>
>> efl.mk:
>> ifeq ($(BR2_PAKCAGE_EFL_GLES_DRM),y)
>> EFL_CONF_OPTS += --enable-gl-drm
>> else
>> EFL_CONF_OPTS += --disable-gl-drm
>> endif
>>
>> Config.in:
>> config BR2_PAKCAGE_EFL_GLES_DRM
>>     bool "Evas GLES DRM Engine"
>>     depends on BR2_PACKAGE_EFL_DRM
>>     depends on BR2_PACKAGE_EFL_OPENGLES # OpenGL ES with EGL support only
>>     depends on BR2_PACKAGE_WAYLAND
>>     help
>>       This option enable building support for the Evas DRM OpenGL ES
>>       based engine.
>>
>> comment "Evas GL DRM Engine needs Evas DRM Engine, OpenGL ES w/ EGL, Wayland"
>>     depends on BR2_PACKAGE_EFL_DRM && !BR2_PACKAGE_EFL_OPENGLES &&
>> !BR2_PACKAGE_WAYLAND
>>
>>
>> Thoughts ?
> 
> yes, for me it makes sens to explicitly separate 'gl_drm' and 'drm' engines, as
> efl do it on the report of configure :
> Ecore_Evas......: yes (+extn +ews -fb +drm +gl-drm -psl1ght -opengl-cocoa
> -software-sdl -opengl-sdl -wayland-shm -wayland-egl -software-gdi
> -software-ddraw -software-x11 -opengl-x11)

Yes, it was my first intention.

Best regards,
Romain

> 
> 
>>
>> Best regards,
>> Romain
>>
>>>
>>> Best regards,
>>> Romain
>>>
>>> [1] http://lists.busybox.net/pipermail/buildroot/2016-September/172422.html
>>>> ---
>>>>  package/efl/efl.mk | 6 ++++++
>>>>  1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/package/efl/efl.mk b/package/efl/efl.mk
>>>> index d6b2bf5..fdeea47 100644
>>>> --- a/package/efl/efl.mk
>>>> +++ b/package/efl/efl.mk
>>>> @@ -199,6 +199,12 @@ else
>>>>  EFL_CONF_OPTS += --disable-drm
>>>>  endif
>>>>
>>>> +ifeq ($(BR2_PACKAGE_EFL_OPENGLES)$(BR2_PACKAGE_EFL_DRM),yy)
>>>> +EFL_CONF_OPTS += --enable-gl-drm
>>>> +else
>>>> +EFL_CONF_OPTS += --disable-gl-drm
>>>> +endif
>>>> +
>>>>  EFL_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBXKBCOMMON),libxkbcommon)
>>>>
>>>>  # Loaders that need external dependencies needs to be --enable-XXX=yes
>>>>
>>>
>>
> 
> 
> Cheers,
> 
> Pierre
