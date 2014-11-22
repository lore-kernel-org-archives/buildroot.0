From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 22 Nov 2014 17:13:26 +0100
Subject: [Buildroot] [PATCH 1/2] package/openpowerlink: do not override
 CMAKE_SYSTEM_PROCESSOR
In-Reply-To: <CAHXCMMKde_wWS7DJPW-go79Te8JmhD8GTns5Zn01LOzxtFqb8A@mail.gmail.com>
References: <1416614492-25656-1-git-send-email-romain.naour@openwide.fr>
 <CAHXCMMKde_wWS7DJPW-go79Te8JmhD8GTns5Zn01LOzxtFqb8A@mail.gmail.com>
Message-ID: <5470B626.9050809@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel, all,

Le 22/11/2014 10:18, Samuel Martin a ?crit :
> Hi Romain, all,
> 
> On Sat, Nov 22, 2014 at 1:01 AM, Romain Naour <romain.naour@openwide.fr> wrote:
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>>
>> ---
>>
>> This commit must be applied after "pkg-cmake.mk: Set CMAKE_SYSTEM_PROCESSOR"
>> http://patchwork.ozlabs.org/patch/411789/
>> ---
>>  ...a-better-regex-for-cmake-system-processor.patch | 89 ++++++++++++++++++++++
>>  package/openpowerlink/openpowerlink.mk             | 12 +--
>>  2 files changed, 90 insertions(+), 11 deletions(-)
>>  create mode 100644 package/openpowerlink/0001-fix-use-a-better-regex-for-cmake-system-processor.patch
>>
>> diff --git a/package/openpowerlink/0001-fix-use-a-better-regex-for-cmake-system-processor.patch b/package/openpowerlink/0001-fix-use-a-better-regex-for-cmake-system-processor.patch
>> new file mode 100644
>> index 0000000..d32fa38
>> --- /dev/null
>> +++ b/package/openpowerlink/0001-fix-use-a-better-regex-for-cmake-system-processor.patch
>> @@ -0,0 +1,89 @@
>> +From 1c8eb7245abcc55d0a46181ec421a6c12df43333 Mon Sep 17 00:00:00 2001
>> +From: Romain Naour <romain.naour@openwide.fr>
>> +Date: Mon, 17 Nov 2014 23:27:05 +0100
>> +Subject: [PATCH 1/1] [FIX] use a better regex for CMAKE_SYSTEM_PROCESSOR
>> +
>> +According to CMake doc, CMAKE_SYSTEM_PROCESSOR is set to the
>> +output of the command "uname -p" (in fact it is the output of "uname
>> +-m"). This is only true for native compilation.
>> +
>> +In the case of cross-compilation, the CMake code does not set anything,
>> +it just expects the CMAKE_SYSTEM_* variables to be set in the
>> +toolchain file.
>> +
>> +Add a test matching the patern "^i.86$" and keep the old one "x86" for
>> +compatibility.
>> +
> 
> I would not have formulated this better! ;-)
> 
>> +Thanks to Samuel Martin [1]
>> +[1] http://lists.busybox.net/pipermail/buildroot/2014-November/112163.html
>> +
>> +Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> +
>> +---
>> + Examples/X86/Linux/gnu/demo_kernel/CMakeLists.txt         | 15 ++++-----------
>> + .../X86/Linux/gnu/powerlink_kernel_module/CMakeLists.txt  | 15 ++++-----------
>> + 2 files changed, 8 insertions(+), 22 deletions(-)
>> +
>> +diff --git a/Examples/X86/Linux/gnu/demo_kernel/CMakeLists.txt b/Examples/X86/Linux/gnu/demo_kernel/CMakeLists.txt
>> +index 271ecdc..341d54e 100644
>> +--- a/Examples/X86/Linux/gnu/demo_kernel/CMakeLists.txt
>> ++++ b/Examples/X86/Linux/gnu/demo_kernel/CMakeLists.txt
>> +@@ -154,21 +154,14 @@ SET(MODULE_SOURCE_FILES
>> +     ${POWERLINK_SOURCE_DIR}/ObjDicts/${OBJDICT}/Objdict.c
>> + )
>> +
>> +-IF (CMAKE_SYSTEM_PROCESSOR STREQUAL x86)
>> ++IF (CMAKE_SYSTEM_PROCESSOR MATCHES "^i.86$" OR CMAKE_SYSTEM_PROCESSOR STREQUAL "x86" OR CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64")
> 
> You could condense this doing [1,2]:
> --
> IF (CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86|x86(_64)?)$"
> --

Yes indeed, thanks !

> 
>> +     SET(MODULE_SOURCE_FILES ${MODULE_SOURCE_FILES} ${POWERLINK_SOURCE_DIR}/EplStack/amix86.c)
>> +-
>> +-ELSEIF (   CMAKE_SYSTEM_PROCESSOR STREQUAL arm
>> +-        OR CMAKE_SYSTEM_PROCESSOR STREQUAL armv7l)
>> ++ELSEIF (CMAKE_SYSTEM_PROCESSOR STREQUAL "arm" OR CMAKE_SYSTEM_PROCESSOR STREQUAL "armv7l")
> 
> I guess "arm" is a shortcut for "armv7l"...
> Is openpowerlink little-endian only?
> This change is only comestic, it could be strip away from this patch.
> 
> Anyway, openpowerlink is disabled for all arm architecture in its
> Config.in file.

Well, when I added Openpowerlink package, I choose to disable it for other 
architecture than x86 ou x86_64 for several reasons:
    - Build issues with the kernel stack with specific ethernet chip driver.
    - The ARM support is not as active as for x86
    - I can't test on ARM
    - This version of Openpowerlink will be superseded by the new stack 2.0.x

Openpowerlink use it's own ethernet chip driver, and on ARM there are only
two available: Davicom DM9003 and Freescale FEC.
The DM9003 live outside the cmake infra and the FEC driver is just broken.

At least, you might use the libpcap library as network stack on ARM but it's
not as efficient compared to the kernel stack.

[snip]

>> -
>>  # There is no shared lib in openpowerlink,
>>  # so force static lib to build libpowerlink.a
>> -OPENPOWERLINK_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
>> +OPENPOWERLINK_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF
> 
> Well, if openpowerlink can only build static library, it'd be better
> if this could be handled directly in its CMake code, when creating
> each library using the STATIC property (see [3]).
> But that's another story... ;-)
> 

I see, the STATIC key work is missing when the user space network stack
(with libpcap) is build.

Side note:
I had considered to package new Openpowerlink stack v2.0.1 but the new build
system need to link with debug and release libraries :-/
(And this is not the only problem)

see:
http://sourceforge.net/p/openpowerlink/discussion/newbie/thread/3f13af65/?limit=25#7a30/c7e5/c90b/0e13

Best regards, 
Romain
