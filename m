From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 26 Oct 2015 22:53:26 +0100
Subject: [Buildroot] [PATCH v5 04/36] package/efl/libefl: new package
In-Reply-To: <20151025135513.GA11692@free.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-5-git-send-email-romain.naour@openwide.fr>
 <20151025135513.GA11692@free.fr>
Message-ID: <562EA0D6.1000308@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

Le 25/10/2015 14:55, Yann E. MORIN a ?crit :
> Romain, All,
> 
> On 2015-10-24 23:00 +0200, Romain Naour spake thusly:
>> Add the libefl package which contains an updated version of the following
>> libraries:
>> libecore, libedje, libeet, libfreet, libeina, libeio, libembryo, libthumb
>> and libevas. It also contains eldbus, ephysics, and escape, see [1].
>>
>> For now, the bump to efl 1.15.x is not complete.
>> This allows to build at least a default configuration whithout X11 support
>> or graphics acceleration.
>> This support will be added by a follow up patches in the series.
>>
>> Also, add BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG config option in order to
>> select all recommended packages that allows to build efl-core whithout the
>> extra-long --enable-i-really-know-what-i-am-doing...
>>
>> At the end of the configure script, the summary tab will show that
>> alsa support is allways disabled even if alsa-utils has been build
>> before efl-core package.
>>
>> "Ecore_Audio.....: yes (-alsa +pulseaudio +sndfile)"
>> This is intentional.
>>
>> An initial runtime test has been done under Qemu with a glibc x86 toolchain.
>>
>> An additional runtime test has been done with a uClibc-ng 1.0.5 toolchain
>> patched with [2] in order to add mkstemps() which is used by Eina library.
>> This patch has been upstreamed in uClubc-ng 1.0.6 release.
>>
>> Another test has been done with a musl toolchain by Vicente Bergas (Thanks!)
>>
>> Add a dependency on threads support since clearly efl libraries are
>> not even built without thread support [3].
>>
>> [1] See https://phab.enlightenment.org/phame/live/3/post/efl_1_8/
>> [2] http://mailman.uclibc-ng.org/pipermail/devel/2015-August/000432.html
>> [3] https://git.enlightenment.org/core/efl.git/tree/configure.ac#n5032
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> Cc: Vicente Bergas <vicencb@gmail.com>
>> ---
>> v4: rename to libefl
>>     EFL needs a toolchain with threads support
>> v3: fix same typo again
>>     Add a note about multisense support
>> v2: remove glibc only dependency
>>     update commit log accordingly
>>     fix typo in Config.in (Vicente Bergas)
>>
>> Vicente, can you test this new series and resend your Tested-By tag ? Thanks !
>> ---
>>  package/efl/Config.in        |  16 +++--
>>  package/efl/libefl/Config.in |  65 +++++++++++++++++
>>  package/efl/libefl/libefl.mk | 161 +++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 237 insertions(+), 5 deletions(-)
>>  create mode 100644 package/efl/libefl/Config.in
>>
>> diff --git a/package/efl/Config.in b/package/efl/Config.in
>> index 7ce5a36..2860cd6 100644
>> --- a/package/efl/Config.in
>> +++ b/package/efl/Config.in
>> @@ -1,8 +1,12 @@
>>  menuconfig BR2_PACKAGE_EFL
>>  	bool "Enlightenment Foundation Libraries"
>> -	depends on BR2_USE_WCHAR
>> -	# libeina uses madvise(). To revisit when bumping EFL to 1.8
>> -	depends on BR2_USE_MMU
>> +	depends on BR2_INSTALL_LIBSTDCPP # libefl
>> +	depends on BR2_PACKAGE_HAS_UDEV # libefl -> libudev
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libefl
>> +	depends on BR2_USE_MMU # libefl
>> +	depends on BR2_USE_WCHAR # libefl
>> +	depends on !BR2_STATIC_LIBS # libefl
>> +	select BR2_PACKAGE_LIBEFL
>>  	help
>>  	  Enlightenment Foundation Libraries
>>  
>> @@ -13,6 +17,7 @@ if BR2_PACKAGE_EFL
>>  source "package/efl/libeina/Config.in"
>>  source "package/efl/libecore/Config.in"
>>  source "package/efl/libeet/Config.in"
>> +source "package/efl/libefl/Config.in"
>>  source "package/efl/libefreet/Config.in"
>>  source "package/efl/libeio/Config.in"
>>  source "package/efl/libevas/Config.in"
>> @@ -24,5 +29,6 @@ source "package/efl/libedbus/Config.in"
>>  
>>  endif # BR2_PACKAGE_EFL
>>  
>> -comment "EFL needs a toolchain w/ wchar"
>> -	depends on !BR2_USE_WCHAR
>> +comment "EFL needs udev /dev management and a toolchain w/ C++, dynamic library, threads, wchar"
>> +	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
> 
> Please, split this very long line...

Ok, but...

> 
>> +	depends on BR2_USE_MMU
>> diff --git a/package/efl/libefl/Config.in b/package/efl/libefl/Config.in
>> new file mode 100644
>> index 0000000..2b758f0
>> --- /dev/null
>> +++ b/package/efl/libefl/Config.in
>> @@ -0,0 +1,65 @@
>> +config BR2_PACKAGE_LIBEFL
>> +	bool "libefl"
>> +	depends on BR2_INSTALL_LIBSTDCPP
>> +	depends on BR2_PACKAGE_HAS_UDEV # libudev
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS # untested without threads
>> +	depends on BR2_USE_MMU
>> +	depends on BR2_USE_WCHAR # use wchar_t
>> +	depends on !BR2_STATIC_LIBS # dlfcn.h
>> +	select BR2_PACKAGE_DBUS
>> +	select BR2_PACKAGE_FREETYPE
>> +	select BR2_PACKAGE_JPEG # Emile needs libjpeg
>> +	select BR2_PACKAGE_LUA # Evas lua 5.1 or 5.2
> 
> You can not select Lua, as it is a provider of the virtual package
> luainterpreter: it is not alowed to select the provider of a virtual
> package, see the manual:
>     http://buildroot.org/downloads/manual/manual.html#_notes_on_depending_on_a_specific_provider
> 
>     If your package really requires a specific provider, then you?ll
>     have to make your package depends on this provider; you can not
>     select a provider.
> 
> You'll have to make libefl (and efl) both depend on BR2_PACKAGE_LUA.
> 
> That's unfortunate, but the manual has explanations on why this is so.

...the comments line start to be very long, should I do something like:

comment "EFL needs Lua, udev /dev management and a toolchain w/ C++, dynamic library, threads, wchar"
	depends on !BR2_PACKAGE_LUA || !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP \
		|| BR2_STATIC_LIBS  || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
	depends on BR2_USE_MMU

> 
>> +	help
>> +	  Enlightenment Foundation Libraries
>> +
>> +	  https://enlightenment.org
>> +
>> +if BR2_PACKAGE_LIBEFL
>> +
>> +config BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG
>> +	bool "Use recommended and tested configurations"
>> +	select BR2_PACKAGE_BULLET
>> +	select BR2_PACKAGE_FONTCONFIG
>> +	select BR2_PACKAGE_GSTREAMER1
>> +	select BR2_PACKAGE_GST1_PLUGINS_BASE
>> +	select BR2_PACKAGE_LIBFRIBIDI
>> +	select BR2_PACKAGE_LIBSNDFILE
>> +	select BR2_PACKAGE_PULSEAUDIO
> 
> You forgot to propagate P.A.'s dependency on BR2_ARCH_HAS_ATOMICS.

OK

> 
>> +	select BR2_PACKAGE_UTIL_LINUX
>> +	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
>> +	default y
>> +	help
>> +	  Avoid to use untested or not recommended configurations,
>> +	  otherwise we need to add a very long and obscure option
>> +	  to start the build.
> 
> No need to explain the nitty-gritty implementation details on why this
> is so. Just state something like:
> 
>     Enable the basic set of recommended features.
> 
>     Without that, the EFL developpers consider the build to be
>     potentially broken and won't provide any support for it.
> 
>     This turns on the following features:
> 
>       - util-linux' libmount: Libmount is used heavily inside Eeze for
>         support of removable devices etc... and disabling this will hurt
>         support for Enlightenment and its filemanager.
> 
>       - fontconfig: If fontconfig is disabled, this is going to make
>         general font searching not work, and only some very direct 'load
>         /path/file.ttf' will work alongside some old-school ttf file
>         path searching. This is very likely not what you want, so highly
>         reconsider turning fontconfig off. Having it off will lead to
>         visual problems like missing text in many UI areas etc...
> 
> And so on, you get the idea. ;-)
> 
> Drop the corresponding comment in the .mk file. It is better to thave
> those comments in the Config.in, so the user can actually see them and
> act accordingly.

Ok, done.

> 
> [--SNIP--]
>> diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
>> index 4dca733..781f397 100644
>> --- a/package/efl/libefl/libefl.mk
>> +++ b/package/efl/libefl/libefl.mk
>> @@ -11,6 +11,167 @@ LIBEFL_SITE = http://download.enlightenment.org/rel/libs/efl
>>  LIBEFL_LICENSE = BSD-2c, LGPLv2.1+, GPLv2+
>>  LIBEFL_LICENSE_FILES = COPYING
>>  
>> +LIBEFL_INSTALL_STAGING = YES
>> +
>> +LIBEFL_DEPENDENCIES = host-pkgconf host-libefl dbus freetype jpeg lua udev zlib
>> +
>> +# Configure options:
>> +# --disable-cxx-bindings: disable C++11 bindings.
>> +# --enable-lua-old: disable Elua and remove luajit dependency.
>> +# --with-x11=none: remove dependency on X.org.
>> +LIBEFL_CONF_OPTS = \
>> +	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
>> +	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
>> +	--disable-cxx-bindings \
>> +	--enable-lua-old \
>> +	--with-x11=none
>> +
>> +# Disable untested configuration warning.
>> +ifeq ($(BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG),)
>> +LIBEFL_CONF_OPTS += --enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-aba
>> +endif
>> +
>> +# Libmount is used heavily inside Eeze for support of removable devices etc.
>> +# and disabling this will hurt support for Enlightenment and its filemanager.
>> +ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
>> +LIBEFL_DEPENDENCIES += util-linux
>> +LIBEFL_CONF_OPTS += --enable-libmount
>> +else
>> +LIBEFL_CONF_OPTS += --disable-libmount
>> +endif
>> +
>> +# If fontconfig is disabled, this is going to make general font
>> +# searching not work, and only some very direct 'load /path/file.ttf'
>> +# will work alongside some old-school ttf file path searching. This
>> +# is very likely not what you want, so highly reconsider turning
>> +# fontconfig off. Having it off will lead to visual problems like
>> +# missing text in many UI areas etc.
>> +ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
>> +LIBEFL_CONF_OPTS += --enable-fontconfig
>> +LIBEFL_DEPENDENCIES += fontconfig
>> +else
>> +LIBEFL_CONF_OPTS += --disable-fontconfig
>> +endif
>> +
>> +# Fribidi is used for handling right-to-left text (like Arabic,
>> +# Hebrew, Farsi, Persian etc.) and is very likely not a feature
>> +# you want to disable unless you know for absolute certain you
>> +# will never encounter and have to display such scripts. Also
>> +# note that we don't test with fribidi disabled so you may also
>> +# trigger code paths with bugs that are never normally used.
>> +ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
>> +LIBEFL_CONF_OPTS += --enable-fribidi
>> +LIBEFL_DEPENDENCIES += libfribidi
>> +else
>> +LIBEFL_CONF_OPTS += --disable-fribidi
>> +endif
>> +
>> +# If Gstreamer 1.x support is disabled, it will heavily limit your media
>> +# support options and render some functionality as useless, leading to
>> +# visible application bugs.
>> +ifeq ($(BR2_PACKAGE_GSTREAMER1)$(BR2_PACKAGE_GST1_PLUGINS_BASE),yy)
>> +LIBEFL_CONF_OPTS += --enable-gstreamer1
>> +LIBEFL_DEPENDENCIES += gstreamer1 gst1-plugins-base
>> +else
>> +LIBEFL_CONF_OPTS += --disable-gstreamer1
>> +endif
>> +
>> +# You have chosen to disable physics support. This disables lots of
>> +# core functionality and is effectively never tested. You are going
>> +# to find features that suddenly don't work and as a result cause
>> +# a series of breakages. This is simply not tested so you are on
>> +# your own in terms of ensuring everything works if you do this
>> +ifeq ($(BR2_PACKAGE_BULLET),y)
>> +LIBEFL_CONF_OPTS += --enable-physics
>> +LIBEFL_DEPENDENCIES += bullet
>> +else
>> +LIBEFL_CONF_OPTS += --disable-physics
>> +endif
>> +
>> +# You disabled audio support in Ecore. This is not tested and may
>> +# Create bugs for you due to it creating untested code paths.
>> +# Reconsider disabling audio.
>> +ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
>> +LIBEFL_CONF_OPTS += --enable-audio
>> +LIBEFL_DEPENDENCIES += libsndfile
>> +else
>> +LIBEFL_CONF_OPTS += --disable-audio
>> +endif
>> +
>> +# The only audio output method supported by Ecore right now is via
>> +# Pulseaudio. You have disabled that and likely have broken a whole
>> +# bunch of things in the process. Reconsider your configure options.
>> +# NOTE: multisense support is automatically enabled with pulseaudio.
>> +ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
>> +LIBEFL_CONF_OPTS += --enable-pulseaudio
>> +LIBEFL_DEPENDENCIES += pulseaudio
>> +else
>> +LIBEFL_CONF_OPTS += --disable-pulseaudio
>> +endif
> 
> As I previously suggested, move all the above comments to the Config.in
> file, to help user make an enlighted (muahahaha!) decision.

Lol :)

> 
>> +# There is no alsa support yet in Ecore_Audio.
>> +# configure will disable alsa support even if alsa-lib is selected.
> 
> So what? Having this comment stand alone is not much use. You should
> probably add "LIBEFL_CONF_OPTS += --disable-alsa", then, no?

I'll add it to LIBEFL_CONF_OPTS at the top of the mk file.

> 
>> +ifeq ($(BR2_PACKAGE_TSLIB),y)
>> +LIBEFL_DEPENDENCIES += tslib
>> +LIBEFL_CONF_OPTS += --enable-tslib
>> +else
>> +LIBEFL_CONF_OPTS += --disable-tslib
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
>> +LIBEFL_DEPENDENCIES += libglib2
>> +# we can also say "always"
> 
> Useless comment, drop it.
ok
> 
>> +LIBEFL_CONF_OPTS += --with-glib=yes
>> +else
>> +LIBEFL_CONF_OPTS += --with-glib=no
>> +endif
>> +
>> +# Prefer openssl (the default) over gnutls.
>> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
>> +LIBEFL_DEPENDENCIES += openssl
>> +LIBEFL_CONF_OPTS += --with-crypto=openssl
>> +else
>> +ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
> 
> use the else ifeq construct rather than nested if-blocks, ...
> 
>> +LIBEFL_DEPENDENCIES += gnutls libgcrypt
>> +LIBEFL_CONF_OPTS += --with-crypto=gnutls \
>> +	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
>> +else
>> +LIBEFL_CONF_OPTS += --with-crypto=none
>> +endif
>> +endif # BR2_PACKAGE_OPENSSL
> 
> .. you'll gain one endif here.

ok

> 
>> +# image loader: handle only loaders that requires dependencies.
>> +# All other loaders are builded by default statically.
>> +ifeq ($(BR2_PACKAGE_LIBEFL_PNG),y)
>> +LIBEFL_CONF_OPTS += --enable-image-loader-png=yes
>> +LIBEFL_DEPENDENCIES += libpng
>> +else
>> +LIBEFL_CONF_OPTS += --enable-image-loader-png=no
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_LIBEFL_JPEG),y)
>> +LIBEFL_CONF_OPTS += --enable-image-loader-jpeg=yes
> 
> Maybe add a comment that the 'jpeg' dependency is already covered as a
> global dependency of libefl. Otherwise, it is strange to not see it here
> (I only remembered it because I previously checked if the dependencies
> of jpeg were prorerly propagated).

ok.

> 
> Regards,
> Yann E. MORIN.
> 
>> +else
>> +LIBEFL_CONF_OPTS += --enable-image-loader-jpeg=no
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_LIBEFL_GIF),y)
>> +LIBEFL_CONF_OPTS += --enable-image-loader-gif=yes
>> +LIBEFL_DEPENDENCIES += giflib
>> +else
>> +LIBEFL_CONF_OPTS += --enable-image-loader-gif=no
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_LIBEFL_TIFF),y)
>> +LIBEFL_CONF_OPTS += --enable-image-loader-tiff=yes
>> +LIBEFL_DEPENDENCIES += tiff
>> +else
>> +LIBEFL_CONF_OPTS += --enable-image-loader-tiff=no
>> +endif
>> +
>> +$(eval $(autotools-package))
>> +
>>  ################################################################################
>>  #
>>  # host-libefl
>> -- 
>> 2.4.3
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
