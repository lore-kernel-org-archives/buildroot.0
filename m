From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 5 Sep 2018 12:03:07 +0100
Subject: [Buildroot] [PATCH 1/1] boot/uboot: Set MAKE_ENV for kconfig
 build system
In-Reply-To: <20180905104223.3pyf6rdoaptg34rm@sapphire.tkos.co.il>
References: <20180905094940.24461-1-thomas.preston@codethink.co.uk>
 <20180905104223.3pyf6rdoaptg34rm@sapphire.tkos.co.il>
Message-ID: <0cf1465d-dab8-000a-0739-20d4ff5fee00@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/09/18 11:42, Baruch Siach wrote:
> Hi Thomas,
> 
> On Wed, Sep 05, 2018 at 10:49:40AM +0100, Thomas Preston wrote:
>> U-Boot fails to build in gitlab CI context because the kconfig-package
>> build stage is unable to find bison for flex even though they are
>> installed in BR_BINARIES_DIR.
>>
>> To fix this, set UBOOT_MAKE_ENV so that UBOOT_KCONFIG_MAKE uses the
>> correct PATH.
>>
>> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
>> ---
>>   boot/uboot/uboot.mk | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
>> index bddafe234d..36428e65fe 100644
>> --- a/boot/uboot/uboot.mk
>> +++ b/boot/uboot/uboot.mk
>> @@ -449,6 +449,9 @@ endif # BR2_TARGET_UBOOT && BR_BUILDING
>>   ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY),y)
>>   $(eval $(generic-package))
>>   else ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG),y)
>> +UBOOT_MAKE_ENV = \
>> +	$(TARGET_MAKE_ENV) \
>> +	BR_BINARIES_DIR=$(BINARIES_DIR)
> 
> I can't find any reference to BR_BINARIES_DIR in U-Boot related Buildroot
> makefile code, or in current U-Boot source tree. How is this going to work?
> 

Ah, it is TARGET_MAKE_ENV which provides the PATH fix, BR_BINARIES_DIR was added by mistake (I copied it from the linux/linux.mk). Should I resubmit?

You should be able to reproduce the error with:

	$ docker run -u1002 -v $PWD:/home/br-user -it buildroot/base make V=1 uboot
	...
	  bison -oscripts/kconfig/zconf.tab.c -t -l scripts/kconfig/zconf.y
	/bin/sh: 1: bison: not found
	scripts/Makefile.lib:228: recipe for target 'scripts/kconfig/zconf.tab.c' failed
	...

The above patch adds `PATH="/home/br-user/output/host/bin`, which fixes the error.
