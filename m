From: Tomi Valkeinen <tomi.valkeinen@iki.fi>
Date: Wed, 2 Dec 2020 13:14:19 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/kmsxx: bump to latest
In-Reply-To: <20201201224931.2e8693e8@gmx.net>
References: <20201021082012.1592809-1-tomi.valkeinen@iki.fi>
 <20201201224931.2e8693e8@gmx.net>
Message-ID: <328fc7ab-06f1-6e60-dd72-b054305e7085@iki.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/12/2020 23:49, Peter Seiderer wrote:

>> diff --git a/package/kmsxx/Config.in b/package/kmsxx/Config.in
>> index 1d174c18b1..0b3013a171 100644
>> --- a/package/kmsxx/Config.in
>> +++ b/package/kmsxx/Config.in
>> @@ -1,12 +1,13 @@
>>  config BR2_PACKAGE_KMSXX
>>  	bool "kms++"
>> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
>> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
> 
> Because of the c++17 option? No test-pkg failure detected without it...

gcc web page said "C++17 features are available since GCC 5".

>> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
> 
> Searched for 'fatal error: linux/dma-buf.h: No such file or directory', found
> 	https://bugs.chromium.org/p/chromium/issues/detail?id=707604
> suggesting at least 4.11...

If I recall right, I looked at the kernel tag in which dma-buf.h was added (kernel commit
c11e391da2a8fe973c3c2398452000bed505851e). Should be in v4.10.

But the link you gave indicates otherwise. I'm confused... I guess it's safer to just increase it to
4.11.

>>  	depends on BR2_INSTALL_LIBSTDCPP
>>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
>>  	select BR2_PACKAGE_LIBDRM
>>  	help
>> -	  libkms++ is a C++11 library for kernel mode setting.
>> +	  libkms++ is a C++17 library for kernel mode setting with Python
>> +	  bindings.
>>
>>  	  Also included are simple test tools for KMS.
>>
>> @@ -14,13 +15,26 @@ config BR2_PACKAGE_KMSXX
>>
>>  if BR2_PACKAGE_KMSXX
>>
>> -config BR2_PACKAGE_KMSXX_INSTALL_TESTS
>> -	bool "Install test programs"
>> +config BR2_PACKAGE_KMSXX_UTILS
>> +	bool "Install kms++utils library and utilities"
>> +	default y
> 
> Rename of an option needs Config.in.legacy handling...

Ok. I haven't looked at how that's done yet. Is it just simpler to keep the old config option?
"test" didn't quite match what I think the installed binaries are, so I thought to rename it, but
it's really not a big thing for me.

>>  	help
>> -	  This option allows to install the kmsxx test programs.
>> +	  This option installs the kms++ utilities.
>> +
>> +config BR2_PACKAGE_KMSXX_PYTHON
>> +	bool "Install kms++ python bindings"
>> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
>> +	depends on !BR2_PACKAGE_PYTHON # python3
>> +	depends on BR2_USE_WCHAR # python3
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
>> +	depends on BR2_USE_MMU # python3
>> +	depends on !BR2_STATIC_LIBS # python3
>> +	select BR2_PACKAGE_PYTHON3
>> +	help
>> +	  This option installs the kms++ python bindings.
> 
> Better done in an separate patch...

Ok.

 Tomi
