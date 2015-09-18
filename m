From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 18 Sep 2015 11:50:01 +0100
Subject: [Buildroot] [PATCH v2] cmake: bump to version 3.3.1
In-Reply-To: <55EE9FC1.2000705@imgtec.com>
References: <1441642979-343-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <55EE9FC1.2000705@imgtec.com>
Message-ID: <55FBEC59.1020007@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

cmake-3.3.2 has been released. Perhaps you want to upgrade your patch.

Regards,

Vincent.

On 09/08/2015 09:43 AM, Vicente Olivert Riera wrote:
> Dear Gustavo Zacarias,
> 
> On 09/07/2015 05:22 PM, gustavo.zacarias at free-electrons.com wrote:
>> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
>>
>> xtensa patch is upstream so there's no need for it any longer.
>>
>> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> Compile test for MIPS architecture:
> 
> $ git shortlog -1
> Gustavo Zacarias (1):
>       cmake: bump to version 3.3.1
> 
> $ file output/build/cmake-3.3.1/.stamp_target_installed
> output/build/cmake-3.3.1/.stamp_target_installed: empty
> 
> Regards,
> 
> Vincent.
> 
>> ---
>>  ...IML-Teach-ABI.h-about-Xtensa-architecture.patch | 30 ----------------------
>>  package/cmake/Config.in                            |  7 +++--
>>  package/cmake/cmake.hash                           |  4 +--
>>  package/cmake/cmake.mk                             |  6 ++---
>>  4 files changed, 10 insertions(+), 37 deletions(-)
>>  delete mode 100644 package/cmake/0002-KWIML-Teach-ABI.h-about-Xtensa-architecture.patch
>>
>> diff --git a/package/cmake/0002-KWIML-Teach-ABI.h-about-Xtensa-architecture.patch b/package/cmake/0002-KWIML-Teach-ABI.h-about-Xtensa-architecture.patch
>> deleted file mode 100644
>> index 7d8eec6..0000000
>> --- a/package/cmake/0002-KWIML-Teach-ABI.h-about-Xtensa-architecture.patch
>> +++ /dev/null
>> @@ -1,30 +0,0 @@
>> -From ded79a976e2b63bbfd7a63f27ec00bd071410e27 Mon Sep 17 00:00:00 2001
>> -From: Max Filippov <jcmvbkbc@gmail.com>
>> -Date: Tue, 17 Mar 2015 15:51:04 +0300
>> -Subject: [PATCH] KWIML: Teach ABI.h about Xtensa architecture
>> -
>> -Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
>> ----
>> - Utilities/KWIML/ABI.h.in | 6 ++++++
>> - 1 file changed, 6 insertions(+)
>> -
>> -diff --git a/Utilities/KWIML/ABI.h.in b/Utilities/KWIML/ABI.h.in
>> -index 21c9139..6300ada 100644
>> ---- a/Utilities/KWIML/ABI.h.in
>> -+++ b/Utilities/KWIML/ABI.h.in
>> -@@ -432,6 +432,12 @@ suppression macro @KWIML at _ABI_NO_VERIFY was defined.
>> - #  define @KWIML at _ABI_ENDIAN_ID @KWIML at _ABI_ENDIAN_ID_BIG
>> - # endif
>> - 
>> -+/* Xtensa */
>> -+#elif defined(__XTENSA_EB__)
>> -+# define @KWIML at _ABI_ENDIAN_ID @KWIML at _ABI_ENDIAN_ID_BIG
>> -+#elif defined(__XTENSA_EL__)
>> -+# define @KWIML at _ABI_ENDIAN_ID @KWIML at _ABI_ENDIAN_ID_LITTLE
>> -+
>> - /* Unknown CPU */
>> - #elif !defined(@KWIML at _ABI_NO_ERROR_ENDIAN)
>> - # error "Byte order of target CPU unknown."
>> --- 
>> -1.8.1.4
>> -
>> diff --git a/package/cmake/Config.in b/package/cmake/Config.in
>> index f3f0f85..6f04a4a 100644
>> --- a/package/cmake/Config.in
>> +++ b/package/cmake/Config.in
>> @@ -14,12 +14,14 @@ config BR2_PACKAGE_CMAKE_CTEST
>>  	bool "ctest"
>>  	select BR2_PACKAGE_CMAKE
>>  	select BR2_PACKAGE_ZLIB
>> +	select BR2_PACKAGE_JSONCPP
>>  	select BR2_PACKAGE_LIBCURL
>>  	select BR2_PACKAGE_LIBARCHIVE
>>  	select BR2_PACKAGE_EXPAT
>>  	select BR2_PACKAGE_BZIP2
>>  	select BR2_PACKAGE_XZ
>>  	depends on BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
>> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # from jsoncpp
>>  	depends on BR2_USE_WCHAR # libarchive
>>  	depends on BR2_INSTALL_LIBSTDCPP
>>  	depends on !BR2_STATIC_LIBS
>> @@ -32,6 +34,7 @@ config BR2_PACKAGE_CMAKE_CTEST
>>  
>>  	  http://www.cmake.org/
>>  
>> -comment "ctest needs a toolchain w/ C++, wchar, dynamic library"
>> +comment "ctest needs a toolchain w/ C++, wchar, dynamic library, gcc >= 4.7"
>>  	depends on BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
>> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || BR2_STATIC_LIBS
>> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
>> +		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
>> diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
>> index 76e03d3..9418b9d 100644
>> --- a/package/cmake/cmake.hash
>> +++ b/package/cmake/cmake.hash
>> @@ -1,2 +1,2 @@
>> -# Locally calculated
>> -sha256 45f4d3fa8a2f61cc092ae461aac4cac1bab4ac6706f98274ea7f314dd315c6d0 cmake-3.1.3.tar.gz
>> +# From http://www.cmake.org/files/v3.3/cmake-3.3.1-SHA-256.txt
>> +sha256	cd65022c6a0707f1c7112f99e9c981677fdd5518f7ddfa0f778d4cee7113e3d6	cmake-3.3.1.tar.gz
>> diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
>> index 9ca6443..12f4cad 100644
>> --- a/package/cmake/cmake.mk
>> +++ b/package/cmake/cmake.mk
>> @@ -4,14 +4,14 @@
>>  #
>>  ################################################################################
>>  
>> -CMAKE_VERSION_MAJOR = 3.1
>> -CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
>> +CMAKE_VERSION_MAJOR = 3.3
>> +CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
>>  CMAKE_SITE = http://www.cmake.org/files/v$(CMAKE_VERSION_MAJOR)
>>  CMAKE_LICENSE = BSD-3c
>>  CMAKE_LICENSE_FILES = Copyright.txt
>>  
>>  HOST_CMAKE_DEPENDENCIES = host-pkgconf
>> -CMAKE_DEPENDENCIES = zlib libcurl libarchive expat bzip2 xz
>> +CMAKE_DEPENDENCIES = zlib jsoncpp libcurl libarchive expat bzip2 xz
>>  
>>  CMAKE_CONF_OPTS = \
>>  	-DKWSYS_LFS_WORKS=TRUE \
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
