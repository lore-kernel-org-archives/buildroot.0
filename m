From: Romain Naour <romain.naour@smile.fr>
Date: Mon, 3 Feb 2020 17:46:48 +0100
Subject: [Buildroot] [PATCH] package/open62541: new package
In-Reply-To: <CAEyMn7ZrcGvbNjT1SETefM_Oz3RouTs6BURb5bQ75TJv-uVKpw@mail.gmail.com>
References: <1579212339-5234-1-git-send-email-yann.cardaillac@smile.fr>
 <CAEyMn7ZrcGvbNjT1SETefM_Oz3RouTs6BURb5bQ75TJv-uVKpw@mail.gmail.com>
Message-ID: <24ff2724-0e6f-a564-5df9-a152a9197908@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Heiko, Yann, All,

Le 03/02/2020 ? 17:05, Heiko Thiery a ?crit?:
> Hi Yann,
> 
> Am Do., 16. Jan. 2020 um 23:05 Uhr schrieb Yann CARDAILLAC
> <yann.cardaillac@smile.fr>:
>>
>> From: Yann CARDAILLAC <ycardaillac@sepro-group.com>
>>
>> Signed-off-by: Yann CARDAILLAC <ycardaillac@sepro-group.com>
>> Signed-off-by: Romain Naour <romain.naour@smile.fr>
>> ---
[...]
>> diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
>> new file mode 100644
>> index 0000000000..b3d2eb7dd5
>> --- /dev/null
>> +++ b/package/open62541/open62541.mk
>> @@ -0,0 +1,57 @@
>> +################################################################################
>> +#
>> +# open62541
>> +#
>> +################################################################################
>> +
>> +OPEN62541_VERSION = v1.0
>> +OPEN62541_SITE_METHOD = git
>> +OPEN62541_SITE = git://github.com/open62541/open62541.git
>> +OPEN62541_GIT_SUBMODULES = YES
>> +OPEN62541_INSTALL_STAGING = YES
>> +OPEN62541_LICENSE = MPL-2.0
>> +OPEN62541_LICENSE_FILES = LICENSE
>> +
>> +# Don't use git discribe to get the version number.
>> +OPEN62541_CONF_OPTS += -DGIT_EXECUTABLE=NO \
>> +       -DOPEN62541_VERSION=$(OPEN62541_VERSION)
> 
> I think you should not use the '+'  for the first time.
> 
> 
> On the other hand I tried to build the package with a compiler without
> c++ suport and it fails.
> I just did a 'make defconfig', 'make menuconfig' with selecting the
> open62541 package and it fails.
> 
> At least there seems to be a missing 'C' in the CMakefile.txt.
> 
> --- a/CMakeLists.txt
> +++ b/CMakeLists.txt
> @@ -1,5 +1,5 @@
>  cmake_minimum_required(VERSION 3.0...3.12)
> -project(open62541)
> +project(open62541 C)
>  # set(CMAKE_VERBOSE_MAKEFILE ON)
>  if(${CMAKE_VERSION} VERSION_LESS 3.12)
>      cmake_policy(VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION})
> 
> But then it fails with an missing compiler option (ssp).
> 
> Should we even support building on c only compiler?

Thanks for the review.

By default, the ssp support is not enabled when you build a toolchain.
But the hardening option of this package (UA_ENABLE_HARDENING) is enabled by
default, so it add several hardening option even if the toolchain doesn't
support it.

I would suggest to disable it from the package (-DUA_ENABLE_HARDENING=OFF) and
let Buildroot (and its toolchain wrapper) handling the hardening support.

Best regards,
Romain

> 
> --
> Heiko
> 
> 
