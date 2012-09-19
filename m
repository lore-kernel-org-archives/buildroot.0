From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Sep 2012 08:03:50 +0200
Subject: [Buildroot] [PATCH 6/9] firefox: Mozilla Web Browser
In-Reply-To: <50592144.4050607@petroprogram.com>
References: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
 <1346855344-15081-7-git-send-email-stefan.froberg@petroprogram.com>
 <5057A4D4.60904@mind.be> <50592144.4050607@petroprogram.com>
Message-ID: <50596046.9030009@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/19/12 03:35, Stefan Fr?berg wrote:
>
> 18.9.2012 1:31, Arnout Vandecappelle kirjoitti:
>>
>> [snip]
>>> diff --git a/package/firefox/Config.in b/package/firefox/Config.in
>>> new file mode 100644
>>> index 0000000..fbd4749
>>> --- /dev/null
>>> +++ b/package/firefox/Config.in
>>> @@ -0,0 +1,417 @@
>>> +config BR2_PACKAGE_FIREFOX
>>> +    bool "firefox"
>>> +    select BR2_PACKAGE_ALSA_LIB
>>> +    select BR2_PACKAGE_CAIRO
>>> +    select BR2_PACKAGE_CAIRO_TEE
>>> +    select BR2_PACKAGE_FREETYPE
>>> +    select BR2_PACKAGE_JPEG
>>> +    select BR2_PACKAGE_LIBGTK2
>>
>>   Without Yann's _AVAILABLE series, you need to explicitly
>> depend on the dependencies of libgtk2 (and cairo but
>> that's implied):
>>
>>          depends on BR2_USE_WCHAR # glib2
>>          depends on BR2_INSTALL_LIBSTDCPP # pango
>>
>>   And there should be a comment to warn about it
>> if WCHAR and LIBSTDCPP are not available.
>>
> Uh???? Sorry but what is this new  _AVAILABLE series you mentioned ?

  If you don't know, never mind :-)



>>> +    select BR2_PACKAGE_LIBFFI
>>> +    select BR2_PACKAGE_LIBNSS
>>> +    select BR2_PACKAGE_LIBNSPR
>>> +    select BR2_PACKAGE_LIBPNG
>>
>>   I thought the internal implementations of these three were used?
>>
> Yes, at currently nss, nspr and especially libpng (because it needs apng
> feature patch) internal versions are used but
> mind you that my version of buildroot is little outdated.
>
> So maybe buildroot versions of nss and nspr will now be correctly
> detected and linked against with firefox.
>
> At least what I think seeing from the mailing list is that nspr and
> nss(?) got some new changes (they were missing .pc files?).
> So maybe they work now.

  Could you rebase against current master and recheck with the
buildroot nss/nspr in your next iteration?


[snip]
>>> +config BR2_PACKAGE_FIREFOX_ENABLE_DEBUG
>>> +    bool "Enable debug build and Valgrind integration hooks"
>>> +    select BR2_PACKAGE_VALGRIND if BR2_TOOLCHAIN_BUILDROOT&&
>>> BR2_GCC_ENABLE_TLS
>>
>>   Let me get this clear: if you're using a glibc-based or
>> crosstool-NG-generated uclibc toolchain with TLS, valgrind.h
>> is not needed?
>>
>>   In other words: shouldn't this just select valgrind unconditionally?
>>
> You might be right. I have always used only uclibc-based, buildroot
> provided toolchain.
> So in other words: I have no clue what will happen in other toolchains

  It's easy enough to build-test with an external Sourcery toolchain
as well.


[snip]
>>> +config BR2_PACKAGE_FIREFOX_ULTRA_PARANOID
>>> +    bool "Enable Ulta-paranoid settings"
>>
>>   Do you think this option is useful for many buildroot users?  I
>> think most users will let firefox run full-screen at boot time,
>> pointing to one and only one site, with no UI for changing URL.
>> An option to provide *that* would be useful :-)
>>
> You mean that WebM ? I think it's kinda cool option. :-)
> To watch videos without flash.
> But of course, being YouTube only it's usefulness is quite limited now....

  No, I mean ultra-paranoid.

  Remember that buildroot users (including yourself :-) can just
add a custom prefs.js to their skeleton, or add it post-build.

[snip]
>>> +config BR2_PACKAGE_FIREFOX_INSTALL_DEFAULT_EXTENSIONS
>>> +    bool "Enable installing of selected default extensions"
>>> +    help
>>> +        This option will enable you to select default extensions to
>>> +        be installed when building Firefox.
>>> +
>>> +        Note: The selected extensions are only *installed*.
>>> +        They are not *enabled* by default.
>>> +        For that you have to manually enable them after starting you
>>> +        freshly build Firefox.
>>
>>   built.
>>
>>   The logic is reversed here, if you ask me. INSTALL_DEFAULT_EXTENSIONS
>> should select the default extensions, but the default extensions
>> shouldn't
>> depend on it.  Or, if the idea is to make a submenu for the extensions,
>> it should be a menuconfig. But since there are only four extensions, I
>> don't think it's worth making a menuconfig for that.
>>
> Yeah, that's what I had in mind. A menu option where user could decide
> if he/she
> want's any default extensions installed and then it would take him/her
> to list
> of extensions to install.

  In that case: use 'menu' (I personally don't like menuconfig much, I
often forget to check the option before entering the menu and then you
just get an empty menu...).

>>   I propose to just remove the DEFAULT_EXTENSIONS symbol.

[snip]
>>> +config BR2_PACKAGE_FIREFOX_PLUGIN_GNASH
>>> +    source "package/gnash/Config.in"
>>
>>   The config symbol should be inside the sourced Config.in.  Also,
>> I think it should be included from packages/Config.in.
>>
> You mean that it should be possible to enable building gnash flash
> plugin outside of firefox ?

  Yes. First of all, it's also a stand-alone executable IIRC.
And even if it is only a firefox plugin, you can make it
depends on BR2_PACKAGE_FIREFOX.

[snip]
>>> diff --git a/package/firefox/firefox-11.0-uintptr_t.patch
>>> b/package/firefox/firefox-11.0-uintptr_t.patch
>>> new file mode 100644
>>> index 0000000..559b4c7
>>> --- /dev/null
>>> +++ b/package/firefox/firefox-11.0-uintptr_t.patch
>>> @@ -0,0 +1,12 @@
>>> +diff -Naur firefox-11.0.org/gfx/qcms/qcmstypes.h
>>> firefox-11.0/gfx/qcms/qcmstypes.h
>>> +--- firefox-11.0.org/gfx/qcms/qcmstypes.h    2012-08-06
>>> 15:09:44.189994318 +0300
>>> ++++ firefox-11.0/gfx/qcms/qcmstypes.h    2012-08-06
>>> 23:35:38.339208022 +0300
>>> +@@ -27,7 +27,7 @@
>>> + #ifdef __OS2__
>>> + /* OS/2's stdlib typdefs uintptr_t. So we'll just include that so
>>> we don't collide */
>>> + #include<stdlib.h>
>>> +-#elif !defined(__intptr_t_defined)&&   !defined(_UINTPTR_T_DEFINED)
>>> ++#elif !defined(__intptr_t_defined)&&
>>> !defined(_UINTPTR_T_DEFINED)&&   !defined(__UCLIBC__)
>>> + typedef PRUptrdiff uintptr_t;
>>
>>   Is this necessary? stdint.h defines __intptr_t_defined (at least in
>> 0.9.32)
>>
> I have 0.9.33 and still got some problems.
> But I will check it again.

  Maybe stdint.h just isn't included (which means uintptr_t isn't
available either).

[snip]
>>> +define FIREFOX_ENABLE_DEBUG
>>> +    echo "ac_add_options --disable-debug">>   $(FIREFOX_DIR)/mozconfig
>>> +    echo "ac_add_options --disable-debug-symbols">>
>>> $(FIREFOX_DIR)/mozconfig
>>> +    echo "ac_add_options --enable-strip">>   $(FIREFOX_DIR)/mozconfig
>>
>>   We normally do stripping directly in the target/ directory,
>> so unstripped binaries are still available in the build
>> directory.  So --disable-strip should be unconditional.  Unless
>> there are non-executable files that should be stripped as well
>> (only executable files are stripped by buildroot).
>>
> Actually, at the very end of the installation process there is a long
> list of files
> that do not seem like normal executable files and in default (non-debug)
> build
> firefox strips them.
> But I have to check that again.

  Buildroot strips files with the executable bit set, not only
normal executables.

[snip]
>>> +    (cd $(@D); \
>>> +        sed -i 's# ""##' browser/base/Makefile.in&&   \
>>
>>   Huh?  That merits some comment to explain why it is needed...
>> Also it fits better in a POST_PATCH_HOOK than here.
>>
> Sorry, forgot to mention that sed line just removes unprintable control
> characters from the title bar.

  That is really mysterious... I'll look at it again in your next
iteration.

[snip]

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
