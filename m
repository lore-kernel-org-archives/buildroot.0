From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Wed, 8 May 2019 08:27:46 +0000
Subject: [Buildroot] [PATCH 1/1] package/exiv2: cleanup options and
 licenses
In-Reply-To: <bdcad4a5-2ba7-ed8c-8fc3-3de53bd2aa0d@mind.be>
References: <20190507103639.94701-1-nicolas.serafini@sensefly.com>
 <bdcad4a5-2ba7-ed8c-8fc3-3de53bd2aa0d@mind.be>
Message-ID: <20190508102742.0000138c@sensefly.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 8 May 2019 00:31:13 +0200 Arnout Vandecappelle <arnout@mind.be> wrote:

>
>
>On 07/05/2019 12:37, Nicolas Serafini wrote:
>> The current version of exiv2 no longer requires a commercial option
>> for lens database integration.
>
> Since when is this (IOW, should it be backported to 2019.02.x or not)?

The commit on which the 2019.02.x is based is before the change so no
need to backport. The 0.27 is the first release without the commercial
option.

>
>> 
>> Add the dedicated licence file for CMake script.
>> 
>> Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
>> ---
>>  package/exiv2/Config.in  | 19 ++-----------------
>>  package/exiv2/exiv2.hash |  1 +
>>  package/exiv2/exiv2.mk   | 16 +++++-----------
>>  3 files changed, 8 insertions(+), 28 deletions(-)
>> 
>> diff --git a/package/exiv2/Config.in b/package/exiv2/Config.in
>> index acce81c593..ddfa34261f 100644
>> --- a/package/exiv2/Config.in
>> +++ b/package/exiv2/Config.in
>> @@ -23,17 +23,6 @@ config BR2_PACKAGE_EXIV2
>>  
>>  if BR2_PACKAGE_EXIV2
>>  
>> -config BR2_PACKAGE_EXIV2_COMMERCIAL
>
> We normally add Config.in.legacy entries when an option is removed.
> In this
>case, however, the option is turned into always-enabled, so the legacy
>handling doesn't do much good. So your patch is OK here.
>
>> -	bool "Enable commercial"
>> -	help
>> -	  Build the commercial version for closed source project.
>> -
>> -	  The Nikon lens name database and the NLS support is
>> disabled
>> -	  for copyright reasons.
>> -
>> -	  A commercial license request is needed.
>> -
>> https://eur02.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.exiv2.org%2Fdownload.html%23license&amp;data=02%7C01%7Cnicolas.serafini%40sensefly.com%7Cbc84a910caa34d56b1c608d6d33bb835%7Cff7d991b392248038418ab806a3414a6%7C1%7C0%7C636928650779725754&amp;sdata=026wRV5K%2BN0vVI7QIwnVVSUyO9eH43nIXe8AcvGVLH0%3D&amp;reserved=0
>> - config BR2_PACKAGE_EXIV2_PNG
>>  	bool "PNG image support"
>>  	select BR2_PACKAGE_ZLIB
>> @@ -47,12 +36,8 @@ config BR2_PACKAGE_EXIV2_XMP
>>  	  Build with XMP support
>>  
>>  config BR2_PACKAGE_EXIV2_LENSDATA
>> -	bool "Nikon lens name database"
>> -	depends on !BR2_PACKAGE_EXIV2_COMMERCIAL
>> +	bool "Include lens data"
>
> How big is this lens data? Is it worth keeping an option for it?

Yes you are right we can remove it. The binary is only 80KB less with
the lensdata option disabled.

Do I need to add a Config.in.legacy option if I remove it. The default
state in exiv2 CMakeList is enabled.

>
>>  	help
>> -	  Integrate Nikon lens name database.
>> -
>> -	  This database is integrated but comes from a thirdparty:
>> -
>> https://eur02.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.rottmerhusen.com%2Fobjektives%2Flensid%2Fthirdparty.html&amp;data=02%7C01%7Cnicolas.serafini%40sensefly.com%7Cbc84a910caa34d56b1c608d6d33bb835%7Cff7d991b392248038418ab806a3414a6%7C1%7C0%7C636928650779725754&amp;sdata=2LCEQwMzSNygNE04lLVpFxtwPylRjtIsq3swI%2Ft4eOU%3D&amp;reserved=0.
>> +	  Build with lens data
>>  
>>  endif
>> diff --git a/package/exiv2/exiv2.hash b/package/exiv2/exiv2.hash
>> index f99cb8cb87..b753c03854 100644
>> --- a/package/exiv2/exiv2.hash
>> +++ b/package/exiv2/exiv2.hash
>> @@ -1,3 +1,4 @@
>>  # Locally calculated
>>  sha256
>> 1b3766b2c203ce213a4195de14d61694017ec1a69d15d4575bccecef130990fe
>> exiv2-0.27.1.tar.gz sha256
>> a7ba75cb966aca374711e2af49e5f3aea6a4443a803440f5d93e73a5a1222f66
>> COPYING +sha256
>> 46cde7dc11e64c78d650b4851b88f6704b4665ff60f22a1caf68ceb15e217e5b
>> COPYING-CMAKE-SCRIPTS diff --git a/package/exiv2/exiv2.mk
>> b/package/exiv2/exiv2.mk index ba9d9b7303..3aa2a9e088 100644 ---
>> a/package/exiv2/exiv2.mk +++ b/package/exiv2/exiv2.mk @@ -7,6 +7,8
>> @@ EXIV2_VERSION = 0.27.1 EXIV2_SITE = $(call
>> github,Exiv2,exiv2,$(EXIV2_VERSION)) EXIV2_INSTALL_STAGING = YES
>> +EXIV2_LICENSE = GPL-2.0+
>> +EXIV2_LICENSE_FILES = COPYING COPYING-CMAKE-SCRIPTS
>
> What is in this additional license file?

It's the the BSD-3-Clause licence for CMakeLists.txt,
config/FindEXPAT.cmake and config/FindMSGFMT.cmake files.
I have to add the BSD-3-Clause to EXIV2_LICENCE.

Thanks for your review.

Regards,
Nicolas

>
> Regards,
> Arnout
>
>>  
>>  EXIV2_CONF_OPTS += -DEXIV2_ENABLE_BUILD_SAMPLES=OFF
>>  
>> @@ -14,18 +16,10 @@ EXIV2_CONF_OPTS +=
>> -DEXIV2_ENABLE_BUILD_SAMPLES=OFF # test which is not allowed when
>> cross-compiling. EXIV2_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
>>  
>> -ifeq ($(BR2_PACKAGE_EXIV2_LENSDATA),)
>> -EXIV2_CONF_OPTS += -DEXIV2_ENABLE_LENSDATA=OFF
>> -endif
>> -
>> -ifeq ($(BR2_PACKAGE_EXIV2_COMMERCIAL),y)
>> -EXIV2_LICENSE = commercial
>> -# NLS support is disabled in commercial version due to the copyright
>> -# of the translated texts.
>> -EXIV2_CONF_OPTS += -DEXIV2_ENABLE_COMMERCIAL=ON
>> -DEXIV2_ENABLE_NLS=OFF +ifeq ($(BR2_PACKAGE_EXIV2_LENSDATA),y)
>> +EXIV2_CONF_OPTS += -DEXIV2_ENABLE_LENSDATA=ON
>>  else
>> -EXIV2_LICENSE = GPL-2.0+
>> -EXIV2_LICENSE_FILES = COPYING
>> +EXIV2_CONF_OPTS += -DEXIV2_ENABLE_LENSDATA=OFF
>>  endif
>>  
>>  ifeq ($(BR2_PACKAGE_EXIV2_PNG),y)
>> 
