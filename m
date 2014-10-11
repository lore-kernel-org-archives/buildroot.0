From: =?UTF-8?Q?Andr=C3=A9_Erdmann?= <dywi@mailerd.de>
Date: Sat, 11 Oct 2014 18:29:13 +0200
Subject: [Buildroot] [PATCH 1/2] package/systemd: fix getty setup
In-Reply-To: <CAGduivx8-n9BeV0gdB8itLv3RE1x5Hn4pJDDpKdS_X_bTWJ4Uw@mail.gmail.com>
References: <1412863083-24764-1-git-send-email-dywi@mailerd.de>
 <CAGduivx8-n9BeV0gdB8itLv3RE1x5Hn4pJDDpKdS_X_bTWJ4Uw@mail.gmail.com>
Message-ID: <CAGrucu0unXvtHeTgiGTa6ftESL-QPkd+8=NytUeeNVpOzwBapA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2014-10-11 16:50 GMT+02:00 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>:
> Hi Andre, all,
>
> I encountered the same problem, did a quick post-build scripts and did
> not had time to find a better solution, so thanks for your work.
>
> On Thu, Oct 9, 2014 at 3:58 PM, Andr? Erdmann <dywi@mailerd.de> wrote:
>> When trying to run a buildroot system configured with
>> BR2_TARGET_GENERIC_GETTY_PORT="tty1" (x86_64), the boot process hangs
>> with the following message:
>>   "A start job is running for dev-tty1.device (<time> / 1min 30s)"
>>
>> Replacing /etc/systemd/system/getty.target.wants/serial-getty at tty1.service
>> (linking to serial-getty@) with getty at tty1.service (-> getty@) fixes the issue.
>>
>> This patch adds a check that "detects" the tty type by removing digits at the
>> end of BR2_TARGET_GENERIC_GETTY_PORT and comparing the resulting base name.
>> An instance of getty at service gets created if the name matches "tty",
>> otherwise serial-getty@ gets instantiated (as before).
> You solution doesn't quite work in all the cases, for example, on an
> iMX platform I'm working with, the tty is 'ttymxc0' which won't match
> your rules.

ttymxc0 would be treated as serial-getty at . My intention was to handle
tty1,tty2,... as getty@, while keeping other tty types unchanged.

> So maybe we should ask the users if the tty is going to be a serial one or not ?

I'd be fine with that.

>>
>> So, tty1,tty2,... are created as links getty at tty1.service -> getty@,
>> while ttyS0, ttyAMA0, ... are created as instances of serial-getty at .
>>
>> Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
>> ---
>> Notes:
>> "ifeq (,$(filter ...))" instead of "ifeq (tty,...)" allows to extend the list
>> of getty@ candidates without much effort. Not sure if there are any other than
>> "tty", though. Probably not, because getty at service refuses to start if
>> /dev/tty0 is not present.
>> ---
>>  package/systemd/systemd.mk | 17 ++++++++++++++++-
>>  1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
>> index face849..fec96d0 100644
>> --- a/package/systemd/systemd.mk
>> +++ b/package/systemd/systemd.mk
>> @@ -183,12 +183,27 @@ define SYSTEMD_USERS
>>         systemd-network -1 systemd-network -1 * - - - Network Manager
>>  endef
>>
>> -define SYSTEMD_INSTALL_SERVICE_TTY
>> +define SYSTEMD_DISABLE_SERVICE_TTY1
>>         rm -f $(TARGET_DIR)/etc/systemd/system/getty.target.wants/getty at tty1.service
>> +endef
>> +
>> +# strip_tty_name :: str -> str
>> +#  removes digits at the end of the given str; ttyS0 => ttyS, tty1 => tty
>> +SYSTEMD_STRIP_TTY_NAME = $(shell \
>> +       printf "%s" "$(call qstrip,$(1))" | sed -e 's=[0-9][0-9]*$$==' )
>> +
>> +ifeq (,$(filter tty,$(call SYSTEMD_STRIP_TTY_NAME,$(BR2_TARGET_GENERIC_GETTY_PORT))))
>> +define SYSTEMD_INSTALL_SERVICE_TTY
>>         ln -fs ../../../../lib/systemd/system/serial-getty at .service $(TARGET_DIR)/etc/systemd/system/getty.target.wants/serial-getty@$(BR2_TARGET_GENERIC_GETTY_PORT).service
>>  endef
>> +else
>> +define SYSTEMD_INSTALL_SERVICE_TTY
>> +       ln -fs ../../../../lib/systemd/system/getty at .service $(TARGET_DIR)/etc/systemd/system/getty.target.wants/getty@$(BR2_TARGET_GENERIC_GETTY_PORT).service
>> +endef
>> +endif
>>
>>  define SYSTEMD_INSTALL_INIT_SYSTEMD
>> +       $(SYSTEMD_DISABLE_SERVICE_TTY1)
>>         $(SYSTEMD_INSTALL_SERVICE_TTY)
>>         $(SYSTEMD_INSTALL_SERVICE_NETWORK)
>>         $(SYSTEMD_INSTALL_SERVICE_TIMESYNC)
>> --
>> 2.1.2
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
