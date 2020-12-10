From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Thu, 10 Dec 2020 21:28:14 +0100
Subject: [Buildroot] [PATCH] package/dt-utils: install barebox-state
 lock file
In-Reply-To: <87v9dgjop1.fsf@grinn-global.com>
References: <20201117102534.107484-1-b.bilas@grinn-global.com>
 <87v9dgjop1.fsf@grinn-global.com>
Message-ID: <956fdf5f-6355-85c7-05a1-f4729b5f1f1d@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marcin,

On 05.12.2020 15:46, Marcin Niestr?j wrote:
> Hi Bartosz,
>
> Bartosz Bilas <b.bilas@grinn-global.com> writes:
>
>> By default there is no /var/lock/barebox-state file what causes
>> the following error when we try to execute barebox-state command:
>>
>> # barebox-state
>> Failed to open lock-file /var/lock/barebox-state
>>
>> Fix it by adding an empty file in post install hook.
>>
>> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
>> ---
>>   package/dt-utils/dt-utils.mk | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/package/dt-utils/dt-utils.mk b/package/dt-utils/dt-utils.mk
>> index 25c287d434..454b00e3d6 100644
>> --- a/package/dt-utils/dt-utils.mk
>> +++ b/package/dt-utils/dt-utils.mk
>> @@ -12,4 +12,11 @@ DT_UTILS_LICENSE_FILES = COPYING
>>   DT_UTILS_DEPENDENCIES = udev
>>   DT_UTILS_AUTORECONF = YES
>>   
>> +define DT_UTILS_INSTALL_LOCK_FILE
>> +	rm -f $(TARGET_DIR)/var/lock/barebox-state
>> +	mkdir -p $(TARGET_DIR)/var/lock
>> +	touch $(TARGET_DIR)/var/lock/barebox-state
>> +endef
>> +DT_UTILS_POST_INSTALL_TARGET_HOOKS += DT_UTILS_INSTALL_LOCK_FILE
> I'm afraid this won't help for minimal rootfs images, where /var/lock is
> a symlink at /tmp. What is the type of rootfs skeleton that you tested
> your changes with?
I've been testing this patch using skeleton-init-systemd.
>
>> +
>>   $(eval $(autotools-package))
Best
Bartek
