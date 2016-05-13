From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 13 May 2016 12:59:33 -0300
Subject: [Buildroot] [PATCH] supertuxkart: new package
In-Reply-To: <570D80C2.70508@mind.be>
References: <1460439224-29314-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <570D80C2.70508@mind.be>
Message-ID: <CAAEAJfCngwsoK4sDoX2hSvq0CGgiorWN+J0SfB8AKBtTpaTctQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On 12 April 2016 at 20:12, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 04/12/16 07:33, Ezequiel Garcia wrote:
>>
>> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>> ---
>>   package/Config.in                      |  1 +
>>   package/supertuxkart/Config.in         | 29
>> +++++++++++++++++++++++++++++
>>   package/supertuxkart/supertuxkart.hash |  2 ++
>>   package/supertuxkart/supertuxkart.mk   | 24 ++++++++++++++++++++++++
>>   4 files changed, 56 insertions(+)
>>   create mode 100644 package/supertuxkart/Config.in
>>   create mode 100644 package/supertuxkart/supertuxkart.hash
>>   create mode 100644 package/supertuxkart/supertuxkart.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 64822bf5f6fa..8438bca33195 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -232,6 +232,7 @@ menu "Games"
>>         source "package/prboom/Config.in"
>>         source "package/rubix/Config.in"
>>         source "package/sl/Config.in"
>> +       source "package/supertuxkart/Config.in"
>>   endmenu
>>
>>   menu "Graphic libraries and applications (graphic/text)"
>> diff --git a/package/supertuxkart/Config.in
>> b/package/supertuxkart/Config.in
>> new file mode 100644
>> index 000000000000..4e9f5bb09ac6
>> --- /dev/null
>> +++ b/package/supertuxkart/Config.in
>> @@ -0,0 +1,29 @@
>> +config BR2_PACKAGE_SUPERTUXKART
>> +       bool "supertuxkart"
>> +       depends on BR2_USE_MMU # fork()
>> +       depends on BR2_PACKAGE_HAS_LIBGL
>> +       depends on BR2_PACKAGE_XORG7
>> +       select BR2_PACKAGE_BLUEZ5_UTILS
>
>
>  Needs:
>
>         depends on BR2_USE_WCHAR # libglib2
>         depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
>         depends on !BR2_STATIC_LIBS # uses dlfcn
>         depends on !BR2_PACKAGE_BLUEZ_UTILS # conflicts with 4.x version
>         depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
>         # wordexp support not in our uClibc configuration
>         depends on !BR2_TOOLCHAIN_USES_UCLIBC
>         depends on BR2_TOOLCHAIN_HAS_SYNC_4
>
>  (though wchar and threads are already covered by Xorg)
>
>  Unless of course it can also work with bluez4. In that case the
> dependencies get pretty complicated...
>
>> +       select BR2_PACKAGE_JPEG
>> +       select BR2_PACKAGE_LIBCURL
>> +       select BR2_PACKAGE_LIBFRIBIDI
>> +       select BR2_PACKAGE_LIBGLU
>> +       select BR2_PACKAGE_LIBOGG
>> +       select BR2_PACKAGE_LIBPNG
>> +       select BR2_PACKAGE_LIBVORBIS
>> +       select BR2_PACKAGE_OPENAL
>
>
>  Needs:
>
>         depends on BR2_INSTALL_LIBSTDCPP
>         depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>         depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
>
>> +       select BR2_PACKAGE_XLIB_LIBXRANDR
>> +       select BR2_PACKAGE_ZLIB
>> +       help
>> +         Karts. Nitro. Action! SuperTuxKart is a free 3D arcade kart
>> +         racer with multiple karts, tracks and modes you can play.
>> +         Beat the evil Nolok by any means necessary, and make the
>> +         mascot kingdom safe once again!
>> +
>> +         http://supertuxkart.sourceforge.net/Main_Page
>> +
>> +comment "supertuxkart needs a toolchain w/ threads, C++"
>> +       depends on !(BR2_INSTALL_LIBSTDCPP || BR2_TOOLCHAIN_HAS_THREADS)
>
>
>  This needs to be updated with all the dependencies above.
>
>
>> +
>> +comment "supertuxkart needs an OpenGL backend"
>> +       depends on !BR2_PACKAGE_HAS_LIBGL
>> diff --git a/package/supertuxkart/supertuxkart.hash
>> b/package/supertuxkart/supertuxkart.hash
>> new file mode 100644
>> index 000000000000..d8e7ac30f6d1
>> --- /dev/null
>> +++ b/package/supertuxkart/supertuxkart.hash
>> @@ -0,0 +1,2 @@
>> +# Locally computed
>> +sha256 c50f00a71df165fb613d20e86bea2d9d5e51ed3e27e1d436fbac3b07cf2ea149
>> supertuxkart-0.9.1-src.tar.xz
>> diff --git a/package/supertuxkart/supertuxkart.mk
>> b/package/supertuxkart/supertuxkart.mk
>> new file mode 100644
>> index 000000000000..e1c67b4e14f4
>> --- /dev/null
>> +++ b/package/supertuxkart/supertuxkart.mk
>> @@ -0,0 +1,24 @@
>>
>> +################################################################################
>> +#
>> +# supertuxkart
>> +#
>>
>> +################################################################################
>> +
>> +SUPERTUXKART_VERSION = 0.9.1
>> +SUPERTUXKART_SOURCE = supertuxkart-$(SUPERTUXKART_VERSION)-src.tar.xz
>> +SUPERTUXKART_SITE =
>> http://downloads.sourceforge.net/project/supertuxkart/SuperTuxKart/$(SUPERTUXKART_VERSION)
>> +SUPERTUXKART_LICENSE = GPLv3
>> +SUPERTUXKART_LICENSE_FILES = COPYING
>> +
>> +SUPERTUXKART_DEPENDENCIES += bluez5_utils jpeg libcurl libfribidi libgl
>> libglu libpng \
>> +                            libogg libvorbis openal xlib_libXrandr zlib
>
>
>  From the CMakeLists, it looks like fribidi and Xrandr are optional
> (controlled by USE_FRIBIDI and USE_XRANDR).
>

I made fribidi optional, but kept libXrandr. The reason for keeping it, is that
it requires either libXrandr, or libXxf86vm.

    if(USE_XRANDR)
        find_package(Xrandr REQUIRED)
        if(NOT XRANDR_FOUND)
            message(FATAL_ERROR "XRANDR not found.")
        endif()
    else()
        find_library(IRRLICHT_XF86VM_LIBRARY Xxf86vm)
        mark_as_advanced(IRRLICHT_XF86VM_LIBRARY)
    endif()

I figured given it's messy to have a conditional select, and since the default
is libXrandr, I thought we could just stick with it.

>
>  I also see a dependency on freetype.
>

Added as optional dependency.

>
>> +
>> +# Since supertuxkart is not installing libstkirrlicht.so,
>> +# and given we don't really need that library to be shared
>> +# we turn off shared libs here.
>> +SUPERTUXKART_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF
>> +
>> +# Disable Wiimote support
>
>
>  Why?
>
>  Actually, it looks like bluez is only needed for wiimote support, so you
> could probably enable this conditionally depending on
> BR2_PACKAGE_BLUEZ5_UTILS and avoid the complicated dependencies in
> Config.in.
>

Right, so I made bluez5_utils optional and simplified the above dependencies.

>
>> +SUPERTUXKART_CONF_OPTS += -DUSE_WIIUSE=OFF
>> +
>> +$(eval $(cmake-package))
>>
>
>  It looks like irrlicht adds -I/usr/X11R6/include - this will have to be
> patched away.
>

Hm.. yes, it can go away. I have no idea if this is supposed to go upstream
or not.
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
