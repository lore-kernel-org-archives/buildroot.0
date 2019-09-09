From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon,  9 Sep 2019 23:20:31 +0300
Subject: [Buildroot] [PATCH v2 0/3] Fixes for hostapd/wpa_supplicant packages
Message-ID: <20190909202034.27508-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas and all,

New wpa_supplicant v2.9 enables by default in its defconfig several features
for WPA3 support and AP mode:
- WPA3: CONFIG_OWE, CONFIG_SAE, CONFIG_DPP
- AP: CONFIG_AP, CONFIG_P2P, CONFIG_WIFI_DISPLAY

WPA3 features add openssl to wpa_supplicant dependencies. The first
two patches add Config.in option for WPA3 support in both hostapd and
wpa_supplicant. When this option is selected, then openssl is also
selected and WPA3 features are enabled in hostapd/wpa_s configuration
files. 

AP features make sense only for wpa_supplicant drivers supporting AP
mode. For instance, if only WEXT driver is enabled, then those features
should be explicitely disabled from hostapd/wpa_s configuration files.
The 3rd patch explicitely disables AP features in wpa_supplicant
configuration file unless they are requested by Config.in options.

These changes are supposed to fix the following two types of issues
listed in daily build results for 2019-09-06:

- wpa_supplicant-2.9 build issues
  -- undefined references to hostapd_is_dfs_required and more
- defconfig board issues (orangepi and other boards)
  -- missing openssl headers

Regards,
Sergey

Changes v1 -> v2

- add patch fixing AP mode options for wpa_supplicant
- update commit messages


Sergey Matyukevich (3):
  package/wpa_supplicant: add Config.in option enabling WPA3 support
  package/hostapd: add Config.in option enabling WPA3 support
  package/wpa_supplicant: fix AP mode settings

 package/hostapd/Config.in                |  7 +++++++
 package/hostapd/hostapd.mk               | 11 +++++++++++
 package/wpa_supplicant/Config.in         |  7 +++++++
 package/wpa_supplicant/wpa_supplicant.mk | 18 ++++++++++++++++++
 4 files changed, 43 insertions(+)

-- 
2.23.0
