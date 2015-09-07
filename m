From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 7 Sep 2015 17:21:27 +0200
Subject: [Buildroot] [PATCH] cmake: bump to version 3.3.1
In-Reply-To: <55EDA8F5.6040503@imgtec.com>
References: <1441633000-8235-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <55EDA295.8070807@imgtec.com> <55EDA8F5.6040503@imgtec.com>
Message-ID: <CAHXCMM+FrPaSsfW0zakOnbf92GrQPN4_REc219eJ0R=c9GTHHg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo, Vicente,

On Mon, Sep 7, 2015 at 5:10 PM, Vicente Olivert Riera
<Vincent.Riera@imgtec.com> wrote:
[...]
>>
>> The host-cmake package is fine, but the target one fails for me at the
>> configure phase:
>>
>> -- Could NOT find JsonCpp (missing:  JsonCpp_LIBRARY JsonCpp_INCLUDE_DIR)
>> CMake Error at CMakeLists.txt:399 (message):
>>   CMAKE_USE_SYSTEM_JSONCPP is ON but a JsonCpp is not found!
>> Call Stack (most recent call first):
>>   CMakeLists.txt:533 (CMAKE_BUILD_UTILITIES)
>>
>> This is the defconfig I have used:
>>
>> BR2_mips=y
>> BR2_TOOLCHAIN_EXTERNAL=y
>> BR2_PACKAGE_CMAKE_CTEST=y
>>
>> I have tried to fix the problem applying this patch:
>>
>> diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
>> index da93fb3..0f0fd39 100644
>> --- a/package/cmake/cmake.mk
>> +++ b/package/cmake/cmake.mk
>> @@ -20,6 +20,12 @@ CMAKE_CONF_OPTS = \
>>         -DCTEST_USE_XMLRPC=OFF \
>>         -DBUILD_CursesDialog=OFF
>>
>> +ifeq ($(BR2_PACKAGE_JSONCPP),y)
>> +CMAKE_CONF_OPTS += -DCMAKE_USE_SYSTEM_JSONCPP=ON
>> +else
>> +CMAKE_CONF_OPTS += -DCMAKE_USE_SYSTEM_JSONCPP=OFF
>> +endif
>> +
>>  # Get rid of -I* options from $(HOST_CPPFLAGS) to prevent that a
>>  # header available in $(HOST_DIR)/usr/include is used instead of a
>>  # CMake internal header, e.g. lzma* headers of the xz package
>>
>> But it didn't worked. Perhaps you have a better idea.
>>
>> Regards,
>>
>> Vincent.
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>
> ok, I have fixed it. The changes should be done this way:
>
> ifeq ($(BR2_PACKAGE_JSONCPP),y)
> CMAKE_CONF_OPTS += -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=ON
> else
> CMAKE_CONF_OPTS += -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=OFF

This will build a static libjsoncpp bundled within cmake sources.
For host package, we don't care, but for target I think we only use
the system libraries.
So, it should be an unconditional dependency:

CMAKE_DEPENDENCIES += jsoncpp
CMAKE_CONF_OPTS += -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=ON

Regards,


-- 
Samuel
