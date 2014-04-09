From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 9 Apr 2014 06:44:06 +0200
Subject: [Buildroot] [PATCH] ne10: bump version to 1.0.0
In-Reply-To: <CAHXCMML_DSi3Mk55ez2u3Fpn1e=0BO2s=V7wgCoXKf1M_9o6Gw@mail.gmail.com>
References: <99baf8d8d8d05b5f2de390deef6546acab0199dd.1396965306.git.baruch@tkos.co.il>
 <CAHXCMML_DSi3Mk55ez2u3Fpn1e=0BO2s=V7wgCoXKf1M_9o6Gw@mail.gmail.com>
Message-ID: <CAHXCMMLzZy=F4RhD=_BgKpHfjZ4Dso+j3Fg4M57yNUVSwvE1rA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 9, 2014 at 6:11 AM, Samuel Martin <s.martin49@gmail.com> wrote:
> Hi Baruch, all,
>
> On Tue, Apr 8, 2014 at 3:55 PM, Baruch Siach <baruch@tkos.co.il> wrote:
>> Switch to github helper while at it.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/a2c/a2ca3fe245e410a738f4b10631a1414696a0edea/
>>
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ---
>>  ...CMakeLists.txt-add-neon-support-to-CFLAGS.patch | 31 ++++++++++++++++++++++
>>  package/ne10/ne10.mk                               | 10 +++----
>>  2 files changed, 36 insertions(+), 5 deletions(-)
>>  create mode 100644 package/ne10/ne10-01-CMakeLists.txt-add-neon-support-to-CFLAGS.patch
>>
>> diff --git a/package/ne10/ne10-01-CMakeLists.txt-add-neon-support-to-CFLAGS.patch b/package/ne10/ne10-01-CMakeLists.txt-add-neon-support-to-CFLAGS.patch
>> new file mode 100644
>> index 000000000000..1777de102328
>> --- /dev/null
>> +++ b/package/ne10/ne10-01-CMakeLists.txt-add-neon-support-to-CFLAGS.patch
>> @@ -0,0 +1,31 @@
>> +From 1ab64866615643d19a8e5c4f1a3f62f1baad6e83 Mon Sep 17 00:00:00 2001
>> +Message-Id: <1ab64866615643d19a8e5c4f1a3f62f1baad6e83.1396964788.git.baruch@tkos.co.il>
>> +From: Baruch Siach <baruch@tkos.co.il>
>> +Date: Tue, 8 Apr 2014 16:40:28 +0300
>> +Subject: [PATCH] CMakeLists.txt: add neon support to CFLAGS
>> +
>> +Fixed build failure:
>> +
>> +.../include/arm_neon.h:32:2: error: #error You must enable NEON instructions (e.g. -mfloat-abi=softfp -mfpu=neon) to use arm_neon.h
>> +
>> +Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> +---
>> + CMakeLists.txt | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/CMakeLists.txt b/CMakeLists.txt
>> +index e5a98af53c1f..22ce166650da 100644
>> +--- a/CMakeLists.txt
>> ++++ b/CMakeLists.txt
>> +@@ -78,7 +78,7 @@ if(ANDROID_PLATFORM)
>> +       add_subdirectory(android/NE10Demo/jni)
>> +     endif()
>> + elseif(GNULINUX_PLATFORM)
>> +-    set(CMAKE_C_FLAGS "-O2 -mthumb-interwork -mthumb -march=armv7-a -mfpu=vfp3")
>> ++    set(CMAKE_C_FLAGS "-O2 -mthumb-interwork -mthumb -march=armv7-a -mfloat-abi=softfp -mfpu=neon")
>> +     set(CMAKE_ASM_FLAGS "-mthumb-interwork -mthumb -march=armv7-a -mfpu=neon")
>> + elseif(IOS_PLATFORM)
>> +     #set minimal target ios version.If not provided this option, Xcode
>> +--
>> +1.9.1
>> +
>
> I clearly don't like this patch, so I nack it.

Just to be clear-crystal, the upstream CMake code is wrong: how could
it know what is the target?

So, the "set(CMAKE_C_FLAGS ...)" and "set(CMAKE_ASM_FLAGS ...)" should
be removed and set on the CMake command line by Buildroot.

Regards,

-- 
Samuel
