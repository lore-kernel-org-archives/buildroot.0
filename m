From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 23 Feb 2020 14:35:52 +0100
Subject: [Buildroot] [PATCH] package/libsvgtiny: fix parallel build
In-Reply-To: <da794688-22a0-ef32-456a-7b39e8882c24@gmail.com>
References: <20200222214439.18588-1-giulio.benetti@benettiengineering.com>
 <da794688-22a0-ef32-456a-7b39e8882c24@gmail.com>
Message-ID: <bbd764c1-47dd-f110-1313-95c7259ea284@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 2/23/20 1:01 AM, Romain Naour wrote:
> Hi Giulio,
> 
> Le 22/02/2020 ? 22:44, Giulio Benetti a ?crit?:
>> Fix previous commit[1] which purpose was to fix parallel build. It
>> didn't work since it assigned $(MAKE1) to LIBSVGTINY_MAKE, but this is a
>> generic-package and building is done using $(MAKE), then LIBSVGTINY_MAKE
>> was ignored. Let's substitute instead $(MAKE) with $(MAKE1) in
>> LIBSVGTINY_BUILD_CMDS.
> 
> Nice catch!

Thanks for reviewing :-)

>>
>> [1]:
>> https://git.buildroot.net/buildroot/commit/?id=26d67a2599d6c88facd5178de853fa355244e7c2
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/67d/67d341c0cc272323d6e231a20796a6848c21d760/
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
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
> (*) here.
>>   define LIBSVGTINY_BUILD_CMDS
>> -	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=/usr \
> Usually comments are outside of the define (*)
>> +# Use $(MAKE1) since parallel build fails
>> +	$(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) PREFIX=/usr \
>>   		COMPONENT_TYPE=$(LIBSVGTINY_COMPONENT_TYPE)
> 
> I would add MAKE1 for other steps (LIBSVGTINY_INSTALL_STAGING_CMDS and
> LIBSVGTINY_INSTALL_TARGET_CMDS).

Yann already fixed everything and applied.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Best regards,
> Romain
> 
> 
>>   endef
>>   
>>
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
