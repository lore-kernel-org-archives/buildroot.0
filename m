From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 6 Jul 2017 19:06:43 +0200
Subject: [Buildroot] [PATCH] package/linuxptp: remove incdefs.sh to
 avoid cross-compilation issues
In-Reply-To: <7b3079cb-f604-6ab2-3da7-448dacf9ef55@jikos.cz>
References: <20170705141028.28194-1-romain.naour@smile.fr>
 <7b3079cb-f604-6ab2-3da7-448dacf9ef55@jikos.cz>
Message-ID: <6827f8c2-c2dc-5727-1844-109bd321a498@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Petr,

Le 05/07/2017 ? 19:12, Petr Kulhavy a ?crit :
> Hi Romain,
> 
> thank you for the patch. A few comments from my side.
> 
> Setting the headers dependency is a good thing.
> The package homepage says the minimum required kernel version is 3.0. So the
> limit can be set to that. Kernel headers 3.2 seem to be too restrictive.

The incdefs.sh script is greping for HWTSTAMP_TX_ONESTEP_SYNC define in the
linux/net_tstamp.h kernel header. The define was added to the 3.2 kernel release.
But you're right, it's too restrictive since, when the define is missing in the
kernel header, it's defined in missing.h.

> 
> What else was exactly failing in your case? Maybe there are some improvements I
> can propose to the package mainstream?

While looking at the issue I made some changes that make me believe that
CROSS_COMPILE was not defined while incdefs.sh was called.

With Yann, we looked at the issue after I published this patch to the mailing
list. We fixed the build issue and I'll send a v2 shortly.

But, we think that greping in a header is not a good practice.
To check if a define is available or not the build system should try to build a
small code including the header. A build system like autotools and CMake can be
used to do so.

Maybe you can try to upstream a new build system ?

> Certainly hard-coding these the literals is not optimal. It might work for you
> but fail in other configurations...

I've tested this patch with test-pkg script, so it fix the build issue.

Best regards,
Romain

> 
> Regards
> Petr
> 
> On 05/07/17 16:10, Romain Naour wrote:
>> incdefs.sh try to define some flags based on some build tests and
>> by checking a kernel header. It doesn't work well while cross-compiling.
>>
>> The Buildroot buildsystem define these definition directly
>> in the EXTRA_CFLAGS.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/364/36470db2c262d2e1fda5144a08cfe221831e093e
>>
>>
>> Signed-off-by: Romain Naour <romain.naour@smile.fr>
>> ---
>>   ...move-incdefs.sh-to-avoid-cross-compilatio.patch | 31 ++++++++++++++++++++++
>>   package/linuxptp/Config.in                         |  4 +++
>>   package/linuxptp/linuxptp.mk                       | 10 +++++--
>>   3 files changed, 43 insertions(+), 2 deletions(-)
>>   create mode 100644
>> package/linuxptp/0001-makefile-remove-incdefs.sh-to-avoid-cross-compilatio.patch
>>
>> diff --git
>> a/package/linuxptp/0001-makefile-remove-incdefs.sh-to-avoid-cross-compilatio.patch
>> b/package/linuxptp/0001-makefile-remove-incdefs.sh-to-avoid-cross-compilatio.patch
>>
>> new file mode 100644
>> index 0000000..cc932b4
>> --- /dev/null
>> +++
>> b/package/linuxptp/0001-makefile-remove-incdefs.sh-to-avoid-cross-compilatio.patch
>>
>> @@ -0,0 +1,31 @@
>> +From 0759b36ad0a728a49f329fa0e7e6173fe3ccb657 Mon Sep 17 00:00:00 2001
>> +From: Romain Naour <romain.naour@smile.fr>
>> +Date: Wed, 5 Jul 2017 15:37:22 +0200
>> +Subject: [PATCH] makefile: remove incdefs.sh to avoid cross-compilation issues
>> +
>> +The Buildroot buildsystem define these definition directly
>> +in the EXTRA_CFLAGS.
>> +
>> +Fixes:
>> +http://autobuild.buildroot.net/results/364/36470db2c262d2e1fda5144a08cfe221831e093e
>>
>> +
>> +Signed-off-by: Romain Naour <romain.naour@smile.fr>
>> +---
>> + makefile | 1 -
>> + 1 file changed, 1 deletion(-)
>> +
>> +diff --git a/makefile b/makefile
>> +index f898336..5912f9a 100644
>> +--- a/makefile
>> ++++ b/makefile
>> +@@ -33,7 +33,6 @@ OBJECTS    = $(OBJ) hwstamp_ctl.o phc2sys.o phc_ctl.o pmc.o
>> pmc_common.o \
>> + SRC    = $(OBJECTS:.o=.c)
>> + DEPEND    = $(OBJECTS:.o=.d)
>> + srcdir    := $(dir $(lastword $(MAKEFILE_LIST)))
>> +-incdefs := $(shell $(srcdir)/incdefs.sh)
>> + version := $(shell $(srcdir)/version.sh $(srcdir))
>> + VPATH    = $(srcdir)
>> +
>> +--
>> +2.9.4
>> +
>> diff --git a/package/linuxptp/Config.in b/package/linuxptp/Config.in
>> index 3e18a0c..8c9d684 100644
>> --- a/package/linuxptp/Config.in
>> +++ b/package/linuxptp/Config.in
>> @@ -1,5 +1,6 @@
>>   config BR2_PACKAGE_LINUXPTP
>>       bool "linuxptp"
>> +    depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
>>       help
>>         The Linux PTP Project is the Precision Time Protocol
>>         implementation according to IEEE standard 1588 for Linux.
>> @@ -11,3 +12,6 @@ config BR2_PACKAGE_LINUXPTP
>>         not a goal.
>>           http://linuxptp.sourceforge.net/
>> +
>> +comment "linuxptp needs a toolchain w/ headers >= 3.2"
>> +    depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
>> diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
>> index beb2591..35702e0 100644
>> --- a/package/linuxptp/linuxptp.mk
>> +++ b/package/linuxptp/linuxptp.mk
>> @@ -10,10 +10,16 @@ LINUXPTP_SITE = git://git.code.sf.net/p/linuxptp/code
>>   LINUXPTP_LICENSE = GPL-2.0+
>>   LINUXPTP_LICENSE_FILES = COPYING
>>   +# incdefs.sh doesn't work for cross-compilation.
>> +# Define HAVE_ONESTEP_SYNC in EXTRA_CFLAGS directly and depends on
>> +# kernel headers >= 3.2.
>>   define LINUXPTP_BUILD_CMDS
>>       $(TARGET_MAKE_ENV) CROSS_COMPILE="$(TARGET_CROSS)" \
>> -        $(MAKE) KBUILD_OUTPUT=$(TARGET_DIR) \
>> -        EXTRA_CFLAGS="$(TARGET_CFLAGS)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
>> +        $(MAKE) \
>> +        EXTRA_CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE \
>> +            -DHAVE_ONESTEP_SYNC -DHAVE_CLOCK_ADJTIME \
>> +            -DHAVE_POSIX_SPAWN" \
>> +        EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
>>           -C $(@D) all
>>   endef
>>   
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
