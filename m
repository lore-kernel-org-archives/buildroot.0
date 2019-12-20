From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 20 Dec 2019 15:14:14 +0100
Subject: [Buildroot] [PATCH 1/2] package/snappy: add snappy.pc
In-Reply-To: <43c1064d-352d-1f0f-d4a8-746380d438a4@benettiengineering.com>
References: <20190529172932.3753-1-fontaine.fabrice@gmail.com>
 <43c1064d-352d-1f0f-d4a8-746380d438a4@benettiengineering.com>
Message-ID: <a001f0da-9cef-6603-5157-7e41ce9d3dff@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On 12/20/19 3:00 PM, Giulio Benetti wrote:
> Hi Fabrice,
> 
> On 5/29/19 7:29 PM, Fabrice Fontaine wrote:
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> ---
>>    .../snappy/0001-Readd-pkgconfig-support.patch | 56 +++++++++++++++++++
>>    1 file changed, 56 insertions(+)
>>    create mode 100644 package/snappy/0001-Readd-pkgconfig-support.patch
>>
>> diff --git a/package/snappy/0001-Readd-pkgconfig-support.patch b/package/snappy/0001-Readd-pkgconfig-support.patch
>> new file mode 100644
>> index 0000000000..f27df9c8e8
>> --- /dev/null
>> +++ b/package/snappy/0001-Readd-pkgconfig-support.patch
>> @@ -0,0 +1,56 @@
>> +From e2c4ae93c6f57a80a71bdcff309006efccd30f42 Mon Sep 17 00:00:00 2001
>> +From: Niclas Rosenvik <youremailsarecrap@gmail.com>
>> +Date: Fri, 4 Aug 2017 12:33:18 +0200
>> +Subject: [PATCH] Readd pkgconfig support.
>> +
>> +Readd pkgconfig support to support usage of snappy with other build systems.
>> +
>> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> +[Retrieved (and updated to add Libs.private) from:
>> +https://github.com/google/snappy/pull/51/commits/e2c4ae93c6f57a80a71bdcff309006efccd30f42]
>> +---
>> + CMakeLists.txt     |  6 ++++++
>> + cmake/snappy.pc.in | 10 ++++++++++
>> + 2 files changed, 16 insertions(+)
>> + create mode 100644 cmake/snappy.pc.in
>> +
>> +diff --git a/CMakeLists.txt b/CMakeLists.txt
>> +index e9e70c8..7a8dab4 100644
>> +--- a/CMakeLists.txt
>> ++++ b/CMakeLists.txt
>> +@@ -54,6 +54,11 @@ configure_file(
>> +   "${PROJECT_SOURCE_DIR}/cmake/config.h.in"
>> +   "${PROJECT_BINARY_DIR}/config.h"
>> + )
>> ++configure_file(
>> ++  "${PROJECT_SOURCE_DIR}/cmake/snappy.pc.in"
>> ++  "${PROJECT_BINARY_DIR}/snappy.pc"
>> ++  @ONLY
>> ++)
>> +
>> + # We don't want to define HAVE_ macros in public headers. Instead, we use
>> + # CMake's variable substitution with 0/1 variables, which will be seen by the
>> +@@ -165,3 +170,4 @@ install(
>> +     "${PROJECT_BINARY_DIR}/SnappyConfigVersion.cmake"
>> +   DESTINATION lib/cmake/Snappy
>> + )
>> ++install(FILES "${PROJECT_BINARY_DIR}/snappy.pc" DESTINATION lib/pkgconfig)
>> +\ No newline at end of file
> 
> No newline,
> 
>> +diff --git a/cmake/snappy.pc.in b/cmake/snappy.pc.in
>> +new file mode 100644
>> +index 0000000..6c43545
>> +--- /dev/null
>> ++++ b/cmake/snappy.pc.in
>> +@@ -0,0 +1,10 @@
>> ++prefix=@CMAKE_INSTALL_PREFIX@
>> ++exec_prefix=${prefix}
>> ++libdir=${exec_prefix}/lib
>> ++includedir=${prefix}/include
>> ++
>> ++Name: @PROJECT_NAME@
>> ++Description: A fast compression/decompression library
>> ++Version: @PROJECT_VERSION@
>> ++Libs: -L${libdir} -lsnappy
>> ++Libs.private: -lstdc++
>> ++Cflags: -I${includedir}
>> +\ No newline at end of file
> 
> No newline
> 
> And, what is the goal of this patch? Does it fix a bug? I see that only
> few packages provide a .pc file that is useful for pkgconfig to retrieve
> libs/incs paths for shared/static libs deps, but can you please provide
> a commit log about this? If it's not needed by any other package as
> dependency or there is not a specific reason I would avoid it.

I've realized only now that this is part of a patchset and is needed to 
fix wireshark build failure. Sorry.

-- 
Giulio Benetti
Benetti Engineering sas
