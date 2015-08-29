From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Aug 2015 23:43:14 +0200
Subject: [Buildroot] [PATCH/next 10/10] package/freeswitch: new package
References: <1439317015-8031-1-git-send-email-bernd.kuhls@t-online.de>
 <1439317015-8031-11-git-send-email-bernd.kuhls@t-online.de>
 <20150829154103.62b721ce@free-electrons.com>
Message-ID: <XnsA505F14C02FCAberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20150829154103.62b721ce at free-
electrons.com:

> Dear Bernd Kuhls,
> 
> Thanks for this submission. A quite complicated software, it seems. You
> submitted Asterisk a while ago, and now Freeswitch. Did you give up on
> Asterisk packaging?

yes, because I could not find an easy-to-use zrtp solution for Asterisk 
while Freeswitch contains this out-of-the-box. Because you showed interest 
in Asterisk I kept that patches in patchwork, I will not continue to work 
on them. With freeswitch I am already conducting first runtime tests on my 
uClibc-based system with good results, audio only so far.

>> +++ b/package/freeswitch/0001-cross_git.patch
>> @@ -0,0 +1,11 @@
> 
> Missing description + SoB.

Will be added in v2, thanks.

>> +--- freeswitch.git/configure.ac.orig     2015-02-24 18:15:49.000000000 
+0100
>> ++++ freeswitch.git/configure.ac     2015-02-24 19:17:15.857077515 +0100
>> +@@ -379,7 +379,7 @@
>> + elif test "x${ax_cv_c_compiler_vendor}" = "xgnu" ; then
>> +     APR_ADDTO(SWITCH_AM_CFLAGS, -fPIC)
>> +     APR_ADDTO(SWITCH_AM_CXXFLAGS, -fPIC)
>> +-    if test "$ac_cv_gcc_supports_w_no_unused_result" = yes; then
>> ++    if test "$ac_cv_gcc_supports_w_no_unused_result" = xyes; then
> 
> This looks wrong: there is no "x" in the left hand side of the test.
> Should this be:
> 
>      if test "$ac...." = "yes" ; then
> 
> instead?

No, this is a bad hack because the test is positive, but following the if-
clause breaks compilation so I broke the comparison ;)

>> ++AC_CHECK_LIB(jpeg, jpeg_std_error,, AC_MSG_ERROR([no usable libjpeg; 
please install libjpeg devel package or equivalent]))
>> ++
>> + PKG_CHECK_MODULES([YUV], [libyuv >= 0.0.1280],
>> +          [AC_MSG_RESULT([yes]);AM_CONDITIONAL([HAVE_YUV],[true])],
>> +          [AC_MSG_RESULT([no]);AM_CONDITIONAL([HAVE_YUV],[false])])
>> +@@ -797,7 +799,6 @@
>> + 
>> + save_LIBS="$LIBS"
>> + LIBS=
>> +-AC_CHECK_LIB(jpeg, jpeg_std_error,, AC_MSG_ERROR([no usable libjpeg; 
please install libjpeg devel package or equivalent]))
> 
> Why is this fixing exactly?

libyuv has an optional jpeg dependency, freeswitch configure misses -ljpeg 
when searching for libyuv and therefore assumes libyuv is missing. When 
freeswitch first searches for libjpeg, -ljpeg will be added to 
PKG_CHECK_MODULES([YUV]. I have to send this patch upstream.

>> +     depends on !BR2_STATIC_LIBS # apr, included in freeswitch source
> 
> No way of using an external apr library? There are some
> use_system_apr / use_system_aprutil variables in configure.ac that seem
> to indicate that it might be possible.

Not with my skills, sorry ;) Freeswitch contains local patches for apr to 
add function "apr_pool_mutex_set" and aprutil to add function 
"apr_queue_pop_timeout", I failed to port these patches to current 
libapr/libaprutil packages.

>> +     depends on !BR2_aarch64
> 
> Why ?

I don?t remember, have to check. I created the base of this packages over 
six months ago..., but I am sure there was a reason ;)

>> +     select BR2_PACKAGE_LIBOPENH264 if BR2_PACKAGE_LIBOPENH264
_ARCH_SUPPORTS
> 
> So it's optional, so why make it mandatory on architectures that are
> part of BR2_PACKAGE_LIBOPENH264_ARCH_SUPPORTS ?
> 
[...]
>> +     select BR2_PACKAGE_ZLIB
> 
> Are you sure all these dependencies are mandatory? For example ODBC
> support seems to be optional. Yaml seems to be optional as well, etc.

I am aware that most packages are optional dependencies, I was too lazy to 
implement Kconfig module selections at this stage because my focus is on 
getting as many packages compiled as possible to spot problems. I even have 
a local patch to get vlc (and therefore freeswitch?s mod_vlc) compiled with 
uclibc, still have to release it ;) I know uClibc-ng will be the new 
default in 2015.08 but atm I have to focus on uClibc until the fli4l 
projects incorporates a newer buildroot version.

>> +FREESWITCH_LICENSE_FILES = COPYING
> 
> The license file is docs/COPYING.

Will be added in v2, thanks.

>> +FREESWITCH_DEPENDENCIES = \
[...]
> 
> Please try to make more of these optional.

Ok, but some freeswitch modules depend on each other and each of them can 
bring in their own external dependencies. It will take some time to sort 
things out.

>> +ifeq ($(BR2_PACKAGE_PYTHON),y)
>> +FREESWITCH_DEPENDENCIES += python
>> +else
>> +FREESWITCH_CONF_OPTS += --without-python
>> +endif
> 
> Pass --with-python when python is enabled.

Will be added in v2, thanks.

>> +define FREESWITCH_BOOTSTRAP
>> +     cd $(@D) && $(TARGET_MAKE_ENV) ./bootstrap.sh
>> +endef
>> +FREESWITCH_POST_PATCH_HOOKS += FREESWITCH_BOOTSTRAP
> 
> If you don't use AUTORECONF = YES, then you need to manually add
> host-autoconf, host-automake and host-libtool in the package
> dependencies.

Will be added in v2, thanks.

>> +# Deactivate a module. Has no effect if it does not exits.
>> +define freeswitch-module-deactivate # module-name
>> +     $(SED) '/$1/s/^/#/' $(@D)/modules.conf
>> +endef
> 
> This macro is not used anywhere.

I kept it for the case when I need to deactivate a module enabled in the 
default configuration.

>> +
>> +# Activate a module. Has no effect if it does not exits.
>> +define freeswitch-module-activate # module-name
>> +     $(SED) '/$1/s/^#//' $(@D)/modules.conf
>> +endef
> 
> Why not using something like the KCONFIG_ENABLE_OPT mechanism, so that
> it can be used both for modules listed in modules.conf as comment, and
> modules not listed (such as mod_openh264).

I will have a look.

>> +define FREESWITCH_ENABLE_MODULES
[...]
> 
> Maybe:
> 
> FREESWITCH_ENABLED_MODULES = \
>      av avmd blacklist bv .... vpx
> 
>      $(foreach mod,$(FREESWITCH_ENABLED_MODULES),\
>           $(call freeswitch-module-activate,mod_$(mod))$(sep))

LGTM.

>> +FREESWITCH_CONF_OPTS += \
>> +     --without-erlang \
>> +     --enable-fhs \
>> +     --with-odbc=$(STAGING_DIR)/usr \
>> +     --enable-zrtp
> 
> Please put the "mandatory" configuration options before the "optional"
> ones (the ones about Python).

Will be added in v2, thanks.

Regards, Bernd
