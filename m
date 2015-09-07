From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 7 Sep 2015 16:26:03 +0100
Subject: [Buildroot] [PATCH] cmake: bump to version 3.3.1
In-Reply-To: <CAHXCMM+FrPaSsfW0zakOnbf92GrQPN4_REc219eJ0R=c9GTHHg@mail.gmail.com>
References: <1441633000-8235-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <55EDA295.8070807@imgtec.com> <55EDA8F5.6040503@imgtec.com>
 <CAHXCMM+FrPaSsfW0zakOnbf92GrQPN4_REc219eJ0R=c9GTHHg@mail.gmail.com>
Message-ID: <55EDAC8B.7060805@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On 09/07/2015 04:21 PM, Samuel Martin wrote:
> Hi Gustavo, Vicente,
> 
> On Mon, Sep 7, 2015 at 5:10 PM, Vicente Olivert Riera
> <Vincent.Riera@imgtec.com> wrote:
> [...]
>>>
>>> The host-cmake package is fine, but the target one fails for me at the
>>> configure phase:
>>>
>>> -- Could NOT find JsonCpp (missing:  JsonCpp_LIBRARY JsonCpp_INCLUDE_DIR)
>>> CMake Error at CMakeLists.txt:399 (message):
>>>   CMAKE_USE_SYSTEM_JSONCPP is ON but a JsonCpp is not found!
>>> Call Stack (most recent call first):
>>>   CMakeLists.txt:533 (CMAKE_BUILD_UTILITIES)
>>>
>>> This is the defconfig I have used:
>>>
>>> BR2_mips=y
>>> BR2_TOOLCHAIN_EXTERNAL=y
>>> BR2_PACKAGE_CMAKE_CTEST=y
>>>
>>> I have tried to fix the problem applying this patch:
>>>
>>> diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
>>> index da93fb3..0f0fd39 100644
>>> --- a/package/cmake/cmake.mk
>>> +++ b/package/cmake/cmake.mk
>>> @@ -20,6 +20,12 @@ CMAKE_CONF_OPTS = \
>>>         -DCTEST_USE_XMLRPC=OFF \
>>>         -DBUILD_CursesDialog=OFF
>>>
>>> +ifeq ($(BR2_PACKAGE_JSONCPP),y)
>>> +CMAKE_CONF_OPTS += -DCMAKE_USE_SYSTEM_JSONCPP=ON
>>> +else
>>> +CMAKE_CONF_OPTS += -DCMAKE_USE_SYSTEM_JSONCPP=OFF
>>> +endif
>>> +
>>>  # Get rid of -I* options from $(HOST_CPPFLAGS) to prevent that a
>>>  # header available in $(HOST_DIR)/usr/include is used instead of a
>>>  # CMake internal header, e.g. lzma* headers of the xz package
>>>
>>> But it didn't worked. Perhaps you have a better idea.
>>>
>>> Regards,
>>>
>>> Vincent.
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>>
>>
>> ok, I have fixed it. The changes should be done this way:
>>
>> ifeq ($(BR2_PACKAGE_JSONCPP),y)
>> CMAKE_CONF_OPTS += -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=ON
>> else
>> CMAKE_CONF_OPTS += -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=OFF
> 
> This will build a static libjsoncpp bundled within cmake sources.
> For host package, we don't care, but for target I think we only use
> the system libraries.
> So, it should be an unconditional dependency:
> 
> CMAKE_DEPENDENCIES += jsoncpp
> CMAKE_CONF_OPTS += -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=ON

well, in that case you only need to add jsoncpp to the current
CMAKE_DEPENDENCIES line, and also select BR2_PACKAGE_JSONCPP in the
Config.in:

diff --git a/package/cmake/Config.in b/package/cmake/Config.in
index f3f0f85..5b197e3 100644
--- a/package/cmake/Config.in
+++ b/package/cmake/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_CMAKE_CTEST
        bool "ctest"
        select BR2_PACKAGE_CMAKE
        select BR2_PACKAGE_ZLIB
+       select BR2_PACKAGE_JSONCPP
        select BR2_PACKAGE_LIBCURL
        select BR2_PACKAGE_LIBARCHIVE
        select BR2_PACKAGE_EXPAT
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index da93fb3..12f4cad 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -11,7 +11,7 @@ CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt

 HOST_CMAKE_DEPENDENCIES = host-pkgconf
-CMAKE_DEPENDENCIES = zlib libcurl libarchive expat bzip2 xz
+CMAKE_DEPENDENCIES = zlib jsoncpp libcurl libarchive expat bzip2 xz

 CMAKE_CONF_OPTS = \
        -DKWSYS_LFS_WORKS=TRUE \

Regards,

Vincent.


> Regards,
> 
> 
