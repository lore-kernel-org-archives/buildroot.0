From: Ivan Sergeev <vsergeev@kumunetworks.com>
Date: Tue, 28 Jan 2014 11:04:44 -0800
Subject: [Buildroot] [PATCH 1/1] ntp: add systemd unit file for ntpd
In-Reply-To: <52E7567C.90607@mind.be>
References: <1390874405-25944-1-git-send-email-vsergeev@kumunetworks.com>
 <52E7567C.90607@mind.be>
Message-ID: <CAPyrzo1V2=hHi-zuZpjMXguLkHevyNm658B_E0-cpH2pOWo2vQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

1. Yup, I believe so, but it's currently not in place in the skeleton. I
think some of the proposed solutions in the network.service thread would
address this.

2. The symlink into multi-user.target.wants "enables" the service, so that
when systemd needs to reach the multi-user target (which it does when it
boots up), it will run the service. Later, running "systemctl disable" on
the service would remove the symlink, so it isn't run automatically for
that target. So the symlink facilitates enabling/disabling the service for
a given target, but the service file itself should live in
/etc/systemd/system.

Thanks,
~vsergeev
Ivan Sergeev


On Mon, Jan 27, 2014 at 11:04 PM, Arnout Vandecappelle <arnout@mind.be>wrote:

> On 28/01/14 03:00, Ivan Sergeev wrote:
>
>> Signed-off-by: Ivan Sergeev <vsergeev@kumunetworks.com>
>>
>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>
>  ---
>>   package/ntp/ntp.mk       | 13 ++++++++++++-
>>   package/ntp/ntpd.service | 11 +++++++++++
>>   2 files changed, 23 insertions(+), 1 deletion(-)
>>   create mode 100644 package/ntp/ntpd.service
>>
>> diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
>> index 40d8e4f..fe64a21 100644
>> --- a/package/ntp/ntp.mk
>> +++ b/package/ntp/ntp.mk
>> @@ -52,13 +52,24 @@ NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_TICKADJ) +=
>> util/tickadj
>>   define NTP_INSTALL_TARGET_CMDS
>>         $(if $(BR2_PACKAGE_NTP_NTPD), install -m 755 $(@D)/ntpd/ntpd
>> $(TARGET_DIR)/usr/sbin/ntpd)
>>         test -z "$(NTP_INSTALL_FILES_y)" || install -m 755 $(addprefix
>> $(@D)/,$(NTP_INSTALL_FILES_y)) $(TARGET_DIR)/usr/bin/
>> -       $(if $(BR2_PACKAGE_NTP_NTPD), install -m 755 package/ntp/S49ntp
>> $(TARGET_DIR)/etc/init.d/S49ntp)
>>         @if [ ! -f $(TARGET_DIR)/etc/default/ntpd ]; then \
>>                 install -m 755 -d $(TARGET_DIR)/etc/default ; \
>>                 install -m 644 package/ntp/ntpd.etc.default
>> $(TARGET_DIR)/etc/default/ntpd ; \
>>         fi
>>   endef
>>
>> +ifeq ($(BR2_PACKAGE_NTP_NTPD),y)
>> +define NTP_INSTALL_INIT_SYSV
>> +       $(INSTALL) -D -m 755 package/ntp/S49ntp $(TARGET_DIR)/etc/init.d/
>> S49ntp
>> +endef
>> +
>> +define NTP_INSTALL_INIT_SYSTEMD
>> +       $(INSTALL) -D -m 644 package/ntp/ntpd.service
>> $(TARGET_DIR)/etc/systemd/system/ntpd.service
>> +       mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>> +       ln -fs ../ntpd.service $(TARGET_DIR)/etc/systemd/
>> system/multi-user.target.wants/ntpd.service
>>
>
>  This patch makes me wonder about two things.
>
> 1. The 3 packages that currently install unit files all have this mkdir -p
> of multi-user.target.wants. Shouldn't that be done by the core
> infrastructure as part of the skeleton?
>
> 2. For sysv-init, we use /etc/init.d directly instead of the usual
> /etc/rcX.d with symlinks to init.d. Shouldn't we do something similar for
> systemd, i.e. put the unit files directly in multi-user.target.wants and
> begone with the symlinks?
>
>  Both of these suggestions are obviously not part of this patch, but
> rather separate cleanup work, since they affect dropbear, lighttpd and
> openssh as well.
>
>
>  Regards,
>  Arnout
>
>
>  +endef
>> +endif
>> +
>>   NTP_POST_PATCH_HOOKS += NTP_PATCH_FIXUPS
>>
>>   $(eval $(autotools-package))
>> diff --git a/package/ntp/ntpd.service b/package/ntp/ntpd.service
>> new file mode 100644
>> index 0000000..7964c53
>> --- /dev/null
>> +++ b/package/ntp/ntpd.service
>> @@ -0,0 +1,11 @@
>> +[Unit]
>> +Description=Network Time Service
>> +After=network.target
>> +
>> +[Service]
>> +Type=forking
>> +PIDFile=/run/ntpd.pid
>> +ExecStart=/usr/sbin/ntpd -g -p /run/ntpd.pid
>> +
>> +[Install]
>> +WantedBy=multi-user.target
>>
>>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140128/8dc98066/attachment.html>
