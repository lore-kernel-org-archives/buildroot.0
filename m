From: =?UTF-8?Q?Vincent_Stehl=c3=a9?= <vincent.stehle@laposte.net>
Date: Mon, 3 Jul 2017 22:47:28 +0200
Subject: [Buildroot] [PATCH] uftrace: new package
In-Reply-To: <a744ab11-02b0-6ed6-c975-b3816ca3bf50@smile.fr>
References: <20170625193743.8424-1-vincent.stehle@laposte.net>
 <a744ab11-02b0-6ed6-c975-b3816ca3bf50@smile.fr>
Message-ID: <0d61249c-aa82-f9c7-8b38-7d012d20a9b8@bergerie>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/03/2017 04:45 PM, Romain Naour wrote:
> Hi Vincent,
> 

Hi Romain,

Thank you for reviewing!

> Le 25/06/2017 ? 21:37, Vincent Stehle a ?crit :
>> From: Vincent Stehl? <vincent.stehle@laposte.net>
>>
>> Add a package for uftrace, a simple function call tracer for user programs.
>>
>> The x86_64 and arm/aarch64 architectures are supported.
>>
>> Tracing necessitates that the executable you want to trace be compiled with
>> -pg or -finstrument-functions option.
>>
>> See https://github.com/namhyung/uftrace
>>
>> Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
>> ---
>>  DEVELOPERS                   |  3 ++-
>>  package/Config.in            |  1 +
>>  package/uftrace/Config.in    | 20 ++++++++++++++++++++
>>  package/uftrace/uftrace.hash |  2 ++
>>  package/uftrace/uftrace.mk   | 28 ++++++++++++++++++++++++++++
>>  5 files changed, 53 insertions(+), 1 deletion(-)
>>  create mode 100644 package/uftrace/Config.in
>>  create mode 100644 package/uftrace/uftrace.hash
>>  create mode 100644 package/uftrace/uftrace.mk
>>
>> diff --git a/DEVELOPERS b/DEVELOPERS
>> index 9e421f4b4..5f2a6b0db 100644
>> --- a/DEVELOPERS
>> +++ b/DEVELOPERS
>> @@ -1706,9 +1706,10 @@ F:	package/openmpi/
>>  F:	package/pinentry/
>>  F:	package/trinity/
>>  
>> -N:	Vincent Stehl? <vincent.stehle@intel.com>
>> +N:	Vincent Stehl? <vincent.stehle@laposte.net>
> 
> This should be part of another commit since it's not related to uftrace.

If you insist I can separate this update from the patch, sure.

Note that half the commits in the tree touching the DEVELOPERS file do
in fact modify something else in the mean time so I guess we are still
somewhat in the "tradition" :)

> 
>>  F:	package/i7z/
>>  F:	package/msr-tools/
>> +F:	package/uftrace/
>>  
>>  N:	Vinicius Tinti <viniciustinti@gmail.com>
>>  F:	package/python-thrift/
>> diff --git a/package/Config.in b/package/Config.in
>> index f69f67f3e..d9639b040 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -121,6 +121,7 @@ menu "Debugging, profiling and benchmark"
>>  	source "package/trace-cmd/Config.in"
>>  	source "package/trinity/Config.in"
>>  	source "package/uclibc-ng-test/Config.in"
>> +	source "package/uftrace/Config.in"
>>  	source "package/valgrind/Config.in"
>>  	source "package/whetstone/Config.in"
>>  endmenu
>> diff --git a/package/uftrace/Config.in b/package/uftrace/Config.in
>> new file mode 100644
>> index 000000000..bb766238c
>> --- /dev/null
>> +++ b/package/uftrace/Config.in
>> @@ -0,0 +1,20 @@
>> +config BR2_PACKAGE_UFTRACE
>> +	bool "uftrace"
>> +	depends on BR2_aarch64 || BR2_arm || BR2_x86_64
>> +	depends on !(BR2_arm && BR2_ARM_SOFT_FLOAT)
> 
> This could be:
> 	depends on BR2_aarch64 || (BR2_arm && !BR2_ARM_SOFT_FLOAT) || BR2_x86_64

This is clearer, thanks.

> 
> Btw, can you explain why only armhf is supported ?

Certainly: the inline assembly fragments used to retrieve the registers
access the NEON/float registers without any #ifdef:

https://github.com/namhyung/uftrace/blob/master/arch/arm/mcount-support.c#L353

I guess it should be possible to "port" uftrace to arm soft float as well.

> 
>> +	depends on BR2_PACKAGE_ELFUTILS
> 
> Can you select BR2_PACKAGE_ELFUTILS and add reverse decencies
> 
> 	depends on BR2_USE_WCHAR # elfutils
> 	depends on !BR2_STATIC_LIBS # elfutils
> 
> Also add thread dependency:
> 	depends on BR2_TOOLCHAIN_HAS_THREADS

Ok I'll go for select + "propagating" the dependencies, thanks.

> 
>> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> 
> Why it's restricted to glibc based toolchain ?
> At least you can keep the elfutils reverse dependencies:
> 
> 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
> 
> It should be fine with uClibc-ng toolchains.

When I tested with test-pkg I found no way of making it build properly
on uClibc/musl based toolchains. Let me retry with the select/depends
reworked as you proposed and I'll let you know how it goes.

> 
>> +	help
>> +	  A simple function call tracer for user programs.
>> +
>> +	  Note that the executable you want to trace should be compiled
>> +	  with -pg or -finstrument-functions option.
>> +
>> +	  https://github.com/namhyung/uftrace
>> +
>> +comment "uftrace needs a glibc toolchain and elfutils"
>> +	depends on BR2_aarch64 || BR2_arm || BR2_x86_64
>> +	depends on !BR2_PACKAGE_ELFUTILS || !BR2_TOOLCHAIN_USES_GLIBC
> 
> update the comment dependencies accordingly:
> comment "uftrace needs a glibc or uClibc toolchain w/ dynamic library, threads,
> wchar"
> 	depends on BR2_aarch64 || (BR2_arm && !BR2_ARM_SOFT_FLOAT) || BR2_x86_64
> 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
> 		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)

Ok, I'll update the comments, thanks.

> 
>> +
>> +comment "uftrace needs a toolchain with hardware floats on ARM"
>> +	depends on BR2_arm && BR2_ARM_SOFT_FLOAT
>> diff --git a/package/uftrace/uftrace.hash b/package/uftrace/uftrace.hash
>> new file mode 100644
>> index 000000000..8509197cc
>> --- /dev/null
>> +++ b/package/uftrace/uftrace.hash
>> @@ -0,0 +1,2 @@
>> +# Locally computed:
>> +sha256 afa698053ef10582c2ed3973ea134c0775d7ff4dcece3034905026185c52b272 uftrace-v0.7.tar.gz
>> diff --git a/package/uftrace/uftrace.mk b/package/uftrace/uftrace.mk
>> new file mode 100644
>> index 000000000..e23f01816
>> --- /dev/null
>> +++ b/package/uftrace/uftrace.mk
>> @@ -0,0 +1,28 @@
>> +################################################################################
>> +#
>> +# uftrace
>> +#
>> +################################################################################
>> +
>> +UFTRACE_VERSION = v0.7
>> +UFTRACE_SITE = $(call github,namhyung,uftrace,$(UFTRACE_VERSION))
>> +UFTRACE_DEPENDENCIES = elfutils
>> +UFTRACE_LICENSE = GPL-2.0
>> +UFTRACE_LICENSE_FILES = COPYING
>> +
>> +define UFTRACE_CONFIGURE_CMDS
>> +	cd $(@D) && \
>> +	$(TARGET_MAKE_ENV) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
>> +	LD="$(TARGET_LD)" ARCH="$(ARCH)" \
>> +	./configure --prefix=/usr
>> +endef
> 
> Use $(TARGET_CONFIGURE_OPTS) instead of defining CC, CFLAGS etc on the command
> line. Also add parenthesis
> Something like:
> 
> 	(cd $(@D) && \
> 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
> 	ARCH="$(ARCH)" \
> 	./configure --prefix=/usr)

This one I'll drop if you don't mind.

> 
>> +
>> +define UFTRACE_BUILD_CMDS
>> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> 
> Keep $(TARGET_CONFIGURE_OPTS) and ARCH="$(ARCH)"
> 
>> +endef
>> +
>> +define UFTRACE_INSTALL_TARGET_CMDS
>> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR="$(TARGET_DIR)"
> 
> Same here.

Well some of the environment settings and configure options are
"sampled" by this configure script of theirs (which resembles autoconf
and is not). This ends up being stored in a file, which is reused
afterwards.

I did not want to add the conf opts and arch to the following steps and
give the impression that they were taken into account while this is the
local configuration file in fact, which has the priority.

Can I please keep it as is?

Meanwhile I'll work on a v2. Thank you for spending time reviewing this
patch!

Best regards,

Vincent.

> 
> Best regards,
> Romain
> 
>> +endef
>> +
>> +$(eval $(generic-package))
>>
> 
