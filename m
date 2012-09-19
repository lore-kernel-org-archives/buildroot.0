From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Wed, 19 Sep 2012 04:35:00 +0300
Subject: [Buildroot] [PATCH 6/9] firefox: Mozilla Web Browser
In-Reply-To: <5057A4D4.60904@mind.be>
References: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
 <1346855344-15081-7-git-send-email-stefan.froberg@petroprogram.com>
 <5057A4D4.60904@mind.be>
Message-ID: <50592144.4050607@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


18.9.2012 1:31, Arnout Vandecappelle kirjoitti:
>
> [snip]
>> diff --git a/package/firefox/Config.in b/package/firefox/Config.in
>> new file mode 100644
>> index 0000000..fbd4749
>> --- /dev/null
>> +++ b/package/firefox/Config.in
>> @@ -0,0 +1,417 @@
>> +config BR2_PACKAGE_FIREFOX
>> +    bool "firefox"
>> +    select BR2_PACKAGE_ALSA_LIB
>> +    select BR2_PACKAGE_CAIRO
>> +    select BR2_PACKAGE_CAIRO_TEE
>> +    select BR2_PACKAGE_FREETYPE
>> +    select BR2_PACKAGE_JPEG
>> +    select BR2_PACKAGE_LIBGTK2
>
>  Without Yann's _AVAILABLE series, you need to explicitly
> depend on the dependencies of libgtk2 (and cairo but
> that's implied):
>
>         depends on BR2_USE_WCHAR # glib2
>         depends on BR2_INSTALL_LIBSTDCPP # pango
>
>  And there should be a comment to warn about it
> if WCHAR and LIBSTDCPP are not available.
>
Uh???? Sorry but what is this new  _AVAILABLE series you mentioned ?

>> +    select BR2_PACKAGE_LIBFFI
>> +    select BR2_PACKAGE_LIBNSS
>> +    select BR2_PACKAGE_LIBNSPR
>> +    select BR2_PACKAGE_LIBPNG
>
>  I thought the internal implementations of these three were used?
>
Yes, at currently nss, nspr and especially libpng (because it needs apng
feature patch) internal versions are used but
mind you that my version of buildroot is little outdated.

So maybe buildroot versions of nss and nspr will now be correctly
detected and linked against with firefox.

At least what I think seeing from the mailing list is that nspr and
nss(?) got some new changes (they were missing .pc files?).
So maybe they work now.

>> +    select BR2_PACKAGE_SQLITE
>> +    select BR2_PACKAGE_SQLITE_ENABLE_FTS3
>> +    select BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY
>> +    select BR2_PACKAGE_SQLITE_SECURE_DELETE
>> +    select BR2_PACKAGE_ZLIB
>> +    depends on BR2_PACKAGE_PYTHON
>
>  Ugh...  Firefox depends on Python?  But in the .mk file it just
> says host-python, so this is probably a mistake...
>
>
My bad. What I meant is that firefox uses host-python (with
--enable-unicodedata) for some parts of the build process.

>  Missing dependencies:
>     depends on BR2_PACKAGE_XSERVER_xorg # mesa3d
>     select BR2_PACKAGE_XLIB_LIBXT
>     select BR2_PACKAGE_MESA3D
>
> (and add xlib_libXt and mesa3d to the _DEPENDENCIES in the .mk file)
>
Ok

>> +    help
>> +      Mozilla Firefox Web Browser
>> +
>> +     
>> http://releases.mozilla.org/pub/mozilla.org/firefox/releases/11.0/source/
>
>  The URL here should not point to the source.  Developer page is more
> appropriate, or perhaps the release notes.
>
Ok

>> +
>> +if BR2_PACKAGE_FIREFOX
>> +
>> +config BR2_PACKAGE_FIREFOX_ENABLE_DEBUG
>> +    bool "Enable debug build and Valgrind integration hooks"
>> +    select BR2_PACKAGE_VALGRIND if BR2_TOOLCHAIN_BUILDROOT&& 
>> BR2_GCC_ENABLE_TLS
>
>  Let me get this clear: if you're using a glibc-based or
> crosstool-NG-generated uclibc toolchain with TLS, valgrind.h
> is not needed?
>
>  In other words: shouldn't this just select valgrind unconditionally?
>
You might be right. I have always used only uclibc-based, buildroot
provided toolchain.
So in other words: I have no clue what will happen in other toolchains

>> +    help
>> +        This enables debug support.
>> +        If you are using buildroot toolchain and your gcc has TLS
>> enable then
>> +        this will also enable Valgrind integration hooks.
>
>  Help text should be indented with 1 tab + 2 spaces and
> word-wrapped at 80 columns (tab counts for 8).
>
>  Same goes for the rest of the help texts.
>
>
>> +
>> +config BR2_PACKAGE_FIREFOX_ENABLE_WEBM
>> +    bool "Enable WebM"
>> +    select BR2_PACKAGE_YASM if BR2_i386 || BR2_x86_64
>> +    help
>> +        WebM is an audio-video format designed to provide
>> royalty-free, open video compression
>> +        for use with HTML5 video. The project's development is
>> sponsored by Google inc.
>> +
>> +        A WebM file consist of VP8 video and Vorbis audio streams,
>> in a container based on
>> +        a profile of Matroska. The project releases WebM related
>> software under a BSD license and
>> +        all users are granted a worldwide, non-exclusive,
>> non-charge, royalty-free patent license.
>> +
>> +        WebM is one way of watching YouTube videos without
>> proprietary Adobe Flash.
>> +        After you have installed WebM enabled Firefox you can try it
>> by visiting the following link:
>> +
>> +        http://www.youtube.com/results?search_query=web&webm=1
>> +
>> +config BR2_PACKAGE_FIREFOX_ULTRA_PARANOID
>> +    bool "Enable Ulta-paranoid settings"
>
>  Do you think this option is useful for many buildroot users?  I
> think most users will let firefox run full-screen at boot time,
> pointing to one and only one site, with no UI for changing URL.
> An option to provide *that* would be useful :-)
>
You mean that WebM ? I think it's kinda cool option. :-)
To watch videos without flash.
But of course, being YouTube only it's usefulness is quite limited now....
>> +    select BR2_PACKAGE_FIREFOX_INSTALL_DEFAULT_EXTENSIONS
>> +    select BR2_PACKAGE_FIREFOX_EXTENSION_NOSCRIPT
>> +    select BR2_PACKAGE_FIREFOX_EXTENSION_ADBLOCK_LITE
>> +    select BR2_PACKAGE_FIREFOX_EXTENSION_GHOSTERY
>> +    select BR2_PACKAGE_FIREFOX_EXTENSION_HTTPS_EVERYWHERE
>> +    help
>> +        This enables my (IMHO) ultra-private custom settings.
>> +        The changed settings appear bold when typing about:config
>> into your browser address bar.
>> +
>> +        Most (but not all!) are documented in
>> +        http://kb.mozillazine.org/Firefox_:_FAQs_:_About:config_Entries
>> +
>> +        For more info of these entries please take a look at
>> package/firefox/prefs.js file.
>> +
>> +        By selecting this option you are also enabling pipelining
>> for your browser.
>> +
>> +        Below is a short summary of settings changed:
>> +       
>> +            network.http.pipelining = true;
>> +            network.http.pipelining.aggressive = true;
>> +            network.http.pipelining.ssl = true;
>> +            network.http.proxy.pipelining = true;
>> +            browser.download.manager.retention = 1;
>> +            browser.formfill.enable = false;
>> +            browser.privatebrowsing.autostart = true;
>> +            dom.disable_window_move_resize = false;
>> +            dom.event.contextmenu.enabled = false;
>> +            geo.enabled = false;
>> +            network.cookie.cookieBehavior = 1;
>> +            network.cookie.lifetimePolicy = 2;
>> +            network.cookie.prefsMigrated = true;
>> +            network.proxy.socks_remote_dns = true;
>> +            network.websocket.enabled = false;
>> +            places.history.enabled = false;
>> +            privacy.clearOnShutdown.offlineApps = true;
>> +            privacy.clearOnShutdown.passwords = true;
>> +            privacy.clearOnShutdown.siteSettings = true;
>> +            privacy.donottrackheader.enabled = true;
>> +            privacy.item.cookies = true;
>> +            privacy.sanitize.sanitizeOnShutdown = true;
>> +
>> +            Note:
>> +            By selecting this option you are also enabling the
>> following privacy/security related
>> +            extensions: NoScript, Adblock Lite, Ghostery&  HTTPS
>> Everywhere
>> +
>> +config BR2_PACKAGE_FIREFOX_INSTALL_DEFAULT_EXTENSIONS
>> +    bool "Enable installing of selected default extensions"
>> +    help
>> +        This option will enable you to select default extensions to
>> +        be installed when building Firefox.
>> +
>> +        Note: The selected extensions are only *installed*.
>> +        They are not *enabled* by default.
>> +        For that you have to manually enable them after starting you
>> +        freshly build Firefox.
>
>  built.
>
>  The logic is reversed here, if you ask me. INSTALL_DEFAULT_EXTENSIONS
> should select the default extensions, but the default extensions
> shouldn't
> depend on it.  Or, if the idea is to make a submenu for the extensions,
> it should be a menuconfig. But since there are only four extensions, I
> don't think it's worth making a menuconfig for that.
>
Yeah, that's what I had in mind. A menu option where user could decide
if he/she
want's any default extensions installed and then it would take him/her
to list
of extensions to install.
>  I propose to just remove the DEFAULT_EXTENSIONS symbol.
>
>> +
>> +config BR2_PACKAGE_FIREFOX_EXTENSION_NOSCRIPT
>> +    bool "Install NoScript extensions"
>> +    depends on BR2_PACKAGE_FIREFOX_INSTALL_DEFAULT_EXTENSIONS
>> +    help
>> +        NoScript for Firefox pre-emptively blocks malicious scripts
>> +        and allows JavaScript, Java, Flash and other potentially
>> dangerous
>> +        content only from sites you trust.
>> +
>> +        NoScript also provides the most anti-XSS and anti-Clickjacking
>> +        protection ever available in a browser
>> +
>> +        http://noscript.net
>> +
>> +config BR2_PACKAGE_FIREFOX_EXTENSION_ADBLOCK_LITE
>> +    bool "Install Adblock Lite extension"
>> +    depends on BR2_PACKAGE_FIREFOX_INSTALL_DEFAULT_EXTENSIONS
>> +    help
>> +        Adblock Lite is a fork of the Adblock Plus version 1.3.10
>> (classic UI)
>> +        extension for blocking advertisements on the web.
>> +        This fork will provide the same features as Adblock Plus 2.x
>> and higher
>> +        while keeping the old UI but without acceptable ads feature.
>> +
>> +        https://bitbucket.org/adstomper/adblocklite
>> +
>> +config BR2_PACKAGE_FIREFOX_EXTENSION_GHOSTERY
>> +    bool "Install Ghostery extension"
>> +    depends on BR2_PACKAGE_FIREFOX_INSTALL_DEFAULT_EXTENSIONS
>> +    help
>> +        Protect your privacy. See who's tracking your web browsing and
>> +        block them with Ghostery.
>> +
>> +        http://www.ghostery.com
>> +
>> +config BR2_PACKAGE_FIREFOX_EXTENSION_HTTPS_EVERYWHERE
>> +    bool "Install HTTPS Everywhere extension"
>> +    depends on BR2_PACKAGE_FIREFOX_INSTALL_DEFAULT_EXTENSIONS
>> +    help
>> +        HTTPS Everywhere is a Firefox and Chrome extension
>> +        that encrypts your communications wit many major
>> +        websites, making your browsing more secure.
>> +
>> +        https://www.eff.org/https-everywhere
>> +
>> +config BR2_PACKAGE_FIREFOX_PLUGIN_GNASH
>> +    source "package/gnash/Config.in"
>
>  The config symbol should be inside the sourced Config.in.  Also,
> I think it should be included from packages/Config.in.
>
You mean that it should be possible to enable building gnash flash
plugin outside of firefox ?

>> +
>> +choice
>> +    default BR2_PACKAGE_FIREFOX_LOCALE_EN_US
>> +    prompt "Select locale"
>
>  Ideally, it should be possible to select several languages.
> But you can leave it as is for the time being - can be added
> later.
>
Ok
> [snip]
>
>> diff --git a/package/firefox/firefox-11.0-NativeWindowHandle.patch
>> b/package/firefox/firefox-11.0-NativeWindowHandle.patch
>> new file mode 100644
>> index 0000000..bced599
>> --- /dev/null
>> +++ b/package/firefox/firefox-11.0-NativeWindowHandle.patch
>
>  This patch misses some explanation + a signed-off-by tag.
> (Same for the other patches.)
>
>  Also, try to upstream the patches if possible.
>

Ok. I try to contact them.

>  Also, patch names are preferably of the format
> firefox-0001-NativeWindowHandle.patch
> (i.e. without the version, and with a numbering scheme to
> clarify the order in which they should be applied).
>
>> @@ -0,0 +1,12 @@
>> +diff -Naur firefox-11.0.org/dom/plugins/ipc/PluginMessageUtils.h
>> firefox-11.0/dom/plugins/ipc/PluginMessageUtils.h
>> +--- firefox-11.0.org/dom/plugins/ipc/PluginMessageUtils.h   
>> 2012-09-04 22:20:07.086923927 +0300
>> ++++ firefox-11.0/dom/plugins/ipc/PluginMessageUtils.h    2012-09-04
>> 22:23:45.195922486 +0300
>> +@@ -131,7 +131,7 @@
>> + typedef HWND NativeWindowHandle;
>> + #elif defined(MOZ_X11)
>> + typedef XID NativeWindowHandle;
>> +-#elif defined(XP_MACOSX) || defined(ANDROID) || defined(MOZ_WIDGET_QT)
>> ++#elif defined(XP_MACOSX) || defined(ANDROID) ||
>> defined(MOZ_WIDGET_QT) || defined(MOZ_DFB)
>> + typedef intptr_t NativeWindowHandle; // never actually used, will
>> always be 0
>> + #else
>> + #error Need NativeWindowHandle for this platform
>> diff --git a/package/firefox/firefox-11.0-execinfo.patch
>> b/package/firefox/firefox-11.0-execinfo.patch
>> new file mode 100644
>> index 0000000..cacd7a1
>> --- /dev/null
>> +++ b/package/firefox/firefox-11.0-execinfo.patch
>> @@ -0,0 +1,45 @@
>> +diff -Naur
>> firefox-11.0.org/ipc/chromium/src/base/debug_util_posix.cc
>> firefox-11.0/ipc/chromium/src/base/debug_util_posix.cc
>> +--- firefox-11.0.org/ipc/chromium/src/base/debug_util_posix.cc   
>> 2012-08-06 15:09:43.325994371 +0300
>> ++++ firefox-11.0/ipc/chromium/src/base/debug_util_posix.cc   
>> 2012-08-06 23:30:33.750226316 +0300
>> +@@ -5,7 +5,7 @@
>> + #include "build/build_config.h"
>> + #include "base/debug_util.h"
>> +
>> +-#define MOZ_HAVE_EXECINFO_H (!defined(ANDROID)&& 
>> !defined(__OpenBSD__))
>> ++#define MOZ_HAVE_EXECINFO_H (!defined(ANDROID)&& 
>> !defined(__OpenBSD__)&&  !defined(__UCLIBC__) )
>> +
>> + #include<errno.h>
>> + #include<fcntl.h>
>
>  uClibc does have backtrace functionality, but only if BACKTRACE is
> configured
> (and it's not in buildroot's default). Make sure that this is
> mentioned in the
> patch description, so it is easier in the future to add support for it
> when
> available.
>
Oh? I didn't know that uClibc has backtrace option.

>  (Note that it's necessary to link with libubacktrace so it probably
> won't work out-of-the-box.)
>
Ah, I see.

> [snip]
>
>> diff --git a/package/firefox/firefox-11.0-isfinite.patch
>> b/package/firefox/firefox-11.0-isfinite.patch
>> new file mode 100644
>> index 0000000..87c024d
>> --- /dev/null
>> +++ b/package/firefox/firefox-11.0-isfinite.patch
>> @@ -0,0 +1,22 @@
>> +diff -Naur firefox-11.0.org/xpcom/ds/nsMathUtils.h
>> firefox-11.0/xpcom/ds/nsMathUtils.h
>> +--- firefox-11.0.org/xpcom/ds/nsMathUtils.h    2012-08-06
>> 15:09:49.059994026 +0300
>> ++++ firefox-11.0/xpcom/ds/nsMathUtils.h    2012-08-06
>> 23:32:57.771217662 +0300
>> +@@ -42,6 +42,9 @@
>> +
>> + #include "nscore.h"
>> + #include<math.h>
>> ++#ifdef    __UCLIBC__
>> ++#include<cmath>
>> ++#endif
>> + #include<float.h>
>> +
>> + #ifdef SOLARIS
>> +@@ -134,6 +137,8 @@
>> +     // Darwin has deprecated |finite| and recommends |isfinite|.
>> The former is
>> +     // not present in the iOS SDK.
>> +     return isfinite(d);
>> ++#elif __UCLIBC__
>> ++    return std::isfinite(d);
>
>  isfinite() is in math.h, so what's the point of getting it from cmath?
>
Yes, I know but for some reason it didn't work out.
So I had to "hack it" out.
I will build it again and check the specific error message.
>> + #else
>> +     return finite(d);
>> + #endif
>> diff --git a/package/firefox/firefox-11.0-uclibc.patch
>> b/package/firefox/firefox-11.0-uclibc.patch
>> new file mode 100644
>> index 0000000..3d1b1a0
>> --- /dev/null
>> +++ b/package/firefox/firefox-11.0-uclibc.patch
>> @@ -0,0 +1,112 @@
>> +diff -Naur firefox-11.0.org/ipc/chromium/src/base/file_util.h
>> firefox-11.0/ipc/chromium/src/base/file_util.h
>> +--- firefox-11.0.org/ipc/chromium/src/base/file_util.h    2012-08-06
>> 15:09:43.333994370 +0300
>> ++++ firefox-11.0/ipc/chromium/src/base/file_util.h    2012-08-06
>> 23:42:29.523183319 +0300
>> +@@ -16,7 +16,9 @@
>> + #include<sys/stat.h>
>> + #elif defined(OS_POSIX)
>> + #include<sys/types.h>
>> ++#ifndef __UCLIBC__
>> + #include<fts.h>
>
>  Again, uClibc does have FTS support (disabled by default in
> buildroot).
>
> [snip]
>
>> +diff -Naur firefox-11.0.org/js/src/ctypes/CTypes.cpp
>> firefox-11.0/js/src/ctypes/CTypes.cpp
>> +--- firefox-11.0.org/js/src/ctypes/CTypes.cpp    2012-08-06
>> 15:09:42.909994396 +0300
>> ++++ firefox-11.0/js/src/ctypes/CTypes.cpp    2012-08-06
>> 23:45:09.691173699 +0300
>> +@@ -473,6 +473,8 @@
>> + static inline bool FloatIsFinite(jsdouble f) {
>> + #ifdef WIN32
>> +   return _finite(f) != 0;
>> ++#elif __UCLIBC__
>> ++  return isinf(f);
>
>  This is unrelated to the rest of the patch - should probably go in
> the isfinite patch.
>
Yes, you are right
>> + #else
>> +   return finite(f);
>> + #endif
>> +diff -Naur firefox-11.0.org/memory/mozalloc/mozalloc.cpp
>> firefox-11.0/memory/mozalloc/mozalloc.cpp
>> +--- firefox-11.0.org/memory/mozalloc/mozalloc.cpp    2012-08-06
>> 15:09:42.968994393 +0300
>> ++++ firefox-11.0/memory/mozalloc/mozalloc.cpp    2012-08-06
>> 23:45:58.800170749 +0300
>> +@@ -259,7 +259,7 @@
>> +
>> + #if defined(XP_MACOSX)
>> +     return malloc_size(ptr);
>> +-#elif defined(MOZ_MEMORY) || defined(XP_LINUX)
>> ++#elif defined(MOZ_MEMORY) || defined(XP_LINUX)&&  !defined(__UCLIBC__)
>> +     // XXX: the |defined(XP_LINUX)| may be too lax;  some Linux
>> installations
>> +     // might use a libc that doesn't have malloc_usable_size. 
>> Let's fix this
>> +     // if/when it happens.
>
>  I would put this in a separate patch from the FTS stuff.
>
>> diff --git a/package/firefox/firefox-11.0-uintptr_t.patch
>> b/package/firefox/firefox-11.0-uintptr_t.patch
>> new file mode 100644
>> index 0000000..559b4c7
>> --- /dev/null
>> +++ b/package/firefox/firefox-11.0-uintptr_t.patch
>> @@ -0,0 +1,12 @@
>> +diff -Naur firefox-11.0.org/gfx/qcms/qcmstypes.h
>> firefox-11.0/gfx/qcms/qcmstypes.h
>> +--- firefox-11.0.org/gfx/qcms/qcmstypes.h    2012-08-06
>> 15:09:44.189994318 +0300
>> ++++ firefox-11.0/gfx/qcms/qcmstypes.h    2012-08-06
>> 23:35:38.339208022 +0300
>> +@@ -27,7 +27,7 @@
>> + #ifdef __OS2__
>> + /* OS/2's stdlib typdefs uintptr_t. So we'll just include that so
>> we don't collide */
>> + #include<stdlib.h>
>> +-#elif !defined(__intptr_t_defined)&&  !defined(_UINTPTR_T_DEFINED)
>> ++#elif !defined(__intptr_t_defined)&& 
>> !defined(_UINTPTR_T_DEFINED)&&  !defined(__UCLIBC__)
>> + typedef PRUptrdiff uintptr_t;
>
>  Is this necessary? stdint.h defines __intptr_t_defined (at least in
> 0.9.32)
>
I have 0.9.33 and still got some problems.
But I will check it again.
>> + #endif
>> + #endif
>> diff --git a/package/firefox/firefox.mk b/package/firefox/firefox.mk
>> new file mode 100644
>> index 0000000..f501636
>> --- /dev/null
>> +++ b/package/firefox/firefox.mk
>> @@ -0,0 +1,240 @@
>> +#############################################################
>> +#
>> +# Mozilla Firefox
>> +#
>> +# Version:     11.0
>> +# Authors:     Stefan Froberg
>> +#
>> +# Builds a very minimal binary with all the optional features
>> +# stripped, except WebM.
>> +#
>> +# With WebM enabled you can watch *some* (but not all!)
>> +# YouTube videos without Adobe Flash player
>> +# http://www.youtube.com/results?search_query=web&webm=1
>> +#
>> +# Because Adobe Flash player plug-in is a glibc binary it
>> +# will obviously not work with uClibc.
>> +# (but maybe with nspluginwrapper ... )
>> +#
>> +# So the only real open source solution for playing flash videos
>> +# with Firefox under uClibc will be gnash + lightspark combo.
>> +# Lightspark handling the newer flash formats while falling back
>> +# to gnash with older versions.
>> +#
>> +# Further, Adobe has recently stopped supporting Linux version of
>> +# their plug-in but Google Chrome PPAPI might some day
>> +# find it's way to firefox and save the day.
>> +# http://www.phoronix.com/scan.php?page=news_item&px=MTEyNzc
>> +#
>> +# Used Linux From Scratch as a starting template for this file
>> +# http://www.linuxfromscratch.org/blfs/view/svb/xsoft/firefox.html
>> +#
>> +# Note: Even tought the libnss and libnspr are marked as dependencies
>> +# here I could not get them to work when building firefox.
>> +# Seems that the configure script needs some patching ...
>> +#
>> +# So for now, untill somebody fixes this, instead of trying to
>> +# use the buildroot system version of these libs the
>> +# internal ones provided by the firefox tarball are used.
>
>  Then remove libnss and libnspr from the dependencies (unless
> they really are dependencies).  Do keep this comment, though.
>
>  Similar for libpng.
>
Ok
>> +#
>> +#############################################################
>> +FIREFOX_VERSION = 11.0
>> +FIREFOX_SOURCE = firefox-$(FIREFOX_VERSION).source.tar.bz2
>> +FIREFOX_SITE =
>> http://releases.mozilla.org/pub/mozilla.org/firefox/releases/$(FIREFOX_VERSION)/source/
>
>  Mozilla only keeps a few recent releases there.  Use
> https://ftp.mozilla.org/...
>
>> +FIREFOX_DEPENDENCIES = host-python alsa-lib cairo freetype jpeg
>> libffi libgtk2 libnss libnspr libpng sqlite zlib
>> +
>> +ifeq ($(BR2_PACKAGE_FIREFOX_ENABLE_DEBUG),y)
>> +FIREFOX_DEPENDENCIES += valgrind
>> +define FIREFOX_ENABLE_DEBUG
>
>  Since it does both enable and disable, it should be called
> SET_DEBUG or something similar.
>
>> +    echo "ac_add_options --enable-debug">>  $(FIREFOX_DIR)/mozconfig
>> +    echo "ac_add_options --enable-debug-symbols">> 
>> $(FIREFOX_DIR)/mozconfig
>> +    echo "ac_add_options --disable-strip">>  $(FIREFOX_DIR)/mozconfig
>> +    echo "ac_add_options --enable-valgrind">>  $(FIREFOX_DIR)/mozconfig
>> +endef
>> +else
>> +define FIREFOX_ENABLE_DEBUG
>> +    echo "ac_add_options --disable-debug">>  $(FIREFOX_DIR)/mozconfig
>> +    echo "ac_add_options --disable-debug-symbols">> 
>> $(FIREFOX_DIR)/mozconfig
>> +    echo "ac_add_options --enable-strip">>  $(FIREFOX_DIR)/mozconfig
>
>  We normally do stripping directly in the target/ directory,
> so unstripped binaries are still available in the build
> directory.  So --disable-strip should be unconditional.  Unless
> there are non-executable files that should be stripped as well
> (only executable files are stripped by buildroot).
>
Actually, at the very end of the installation process there is a long 
list of files
that do not seem like normal executable files and in default (non-debug)
build
firefox strips them.
But I have to check that again.

>> +    echo "ac_add_options --disable-valgrind">> 
>> $(FIREFOX_DIR)/mozconfig
>> +endef
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_FIREFOX_ENABLE_WEBM),y)
>> +# Only x86 needs yasm
>> +ifeq ($(BR2_i386),y) || ($(BR2_x86_64),y)
>> +FIREFOX_DEPENDENCIES += host-yasm
>> +endif
>> +define FIREFOX_ENABLE_WEBM
>> +    echo "ac_add_options --enable-webm">>  $(FIREFOX_DIR)/mozconfig
>> +endef
>> +else
>> +define FIREFOX_ENABLE_WEBM
>> +    echo "ac_add_options --disable-webm">>  $(FIREFOX_DIR)/mozconfig
>> +endef
>> +endif
>> +
>> +#####################################################################
>> +# Some post-install, optional default profile custom settings
>> +# (extensions, secure default settings, language packs, flash etc...)
>> +#####################################################################
>> +
>> +# General Info&  description of some Firefox extensions.
>> +# Too large to put directly here.
>> +include package/firefox/firefox_extensions.mk.in
>> +
>> +# My (IMHO) privacy enhanced about:config settings.
>> +# Before you enable this feature please
>> +# check prefs.js file
>> +#
>> +# Note: This will also install NoScript, Adblock Lite, Ghostery and
>> +# HttpsEverywhere extensions
>
>  This is already explained in the config option's help
> text, so no need to repeat it here.
>
Ok
>> +
>> +ifeq ($(BR2_PACKAGE_FIREFOX_ULTRA_PARANOID),y)
>> +define FIREFOX_ULTRA_PARANOID
>> +    cp -i package/firefox/prefs.js
>> $(TARGET_DIR)/usr/lib/firefox-$(FIREFOX_VERSION)/defaults/profile/
>
>  Use install -D -m 0644.
>
>> +endef
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_FIREFOX_INSTALL_DEFAULT_EXTENSIONS),y)
>> +
>> +# Because this setting will also install the extensions mentioned in
>> +# package/firefox/firefox_extensions.mk.in we will need two
>> +# additional tools: host-unzip and host-xmlstarlet
>> +
>> +FIREFOX_DEPENDENCIES += host-unzip host-xmlstarlet
>
>  Then this should probably move to the extensions.mk, no?
>
Yes, I forgot to move it there
>> +
>> +define FIREFOX_INSTALL_DEFAULT_EXTENSIONS
>> +    $(call FIREFOX_INSTALL_EXTENSION,$(EXTENSION_SOURCE))
>> +endef
>> +endif
>
>  It's very strange to have this line using two macros that are defined
> in a different file...  Move it to the extensions.mk.
>
>> +
>> +# Installing selected langpack (en-US locale does not need any)   
>> +ifneq ($(BR2_FIREFOX_LOCALE_EN_US),y)
>> +
>> +FIREFOX_LOCALE:=$(call qstrip,$(BR2_PACKAGE_FIREFOX_LOCALE))
>> +FIREFOX_LOCALE_SOURCE:=https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/$(FIREFOX_VERSION)/linux-i686/xpi/$(FIREFOX_LOCALE).xpi
>>
>
>  linux-i686? Aren't xpis platform-independent?  Will this work on
> different targets
> (with different endianness)?
>
As far as I know they are platform-independent.

If you wget for example my native language from
https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/$(FIREFOX_VERSION)/linux-i686/xpi/fi.xpi

and then unzip it and check them with file command it will tell that
they are just a bunch of XML and other text files.
>> +
>> +define FIREFOX_INSTALL_LANGPACK
>> +    $(call DOWNLOAD,$(FIREFOX_LOCALE_SOURCE))
>> +    cp $(DL_DIR)/$(FIREFOX_LOCALE).xpi
>> $(TARGET_DIR)/usr/lib/firefox-$(FIREFOX_VERSION)/extensions/langpack-$(FIREFOX_LOCALE)@firefox.mozilla.org.xpi
>
>  Use "install -D -m 0644" instead of cp.
>
>> +    echo
>> "user_pref(\"general.useragent.locale\",\"$(FIREFOX_LOCALE)\");">> 
>> $(TARGET_DIR)/usr/lib/firefox-$(FIREFOX_VERSION)/defaults/profile/prefs.js
>>
>> +endef
>> +endif
>> +
>> +define FIREFOX_CUSTOM_DEFAULT_PROFILE
>> +    mkdir -p
>> $(TARGET_DIR)/usr/lib/firefox-$(FIREFOX_VERSION)/defaults/profile
>> +    $(FIREFOX_ULTRA_PARANOID)
>> +    $(FIREFOX_INSTALL_DEFAULT_EXTENSIONS)
>> +    $(FIREFOX_INSTALL_LANGPACK)
>> +endef
>
>  If ULTRA_PARANOID isn't set but one of the other two is, will this still
> work?  Or should there be a non-paranoid default prefs.js as well?
>
It should work. I tested the following combinations:
- just ultra-paranoid
- ultra-paranoid+extensions
- ultra-paranoid+extensions+langpack
-  just extensions
- just langpack
none of the above

That prefs.js that I provided is only needed if ultra-paranoid is enabled.
Without it the firefox will use built-in defaults, like enabling
Geolocating your browser and where you are surfing and other "nice" things.
>> +
>> +FIREFOX_POST_INSTALL_TARGET_HOOKS += FIREFOX_CUSTOM_DEFAULT_PROFILE
>> +
>> +# Even thought Firefox uses autoconf it's configure process
>> +# is not simple "configure&&  make&&  make install"
>> +# but a lot more messier than that.
>> +
>> +define FIREFOX_CONFIGURE_CMDS
>> +    # Copy the default mozconfig to source directory.
>
>  Comments inside _CMDS blocks aren't very nice, because they're
> interpreted by the shell (and printed on the console). Move the
> comments before the _CMDS block - but most of them are unnecessary,
> the code is self-explanatory.
>
Okay
>> +    cp package/firefox/mozconfig $(@D)
>> +
>> +    # If you want to enable any extra build options like
>> +    # DBus support, libnotify support, etc., then this
>> +    # will be the right place to do it.
>> +
>> +    echo "ac_add_options --build=$(GNU_HOST_NAME)">> 
>> $(FIREFOX_DIR)/mozconfig
>> +    echo "ac_add_options --host=$(GNU_TARGET_NAME)">> 
>> $(FIREFOX_DIR)/mozconfig
>> +
>> +    # Enable parallel building
>> +    echo "mk_add_options MOZ_MAKE_FLAGS=\"-j$(BR2_JLEVEL)\"">> 
>> $(FIREFOX_DIR)/mozconfig
>
>  That doesn't work if JLEVEL=0.  Use $(PARALLEL_JOBS).
>
Ok
>> +
>> +    $(FIREFOX_ENABLE_WEBM)
>> +    $(FIREFOX_ENABLE_DEBUG)
>
>  You could define a FIREFOX_AC_OPTIONS variable, and then do
>
>     for option in $(FIREFOX_AC_OPTIONS); do \
>         echo "ac_add_options $${option}" >> $(FIREFOX_DIR)/mozconfig; \
>     done
>
>  That simplifies the WEBM and DEBUG conditional blocks a bit.  And it
> would
> make it easy to add things like $(DISABLE_IPV6) and
> $(SHARED_STATIC_LIBS_OPTS).
>
>
Sounds good
>> +
>> +    # Create the needed build directory that was defined in
>> mozconfig file
>> +    mkdir -p $(@D)/firefox-build-dir
>
>  To keep things together, it's better to also do
>     echo "mk_add_options MOZ_OBJDIR=@TOPSRCDIR@/firefox-build-dir" >>
> $(FIREFOX_DIR)/mozconfig
> here.
>
>> +endef
>> +
>> +
>> +# Firefox needs SQLite to store it's configurations.
>                                    ^^^^ its
>
>> +# Further the SQLite must be build with SQLITE_SECURE_DELETE,
>> SQLITE_THREADSAFE,
>> +# SQLITE_ENABLE_FTS3 and SLITE_ENABLE_UNLOCK_NOTIFY enabled.
>> +#
>> +# However, even if you *do* have these things enabled the damn
>> configure
>> +# script says that they are not. So I had to force the correct
>> settings.
>> +#
>> +# Even worse, it seems that the script does not respect even
>> +# pkg-config variables (see below) to find the buildroot version of
>> SQLite
>> +# but insist of using *host* SQLite library.
>> +#
>> +# Luckily, in the actual linking time, the correct libraries seem to
>> be used.
>> +
>> +define FIREFOX_BUILD_CMDS
>> +
>> +    # Picked the PKG_ variable suggestions from:
>> +    #
>> http://www.flameeyess.eu/autotools-mythbuster/pkgconfig/cross-compiling
>> +    #
>> +    # With these settings, *most* of the buildroot system libs were
>> found.
>> +    # With the exception of SQLite, NSS and NSPR.
>> +
>> +    # Had to enforce HOST_CC, CC_FOR_BUILD and HOST_CXX because
>> +    # the configure would not get them right.
>
>  Again, move the comments outside (and remove the duplicates).
>
>> +
>> +    (cd $(@D); \
>> +        sed -i 's# ""##' browser/base/Makefile.in&&  \
>
>  Huh?  That merits some comment to explain why it is needed...
> Also it fits better in a POST_PATCH_HOOK than here.
>
Sorry, forgot to mention that sed line just removes unprintable control
characters from the title bar.
>> +        ac_cv_sqlite_secure_delete=yes \
>> +        ac_cv_sqlite_threadsafe=yes \
>> +        ac_cv_sqlite_enable_fts3=yes \
>> +        ac_cv_sqlite_enable_unlock_notify=yes \
>
>  It's nicer to put all these in FIREFOX_CONF_ENV, for
> consistency with $(autotools-package).
>
>> +        HOST_CC=gcc \
>> +        CC_FOR_BUILD=gcc \
>> +        HOST_CXX=g++ \
>
>  These already are in mozconfig, and also in TARGET_CONFIGURE_OPTS.
> Well, except that TARGET_CONFIGURE_OPTS uses the absolute path
> and adds ccache to it.  Or maybe the firefox build has a problem
> with ccache? Then it should use $(HOSTCC_NOCCACHE) instead of plain
> gcc/g++.
>
>> +        PKG_CONFIG_DIR= \
>> +       
>> PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig"
>> \
>> +        PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
>> +        PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)"\
>
>  These shouldn't do anything, because our pkg-config already uses the
> correct paths.  Unless firefox doesn't use our pkg-config,
> which would explain all the problems you have - in that case, firefox
> needs to be patched to use the correct pkg-config.
>
>
All I can say that I had a really hellish time trying to tell firefox
where to find packages with pkg-config.
But I will check this again too and try to clean it a bit like you
suggested.
>> +        $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV)
>> CXXFLAGS="$(TARGET_CXXFLAGS) -fvisibility=hidden
>> -fvisibility-inlines-hidden" LDFLAGS="$(TARGET_LDFLAGS)" $(MAKE) -f
>> client.mk )
>> +
>> +endef
>> +
>> +define FIREFOX_INSTALL_TARGET_CMDS
>> +    # This will create a firefox installation tarball
>> +    (cd $(@D); \
>> +    $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C
>> firefox-build-dir/browser/installer )
>> +
>> +    # Make nice new clean home for our firefox and extract it there
>> +    rm -rf $(TARGET_DIR)/usr/lib/firefox-$(FIREFOX_VERSION)&&  \
>
>  No need to join the lines with && here - newline is good enough.
>
>  $(TARGET_DIR)/usr/lib/firefox-$(FIREFOX_VERSION) is used quite
> a lot, maybe abbreviate it to $(FIREFOX_INSTALL_DIR)
>
>> +    mkdir $(TARGET_DIR)/usr/lib/firefox-$(FIREFOX_VERSION)&&  \
>> +    tar -xvf
>> $(@D)/firefox-build-dir/dist/firefox-$(FIREFOX_VERSION).en-US.linux-*.tar.bz2
>> -C $(TARGET_DIR)/usr/lib/firefox-$(FIREFOX_VERSION) --strip-components=1
>
>  Remove the -v from tar - it's useful while debugging
> but unneeded once it's finished. And it's better to use
> $(TAR) $(TAR_STRIP_COMPONENTS)=1 $(TAR_OPTIONS) -f ... -C ...
>
>> +   
>> +    # Make some symlinks to firefox binary and plugins directory
>> +    (cd $(TARGET_DIR)/usr/bin&&  \
>> +    ln -sfv ../lib/firefox-$(FIREFOX_VERSION)/firefox .&&  \
>
>  Don't cd, but just
>     ln -sf ../lib/firefox-$(FIREFOX_VERSION)/firefox
> $(TARGET_DIR)/usr/bin
>
>  And again, remove -v
>
>> +    mkdir -pv $(TARGET_DIR)/usr/lib/mozilla/plugins&&  \
>
>  No && needed
>
>> +    cd $(TARGET_DIR)/usr/lib/firefox-$(FIREFOX_VERSION)&&  \
>> +    ln -sfv ../mozilla/plugins .&&  \
>
>     ln -sf ../mozilla/plugins $(FIREFOX_INSTALL_DIR)
>
>> +    chown -R -v root:root
>> $(TARGET_DIR)/usr/lib/firefox-$(FIREFOX_VERSION) )
>
>  This is bad. You shouldn't build buildroot as root, but as
> a normal user. At the end, when putting everything together
> in the filesystem, buildroot will chown everything to root
> using fakeroot, so it can be done without actual root access
> on the build machine.
>
>  In short: remove that line.
>
>> +
>> +    # Using strace revealed that for some strange reason the firefox
>> is looking these
>> +    # from /usr/lib and not from /usr/lib/$(FIREFOX_VERSION) like
>> the rest of the files.
>> +    # That's why I had to use symlinks to make it start.
>> +
>> +    (cd $(TARGET_DIR)/usr/lib&&  \
>> +    ln -sfv firefox-$(FIREFOX_VERSION)/libxul.so .&&  \
>> +    ln -sfv firefox-$(FIREFOX_VERSION)/libmozjs.so .&&  \
>> +    ln -sfv firefox-$(FIREFOX_VERSION)/libmozalloc.so . )
>
>     ln -sf firefox-$(FIREFOX_VERSION)/libxul.so $(TARGET_DIR)/usr/lib
>  and no &&.
>
>> +
>> +    # For gnash support
>> +    rm -rf $(STAGING_DIR)/usr/include/npapi
>> +    mkdir -v $(STAGING_DIR)/usr/include/npapi   
>> +    cp -v $(FIREFOX_DIR)/dom/plugins/base/*.h
>> $(STAGING_DIR)/usr/include/npapi
>
>  This should be in INSTALL_STAGING_CMDS, and you should define
> FIREFOX_INSTALL_STAGING = YES
>
>> +
>> +endef
>> +
>> +$(eval $(generic-package))
>> +
>> +
>> +
>> +
>> +
>
>  Get rid of those empty lines at the end of the file.
> I got some whitespace errors when applying the patch series,
> so there are probably some spaces at the end of some lines as
> well.
>
>> diff --git a/package/firefox/firefox_extensions.mk.in
>> b/package/firefox/firefox_extensions.mk.in
>> new file mode 100644
>> index 0000000..8c8fa3d
>> --- /dev/null
>> +++ b/package/firefox/firefox_extensions.mk.in
>> @@ -0,0 +1,168 @@
>> +#############################################################
>> +# Extensions
>> +#
>> +# General Info:
>> +#
>> +# Firefox extensions are nothing more than ordinary zip-files with
>> .xpi file extension.
>> +#
>> +# If you want to add your own default extension(s) to your default
>> firefox profile
>> +# then you basically have to:
>> +# - download the extension file
>> +# - get the extension id from that file with the help of xmlstarlet
>> tool
>> +# - unzip the extension file to
>> /usr/lib/firefox-$(FIREFOX_VERSION/extensions/$(EXTENSION_ID)
>> +#
>> +# For more information of global extension installation look at:
>> +# http://kb.mozillazine.org/Installing_extensions#Global_installation
>> +#
>> +# For information of how to get the extension id (needs unzip and
>> xmlstarlet) look at:
>> +# http://kb.mozillazine.org/Determine_extension_ID
>> +#
>> +# Note that this process will only *install* your extensions to your
>> default firefox profile.
>> +# It will not *enable* them by default.
>> +# You have to do it manually afterwards from Firefox Add-ons menu.
>> +#
>> +# There is an "extensions.enabledAddons" setting in about:config
>> +# but it's no use if you try to set it in pref.js file.
>> +# It seems it's a read-only setting and it will be updated each
>> +# time after you have manually enabled your installed
>> extensions/language packs
>> +# from Add-ons menu.
>> +#
>> +# The messy way to enable your extensions by default with each build
>> would be:
>> +#
>> +# - Start your firefox at least once and then enable all your
>> extensions manually
>> +#
>> +# - Do all the necessary setting you need for your extensions/langpacks
>> +# (like Adblock Lite subscriptions, default language etc..)
>> +#
>> +# - Go to your $HOME/.mozilla/firefox/some_random_chars.default/
>> folder and copy
>> +# at least the files starting with extensions.* (and maybe also
>> addons.*)
>> +# to package/firefox/extensions buildroot folder.
>> +# To make sure, it's generally better to copy *all* files& 
>> directories from
>> +# $HOME/.mozilla/firefox/some_random_chars.default/ folder to
>> +# packge/firefox/extensions
>> +#
>> +# - Add buildroot option that will copy all those saved custom
>> settings from
>> +# package/firefox/extensions folder in
>> FIREFOX_POST_INSTALL_TARGET_HOOKS phase
>> +# (or alternativaly, at the end of the FIREFOX_INSTALL_TARGET_CMDS)
>> +# to $(TARGET_DIR)/usr/lib/firefox-$(FIREFOX_VERSION)/extensions
>> +#
>> +# This seems to be the only way to *enable* extensions by default
>> because
>> +# firefox keep's track of extensions in SQLite database (like
>> extensions.sqlite file)
>> +# and not in easily editable/patchable text files :-(
>
>  IIRC the .sqlite file is machine-specific, so this has to be done on
> the target. May be worth adding that to the comment.
>
Okay
>> +#
>> +# Next comes four privacy/security related extensions.
>> +#
>> +
>> +# Name:        NoScript
>> +# Version:    2.5.3
>> +# Home:        http://noscript.net
>> +# Download URL:   
>> http://releases.mozilla.org/pub/mozilla.org/addons/722/noscript-2.5.3-fx+fn+sm.xpi
>> +# Description:    "NoScript for Firefox pre-emptively blocks
>> malicious scripts
>> +#         and allows JavaScript, Java, Flash and other potentially
>> dangerous
>> +#         content only from sites you trust.
>> +#         NoScript also provides the most anti-XSS and
>> anti-Clickjacking
>> +#        protection ever available in a browser."
>
>  This whole comment is redundant: the description and homepage
> are already in the Config.in help text, the download URL is
> below.  Same goes for the other extensions.
>
>> +
>> +ifeq ($(BR2_PACKAGE_FIREFOX_EXTENSION_NOSCRIPT),y)
>> +EXTENSION_SOURCE+=http://releases.mozilla.org/pub/mozilla.org/addons/722/noscript-2.5.3-fx+fn+sm.xpi
>>
>
>  May be worthwhile to split into
>
> FIREFOX_EXTENSION_NOSCRIPT_VERSION = 2.5.3
> FIREFOX_EXTENSION_NOSCRIPT_SITE    =
> http://releases.mozilla.org/pub/mozilla.org/addons/722
> FIREFOX_EXTENSION_NOSCRIPT_SOURCE  =
> noscript-$(FIREFOX_EXTENSION_NOSCRIPT_VERSION)-fx+fn+sm.xpi
>
> for consistency with other packages.
>
>  Then you can add
>
> FIREFOX_EXTENSION-$(BR2_PACKAGE_FIREFOX_EXTENSION_NOSCRIPT) += NOSCRIPT
>
>  and use my rewrite below
>
> [snip]
>
>> +ifeq ($(BR2_PACKAGE_FIREFOX_INSTALL_DEFAULT_EXTENSIONS),y)
>
>  This condition is redundant AFAICS.
>
>> +
>> +UNZIP=$(HOST_DIR)/usr/bin/unzip
>> +XMLSTARLET=$(HOST_DIR)/usr/bin/xml
>> +
>> +define    FIREFOX_INSTALL_EXTENSION
>> +   
>> +# Do multi-download, get extension id for each downloaded file
>> +# and finally unzip it to
>> +#
>> $(TARGET_DIR)/usr/lib/firefox-$(FIREFOX_VERSION)/extensions/${EXTENSION_ID}
>> +#
>> +# Inner guts copied from package/pkg-download.mk DOWNLOAD_WGET
>> +# Thanks to Yann and Thomas for helping with that $${i##*/} thing!
>> +
>> +    for i in $(EXTENSION_SOURCE);do \
>> +        FILENAME=$${i##*/} ;\
>> +        test -e $(DL_DIR)/$${FILENAME} || \
>> +        $(WGET) -O $(DL_DIR)/$${FILENAME} $${i} || \
>> +        (rm -f $(DL_DIR)/$${FILENAME} ; exit 1) ;\
>> +        EXTENSION_ID=`$(UNZIP) -qc $(DL_DIR)/$${FILENAME}
>> install.rdf | $(XMLSTARLET) sel \
>> +        -N rdf=http://www.w3.org/1999/02/22-rdf-syntax-ns# \
>> +        -N em=http://www.mozilla.org/2004/em-rdf# \
>> +        -t -v \
>> +       
>> "//rdf:Description[@about='urn:mozilla:install-manifest']/em:id"` ;\
>> +        $(UNZIP) -d
>> $(TARGET_DIR)/usr/lib/firefox-$(FIREFOX_VERSION)/extensions/$${EXTENSION_ID}
>> $(DL_DIR)/$${FILENAME};\
>> +    done   
>> +
>> +endef
>> +endif
>
>  Alternative:
>
> # Download and install a firefox extension.
> # The extension is defined by FIREFOX_EXTENSION_FOO_SITE and
> FIREFOX_EXTENSION_FOO_SOURCE
> # Argument 1 is the extension name, FOO.
> define FIREFOX_INSTALL_EXTENSION
>     $(call
> DOWNLOAD,$(FIREFOX_EXTENSION_$(1)_SITE),$(FIREFOX_EXTENSION_$(1)_SOURCE))
>     EXTENSION_ID="$$($(UNZIP) -qc
> $(DL_DIR)/$(FIREFOX_EXTENSION_$(1)_SOURCE) | \
>         $(XMLSTARLET) sel -t \
>             -N rdf=http://www.w3.org/1999/02/22-rdf-syntax-ns# \
>             -N em=http://www.mozilla.org/2004/em-rdf# \
>             -v
> "//rdf:Description[@about='urn:mozilla:install-manifest']/em:id")"; \
>     $(UNZIP) -d $(FIREFOX_INSTALL_DIR)/extensions/$${EXTENSION_ID}
> $(DL_DIR)/$(FIREFOX_EXTENSION_$(1)_SOURCE)
> endef
>
> define FIREFOX_INSTALL_EXTENSIONS
>     $(foreach ext,$(FIREFOX_EXTENSION-y),$(call
> FIREFOX_INSTALL_EXTENSION,$(ext))$(sep))
> endef
>
> FIREFOX_POST_INSTALL_TARGET_HOOKS += FIREFOX_INSTALL_EXTENSIONS
>
>
>  (Untested, of course, and I admit there's a bit of make magickery in
> there.)
>
> [snip]
>> diff --git a/package/firefox/prefs.js b/package/firefox/prefs.js
>> new file mode 100755
>> index 0000000..7cbf675
>> --- /dev/null
>> +++ b/package/firefox/prefs.js
>
>  Since this one is only used with the PARANOID config, perhaps it
> should be called prefs.paranoid.js?
>
No problem
>> @@ -0,0 +1,100 @@
>> +# Mozilla User Preferences
>> +
>> +# Most of the settings below are documented in
>> +# http://kb.mozillazine.org/Firefox_:_FAQs_:_About:config_Entries
>> +#
>> +# Those entries that are not documented (tagged UNDOCUMENTED) are
>> +# the ones I found out when playing with various
>> +# Firefox Privacy settings and then checking afterwards
>> +# from the about:config URL what had changed.
>
>  A bit a general remark: you use the first person ("I") a couple
> of times. OK with me, but remember that your authorship will be
> less evident in the files themselves.  So maybe it's better to
> explicitly mention your name there.
>
>> +
>> +# If you have more information about these entries please update.
>> +
>> +########################
>> +# Performance settings #
>> +########################
>> +
>> +# Enable pipelining
>> +user_pref("network.http.pipelining",true);
>> +user_pref("network.http.pipelining.agressive",true);
>> +user_pref("network.http.pipelining.ssl",true);
>> +user_pref("network.http.proxy.pipelining",true);
>> +
>> +###############################
>> +# Privacy&  Security settings #
>> +###############################
>> +
>> +# When to remove downloaded files entries from the Download Manager
>> +#    0: Upon successful download
>> +#    1: When the browser exits
>> +#    2 (default): Manually
>> +user_pref("browser.download.manager.retention",1);
>> +
>> +# Don't save information entered in web page forms and the Search Bar
>> +user_pref("browser.formfill.enable",false);
>> +
>> +# Automatically Start in Private Browsing Mode
>> +user_pref("browser.privatebrowsing.autostart",true);
>> +
>> +# Windows may not be moved or resized via JavaScript
>> +user_pref("dom.disable_window_move_resize",true);
>> +
>> +# Webpages will not be able to affect the context menu event,
>> +# thus allowing to access the context menu all the time
>> +user_pref("dom.event.contextmenu.enabled",false);
>> +
>> +# Is location aware browsing enabled? Default setting *was* 'true'
>> (Jesus Christ!)
>> +user_pref("geo.enabled",false);
>> +
>> +# Allow cookies from originating server only
>> +user_pref("network.cookie.cookieBehavior",1);
>> +
>> +# Accept cookies for session only
>> +user_pref("network.cookie.lifetimePolicy",2);
>> +
>> +# Consult current preferences for cookie prefs
>> +user_pref("network.cookie.prefsMigrated",true);
>> +
>> +# Perform all DNS lookups on remote proxy server
>> +# NOTE: It has *still* (8th of June 2012) not been fixed!
>> +# ( see Bug 134105
>> https://bugzilla.mozilla.org/show_bug.cgi?id=134105 )
>> +user_pref("network.proxy.socks_remote_dns",true);
>> +
>> +# Only important if you are using Tor. Might be fixed by now
>> +# ( see https://trac.torproject.org/projects/tor/ticket/5741 )
>> +user_pref("network.websocket.enabled",false);
>> +
>> +# UNDOCUMENTED
>> +# Not documented by Mozilla but my best guess is that this disables
>> browser history :-)
>> +user_pref("places.history.enabled",false);
>> +
>> +# UNDOCUMENTED
>> +# Not documented by Mozilla (what the heck are offline apps???)
>> +user_pref("privacy.clearOnShutdown.offlineApps",true);
>> +
>> +# UNDOCUMENTED
>> +# Not documented by Mozilla (but should be obvious :-) )
>> +user_pref("privacy.clearOnShutdown.passwords",true);
>> +
>> +# UNDOCUMENTED
>> +# Not documented by Mozilla (???)
>> +user_pref("privacy.clearOnShutdown.siteSettings",true);
>> +
>> +# UNDOCUMENTED
>> +# Not documented by Mozilla but this is clearly the
>> +# Do-not-track feature from Firefox privacy settings
>> +user_pref("privacy.donottrackheader.enabled",true);
>> +
>> +# Delete all cookies when using the Firefox Clear Private Data feature
>> +user_pref("privacy.item.cookies",true);
>> +
>> +# Perform the Firefox Clear Private Data operation when closing the
>> browser
>> +user_pref("privacy.sanitize.sanitizeOnShutdown",true);
>> +
>> +
>> +
>> +
>> +
>> +
>> +
>> +
>
>  Remove those empty lines at the end.
>
>
>  Phew, glad I managed to finish this review :-)
>
>  Regards,
>  Arnout

:-)

Thank you Arnout.
You helped me a lot

Stefan
