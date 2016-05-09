From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 May 2016 01:16:33 +0200
Subject: [Buildroot] [PATCH] supertuxkart: new package
In-Reply-To: <CAAEAJfBO034-Nonhz=2u4=akxD1ZY4Hx5yRgXfV2+CbprK9+9g@mail.gmail.com>
References: <1460439224-29314-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <570D80C2.70508@mind.be>
 <CAAEAJfBO034-Nonhz=2u4=akxD1ZY4Hx5yRgXfV2+CbprK9+9g@mail.gmail.com>
Message-ID: <9cf89fcf-1d3a-6255-06ae-8b700a5d6fd1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/08/16 19:33, Ezequiel Garcia wrote:
> Arnout,
>
> Thanks a lot for your feedback, and sorry for the delay.
> I did this during vacations... and then vacations was over :/
>
> On 12 April 2016 at 20:12, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 04/12/16 07:33, Ezequiel Garcia wrote:
[snip]
>>> +       select BR2_PACKAGE_BLUEZ5_UTILS
>>
>>
>>  Needs:
>>
>>         depends on BR2_USE_WCHAR # libglib2
>
> Don't see the libglib2 dependency. Where is it?

  bluez5_utils selects libglib2 and dbus. I should have written:

	depends on BR2_USE_WCHAR # bluez5_utils <- libglib2

but I just copied the lines from bluez5_utils...

>
> Is it because of fribidi? In that case, should we really depend on it?
>
>>         depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
>
> Ditto: dbus?
>
>>         depends on !BR2_STATIC_LIBS # uses dlfcn
>>         depends on !BR2_PACKAGE_BLUEZ_UTILS # conflicts with 4.x version
>>         depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
>
> Why 3.4 ?

  All inherited from bluez5_utils.

>
>>         # wordexp support not in our uClibc configuration
>
> wordexp?
>
>>         depends on !BR2_TOOLCHAIN_USES_UCLIBC
>>         depends on BR2_TOOLCHAIN_HAS_SYNC_4
>>
>>  (though wchar and threads are already covered by Xorg)
>>
>>  Unless of course it can also work with bluez4. In that case the
>> dependencies get pretty complicated...
>>
>>> +       select BR2_PACKAGE_JPEG
>>> +       select BR2_PACKAGE_LIBCURL
>>> +       select BR2_PACKAGE_LIBFRIBIDI
>>> +       select BR2_PACKAGE_LIBGLU
>>> +       select BR2_PACKAGE_LIBOGG
>>> +       select BR2_PACKAGE_LIBPNG
>>> +       select BR2_PACKAGE_LIBVORBIS
>>> +       select BR2_PACKAGE_OPENAL
>>
>>
>>  Needs:
>>
>>         depends on BR2_INSTALL_LIBSTDCPP
>>         depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>>         depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS

  Same story here: these lines should have a '# openal' after them.

>>
>>> +       select BR2_PACKAGE_XLIB_LIBXRANDR
>>> +       select BR2_PACKAGE_ZLIB
>>> +       help
>>> +         Karts. Nitro. Action! SuperTuxKart is a free 3D arcade kart
>>> +         racer with multiple karts, tracks and modes you can play.
>>> +         Beat the evil Nolok by any means necessary, and make the
>>> +         mascot kingdom safe once again!
>>> +
>>> +         http://supertuxkart.sourceforge.net/Main_Page
>>> +
>>> +comment "supertuxkart needs a toolchain w/ threads, C++"
>>> +       depends on !(BR2_INSTALL_LIBSTDCPP || BR2_TOOLCHAIN_HAS_THREADS)
>>
>>
>>  This needs to be updated with all the dependencies above.
>>
[snip]
>>> --- /dev/null
>>> +++ b/package/supertuxkart/supertuxkart.mk
>>> @@ -0,0 +1,24 @@
>>>
>>> +################################################################################
>>> +#
>>> +# supertuxkart
>>> +#
>>>
>>> +################################################################################
>>> +
>>> +SUPERTUXKART_VERSION = 0.9.1
>>> +SUPERTUXKART_SOURCE = supertuxkart-$(SUPERTUXKART_VERSION)-src.tar.xz
>>> +SUPERTUXKART_SITE =
>>> http://downloads.sourceforge.net/project/supertuxkart/SuperTuxKart/$(SUPERTUXKART_VERSION)
>>> +SUPERTUXKART_LICENSE = GPLv3
>>> +SUPERTUXKART_LICENSE_FILES = COPYING
>>> +
>>> +SUPERTUXKART_DEPENDENCIES += bluez5_utils jpeg libcurl libfribidi libgl
>>> libglu libpng \
>>> +                            libogg libvorbis openal xlib_libXrandr zlib
>>
>>
>>  From the CMakeLists, it looks like fribidi and Xrandr are optional
>> (controlled by USE_FRIBIDI and USE_XRANDR).
>>
>
> OK.
>
>>  I don't see why libglu is needed.
>>
>
> I don't know much about glu, I just saw this stuff:
>
> $ grep -r glu .
> ./lib/glew/include/GL/glew.h:/* <glu.h> */
> ./lib/glew/include/GL/glew.h:#    include <OpenGL/glu.h>
> ./lib/glew/include/GL/glew.h:#    include <GL/glu.h>
> ./lib/glew/CMakeFiles/glew.dir/C.includecache:OpenGL/glu.h
> ./lib/glew/CMakeFiles/glew.dir/C.includecache:GL/glu.h

  OK.

> [..]
> ./INSTALL.md:libgl1-mesa-dev libglu1-mesa-dev libcurl4-openssl-dev
> libfribidi-dev libbluetooth-dev libxrandr-dev
>
>>  I also see a dependency on freetype.
>>
>
> Where?

  I should have written: an _optional_ dependency on freetype. CMakeLists.txt 
contains find_package(Freetype)

>
>>
>>> +
>>> +# Since supertuxkart is not installing libstkirrlicht.so,
>>> +# and given we don't really need that library to be shared
>>> +# we turn off shared libs here.
>>> +SUPERTUXKART_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF
>>> +
>>> +# Disable Wiimote support
>>
>>
>>  Why?
>>
>
> No reason.
>
>>  Actually, it looks like bluez is only needed for wiimote support, so you
>> could probably enable this conditionally depending on
>> BR2_PACKAGE_BLUEZ5_UTILS and avoid the complicated dependencies in
>> Config.in.
>>
>
> OK.
>
>>
>>> +SUPERTUXKART_CONF_OPTS += -DUSE_WIIUSE=OFF
>>> +
>>> +$(eval $(cmake-package))
>>>
>>
>>  It looks like irrlicht adds -I/usr/X11R6/include - this will have to be
>> patched away.
>>
>
> Hm, I see.
>
>>  It would also be nice if CMakeLists could be updated to use the system glew
>> instead of the bundled one.
>>
>
> Why? If the package bundles a glew, why not using it?

  We avoid bundled libraries for several reasons:

- size: if libglew is selected for another reason, we will have it twice;

- security: if a (security) bug is fixed in libglew and supertuxkart doesn't 
update their libglew, it remains unfixed.

- build consistency: if we need to patch libglew to make it build e.g. for some 
arch or libc, we have to produce the same patch again for supertuxkart.

See e.g. [1] for extensive explanation why bundling is bad.


  However, it's possible that supertuxkart has made project-specific 
modifications to libglew, in this case unbundling is difficult. I see that at 
least it is an older version than what we have.


  Regards,
  Arnout

[1] https://fedoraproject.org/wiki/Bundled_Libraries?rd=Packaging:Bundled_Libraries




-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
