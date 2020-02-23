From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 23 Feb 2020 14:36:34 +0100
Subject: [Buildroot] [PATCH] package/libsvgtiny: fix parallel build
In-Reply-To: <20200223074849.GC8743@scaer>
References: <20200222214439.18588-1-giulio.benetti@benettiengineering.com>
 <20200223074849.GC8743@scaer>
Message-ID: <9f22a7ba-7a56-3a7b-0116-b14df647cbd0@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2/23/20 8:48 AM, Yann E. MORIN wrote:
> Giulio, All,
> 
> On 2020-02-22 22:44 +0100, Giulio Benetti spake thusly:
>> Fix previous commit[1] which purpose was to fix parallel build. It
>> didn't work since it assigned $(MAKE1) to LIBSVGTINY_MAKE, but this is a
>> generic-package and building is done using $(MAKE), then LIBSVGTINY_MAKE
>> was ignored. Let's substitute instead $(MAKE) with $(MAKE1) in
>> LIBSVGTINY_BUILD_CMDS.
>>
>> [1]:
>> https://git.buildroot.net/buildroot/commit/?id=26d67a2599d6c88facd5178de853fa355244e7c2
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/67d/67d341c0cc272323d6e231a20796a6848c21d760/
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Applied to master, after fixing the nits noticed by Romain. Thanks!

Thank you for fixing!

Kinds regards
-- 
Giulio Benetti
Benetti Engineering sas

> Regards,
> Yann E. MORIN.
> 
>> ---
>>   package/libsvgtiny/libsvgtiny.mk | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
>> index fe7dc0a6d2..a2165d5b7e 100644
>> --- a/package/libsvgtiny/libsvgtiny.mk
>> +++ b/package/libsvgtiny/libsvgtiny.mk
>> @@ -12,8 +12,6 @@ LIBSVGTINY_DEPENDENCIES = \
>>   	libxml2 host-gperf host-pkgconf host-netsurf-buildsystem
>>   LIBSVGTINY_LICENSE = MIT
>>   LIBSVGTINY_LICENSE_FILES = README
>> -# Package does not build in parallel due to improper make rules
>> -LIBSVGTINY_MAKE = $(MAKE1)
>>   
>>   # The libsvgtiny build system cannot build both the shared and static
>>   # libraries. So when the Buildroot configuration requests to build
>> @@ -29,7 +27,8 @@ define LIBSVGTINY_CONFIGURE_CMDS
>>   endef
>>   
>>   define LIBSVGTINY_BUILD_CMDS
>> -	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=/usr \
>> +# Use $(MAKE1) since parallel build fails
>> +	$(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) PREFIX=/usr \
>>   		COMPONENT_TYPE=$(LIBSVGTINY_COMPONENT_TYPE)
>>   endef
>>   
>> -- 
>> 2.20.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
