From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Tue, 7 Apr 2020 09:16:39 +0200
Subject: [Buildroot] [PATCH] package/libminizip: new package
In-Reply-To: <20200407060433.GA22325@scaer>
References: <20200406183559.130627-1-b.bilas@grinn-global.com>
 <20200407060433.GA22325@scaer>
Message-ID: <47cf1b5b-79b5-c3dc-f648-35ba96383d56@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On 07.04.2020 08:04, Yann E. MORIN wrote:
> Bartosz, All,
>
> On 2020-04-06 20:35 +0200, Bartosz Bilas spake thusly:
>> libminizip is a minimalistic library that supports compressing,
>> extracting, viewing, and manipulating zip files.
>>
>> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> How is it different from package/minizip/ ?

That's the old, original version of minizip which contains some of 
necessary headers such as unzip.h which is required for one of 
buildroot's package which started failing due to lack of it. The current 
version of minizip doesn't have it unfortunately. Therefore I decided to 
create a new-separate package to provide that library only. I was 
wondering how to handle that, using the existing minizip/libzlib package 
but nothing good came my mind :/ So it would be great if you had some 
idea? :)

[0] 
http://autobuild.buildroot.net/results/65fa719e8b2466409a12eb103a8938e1488efc0c

>
> I've marked as "not applicable", then.
>
> Regards,
> Yann E. MORIN.
>
>> ---
>>   DEVELOPERS                         |  1 +
>>   package/Config.in                  |  1 +
>>   package/libminizip/Config.in       | 11 +++++++++++
>>   package/libminizip/libminizip.hash |  2 ++
>>   package/libminizip/libminizip.mk   | 15 +++++++++++++++
>>   5 files changed, 30 insertions(+)
>>   create mode 100644 package/libminizip/Config.in
>>   create mode 100644 package/libminizip/libminizip.hash
>>   create mode 100644 package/libminizip/libminizip.mk
>>
>> diff --git a/DEVELOPERS b/DEVELOPERS
>> index e9ac2b7460..b6243276a3 100644
>> --- a/DEVELOPERS
>> +++ b/DEVELOPERS
>> @@ -282,6 +282,7 @@ F:	package/orbit/
>>   N:	Bartosz Bilas <b.bilas@grinn-global.com>
>>   F:	board/stmicroelectronics/stm32mp157a-dk1/
>>   F:	configs/stm32mp157a_dk1_defconfig
>> +F:	package/libminizip/
>>   F:	package/python-esptool/
>>   F:	package/python-pyaes/
>>   F:	package/qt5/qt5scxml/
>> diff --git a/package/Config.in b/package/Config.in
>> index 373868ca82..95727396ea 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -1278,6 +1278,7 @@ endmenu
>>   
>>   menu "Compression and decompression"
>>   	source "package/libarchive/Config.in"
>> +	source "package/libminizip/Config.in"
>>   	source "package/libmspack/Config.in"
>>   	source "package/libsquish/Config.in"
>>   	source "package/libzip/Config.in"
>> diff --git a/package/libminizip/Config.in b/package/libminizip/Config.in
>> new file mode 100644
>> index 0000000000..5307db3c4f
>> --- /dev/null
>> +++ b/package/libminizip/Config.in
>> @@ -0,0 +1,11 @@
>> +config BR2_PACKAGE_LIBMINIZIP
>> +	bool "libminizip"
>> +	select BR2_PACKAGE_ZLIB
>> +	help
>> +	  LibMinizip is a minimalistic library that supports compressing,
>> +	  extracting, viewing, and manipulating zip files.
>> +
>> +	  This package includes development support files
>> +	  for the minizip library.
>> +
>> +	  http://www.winimage.com/zLibDll/minizip.html
>> diff --git a/package/libminizip/libminizip.hash b/package/libminizip/libminizip.hash
>> new file mode 100644
>> index 0000000000..1aa87a2901
>> --- /dev/null
>> +++ b/package/libminizip/libminizip.hash
>> @@ -0,0 +1,2 @@
>> +# Locally computed
>> +sha256  78d87c463dd6bd446292fe0d3ee72878355b3b7fa52add5722671dfe9290f262  libminizip-1.1.tar.gz
>> diff --git a/package/libminizip/libminizip.mk b/package/libminizip/libminizip.mk
>> new file mode 100644
>> index 0000000000..6ae3c6cb01
>> --- /dev/null
>> +++ b/package/libminizip/libminizip.mk
>> @@ -0,0 +1,15 @@
>> +################################################################################
>> +#
>> +# libminizip
>> +#
>> +################################################################################
>> +
>> +LIBMINIZIP_VERSION = 1.1
>> +LIBMINIZIP_SITE = $(call github,nmoinvaz,minizip,$(LIBMINIZIP_VERSION))
>> +LIBMINIZIP_DEPENDENCIES = zlib
>> +LIBMINIZIP_AUTORECONF = YES
>> +LIBMINIZIP_INSTALL_STAGING = YES
>> +LIBMINIZIP_LICENSE = Zlib
>> +LIBMINIZIP_LICENSE_FILES = LICENSE
>> +
>> +$(eval $(autotools-package))
>> -- 
>> 2.26.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
Best
Bartek
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200407/b693f632/attachment.html>
