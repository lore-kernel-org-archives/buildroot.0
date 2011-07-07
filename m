From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 07 Jul 2011 12:04:49 +0200
Subject: [Buildroot] [PATCH 03/28] linux: make it possible to install
 the kernel in /boot
In-Reply-To: <201107042348.43715.yann.morin.1998@anciens.enib.fr>
References: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
 <8f2cdc43b7b0efaf09e1f1be70019f9cdc0cb8ec.1309815048.git.thomas.petazzoni@free-electrons.com>
 <201107042348.43715.yann.morin.1998@anciens.enib.fr>
Message-ID: <4E1584C1.3060203@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann E. MORIN wrote:
> Thomas, All,
>
> On Monday 04 July 2011 23:33:20 Thomas Petazzoni wrote:
>> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
>> ---
>>   linux/Config.in |    7 +++++++
>>   linux/linux.mk  |    3 +++
>>   2 files changed, 10 insertions(+), 0 deletions(-)
>>
>> diff --git a/linux/Config.in b/linux/Config.in
>> index 1f1a69c..c9229a5 100644
>> --- a/linux/Config.in
>> +++ b/linux/Config.in
>> @@ -153,6 +153,13 @@ config BR2_LINUX_KERNEL_IMAGE_TARGET_NAME
>>   	  Specify the kernel make target to build the kernel that you
>>   	  need.
>>
>> +config BR2_LINUX_KERNEL_INSTALL_TARGET
>> +	bool "Install kernel image to /boot in target"
>> +	help
>> +	  Select this option to have the kernel image installed to
>> +	  /boot in the target root filesystem, as is typically done on
>> +	  x86/x86_64 systems.
>> +
>>   endif # BR2_LINUX_KERNEL
>>
>>   endmenu
>> diff --git a/linux/linux.mk b/linux/linux.mk
>> index 43ca87b..2bb32cb 100644
>> --- a/linux/linux.mk
>> +++ b/linux/linux.mk
>> @@ -158,6 +158,9 @@ $(LINUX26_DIR)/.stamp_compiled: $(LINUX26_DIR)/.stamp_configured $(LINUX26_DIR)/
>>   $(LINUX26_DIR)/.stamp_installed: $(LINUX26_DIR)/.stamp_compiled
>>   	@$(call MESSAGE,"Installing kernel")
>>   	cp $(LINUX26_IMAGE_PATH) $(BINARIES_DIR)
>> +ifeq ($(BR2_LINUX_KERNEL_INSTALL_TARGET),y)
>> +	install -m 0644 -D $(LINUX26_IMAGE_PATH) $(TARGET_DIR)/boot/$(LINUX26_IMAGE_NAME)
>> +endif
>
> If we install the kernel in /boot, why do we stil install it in
> ${BINARIES_DIR} ?
>
> It can only be confusing to have the kernel image in two places.

Does this really hurt? I found that a handy _feature_ indeed.

Well, sorry for writing after v3 was submitted, but Thomas was so much
faster than my review! :)

I need the kernel in the target for some products, but with v2 of
Thomas' work I also was sure that I always have an uImage in
output/images, ready for network boot via TFTP and other stuff.

Now I'd have to try both places, or script around the config to know
where I'll find my uImage.

I'd rather come back to v2, but if you mind a few MB wasted on the
development host, an additional option (say, "Copy kernel image to
/images dir") would save both needs.

Luca
