From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 3 Nov 2015 07:43:10 +0100
Subject: [Buildroot] [PATCH v6 06/33] package/efl/libefl: new package
In-Reply-To: <CAAMcf8AEeazqU0Cx+pfuXP1zytprOnMrPs9R6Gu+-8BjotH=Sg@mail.gmail.com>
References: <1446401289-9059-1-git-send-email-romain.naour@openwide.fr>
 <1446401289-9059-7-git-send-email-romain.naour@openwide.fr>
 <CAAMcf8AEeazqU0Cx+pfuXP1zytprOnMrPs9R6Gu+-8BjotH=Sg@mail.gmail.com>
Message-ID: <5638577E.3030606@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vicente,

Le 01/11/2015 21:55, Vicente a ?crit :
> Hello Romain,
> 
> On Sun, Nov 1, 2015 at 6:07 PM, Romain Naour <romain.naour@openwide.fr> wrote:
>> Add the libefl package which contains an updated version of the following
>> libraries:
>> libecore, libedje, libeet, libfreet, libeina, libeio, libembryo, libthumb
>> and libevas. It also contains eldbus, ephysics, and escape, see [1].
>>
>> For now, the bump to efl 1.15.x is not complete.
>> This allows to build at least a default configuration without X11 support
>> or graphics acceleration.
>> This support will be added by a follow up patches in the series.
>>
>> Also, add BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG config option in order to
>> select all recommended packages that allows to build libefl without the
>> extra-long --enable-i-really-know-what-i-am-doing...
>>
>> Here is some notes about libefl dependencies:
>>   - alsa:
>>     At the end of the configure script, the summary tab will show that
>>     alsa support is allways disabled even if alsa-utils has been build
>>     before efl-core package.
>>     "Ecore_Audio.....: yes (-alsa +pulseaudio +sndfile)"
>>     This is intentional.
>>
>>   - util-linux:
>>     libefl select util-linux libblkid since it's listed as an dependency
>>     in the README [2].
>>
>>   - threads support:
>>     Add a dependency on threads support since clearly efl libraries are
>>     not even built without thread support [3].
>>
>>   - Curl:
>>     Curl is listed as an dependency in the README because it's a runtime
>>     dependency since efl 1.8 [4].
>>
>> An initial runtime test has been done under Qemu with a glibc x86 toolchain.
>>
>> An additional runtime test has been done with a uClibc-ng 1.0.5 toolchain
>> patched with [5] in order to add mkstemps() which is used by Eina library.
>> This patch has been upstreamed in uClubc-ng 1.0.6 release.
>>
>> Another test has been done with a musl toolchain by Vicente Bergas (Thanks!).
>>
>> We need to regenerate the configure script to workaround a build issue with
>> eldbus-codegen:
>>
>>   CCLD     bin/eldbus/eldbus-codegen
>>   CXXLD    bin/eolian_cxx/eolian_cxx
>>   CCLD     lib/ecore_x/ecore_x_vsync
>>   CCLD     lib/evas/common/libevas_op_blend_sse3.la
>>   CCLD     lib/evas/common/libevas_convert_rgb_32.la
>>   CCLD     lib/ecore_ipc/libecore_ipc.la
>> [...]/i686-ctng-linux-gnu/bin/ld: warning: libefl.so.1, needed by lib/ecore/.libs/libecore.so, not found (try using -rpath or -rpath-link)
>> lib/ecore/.libs/libecore.so: undefined reference to `efl_control_suspend_set'
>> lib/ecore/.libs/libecore.so: undefined reference to `efl_control_interface_get'
>> collect2: error: ld returned 1 exit status
>> Makefile:19135: recipe for target 'bin/eldbus/eldbus-codegen' failed
>> make[6]: *** [bin/eldbus/eldbus-codegen] Error 1
>>
>> A dependency on libefl seems to be missing for eldbus but by
>> regenerating eldbus-codegen build correctly.
>>
>> Reported upstream [6].
>>
>> Also, gettextize is needed since *.po files were generated with
>> an "old" gettext version (0.18):
>>
>> Making all in po
>> *** error: gettext infrastructure mismatch: using a Makefile.in.in from gettext version 0.18 but the autoconf macros are from gettext version 0.19
>> Makefile:149: recipe for target 'check-macro-version' failed
>>
>> [1] See https://phab.enlightenment.org/phame/live/3/post/efl_1_8/
>> [2] https://git.enlightenment.org/core/efl.git/tree/README?id=v1.15.2#n478
>> [3] https://git.enlightenment.org/core/efl.git/tree/configure.ac#n5032
>> [4] https://git.enlightenment.org/core/efl.git/tree/README?id=v1.15.2#n453
>>     https://git.enlightenment.org/core/efl.git/commit/?id=2c1c6b9335e38c6e52b06829a95d9b58d780c99e
>> [5] http://mailman.uclibc-ng.org/pipermail/devel/2015-August/000432.html
>> [6] https://phab.enlightenment.org/T2718
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> Cc: Vicente Bergas <vicencb@gmail.com>
>> ---
>> v6: Changes from Yann E.Morin's review
>>      - squash curl, autotools and libblkid patches
>>      - use depends on Lua
>>      - LIBEFL_RECOMMENDED_CONFIG depends on BR2_ARCH_HAS_ATOMICS
>>      - rework Config.in help text (remove comments in .mk)
>>      - add some option in LIBEFL_CONF_OPTS to disable some features
>>        explicitely.
>>     Split the dependency comment (Arnout)
>>
>> v4: rename to libefl
>>     EFL needs a toolchain with threads support
>> v3: fix same typo again
>>     Add a note about multisense support
>> v2: remove glibc only dependency
>>     update commit log accordingly
>>     fix typo in Config.in (Vicente Bergas)
>>
>> Vicente, can you test this new series and resend your Tested-By tag ? Thanks !
> 
> Yes, sure!
> I've just tested the branch "efl-1.15.2-for-buildroot-v6" from
> git://github.com/RomainNaour/buildroot.git

This branch is a working branch I shared with Yann for a "live" review.
I recommend to use the series I posted on the list because it contain some last
minute fix. Hopefully, there is no big difference between the two ;-) (just some
commit log changes), so your testing is ok :)

> with
> git cherry-pick 22e0f3a27eba84a381392617801d6ef0c0cc5539
> to add terminology as a test application for efl.
> I've build it with this configuration (which uses musl):
> BR2_arm=y
> BR2_cortex_a8=y
> BR2_ARM_EABIHF=y
> BR2_ARM_FPU_NEON=y
> BR2_DL_DIR="/var/abs/local/sources"
> BR2_OPTIMIZE_3=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/arm-buildroot-linux-musleabihf/usr"
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-buildroot-linux-musleabihf"
> BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_2=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_PACKAGE_EFL=y
> # BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG is not set
> BR2_PACKAGE_LIBEFL_FB=y
> BR2_PACKAGE_LIBEFL_PNG=y
> BR2_PACKAGE_LIBELEMENTARY=y
> BR2_PACKAGE_LUA=y
> BR2_PACKAGE_TERMINOLOGY=y
> 
> with a custom built barebox and linux on a beaglebone black.
> 
> The result: Terminology launched as expected on the hdmi framebuffer output.
> :D

Great to see it works for you :)

See that I keep your fb patch in the series, but there are two upstream commits
that seems to fixes your issue:

https://git.enlightenment.org/core/efl.git/commit/?h=efl-1.15&id=34b391d8937393f76e36b1871b390ea9e30fd0a9

https://git.enlightenment.org/core/efl.git/commit/?h=efl-1.15&id=0feb8814565763b0f9f60b3232f7e6d4fd7e31ea

Care to take a look ?

> 
> Tested-by: Vicente Bergas <vicencb@gmail.com>

Thank!

Best regards,
Romain

> 
> Regards,
>   Vicente.
> 
