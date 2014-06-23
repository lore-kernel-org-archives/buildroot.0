From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 23 Jun 2014 11:20:56 +0200
Subject: [Buildroot] [PATCH v2 2/3] system: convert "system.mk" recipes
 to "target-finalize" hooks
In-Reply-To: <53A4C529.4070507@mind.be>
References: <1403252778-19761-1-git-send-email-fabio.porcedda@gmail.com>
 <1403252778-19761-3-git-send-email-fabio.porcedda@gmail.com>
 <53A4C529.4070507@mind.be>
Message-ID: <CAHkwnC_9xRY9WtBKe-wUtcj+Pzoug5EV5KK8uFC_sOO2vd5j1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 21, 2014 at 1:35 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 20/06/14 10:26, Fabio Porcedda wrote:
>> Convert "system.mk" recipes to "target-finalize" hooks in order to:
>> - Ensure an ordering even if top-level parallel make is being used.
>> - Execute "system.mk" commands after the "target-finalize" initial message
>>   is printed so they can be clearly distinguished from packages
>>   building.
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>  One small remark:
>
> [snip]
>> +ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
>> +ifeq ($(BR2_PACKAGE_SYSVINIT),y)
>>  # In sysvinit inittab, the "id" must not be longer than 4 bytes, so we
>>  # skip the "tty" part and keep only the remaining.
>> -target-generic-getty-sysvinit:
>> +define SYSTEM_GENERIC_GETTY_SYSVINIT
>>       $(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(TARGET_GENERIC_GETTY_PORT) | tail -c+4)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_OPTIONS) $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
>>               $(TARGET_DIR)/etc/inittab
>> +endef
>> +TARGET_FINALIZE_HOOKS += SYSTEM_GENERIC_GETTY_SYSVINIT
>> +else
>> +# Add getty to busybox inittab
>> +define SYSTEM_GENERIC_GETTY_BUSYBOX
>> +     $(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY_PORT)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_OPTIONS) $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
>> +             $(TARGET_DIR)/etc/inittab
>> +endef
>> +TARGET_FINALIZE_HOOKS += SYSTEM_GENERIC_GETTY_BUSYBOX
>
>  Wouldn't it be better/cleaner to define SYSTEM_GENERIC_GETTY in both cases, and
> just define it differently depending on BR2_PACKAGE_SYSVINIT? Same for the
> REMOUNT_ROOTFS, below.
<snip>

Well, In a first attempt i was doing like that but later I've decided
to follow the original style because is more descriptive.

I will change the patch as you suggested.

Thanks & BR
-- 
Fabio Porcedda
