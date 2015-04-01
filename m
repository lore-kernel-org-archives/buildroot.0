From: Johan Sagaert <sagaert.johan@proximus.be>
Date: Wed, 01 Apr 2015 14:25:38 +0200
Subject: [Buildroot] [PATCH 1/1] build host lz4 to support lz4
 compression in the kernel.
In-Reply-To: <20150401133722.6d6ab6c9@free-electrons.com>
References: <1427884257-20151-1-git-send-email-sagaert.johan@proximus.be>
 <20150401133722.6d6ab6c9@free-electrons.com>
Message-ID: <551BE3C2.8020508@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni schreef op 1/04/2015 om 13:37:
> Dear Sagaert Johan,
>
> On Wed,  1 Apr 2015 12:30:57 +0200, Sagaert Johan wrote:
>
>> diff --git a/linux/linux.mk b/linux/linux.mk
>> index 22fce35..137c64d 100644
>> --- a/linux/linux.mk
>> +++ b/linux/linux.mk
>> @@ -49,7 +49,7 @@ LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
>>   LINUX_PATCH = $(filter ftp://% http://% https://%,$(LINUX_PATCHES))
>>   
>>   LINUX_INSTALL_IMAGES = YES
>> -LINUX_DEPENDENCIES += host-kmod host-lzop
>> +LINUX_DEPENDENCIES += host-kmod host-lzop host-lz4
> I think it's time to add some Config.in options in linux/Config.in to
> select the compression tools to be made available, and enforce their
> usage/availability in the Linux .config file. It is annoying to bvuild
> host-lzop and host-lz4 every time you're building a kernel if you don't
> care about those compressions algos.
I am not sure if all kernel releases have the lz4 compression option, so 
this
seemed the most simple solution, lz4 is not taking large resources in 
terms of build time
This works fine for me now.
Not sure about this : could host-lz4 be build in a kernel_pre_build hook ?
checking the kernels .config  before the kernel build starts.
>> diff --git a/package/lz4/host-lz4.mk b/package/lz4/host-lz4.mk
>> new file mode 100644
>> index 0000000..03138f9
>> --- /dev/null
>> +++ b/package/lz4/host-lz4.mk
>> @@ -0,0 +1,21 @@
>> +################################################################################
>> +#
>> +# host-lz4
>> +#
>> +################################################################################
>> +
>> +HOST_LZ4_VERSION = r123
>> +HOST_LZ4_SITE = $(call github,Cyan4973,lz4,$(HOST_LZ4_VERSION))
>> +HOST_LZ4_LICENSE = BSD-2c
>> +HOST_LZ4_LICENSE_FILES = LICENSE
>> +
>> +define HOST_LZ4_BUILD_CMDS
>> +	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)
>> +endef
>> +
>> +define HOST_LZ4_INSTALL_CMDS
>> +	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) install DESTDIR=$(HOST_DIR)
>> +endef
>> +
>> +$(eval $(host-generic-package))
>> +
>> diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
>> index 38e10d8..6f8af03 100644
>> --- a/package/lz4/lz4.mk
>> +++ b/package/lz4/lz4.mk
>> @@ -17,14 +17,6 @@ endef
>>   LZ4_POST_PATCH_HOOKS += LZ4_DISABLE_SHARED
>>   endif
>>   
>> -define HOST_LZ4_BUILD_CMDS
>> -	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)
>> -endef
>> -
>> -define HOST_LZ4_INSTALL_CMDS
>> -	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) install DESTDIR=$(HOST_DIR)
>> -endef
>> -
>>   define LZ4_BUILD_CMDS
>>   	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) liblz4
>>   endef
>> @@ -38,4 +30,3 @@ define LZ4_INSTALL_TARGET_CMDS
>>   endef
>>   
>>   $(eval $(generic-package))
>> -$(eval $(host-generic-package))
> This entire change seems completely unnecessary, and not only that, but
> it is completely incompatible with the Buildroot best practices to
> write host packages. Why did you do this change in the first place?
>
> Thanks,
>
> Thomas
I don't want lz4 on the target , that is why i have done it this way,  
lz4 that can be selected via the menu
if needed on the target , and a host-lz4 that is always build when 
building a kernel.
Sent me your suggestion, and i will try to fix this patch. (have to do 
all buildroot patchwork in free-time )

Regards , Johan
