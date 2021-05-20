From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Fri, 21 May 2021 00:45:13 +0300
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: fix build with
 CVE-2021-30004 changes
In-Reply-To: <20210520201833.GG3208066@scaer>
References: <20210520190456.59520-1-geomatsi@gmail.com>
 <20210520201833.GG3208066@scaer>
Message-ID: <YKbYaYOVGxnmPd/1@curiosity>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

> > Commit a8fbe67b9b16 ("package/wpa_supplicant: add upstream patch to fix
> > CVE-2021-30004") added security patch from hostapd upstream without
> > required ASN.1 helpers. Backport and adapt two commits from the
> > hostapd upstream to add missing headers and helpers.
> > 
> > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> 
> Applied to master, thanks.
> 
> I was surprised, because I saw zero issue about this in our
> autobuilders. But I could trigger one locally with:
> 
>     BR2_arm=y
>     BR2_cortex_a7=y
>     BR2_TOOLCHAIN_EXTERNAL=y
>     BR2_INIT_NONE=y
>     BR2_SYSTEM_BIN_SH_NONE=y
>     # BR2_PACKAGE_BUSYBOX is not set
>     # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>     BR2_PACKAGE_WPA_SUPPLICANT=y
>     BR2_PACKAGE_WPA_SUPPLICANT_WEXT=y
>     BR2_PACKAGE_WPA_SUPPLICANT_WIRED=y
>     BR2_PACKAGE_WPA_SUPPLICANT_IBSS_RSN=y
>     BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT=y
>     BR2_PACKAGE_WPA_SUPPLICANT_WIFI_DISPLAY=y
>     BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN=y
>     BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT=y
>     BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG=y
>     BR2_PACKAGE_WPA_SUPPLICANT_WPS=y
>     BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
>     BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO=y
>     BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
>     BR2_PACKAGE_WPA_SUPPLICANT_DBUS=y
>     BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION=y

This issue is relevant only for hostapd internal TLS implementation.
So openssl needs to be disabled to make sure that internal TLS is
selected. Probably this is the reason why we didn't observe this
issue more frequenlty in the autobuilder ?

As soon as internal TLS is selected, the following minimal
wpa_supplicant configuration should be enough to trigger:

BR2_PACKAGE_WPA_SUPPLICANT=y
BR2_PACKAGE_WPA_SUPPLICANT_EAP=y

Regards,
Sergey
