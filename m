From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 14:10:29 +0100
Subject: [Buildroot] [PATCH 1/1] wpa_supplicant - Specify that old and
 new dbus are incompatible
In-Reply-To: <877eqwjlik.fsf@dell.be.48ers.dk>
References: <20180218215039.4811-1-pinaraf@pinaraf.info>
 <87fu5kkfy0.fsf@dell.be.48ers.dk> <3603330.UGTkN10abk@peanuts2>
 <877eqwjlik.fsf@dell.be.48ers.dk>
Message-ID: <20181216141029.69962524@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 01 Mar 2018 08:35:47 +0100, Peter Korsgaard wrote:

>  > It generated a .service file with an empty BusName in the [Service] part of 
>  > the .service.
>  > Since enabling only one interface generated the proper file, I deduced both 
>  > could not be enabled together. Maybe something else in my configuration 
>  > impacted that, I will check that again if you can't reproduce.  
> 
> Wait, are we talking about dbus service files (that afaik don't take a
> BusName directive) or systemd files?

I just did a build, with the following defconfig:

BR2_arm=y
BR2_cortex_a8=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y
BR2_INIT_SYSTEMD=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_WPA_SUPPLICANT=y
BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD=y
BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW=y
# BR2_TARGET_ROOTFS_TAR is not set

So, it has systemd enabled and both the old and new dbus interfaces in
wpa-supplicant. And the BusName is definitely not empty:

$ cat lib/systemd/system/wpa_supplicant.service 
[Unit]
Description=WPA supplicant
Before=network.target
Wants=network.target

[Service]
Type=dbus
BusName=fi.w1.wpa_supplicant1
ExecStart=/usr/sbin/wpa_supplicant -u

[Install]
WantedBy=multi-user.target
Alias=dbus-fi.w1.wpa_supplicant1.service

Since we haven't heard from the original submitter since February, I'll
mark this patch as Rejected in patchwork.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
