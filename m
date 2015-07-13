From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 13 Jul 2015 22:47:54 +0200
Subject: [Buildroot] [PATCH 12/16] package/samba: add systemd support
In-Reply-To: <CAHXCMMJkam4Rkonum9c5TkB8d8mpzKMhjGePPaGJhgakJMYK4Q@mail.gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
 <1421684056-5266-13-git-send-email-maxtram95@gmail.com>
 <CAHXCMMJkam4Rkonum9c5TkB8d8mpzKMhjGePPaGJhgakJMYK4Q@mail.gmail.com>
Message-ID: <CAGduivwZjW9Logy6CLrGH=A_eTyknAvEdgV7pNpfbuzvZZyZ0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel, Maxim, all

On Mon, Feb 2, 2015 at 11:38 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> Hi Maxim,
>
On a more general note, we want to install your systemd services into
/usr/lib/systemd/system/ instead of the /lib/systemd/system that you
used.
> On Mon, Jan 19, 2015 at 5:14 PM, Maxim Mikityanskiy <maxtram95@gmail.com> wrote:
>> Add {smbd,nmbd,winbindd}.service files for systemd. Add tmpfiles.d
>> config file to create samba directories.
>>
>> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
>> ---
>>  package/samba/nmbd.service        | 12 ++++++++++++
>>  package/samba/samba.mk            | 23 +++++++++++++++++++++++
>>  package/samba/samba_tmpfiles.conf |  4 ++++
>>  package/samba/smbd.service        | 12 ++++++++++++
>>  package/samba/winbindd.service    | 12 ++++++++++++
>>  5 files changed, 63 insertions(+)
>>  create mode 100644 package/samba/nmbd.service
>>  create mode 100644 package/samba/samba_tmpfiles.conf
>>  create mode 100644 package/samba/smbd.service
>>  create mode 100644 package/samba/winbindd.service
>>
>> diff --git a/package/samba/nmbd.service b/package/samba/nmbd.service
>> new file mode 100644
>> index 0000000..6e241ea
>> --- /dev/null
>> +++ b/package/samba/nmbd.service
>> @@ -0,0 +1,12 @@
>> +[Unit]
>> +Description=Samba NetBIOS name server
>> +After=network.target
>> +
>> +[Service]
>> +Type=forking
>> +PIDFile=/var/run/samba/nmbd.pid
>> +ExecStart=/usr/sbin/nmbd -D
>> +ExecReload=/bin/kill -HUP $MAINPID
>> +
>> +[Install]
>> +WantedBy=multi-user.target
>> diff --git a/package/samba/samba.mk b/package/samba/samba.mk
>> index 31ad644..5a11ebe 100644
>> --- a/package/samba/samba.mk
>> +++ b/package/samba/samba.mk
>> @@ -182,6 +182,29 @@ endef
>>
>>  SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_INSTALL_CONFIG
>>
>> +ifeq ($(BR2_INIT_SYSTEMD),y)
>> +define SAMBA_INSTALL_TMPFILES_HOOK
>> +       $(INSTALL) -D -m 644 package/samba/samba_tmpfiles.conf \
>> +               $(TARGET_DIR)/usr/lib/tmpfiles.d/samba.conf
>> +endef
>> +
>> +SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_INSTALL_TMPFILES_HOOK
>> +endif
>> +
>> +define SAMBA_INSTALL_INIT_SYSTEMD
>> +       $(INSTALL) -D -m 644 package/samba/smbd.service \
>> +               $(TARGET_DIR)/lib/systemd/system/smbd.service
>
> smbd can be disabled, so its *.service installation should be optional
> WRT its option.
>
>> +       $(INSTALL) -D -m 644 package/samba/nmbd.service \
>> +               $(TARGET_DIR)/lib/systemd/system/nmbd.service
>
> ditto for nmbd.
>
>> +       $(if $(BR2_PACKAGE_SAMBA_WINBINDD),$(INSTALL) -D -m 644 package/samba/winbindd.service $(TARGET_DIR)/lib/systemd/system/winbindd.service)
>> +       mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>> +       ln -fs /lib/systemd/system/smbd.service \
>> +               $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/smbd.service
>
> ditto
>
>> +       ln -fs /lib/systemd/system/nmbd.service \
>> +               $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nmbd.service
>
> ditto
>
>> +       $(if $(BR2_PACKAGE_SAMBA_WINBINDD),ln -fs /lib/systemd/system/winbindd.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/winbindd.service)
>> +endef
>> +
>>  define SAMBA_INSTALL_INIT_SYSV
>>         $(INSTALL) -m 0755 -D package/samba/S91smb $(TARGET_DIR)/etc/init.d/S91smb
>>  endef
>> diff --git a/package/samba/samba_tmpfiles.conf b/package/samba/samba_tmpfiles.conf
>> new file mode 100644
>> index 0000000..e265f75
>> --- /dev/null
>> +++ b/package/samba/samba_tmpfiles.conf
>> @@ -0,0 +1,4 @@
>> +d /var/cache/samba 0755 root root -
>> +d /var/log/samba 0755 root root -
>> +d /var/lock/samba 0755 root root -
>> +d /var/run/samba 0755 root root -
>> diff --git a/package/samba/smbd.service b/package/samba/smbd.service
>> new file mode 100644
>> index 0000000..64abf56
>> --- /dev/null
>> +++ b/package/samba/smbd.service
>> @@ -0,0 +1,12 @@
>> +[Unit]
>> +Description=Samba SMB/CIFS server
>> +After=network.target nmbd.service winbindd.service
>> +
>> +[Service]
>> +Type=forking
>> +PIDFile=/var/run/samba/smbd.pid
>> +ExecStart=/usr/sbin/smbd -D
>> +ExecReload=/bin/kill -HUP $MAINPID
>> +
>> +[Install]
>> +WantedBy=multi-user.target
>> diff --git a/package/samba/winbindd.service b/package/samba/winbindd.service
>> new file mode 100644
>> index 0000000..214c17e
>> --- /dev/null
>> +++ b/package/samba/winbindd.service
>> @@ -0,0 +1,12 @@
>> +[Unit]
>> +Description=Samba Winbind daemon
>> +After=network.target nmbd.service
>> +
>> +[Service]
>> +Type=forking
>> +PIDFile=/var/run/samba/winbindd.pid
>> +ExecStart=/usr/sbin/winbindd -D
>> +ExecReload=/bin/kill -HUP $MAINPID
>> +
>> +[Install]
>> +WantedBy=multi-user.target
>> --
>> 2.2.1
>
> Regards,
>
> --
> Samuel
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
