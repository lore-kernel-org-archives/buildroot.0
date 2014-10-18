From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 18 Oct 2014 13:39:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/avahi: use upstream-provided
 systemd files
In-Reply-To: <20141017224043.GD7944@free.fr>
References: <1413573042-6638-1-git-send-email-dywi@mailerd.de>
 <20141017224043.GD7944@free.fr>
Message-ID: <CAGduivw9Gmz_8uWxHq59N8Di5uCzvHvP98sV7_V+pDP8m=7gWw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Andr?, all,

On Sat, Oct 18, 2014 at 12:40 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Andr?, All,
>
> On 2014-10-17 21:10 +0200, Andr? Erdmann spake thusly:
>> When using the buildroot-provided avahi-daemon.service file, bootup never
>> finishes, because multi-user.target is waiting for avahi-daemon to exit,
>> which is caused by "Type=oneshot" (in avahi-daemon.service).
>>
>> Upstream's systemd files get already installed to /lib/systemd.
>> They're not an exact copy of S50avahi-daemon, but work flawlessly,
>> so use these units:
>>
>> * avahi-daemon.service, auto-enabled (ln -fs in AVAHI_INSTALL_INIT_SYSTEMD)
>> * avahi-daemon.socket,
>>   not auto-enabled, but a dependency of avahi-daemon.service
>> * avahi-dnsconfd.service, auto-enabled
>>
>> Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
>
> Looks like the sane thing to do, indeed.
>
> I'm no systemd expert, so copying Eric, which will probably be able to
> confirm my:
>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Regards,
> Yann E. MORIN.
>
>> ---
>> With "Type=oneshot", systemd waits for avahi-daemon to exit,
>> which does not happen (unless killed):
>>
>> $ systemctl --no-pager status avahi-daemon.service
>> * avahi-daemon.service - Avahi daemon
>>    Loaded: loaded (/etc/systemd/system/avahi-daemon.service; enabled)
>>    Active: activating (start) since Wed 2014-10-15 21:26:49 CEST; 56s ago
>>  Main PID: 190 (avahi-daemon)
>>    CGroup: /system.slice/avahi-daemon.service
>>            |-190 avahi-daemon: running [buildroot.local]
>>            |-192 avahi-daemon: chroot helper
>>
>> Oct 15 21:26:49 buildroot avahi-daemon[190]: Network interface enumeration completed.
>> Oct 15 21:26:49 buildroot avahi-daemon[190]: Registering HINFO record with values 'X86_64'/'LINUX'.
>> Oct 15 21:26:49 buildroot avahi-daemon[190]: Server startup complete. Host name is buildroot.local. Local service c...3347.
>> Oct 15 21:26:49 buildroot avahi-daemon[190]: Service "buildroot" (/services/ssh.service) successfully established.
>> Oct 15 21:26:49 buildroot avahi-daemon[190]: Service "buildroot" (/services/sftp-ssh.service) successfully established.
>> Oct 15 21:26:49 buildroot avahi-daemon[190]: Joining mDNS multicast group on interface br0.IPv4 with address 192.168.3.114.
>> Oct 15 21:26:49 buildroot avahi-daemon[190]: New relevant interface br0.IPv4 for mDNS.
>> Oct 15 21:26:49 buildroot avahi-daemon[190]: Registering new address record for 192.168.3.114 on br0.IPv4.
>> Oct 15 21:26:50 buildroot avahi-daemon[190]: Registering new address record for fe80::5054:ff:feb1:f19a on eth0.*.
>> Oct 15 21:26:50 buildroot avahi-daemon[190]: Registering new address record for fe80::bcbb:86ff:fe4a:14d6 on br0.*.
>> Hint: Some lines were ellipsized, use -l to show in full.
>> (EOF)
>>
>>
>> The result is that the boot process never reaches "multi-user.target":
>>
>> $ systemctl --no-pager list-jobs
>> JOB UNIT                 TYPE  STATE
>>   1 multi-user.target    start waiting
>>  57 avahi-daemon.service start running
>>
>> 2 jobs listed.
>> (EOF)
>> ---
>>  package/avahi/avahi-daemon.service | 15 ---------------
>>  package/avahi/avahi.mk             |  8 ++++----
>>  2 files changed, 4 insertions(+), 19 deletions(-)
>>  delete mode 100644 package/avahi/avahi-daemon.service
>>
>> diff --git a/package/avahi/avahi-daemon.service b/package/avahi/avahi-daemon.service
>> deleted file mode 100644
>> index c9b7b1f..0000000
>> --- a/package/avahi/avahi-daemon.service
>> +++ /dev/null
>> @@ -1,15 +0,0 @@
>> -[Unit]
>> -Description=Avahi daemon
>> -Requires=dbus.target
>> -After=syslog.target network.target auditd.service
>> -
>> -[Service]
>> -Type=oneshot
>> -RemainAfterExit=ye
>> -ExecStart=/usr/sbin/avahi-daemon -s
>> -ExecReload=/usr/sbin/avahi-daemon -r
>> -ExecStop=/usr/sbin/avahi-daemon -k
>> -Restart=restart-always
>> -
>> -[Install]
>> -WantedBy=multi-user.target
>> diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
>> index 706561f..609d89c 100644
>> --- a/package/avahi/avahi.mk
>> +++ b/package/avahi/avahi.mk
>> @@ -164,14 +164,14 @@ endif
>>  ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
>>
>>  define AVAHI_INSTALL_INIT_SYSTEMD
>> -  $(INSTALL) -D -m 644 package/avahi/avahi-daemon.service \
>> -    $(TARGET_DIR)/etc/systemd/system/avahi-daemon.service
>> -
>>    mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>>
>> -  ln -fs ../avahi-daemon.service \
>> +  ln -fs ../../../../lib/systemd/system/avahi-daemon.service \
Just an idea, how about doing:
ln -fs /lib/systemd/system/avahi-daemon.service \
Instead of all the ../ ?
>>      $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/avahi-daemon.service
>>
>> +  ln -fs ../../../../lib/systemd/system/avahi-dnsconfd.service \
Same here.
>> +    $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/avahi-dnsconfd.service
>> +
>>    mkdir -p $(TARGET_DIR)/usr/lib/tmpfiles.d
>>
>>    $(INSTALL) -D -m 644 package/avahi/avahi_tmpfiles.conf \
>> --
>> 2.1.2
