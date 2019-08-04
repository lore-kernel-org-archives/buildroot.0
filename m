From: David <david@ledav.net>
Date: Sun, 04 Aug 2019 02:03:40 +0200
Subject: [Buildroot] [PATCH 1/1] sgp30: New kernel module package
In-Reply-To: <20190803081556.GC28984@scaer>
References: <20181202182617.6397-1-david@ledav.net>
 <20190803081556.GC28984@scaer>
Message-ID: <f79437887a42758d179475b40c953d8a@ledav.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

No problem :-)

Yess and thanks for your changes. However, as Peter pointed out in an 
other mail,
this driver was added to the mainline kernel in the meantime (since 
v5.1) and I didn't
noticed it as I switched on another projet in between... Otherwise I had 
removed the
patch a long time ago... :-/

Moreover, the driver has few annoying bugs with the 'baseline' 
save/restore who makes
the kernel crash and as I can see the kernel's version looks far better. 
I will have
to test it again when I'll have free time ...

So, just forget about this patch and let use the more recent mainline 
one...
Sorry for the time spent on this and thanks for all.

Regards,
David.

On 03/08/2019 10:15, Yann E. MORIN wrote:
> David, All,
> Thanks for your contribution, and sorry to come back to it so late...
> 
> On 2018-12-02 19:26 +0100, David De Grave spake thusly:
>> Kernel module for the Sensirion sgp30 / sgpc2 chemical sensors.
> 
> As you may have noticed, I've respun this patch with a few changes:
>     https://patchwork.ozlabs.org/patch/1141451/
> 
> Regards,
> Yann E. MORIN.
> 
>> Signed-off-by: David De Grave <david@ledav.net>
>> ---
>>  package/Config.in        |  1 +
>>  package/sgp30/Config.in  | 17 +++++++++++++++++
>>  package/sgp30/sgp30.hash |  1 +
>>  package/sgp30/sgp30.mk   | 13 +++++++++++++
>>  4 files changed, 32 insertions(+)
>>  create mode 100644 package/sgp30/Config.in
>>  create mode 100644 package/sgp30/sgp30.hash
>>  create mode 100644 package/sgp30/sgp30.mk
>> 
>> diff --git a/package/Config.in b/package/Config.in
>> index 0339ec77d7..dd22e8983a 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -507,6 +507,7 @@ endmenu
>>  	source "package/sedutil/Config.in"
>>  	source "package/setserial/Config.in"
>>  	source "package/sg3_utils/Config.in"
>> +	source "package/sgp30/Config.in"
>>  	source "package/sigrok-cli/Config.in"
>>  	source "package/sispmctl/Config.in"
>>  	source "package/smartmontools/Config.in"
>> diff --git a/package/sgp30/Config.in b/package/sgp30/Config.in
>> new file mode 100644
>> index 0000000000..8e08877f7b
>> --- /dev/null
>> +++ b/package/sgp30/Config.in
>> @@ -0,0 +1,17 @@
>> +
>> +config BR2_PACKAGE_SGP30
>> +	bool "sgp30/sgpc3"
>> +	depends on BR2_LINUX_KERNEL
>> +	help
>> +          I2C interface support for the following
>> +          Sensirion SGP multi-pixel gas sensors:
>> +
>> +            * SGP30 gas sensor
>> +            * SGPC3 low power gas sensor
>> +
>> +          This module will be called sgp30.
>> +
>> +	  Requires CONFIG_CRC8 & CONFIG_IIO
>> +
>> +comment "sgp30/sgpc3 needs a Linux kernel to be built"
>> +        depends on !BR2_LINUX_KERNEL
>> diff --git a/package/sgp30/sgp30.hash b/package/sgp30/sgp30.hash
>> new file mode 100644
>> index 0000000000..61fda409ed
>> --- /dev/null
>> +++ b/package/sgp30/sgp30.hash
>> @@ -0,0 +1 @@
>> +sha256 
>> f8d619046589eee93dbce091be5dc3059a2e37513e50b3c61eada9c3b6fc7c0f  
>> Sensirion_Gas_Sensors_SGP30_Linux_Driver.zip
>> diff --git a/package/sgp30/sgp30.mk b/package/sgp30/sgp30.mk
>> new file mode 100644
>> index 0000000000..ec5bb25b23
>> --- /dev/null
>> +++ b/package/sgp30/sgp30.mk
>> @@ -0,0 +1,13 @@
>> +
>> +SGP30_SOURCE = Sensirion_Gas_Sensors_SGP30_Linux_Driver.zip
>> +SGP30_SITE = 
>> https://www.sensirion.com/fileadmin/user_upload/customers/sensirion/Dokumente/13_Sample_Codes_Software/Gas_Sensors
>> +SGP30_LICENSE = GPL-2.0+
>> +SGP30_LICENSE_FILE = LICENSE
>> +SGP30_MODULE_SUBDIRS = sgp30
>> +
>> +define SGP30_EXTRACT_CMDS
>> +        $(UNZIP) -d $(@D) $(SGP30_DL_DIR)/$(SGP30_SOURCE)
>> +endef
>> +
>> +$(eval $(kernel-module))
>> +$(eval $(generic-package))
>> --
>> 2.13.6
>> 
>> 
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
