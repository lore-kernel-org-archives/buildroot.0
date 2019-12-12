From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Thu, 12 Dec 2019 23:59:24 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/avro-c: new package
In-Reply-To: <CAKcgs2z14-aa9GppZWOS6iO8G-MNeaL2bTa383QUicXPSHV2Mw@mail.gmail.com>
References: <20191212124143.220947-1-titouan.christophe@railnova.eu>
 <20191212124143.220947-2-titouan.christophe@railnova.eu>
 <CAKcgs2z14-aa9GppZWOS6iO8G-MNeaL2bTa383QUicXPSHV2Mw@mail.gmail.com>
Message-ID: <1f2a799f-7b76-fd38-3674-180dbdb7fa23@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Good evening Gilles,

Thank you again for reviewing this series thoroughly.

On 12/12/19 9:49 PM, Gilles Talis wrote:
> Hello Titouan, all,
> 
> Thanks for taking my first set of comments into account.
> Please find new ones.
> 
> Le jeu. 12 d?c. 2019 ? 13:42, Titouan Christophe
> <titouan.christophe@railnova.eu> a ?crit :

[snip]

> $ ./utils/check-package package/avro-c/* returns the following warning
> package/avro-c/0001-Compile-on-musl.patch:4: generate your patches
> with 'git format-patch -N'
> 79 lines processed
> 1 warnings generated
> Can you please fix it?
> 

My bad, I use `make check-package`; which only looks for .mk, .hash and 
Config files; hence why I did not see this warning.

>> +
>> diff --git a/package/avro-c/Config.in b/package/avro-c/Config.in
>> new file mode 100644
>> index 0000000000..a21446186a
>> --- /dev/null
>> +++ b/package/avro-c/Config.in
>> @@ -0,0 +1,20 @@
>> +config BR2_PACKAGE_AVRO_C
>> +       bool "avro"
> I would go for "avro-c"
> 
>> +       depends on !BR2_STATIC_LIBS
> A comment at the end or beginning of the file mentioning that the
> package needs a library with dynamic library would be nice
> If you could also quickly explain why the package can't be statically
> compiled, that'd be great.

It looks to me that avro-c unconditionally builds shared libs when not 
compiling for Windows 
(https://github.com/apache/avro/blob/release-1.9.1/lang/c/src/CMakeLists.txt#L91-L99), 
regardless the value of BUILD_SHARED_LIBS (see 
https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_cmake_based_packages 
and https://cmake.org/cmake/help/latest/command/add_library.html).

Unless static support is really needed, I wouldn't engage myself in a 
CMake fight for now.

[snip]

>> diff --git a/package/avro-c/avro-c.mk b/package/avro-c/avro-c.mk
>> new file mode 100644
>> index 0000000000..2ca01ecef5
>> --- /dev/null
>> +++ b/package/avro-c/avro-c.mk
>> @@ -0,0 +1,14 @@
>> +################################################################################
>> +#
>> +# avro-c
>> +#
>> +################################################################################
>> +
>> +AVRO_C_VERSION = 1.9.1
> If you plan to update avro-c and python-avro at the same time, sharing
> the same version variable would be handy
> 
>> +AVRO_C_SITE = https://www-eu.apache.org/dist/avro/avro-$(AVRO_C_VERSION)/c
>> +AVRO_C_LICENSE = Apache-2.0
>> +AVRO_C_LICENSE_FILES = LICENSE NOTICE
> It should only be LICENSE
>> +AVRO_C_INSTALL_STAGING = YES
>> +AVRO_C_DEPENDENCIES = jansson
> zib, snappy and lzma are non-required dependencies. Do you want to
> make them dependencies for this package if they are enabled?

Indeed, thank you for pointing it out.

> 
>> +
>> +$(eval $(cmake-package))
>> --
>> 2.23.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> Thanks
> Gilles.
> 

I'll resend a new version soon.

Best regards,

Titouan
