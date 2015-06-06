From: Tomasz Gorochowik <tomasz.gorochowik@gmail.com>
Date: Sun, 7 Jun 2015 00:24:34 +0200
Subject: [Buildroot] [PATCH 1/1] eudev: add cxx dependency
In-Reply-To: <20150606210404.GH3581@free.fr>
References: <1433616116-30527-1-git-send-email-tomasz.gorochowik@gmail.com>
 <20150606210404.GH3581@free.fr>
Message-ID: <CAJ4oOgypx858taa1cef4uivge-jyS07WZ=5R2=g-w_MaVWjxMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

> eudev is written entirely in C, not C++.
>
> What is the problem yuou are trying to fix?

I might be misinterpreting something, but here's what I do.

Mininal config changes I make to reproduce the error:

Target architecture: ARM (little endian)
Architecture variant: cortex-A9
Toolchain -> Enable WCHAR support
Target -> /dev management: eudev

Builduing this config ends with an eudev error.
The interesting part of output/build/eudev-3.0/config.log:

configure:13481: checking how to run the C++ preprocessor
[...]
configure:13597: error: in `/tmp/buildroot/output/build/eudev-3.0':
configure:13599: error: C++ preprocessor "/lib/cpp" fails sanity check

This issue gets fixed if I enable BR2_TOOLCHAIN_BUILDROOT_CXX.

Please let me know if I'm missing something obvious, maybe some flag should be
set somewhere instead of enabling cxx support?

Regards,
Tomasz Gorochowik


2015-06-06 23:04 GMT+02:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> Tomasz, All,
>
> On 2015-06-06 20:41 +0200, Tomasz Gorochowik spake thusly:
>> Dynamic /dev management using eudev requires c++ support
>

>
> Regards,
> Yann E. MORIN.
>
>> Signed-off-by: Tomasz Gorochowik <tomasz.gorochowik@gmail.com>
>> ---
>>  system/Config.in | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/system/Config.in b/system/Config.in
>> index 84cde94..9ef3897 100644
>> --- a/system/Config.in
>> +++ b/system/Config.in
>> @@ -114,13 +114,14 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
>>  config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
>>       bool "Dynamic using eudev"
>>       depends on BR2_USE_WCHAR
>> +     depends on BR2_TOOLCHAIN_BUILDROOT_CXX
>>       depends on !BR2_STATIC_LIBS
>>       depends on BR2_USE_MMU # eudev
>>       select BR2_PACKAGE_EUDEV
>>
>> -comment "eudev needs a toolchain w/ wchar, dynamic library"
>> +comment "eudev needs a toolchain w/ wchar, cxx, dynamic lib"
>>       depends on BR2_USE_MMU
>> -     depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
>> +     depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_BUILDROOT_CXX || BR2_STATIC_LIBS
>>
>>  endchoice
>>
>> --
>> 2.4.2
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
