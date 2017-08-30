From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 30 Aug 2017 23:07:57 +0200
Subject: [Buildroot] [PATCH 6/7] package/gcc: enable float128 on
 powerpc64le with glibc >= 2.26 toolchains
In-Reply-To: <20170830225122.1b9bb0b8@windsurf.lan>
References: <20170827173606.13144-1-romain.naour@gmail.com>
 <20170827173606.13144-7-romain.naour@gmail.com>
 <20170830225122.1b9bb0b8@windsurf.lan>
Message-ID: <9c637bce-d8fd-62eb-51ff-281dd1863915@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 30/08/2017 ? 22:51, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Sun, 27 Aug 2017 19:36:05 +0200, Romain Naour wrote:
>> float128 is now required on powerpc64le with glibc >= 2.26 toolchains.
>>
>> Fixes:
>> running configure fragment for sysdeps/gnu
>> running configure fragment for sysdeps/powerpc/powerpc64le
>> checking if [...]powerpc64le-buildroot-linux-gnu-gcc supports binary128 floating point type... no
>> checking if the target machine is at least POWER8... yes
>> configure: error: ***  binary128 floating point type (GCC >= 6.2) is required on powerpc64le.
>>
>> In order to prepare the glibc bump to this version, we enable
>> binary128 floating point in gcc. This require at least gcc >= 6.2.
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> ---
>>  package/gcc/gcc.mk | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
>> index 49ccccf..54ef70c 100644
>> --- a/package/gcc/gcc.mk
>> +++ b/package/gcc/gcc.mk
>> @@ -254,6 +254,14 @@ HOST_GCC_COMMON_CONF_OPTS += \
>>  	--without-long-double-128
>>  endif
>>  
>> +# Since glibc >= 2.26, poerpc64le requires double/long double which
> 
> Typo: powerpc64le.
> 
>> +# requires at least gcc 6.2.
>> +# See sysdeps/powerpc/powerpc64le/configure.ac
>> +ifeq ($(BR2_TOOLCHAIN_USES_GLIBC)$(BR2_TOOLCHAIN_GCC_AT_LEAST_6)$(BR2_powerpc64le),yyy)
> 
> So what happens if I build a gcc 5.x / glibc 2.26 / powerpc64le
> toolchain ?

As far I understand from the error message, using gcc 5.x with glibc 2.26 on
powerpc64le should not be allowed.

I'll fix this.

Thanks for the review.

Best regards,
Romain

> 
> Thomas
> 
