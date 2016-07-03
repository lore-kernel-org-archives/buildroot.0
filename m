From: Nathaniel Roach <nroach44@gmail.com>
Date: Sun, 3 Jul 2016 18:54:41 +0800
Subject: [Buildroot] [PATCH v3] package/quagga: Add systemd.service file
In-Reply-To: <CAGduivyM5Y4TBVos3Pz8bW-7KeZc0RQA+uTbDQtXrA0tR-sR+A@mail.gmail.com>
References: <1467533939-26606-1-git-send-email-nroach44@gmail.com>
 <CAGduivyM5Y4TBVos3Pz8bW-7KeZc0RQA+uTbDQtXrA0tR-sR+A@mail.gmail.com>
Message-ID: <55ce8415-62de-2e1e-bc88-f35d511866ec@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,


On 03/07/16 18:42, Maxime Hadjinlian wrote:
> Hi Nathaniel, all
>
> On Sun, Jul 3, 2016 at 10:18 AM, Nathaniel Roach <nroach44@gmail.com> wrote:
>> Use a template service file as all of the daemons use almost
>> identical arguments and generally appear the same to the init
>> system.
>>
>> We "Wants=" zebra as that's the daemon for interfacing to the
>> kernel, and it's not required for the other daemons to work
>> but it's probably going to be used in nearly all setups.
>>
>> /usr/bin/env is needed as systemd doesn't allow the instance
>> variable (%i) in the executable path.
>>
>> We don't enable these services by default as this would require
>> creating configuration and /etc/default files. (And is easily
>> achieved with an FS overlay)
>>
>> Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
>> ---
>> Changes v2 -> v3:
>>   - Remove invalid references to quagga.service (Arnout)
>>   - Check if the binary is executable before trying to start it
>>     (Arnout)
>>   - Remove PID file arguments and options (Arnout)
>>   - Add reload capability as the daemons do support it
>>
>> Changes v1 -> v2:
>>   (As suggested by Arnout Vandecappelle)
>>   - Completely remove shim and use /usr/bin/env instead
>>   - Don't tell quagga to fork as systemd prefers it
>>   - Add comment to .service file about /usr/bin/env
>>   - Explain not enabling the service on build in patch
>> ---
>>   package/quagga/quagga.mk       |  2 ++
>>   package/quagga/quagga at .service | 20 ++++++++++++++++++++
>>   2 files changed, 22 insertions(+)
>>   create mode 100644 package/quagga/quagga at .service
>>
>> diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
>> index 22e90ad..1bbc72d 100644
>> --- a/package/quagga/quagga.mk
>> +++ b/package/quagga/quagga.mk
>> @@ -75,6 +75,8 @@ endif
>>   define QUAGGA_INSTALL_INIT_SYSTEMD
>>          $(INSTALL) -D -m 644 package/quagga/quagga_tmpfiles.conf \
>>                  $(TARGET_DIR)/usr/lib/tmpfiles.d/quagga.conf
>> +       $(INSTALL) -D -m 644 package/quagga/quagga at .service \
>> +               $(TARGET_DIR)/usr/lib/systemd/system/quagga at .service
>>   endef
>>
>>   $(eval $(autotools-package))
>> diff --git a/package/quagga/quagga at .service b/package/quagga/quagga at .service
>> new file mode 100644
>> index 0000000..16acc30
>> --- /dev/null
>> +++ b/package/quagga/quagga at .service
>> @@ -0,0 +1,20 @@
>> +[Unit]
>> +Description=Quagga %i routing daemon
>> +ConditionFileIsExecutable=/usr/sbin/%i
>> +Wants=quagga at zebra.service
> Just a though, I read about why you added the Wants, maybe a comment
> would be nice here ?
>> +
>> +[Service]
>> +Type=simple
> Since you have removed the '--daemon' option, maybe you should revert
> this to "forking" ?
I might have it backwards, but it would need "forking" if --daemon was 
specified, otherwise "systemctl start quagga at ospfd" would hang.
>> +EnvironmentFile=/etc/default/quagga-%i
>> +PrivateTmp=true
>> +# Systemd doesn't like having %i in the executable path.
>> +ExecStart=/usr/bin/env /usr/sbin/%i $OPTS -f /etc/quagga/%i.conf
>> +ExecReload=/bin/kill -HUP $MAINPID
>> +KillMode=mixed
>> +KillSignal=SIGINT
> If I understand correctly, what you want to do is send a SIGINT to the
> main processes and SIGKILL to the other ? From the services file I can
> find in major distro, they don't specify it so it's left to the
> default SIGTERM, why did you need to change that ? (Maybe you already
> explained in your previous mail and I missed, sorry if that's the
> case).
KillMode=Mixed is an artefact left over from the OpenVPN .service file I 
used as a reference. I (again) misread the systemd docs and left it in 
as it seemed more appropriate than the default if any child processes 
are started. This can be removed on commit, or I'll fix it if there's 
any other things that need to be changed.
>> +Restart=on-failure
>> +RestartSec=1
> Why ?
I've had ospfd crash during configuration and general usage, this is 
undesirable as it's responsible for keeping a large amount of routes in 
my router's tables.
>> +
>> +[Install]
>> +WantedBy=multi-user.target
>> +
>> --
>> 2.8.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
