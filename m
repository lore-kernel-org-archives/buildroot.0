From: Floris Bos <bos@je-eigen-domein.nl>
Date: Tue, 10 Feb 2015 22:09:44 +0100
Subject: [Buildroot] [PATCH] Linux kernel: add support for config
 fragment files
In-Reply-To: <20150210191953.GA32404@tarshish>
References: <1423576221-24249-1-git-send-email-bos@je-eigen-domein.nl>
 <20150210191953.GA32404@tarshish>
Message-ID: <54DA7398.9090707@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/10/2015 08:19 PM, Baruch Siach wrote:
> On Tue, Feb 10, 2015 at 02:50:21PM +0100, Floris Bos wrote:
>> Adds configuration option to merge additional kernel configuration files
>> to the main kernel configuration using scripts/kconfig/merge_config.sh
>>
>> For use-cases in which it is desired to build a custom Linux kernel based on
>> the defconfig of the target device, but with a couple extra options/modules
>> enabled.
>>
>> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
>> ---
> [...]
>
>> @@ -178,6 +179,8 @@ define LINUX_CONFIGURE_CMDS
>>   	$(INSTALL) -m 0644 $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
>>   	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
>>   	rm $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
>> +	$(if $(LINUX_KERNEL_CONFIG_FRAGMENTS),
>> +		$(@D)/scripts/kconfig/merge_config.sh -m -O $(@D) $(@D)/.config $(LINUX_KERNEL_CONFIG_FRAGMENTS))
> The merge_config.sh script is in the kernel since version 3.3. The -O
> parameter is only supported since v3.9. How do you handle older kernels?

Could make it use the merge_config.sh we have in buildroot (in 
support/kconfig) instead, if support for old kernel versions is a 
requirement.


Yours sincerely,

Floris Bos
