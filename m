From: Tian Yuanhao <tianyuanhao@aliyun.com>
Date: Thu, 1 Apr 2021 09:43:54 +0800
Subject: [Buildroot] [PATCH v2 1/1] package/wpa_supplicant: fix wrong
 config
In-Reply-To: <20210317033739.71436-1-tianyuanhao@aliyun.com>
References: <20210316021804.3790808-1-tianyuanhao@aliyun.com>
 <20210317033739.71436-1-tianyuanhao@aliyun.com>
Message-ID: <fbef5119-fcd2-c9c8-f4c0-165aee254d41@aliyun.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nicolas,

In my opinion, the two options CONFIG_CTRL_IFACE and 
CONFIG_CTRL_IFACE_DBUS_NEW are not directly related except for their 
similar names. It should be correct now. Could you please test it?

Regards,
Yuanhao

On 2021/3/17 ??11:37, Tian Yuanhao wrote:
 > When BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE is not set and
 > BR2_PACKAGE_WPA_SUPPLICANT_DBUS=y, CONFIG_CTRL_IFACE_DBUS_NEW will be
 > enabled by 's/^#\(CONFIG_CTRL_IFACE_DBUS_NEW\)/\1/' first, and then
 > disabled by 's/^\(CONFIG_CTRL_IFACE\)/#\1/'.
 >
 > v2:
 >?? - fix it by adding '\>' after CONFIG_CTRL_IFACE
 >?? - disable CONFIG_CTRL_IFACE_DBUS_INTRO when not enabled
 >
 > Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
 > ---
 >? package/wpa_supplicant/wpa_supplicant.mk | 4 +++-
 >? 1 file changed, 3 insertions(+), 1 deletion(-)
 >
 > diff --git a/package/wpa_supplicant/wpa_supplicant.mk 
b/package/wpa_supplicant/wpa_supplicant.mk
 > index c82db43c1c..c861db3d12 100644
 > --- a/package/wpa_supplicant/wpa_supplicant.mk
 > +++ b/package/wpa_supplicant/wpa_supplicant.mk
 > @@ -135,7 +135,7 @@ WPA_SUPPLICANT_CONFIG_EDITS += 
's/\#\(CONFIG_TLS=\).*/\1internal/'
 >? endif
 >
 >? ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE),)
 > -WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_CTRL_IFACE
 > +WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_CTRL_IFACE\>
 >? endif
 >
 >? ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS),y)
 > @@ -152,6 +152,8 @@ endef
 >
 >? ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION),y)
 >? WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_CTRL_IFACE_DBUS_INTRO
 > +else
 > +WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_CTRL_IFACE_DBUS_INTRO
 >? endif
 >
 >? else
 >
