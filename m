From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 19 May 2018 21:01:48 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/exim: remove libnsl linking
 and fix native tools build
In-Reply-To: <20180517072627.wkekm5mbofgjo36h@tarshish>
References: <20180517072140.6432-1-romain.naour@gmail.com>
 <20180517072627.wkekm5mbofgjo36h@tarshish>
Message-ID: <775bdd3d-e233-0347-8a02-d5ee2c08d3ca@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Le 17/05/2018 ? 09:26, Baruch Siach a ?crit?:
> Hi Romain,
> 
> On Thu, May 17, 2018 at 09:21:39AM +0200, Romain Naour wrote:
> 
> [snip]
> 
>> -# only glibc provides libnsl, remove -lnsl for all other toolchains
>> +# Only Exim's nis.so and nisplus.so lookup modules require libnsl,
>> +# but they are not build by default.
>> +# libnsl has been deprecated from Glibc and no other libc provide it.
>> +# There is no libnsl package in Buildroot yet.
>> +# Remove -lnsl for all toolchains.
>>  # http://bugs.exim.org/show_bug.cgi?id=1564
>> -ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
>> +# This also fixes a host build issue on recent distributions where
>> +# libnsl is not installed by default.
>>  define EXIM_REMOVE_LIBNSL_FROM_MAKEFILE
>>  	$(SED) 's/-lnsl//g' $(@D)/OS/Makefile-Linux
>>  endef
>> -endif
> 
> It only occurred to me now. Since this is now unconditional we should use a 
> regular patch. sed is used here only because the modification used to be 
> conditional, and we don't do conditional patching. But this no longer holds.

Ok, It's done in the v4.
Thanks for the review!

Best regards,
Romain

> 
>>  # musl does not provide struct ip_options nor struct ip_opts (but it is
>>  # available with both glibc and uClibc)
> 
> baruch
> 
