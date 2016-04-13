From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Wed, 13 Apr 2016 10:01:24 +0200
Subject: [Buildroot] [PATCH v3] package/wpa_supplicant: Fix systemd
 service for new DBus bus name
In-Reply-To: <570D6D0F.8040303@mind.be>
References: <1460475306-29701-1-git-send-email-m.niestroj@grinn-global.com>
 <570D6D0F.8040303@mind.be>
Message-ID: <570DFCD4.2090305@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 12.04.2016 23:47, Arnout Vandecappelle wrote:
> On 04/12/16 17:35, Marcin Niestroj wrote:
>> systemd service files were supplied with old DBus bus name. After
>> service activation systemd was waiting for appearance of specified bus
>> name to consider it started successfully. However, if wpa_supplicant was
>> compiled only with new dbus interface name, then systemd didn't notice
>> configured (old) DBus bus name appearance. In the end service was
>> considered malfunctioning and it was deactivated.
>>
>> Add upstream patch, which updates systemd service BusName property
>
>   It's not an upstream patch, it's an upstreamable patch. At least, I
> can't find it in the upstream git repo nor on the mailing list. Did you
> even send it upstream already?

Sorry for misleading here, I will update description. As Baruch wrote
earlier, it's already been sent to mailing list.

>
>> @@ -0,0 +1,77 @@
>> +From b6cea24d6191d9ccdcd1ac38a5322e3da73218db Mon Sep 17 00:00:00 2001
>> +From: Marcin Niestroj <m.niestroj@grinn-global.com>
>> +Date: Mon, 11 Apr 2016 13:23:54 +0200
>> +Subject: [PATCH] systemd: Update service files according to dbus
>> interface
>> + version used
>> +
>> +systemd service files were supplied with old DBus bus name. After
>> +service activation systemd was waiting for appearance of specified bus
>> +name to consider it started successfully. However, if wpa_supplicant was
>> +compiled only with new dbus interface name, then systemd didn't notice
>> +configured (old) DBus bus name appearance. In the end service was
>> +considered malfunctioning and it was deactivated.
>> +
>> +Update systemd service BusName property according to supported DBus
>> +interface version.
>
>   If you send this patch upstream before posting a v4, please include a
> reference to the upstream mailing list message (or better yet, the
> commit :-)

Thanks for pointing it, I will add the reference.

>
>> +
>> +Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
>> +---
>> + wpa_supplicant/Makefile                          | 8 ++++++--
>> + wpa_supplicant/systemd/wpa_supplicant.service.in | 4 ++--
>> + 2 files changed, 8 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
>> +index ad9ead9..fbd1b25 100644
>> +--- a/wpa_supplicant/Makefile
>> ++++ b/wpa_supplicant/Makefile
>> +@@ -1374,6 +1374,7 @@ ifndef DBUS_INCLUDE
>> + DBUS_INCLUDE := $(shell $(PKG_CONFIG) --cflags dbus-1)
>> + endif
>> + DBUS_CFLAGS += $(DBUS_INCLUDE)
>> ++DBUS_INTERFACE=fi.epitest.hostap.WPASupplicant
>
>   Coding style in this file is with spaces around the =
>
>   Otherwise, the patch looks good to me. Since the spaces are just a
> triviality:
>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

As I am newbie in mailing list workflow: does this tag mean, that I
have permission to add it to v4 patch directly (if I fix all pointed 
issues)? Or it's just for other reviewers, so they know what has been
already reviewed in previous version of patch?

Regards,
Marcin

>
>   Regards,
>   Arnout
>
>> + endif
>> +
>> + ifdef CONFIG_CTRL_IFACE_DBUS_NEW
>> +@@ -1399,6 +1400,7 @@ DBUS_OBJS += dbus/dbus_new_introspect.o
>> + DBUS_CFLAGS += -DCONFIG_CTRL_IFACE_DBUS_INTRO
>> + endif
>> + DBUS_CFLAGS += $(DBUS_INCLUDE)
>> ++DBUS_INTERFACE=fi.w1.wpa_supplicant1
>> + endif
>> +
>> + ifdef DBUS
>> +@@ -1760,11 +1762,13 @@ else
>> + endif
>> +
>> + %.service: %.service.in
>> +-    $(Q)sed -e 's|\@BINDIR\@|$(BINDIR)|g' $< >$@
>> ++    $(Q)sed -e 's|\@BINDIR\@|$(BINDIR)|g' \
>> ++        -e 's|\@DBUS_INTERFACE\@|$(DBUS_INTERFACE)|g' $< >$@
>> +     @$(E) "  sed" $<
>> +
>> + %@.service: %.service.arg.in
>> +-    $(Q)sed -e 's|\@BINDIR\@|$(BINDIR)|g' $< >$@
>> ++    $(Q)sed -e 's|\@BINDIR\@|$(BINDIR)|g' \
>> ++        -e 's|\@DBUS_INTERFACE\@|$(DBUS_INTERFACE)|g' $< >$@
>> +     @$(E) "  sed" $<
>> +
>> + wpa_supplicant.exe: wpa_supplicant
>> +diff --git a/wpa_supplicant/systemd/wpa_supplicant.service.in
>> b/wpa_supplicant/systemd/wpa_supplicant.service.in
>> +index ea964ce..bc5d49a 100644
>> +--- a/wpa_supplicant/systemd/wpa_supplicant.service.in
>> ++++ b/wpa_supplicant/systemd/wpa_supplicant.service.in
>> +@@ -5,9 +5,9 @@ Wants=network.target
>> +
>> + [Service]
>> + Type=dbus
>> +-BusName=fi.epitest.hostap.WPASupplicant
>> ++BusName=@DBUS_INTERFACE@
>> + ExecStart=@BINDIR@/wpa_supplicant -u
>> +
>> + [Install]
>> + WantedBy=multi-user.target
>> +-Alias=dbus-fi.epitest.hostap.WPASupplicant.service
>> ++Alias=dbus- at DBUS_INTERFACE@.service
>> +--
>> +2.8.0
>> +
>>
>
>

-- 
Marcin Niestroj
