From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 May 2019 00:02:31 +0200
Subject: [Buildroot] [git commit] package/flare-engine: re-enable
 package on microblaze
In-Reply-To: <757073a2-45c1-d0f1-3d84-6c93bc8582b5@micronovasrl.com>
References: <20190527213701.2BAC18DAA9@busybox.osuosl.org>
 <757073a2-45c1-d0f1-3d84-6c93bc8582b5@micronovasrl.com>
Message-ID: <868ec9d3-adb9-9076-ff14-9ba797bc8927@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27/05/2019 23:50, Giulio Benetti wrote:
> Hello Arnout,
> 
> Il 27/05/2019 23:37, Arnout Vandecappelle (Essensium/Mind) ha scritto:
>> commit:
>> https://git.buildroot.net/buildroot/commit/?id=1203cca1b51eefb4ee236d998ab6ec32bdd087d8
>>
>> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>>
>> With Microblaze Gcc version < 8.x the build hangs due to bug 85180:
>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
>> To avoid this, the flare-engine package has a
>> !BR2_TOOLCHAIN_HAS_GCC_BUG_85180 dependency. However, gcc bug 85180 only
>> triggers when optimization is enabled, so we can work around the issue
>> by passing -O0, which is what we do in other Buildroot packages to work
>> around this bug.
>>
>> So, this commit passes -O0 when BR2_TOOLCHAIN_HAS_GCC_BUG_85180, and
>> re-enables flare-engine on Microblaze. It is not enough to set
>> CMAKE_CXX_FLAGS, because flare-engine's CMakeLists.txt sets
>> CMAKE_CXX_FLAGS_<BUILD_TYPE> (depending on the value of
>> CMAKE_BUILD_TYPE), and the build-type-specific flags come after the
>> generic flags, so our -O0 gets overridden again. Therefore, also set
>> CMAKE_BUILD_TYPE to the dummy value Buildroot.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/706/7065e14917a8bbc0faf21b29183ac55b6c800ee3/
>>
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> [Arnout: extend explanatory comment and update commit log]
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>> ? package/flare-engine/Config.in?????? | 4 ----
>> ? package/flare-engine/flare-engine.mk | 8 ++++++++
>> ? 2 files changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/package/flare-engine/Config.in b/package/flare-engine/Config.in
>> index e299a6b7de..cdcb018948 100644
>> --- a/package/flare-engine/Config.in
>> +++ b/package/flare-engine/Config.in
>> @@ -2,7 +2,6 @@ config BR2_PACKAGE_FLARE_ENGINE
>> ????? bool "flare-engine"
>> ????? depends on BR2_INSTALL_LIBSTDCPP
>> ????? depends on !BR2_STATIC_LIBS # SDL2
>> -??? depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85180
>> ????? select BR2_PACKAGE_SDL2
>> ????? select BR2_PACKAGE_SDL2_IMAGE
>> ????? select BR2_PACKAGE_SDL2_MIXER
>> @@ -18,6 +17,3 @@ config BR2_PACKAGE_FLARE_ENGINE
>> ? ? comment "flare-engine needs a toolchain w/ C++, dynamic library"
>> ????? depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
>> -
>> -comment "flare-engine needs a toolchain not affected by GCC bug 85180"
>> -??? depends on BR2_TOOLCHAIN_HAS_GCC_BUG_85180
>> diff --git a/package/flare-engine/flare-engine.mk
>> b/package/flare-engine/flare-engine.mk
>> index 2f36602348..1ec50bfed4 100644
>> --- a/package/flare-engine/flare-engine.mk
>> +++ b/package/flare-engine/flare-engine.mk
>> @@ -19,4 +19,12 @@ ifeq ($(BR2_ENABLE_DEBUG),y)
>> ? FLARE_ENGINE_CONF_OPTS += -DCMAKE_BUILD_TYPE=RelWithDebInfo
>> ? endif
>> ? +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
>> +# CMakeLists.txt sets CMAKE_CXX_FLAGS_<BUILD_TYPE> depending on
>> +# BUILD_TYPE, and this comes after the generic CMAKE_CXX_FLAGS.
>> +# Overrice CMAKE_BUILD_TYPE so no overrides are applied.
> 
> Here ^^^^^^^^ there's a typo.
 Thanks, fixed in master.

 Regards,
 Arnout

> 
> Kind regards
