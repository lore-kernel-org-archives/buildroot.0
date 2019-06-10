From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Jun 2019 14:37:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-bad:
 add wpe plugin option
In-Reply-To: <CADvTj4ocW=w=hFRHNuTTu7PJYxrRp8D0WBYHuGKp8FWY_NAUqw@mail.gmail.com>
References: <20190605055125.38900-1-james.hilliard1@gmail.com>
 <0a023992-228e-28a7-2f13-3348de8293cd@mind.be>
 <CADvTj4ocW=w=hFRHNuTTu7PJYxrRp8D0WBYHuGKp8FWY_NAUqw@mail.gmail.com>
Message-ID: <64ba770d-1118-1054-c275-b14c151ae760@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/06/2019 23:59, James Hilliard wrote:
> On Sat, Jun 8, 2019 at 2:54 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 05/06/2019 07:51, James Hilliard wrote:
[snip]
>>> +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WPE
>>> +     bool "wpe"
>>> +     default y
>>> +     depends on BR2_PACKAGE_WPEWEBKIT
>>
>>  We normally select packages instead of depending on them. Yes, that implies
>> copying all its dependencies.
>>
>>  If there is a good reason to use a depends instead of select, please explain it
>> in the commit message.
> I basically just copied this:
> https://github.com/buildroot/buildroot/blob/280149ce60774aab6a75e3f257185b0d6d2b144e/package/gstreamer1/gst1-plugins-bad/Config.in#L403

 That's different. An OpenGL provider is not something that can be select'ed,
because there are several providers possible and there's no way to know
automatically which one it should be. So the

	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL

part is definitely correct.

 However, I was talking about the wpewebkit dependency. It is certainly possible
to select wpewebkit rather than depend on it. But then you do need to copy all
the dependencies, like this:

config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WPE
	bool "wpe"
	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS # wpewebkit
	depends on !BR2_BINFMT_FLAT # wpewebkit -> icu
	depends on !BR2_STATIC_LIBS # wpewebkit -> wayland
	depends on BR2_INSTALL_LIBSTDCPP # wpewebkit -> harfbuzz, icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wpewebkit -> wayland, icu, libsoup
	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # wpewebkit
	depends on BR2_HOST_GCC_AT_LEAST_4_8 # wpewebkit -> icu
	depends on BR2_USE_WCHAR # wpewebkit -> icu, libsoup
	depends on BR2_PACKAGE_HAS_LIBGLES # wpewebkit -> libepoxy
	depends on BR2_PACKAGE_HAS_LIBEGL # wpewebkit -> libepoxy
	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # wpewebkit -> wpebackend-fdo
	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
	select BR2_PACKAGE_WPEWEBKIT
 	help
	  ...

comment "wpe plugin needs a toolchain w/ C++, wchar, threads, dynamic library,
gcc >= 6, host gcc >= 4.8"
	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
	depends on !BR2_BINFMT_FLAT
	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_6 || !BR2_HOST_GCC_AT_LEAST_4_8

comment "wpe plugin needs an OpenGL ES w/ EGL-capable Wayland backend"
	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
	depends on !BR2_BINFMT_FLAT
	depends on !BR2_PACKAGE_HAS_LIBGLES || !BR2_PACKAGE_HAS_LIBEGL \
		|| !BR2_PACKAGE_HAS_LIBEGL_WAYLAND


>>  Also, just to be clear: there is no dependency on
>> BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA or BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL ?
> Not from what I could tell, at least there didn't appear to be in the
> autoconf script here:
> https://github.com/GStreamer/gst-plugins-bad/blob/1.16/configure.ac#L2301
> Those all appear to be BR2_PACKAGE_WPEWEBKIT dependencies.
> The configure script however doesn't check for gl headers even though
> they are required for wpe,
> hence the need to add BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL as a
> buildroot dependency to ensure the build doesn't fail when wpewebkit
> and gst1-plugins-bad
> are enabled without opengl.

 See, that's where I'm confused. Even if
BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL is enabled, it is still possible
that BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA and BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL
are disabled. Does it still work in that case? I tested that it builds, but does
it actually work at runtime too?



 However, it turns out that I accidentally pushed my test branch two days ago,
so it has already been applied to master. I thought about reverting it, but
there haven't been any build failures, and my local tests did build fine.

 About the 'depends on' instead of 'select', we do have something like that for
a couple of other "big" plugins (e.g. directfb), and it does make the code a
whole lot simpler. So let's keep it like it is now.

 The only thing I'd still like you to do is to check if the following
configuration works correctly at runtime:

BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WPE=y
# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL is not set
# BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND is not set
BR2_PACKAGE_WPEWEBKIT=y
# BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA is not set

 If this doesn't work at runtime, we may need to add

	select BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
	select BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL

 Regards,
 Arnout
