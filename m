From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon, 9 Sep 2019 16:40:12 +0300
Subject: [Buildroot] [PATCH 1/2] package/wpa_supplicant: add Config.in
 option for WPA3
In-Reply-To: <CANQCQpZGn5EW0txRAwvKCTej6bOYiTseysFCicsRSAxnG=nvUA@mail.gmail.com>
References: <20190908151709.23971-1-geomatsi@gmail.com>
 <20190908151709.23971-2-geomatsi@gmail.com>
 <CANQCQpZGn5EW0txRAwvKCTej6bOYiTseysFCicsRSAxnG=nvUA@mail.gmail.com>
Message-ID: <20190909134012.qnf2yojdfqk3hemn@bars>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > New wpa_supplicant v2.9 enables by default WPA3 features such as
> > SAE and DPP. Building those features requires openssl.
> >
> > This patch adds Config.in option for WPA3 support in wpa_supplicant.
> > When this option is selected, libopenssl is also selected and WPA3
> > features OWE, SAE, DPP are enabled in wpa_supplicant configuration.
> > When this option is deselected, then all the above WPA3 options
> > are disabled.

...

> To test your else case with WPA3 disabled.  I took the following build
> failure and applied your patch.
> http://autobuild.buildroot.net/results/c93c1f78429d022fd0f7b6db91eb860cc3d4d95b/
> 
> Here's where the build now fails.  Looks like the sae related linking
> issues are gone but dfs is still an issue.
> /home/foobar/c93c1f78429d022fd0f7b6db91eb860cc3d4d95b/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld:
> ../src/ap/ieee802_11_vht.o: in function
> `hostapd_eid_txpower_envelope':
> ieee802_11_vht.c:(.text+0x2c8): undefined reference to `hostapd_is_dfs_required'
> 
> This can be resolved by adding the src/ap/dfs.o to the list of items
> built, I'm just unsure of the right CONFIG option to set that or if it
> is an actual Makefile miss when a recent feature was added.  It will
> build successful it you enable the Buildroot
> "BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT" option that adds the missing
> objs.
> 
> Regards,
> Matt

Hi Matt,

Multiple wpa_supplicant build issues of this kind have been already
reported in the latest daily build results. This issue is reproduced
when BR2_PACKAGE_WPA_SUPPLICANT_NL80211 disabled. In this case
wpa_supplicant uses WEXT driver by default. However that
driver does not support AP mode.

On the other hand, wpa-supplicant v2.9 enables CONFIG_AP in defconfig.
This was not the case in v2.7, so wpa_supplicant.mk does not switch
off this option when BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT is disabled. 

I have a patch for this issue as well and plan to include into v2 after
I collect some feedback regarding WPA3 support.

In brief, the fix is going to be someting like this:

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index a518ecc217..1d582354f7 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -84,10 +84,16 @@ ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT),y)
 WPA_SUPPLICANT_CONFIG_ENABLE += \
 	CONFIG_AP \
 	CONFIG_P2P
+else
+WPA_SUPPLICANT_CONFIG_DISABLE += \
+	CONFIG_AP \
+	CONFIG_P2P
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WIFI_DISPLAY),y)
 WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_WIFI_DISPLAY
+else
+WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_WIFI_DISPLAY
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING),y)


Regards,
Sergey
