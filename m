From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 23 Nov 2011 14:53:34 +0100
Subject: [Buildroot] [PATCH 1/3] Add the systemd package
In-Reply-To: <20111123115759.GD4309@sapphire.tkos.co.il>
References: <1322047811-12933-1-git-send-email-maxime.ripard@free-electrons.com>
 <1322047811-12933-2-git-send-email-maxime.ripard@free-electrons.com>
 <20111123115759.GD4309@sapphire.tkos.co.il>
Message-ID: <4ECCFADE.9060700@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 23/11/2011 12:57, Baruch Siach wrote:
> On Wed, Nov 23, 2011 at 12:30:09PM +0100, Maxime Ripard wrote:
>> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>> ---
>>  fs/skeleton/etc/mtab       |    2 +-
>>  linux/linux.mk             |    2 +
>>  package/Config.in          |    1 +
>>  package/dbus/dbus.mk       |    4 +++
>>  package/systemd/Config.in  |   16 +++++++++++++++
>>  package/systemd/systemd.mk |   45 ++++++++++++++++++++++++++++++++++++++++++++
>>  6 files changed, 69 insertions(+), 1 deletions(-)
>>  create mode 100644 package/systemd/Config.in
>>  create mode 100644 package/systemd/systemd.mk
>>
>> diff --git a/fs/skeleton/etc/mtab b/fs/skeleton/etc/mtab
>> index e1c2045..4c0a094 120000
>> --- a/fs/skeleton/etc/mtab
>> +++ b/fs/skeleton/etc/mtab
>> @@ -1 +1 @@
>> -../proc/mounts
>> \ No newline at end of file
>> +/proc/mounts
>> \ No newline at end of file
> 
> Why is this change needed?

Because systemd tests if /etc/mtab is a link to /proc/mounts or
/proc/self/mounts, and thus fails with this link.

http://cgit.freedesktop.org/systemd/tree/src/main.c#n1082

>> +define SYSTEMD_INSTALL_INIT_HOOK
>> +	ln -fs /bin/systemd $(TARGET_DIR)/sbin/init
>> +	ln -fs /bin/systemctl $(TARGET_DIR)/sbin/halt
>> +	ln -fs /bin/systemctl $(TARGET_DIR)/sbin/poweroff
>> +	ln -fs /bin/systemctl $(TARGET_DIR)/sbin/reboot
>> +endef
> 
> You should probably add busybox to your dependencies to make sure you override 
> the busybox provided applets.

Right


-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
