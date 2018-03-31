From: Pascal Vizeli <pvizeli@syshack.ch>
Date: Sat, 31 Mar 2018 17:28:40 +0200
Subject: [Buildroot] [PATCH 1/1] NetworkManager: allow to wait on boot
In-Reply-To: <f34ec8b4-5851-7710-b17b-c649f04d4b99@mind.be>
References: <CACvFaDdBTOiSQw9V7PHOff5_p5U-S-MvD0gWb6suKF4Cq=kEVg@mail.gmail.com>
 <f34ec8b4-5851-7710-b17b-c649f04d4b99@mind.be>
Message-ID: <CACvFaDezuh2GxOSnoRVYQPUEvR7Q0HMJ1sPMXB2yn4YCdXUP=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I try it agen :) git send-email was never running on my dev system :(
There are a lot of people with problems on that and no solution have
relay work...


2018-03-31 11:10 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
>  Hi Pascal,
>
>  Thank you for your contribution.
>
> On 30-03-18 23:48, Pascal Vizeli wrote:
>> From 9bb88ee15c3b603c39b6140c040b4a5b17c8a86a Mon Sep 17 00:00:00 2001
>> From: Pascal Vizeli <pvizeli@syshack.ch>
>> Date: Fri, 30 Mar 2018 22:25:57 +0200
>> Subject: [PATCH 1/1] NetworkManager: allow to wait on boot
>>
>> This patch allow a system to wait for network card on boot time.
>>
>> Signed-off-by: Pascal Vizeli <pvizeli@syshack.ch>
>> ---
>>  package/network-manager/Config.in          | 6 ++++++
>>  package/network-manager/network-manager.mk | 6 ++++++
>>  2 files changed, 12 insertions(+)
>>
>> diff --git a/package/network-manager/Config.in
>> b/package/network-manager/Config.in
>> index 72658c1..1bdb225 100644
>> --- a/package/network-manager/Config.in
>> +++ b/package/network-manager/Config.in
>> @@ -62,6 +62,12 @@ config BR2_PACKAGE_NETWORK_MANAGER_OVS
>>   help
>>    This option enables support for OpenVSwitch
>>
>> +config BR2_PACKAGE_NETWORK_MANAGER_WAIT_BOOT
>> + bool "Wait on boot support"
>> + depends on BR2_INIT_SYSTEMD
>
>  Indentation is not correct. Please use the utils/check-package script to
> validate your changes.
>
>  Or perhaps it's your mailer that destroyed the whitespace. In that case (or
> actually, in any case) please use git send-email to send your patch.
>
>
>> + help
>> +  This option allow NetworkManager to wait on boot
>> +
>>  endif
>>
>>  comment "NetworkManager needs udev /dev management and a glibc
>> toolchain w/ headers >= 3.7, dynamic library"
>> diff --git a/package/network-manager/network-manager.mk
>> b/package/network-manager/network-manager.mk
>> index a520aad..d48ffe9 100644
>> --- a/package/network-manager/network-manager.mk
>> +++ b/package/network-manager/network-manager.mk
>> @@ -102,6 +102,12 @@ define NETWORK_MANAGER_INSTALL_INIT_SYSTEMD
>>
>>   ln -sf /usr/lib/systemd/system/NetworkManager-dispatcher.service \
>>   $(TARGET_DIR)/etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service
>> +
>> + if [ $(BR2_PACKAGE_NETWORK_MANAGER_WAIT_BOOT) == y ]; \
>> + then \
>> + ln -sf /usr/lib/systemd/system/NetworkManager-wait-online.service \
>> + $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/NetworkManager-wait-online.service;
>
>  Is there any reason to do this conditionally? As far as I can see, this service
> does nothing except block other services that need networking until you get an
> IP address. Why would you ever NOT want this?
>
>  In other words, I think you should remove the Config.in option, and instead
> create the symlink unconditionally.
>
>
>  I have marked your patch as Changes Requested in patchwork, so unless you
> resend it (with the fixes mentioned above), we will forget about it.
>
>  Thank you!
>
>  Regards,
>  Arnout
>
>> \
>> + fi
>>  endef
>>
>>  $(eval $(autotools-package))
>>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-NetworkManager-allow-to-wait-on-boot.patch
Type: application/octet-stream
Size: 1119 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180331/5709e9b1/attachment.obj>
