From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Date: Fri, 17 Mar 2017 07:10:03 +0100
Subject: [Buildroot] [PATCH] libkcapi: new package
In-Reply-To: <eb8ef5fc-3f14-9e49-0553-ae6d01882868@imgtec.com>
References: <1489138282-28127-1-git-send-email-marcin.nowakowski@imgtec.com>
 <eb8ef5fc-3f14-9e49-0553-ae6d01882868@imgtec.com>
Message-ID: <02a9b349-afb8-afdc-21d6-ecbd4e01e4f5@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rahul,

On 16.03.2017 14:05, Rahul Bedarkar wrote:
> Hello,
>
> Some minor comments. See below.
>
> On Friday 10 March 2017 03:01 PM, Marcin Nowakowski wrote:
>> This package provides a userspace library that allows easy use of crypto
>> interfaces exposed by the kernel.
>>
>> A git tip is used instead of the last official release, as autotools
>> support and cross-compilation fixes have been added only very recently.
>>
>> Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
>> ---
>>  DEVELOPERS                     |  3 +++
>>  package/Config.in              |  1 +
>>  package/libkcapi/Config.in     | 11 +++++++++++
>>  package/libkcapi/libkcapi.hash |  2 ++
>>  package/libkcapi/libkcapi.mk   | 19 +++++++++++++++++++
>>  5 files changed, 36 insertions(+)
>>  create mode 100644 package/libkcapi/Config.in
>>  create mode 100644 package/libkcapi/libkcapi.hash
>>  create mode 100644 package/libkcapi/libkcapi.mk
>>
>> diff --git a/DEVELOPERS b/DEVELOPERS
>> index ff72ca1..cf24db8 100644
>> --- a/DEVELOPERS
>> +++ b/DEVELOPERS
>> @@ -991,6 +991,9 @@ F:    package/easydbus/
>>  F:    package/rs485conf/
>>  F:    package/turbolua/
>>
>> +N:    Marcin Nowakowski <marcin.nowakowski@imgtec.com>
>> +F:    package/libkcapi/
>> +
>>  N:    Marek Belisko <marek.belisko@open-nandra.com>
>>  F:    package/libatasmart/
>>  F:    package/polkit/
>> diff --git a/package/Config.in b/package/Config.in
>> index cfe7fc6..2e605f0 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -933,6 +933,7 @@ menu "Crypto"
>>      source "package/libgcrypt/Config.in"
>>      source "package/libgpg-error/Config.in"
>>      source "package/libgpgme/Config.in"
>> +    source "package/libkcapi/Config.in"
>>      source "package/libksba/Config.in"
>>      source "package/libmcrypt/Config.in"
>>      source "package/libmhash/Config.in"
>> diff --git a/package/libkcapi/Config.in b/package/libkcapi/Config.in
>> new file mode 100644
>> index 0000000..91402dd
>> --- /dev/null
>> +++ b/package/libkcapi/Config.in
>> @@ -0,0 +1,11 @@
>> +config BR2_PACKAGE_LIBKCAPI
>> +    bool "libkcapi"
>> +    help
>> +      Linux Kernel Crypto API userspace interface library
>> +
>> +      http://www.chronox.de/libkcapi.html
>> +
>> +config BR2_PACKAGE_LIBKCAPI_APPS
>> +    bool "libkcapi test applications"
>> +    depends on BR2_PACKAGE_LIBKCAPI
>> +
>
> Empty line at the end of Config.in file is not required.
>
> For consistency with other packages, add sub-option into if
> BR2_PACKAGE_LIBKCAPI ... endif statement.

Will do

>> diff --git a/package/libkcapi/libkcapi.hash
>> b/package/libkcapi/libkcapi.hash
>> new file mode 100644
>> index 0000000..3b08d3c
>> --- /dev/null
>> +++ b/package/libkcapi/libkcapi.hash
>> @@ -0,0 +1,2 @@
>> +# Locally calculated
>> +sha256
>> 77b53b5bd2b1f11a6b4be68d7b1129aac4efe476400cca6bcb94577d4d8850f3
>> libkcapi-94f741aa1dc6af1b45945786c8cc378a86bc9538.tar.gz
>> diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
>> new file mode 100644
>> index 0000000..b656ebf
>> --- /dev/null
>> +++ b/package/libkcapi/libkcapi.mk
>> @@ -0,0 +1,19 @@
>> +################################################################################
>>
>> +#
>> +# libkcapi
>> +#
>> +################################################################################
>>
>> +
>> +LIBKCAPI_VERSION = 94f741aa1dc6af1b45945786c8cc378a86bc9538
>> +LIBKCAPI_SITE = $(call github,smuellerDD,libkcapi,$(LIBKCAPI_VERSION))
>> +LIBKCAPI_AUTORECONF = YES
>> +LIBKCAPI_AUTORECONF_OPTS = -i
>
> I can build package without LIBKCAPI_AUTORECONF_OPTS. I think it is not
> required because AUTORECONF variable in package/autoconf/autoconf.mk
> already has -i option in it.

Indeed, I haven't noticed it.

>> +LIBKCAPI_INSTALL_STAGING = YES
>> +LIBKCAPI_LICENSE = BSD-3c or GPLv2
>> +LIBKCAPI_LICENSE_FILES = COPYING
>
> There are other two license files COPYING.bsd and COPYING.gplv2. I think
> we should add these as well to LIBKCAPI_LICENSE_FILES variable. Because,
> even though COPYING file contain BSD-3c license text, it doesn't have
> full GPLv2 license text.

But the COPYING file already states that it can be licensed under GPLv2, 
so I don't think it's necessary. On the other hand it won't do any harm 
to copy the files so I can add all here ...

thanks
Marcin
