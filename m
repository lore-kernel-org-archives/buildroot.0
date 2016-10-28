From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Oct 2016 14:43:59 +0200
Subject: [Buildroot] [git commit] linux-firmware: Include all bnx2x firmwares
Message-ID: <20161028124448.B01FB81972@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e37a9115f51c15115dfde7bc896c408ca0840561
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently buildroot will create a broken system for any kernel version
not between 3.18 and 4.1, as the bnx2x firmware it includes is only
valid for that version of the upstream driver.

This change modifies the build so that all versions are included as there was a
strong preference for not adding options for each version, nor only supporting
the latest kernel:

On Fri, Feb 26, 2016 at 7:09 PM, Thomas Petazzoni wrote:
> I think adding new config to chose between different versions of a
> given firmware is going a bit too far. If we were to do that for all
> firmwares in linux-firmware, it would really increase the number of
> Config.in options too much.
>
> Shall I suggest to install both versions of the firmware? The firmware
> files are not that large, and if filesystem size is really a strong
> issue, it is always possible to clean up the non-required firmware
> files in a post-build script.

On Wed, Mar 2, 2016 at 7:47 AM, Arnout Vandecappelle wrote:
> No, this is certainly not good, it fixes 4.2+ and simultaneously breaks 4.1-.
>
> What is wrong with Thomas's proposal to remove the unneeded versions in a
> post-build script? If your size is so important that 640K matters, you would
> probably anyway want to keep only one of the six binaries instead of three
> different chip revisions.

It is up to the user to ensure they remove the versions they don't want.

Note that this increases the size of the root file system by about 8MB.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/linux-firmware.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 38bced6..535b69a 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -295,10 +295,7 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BNX2X),y)
-LINUX_FIRMWARE_FILES += \
-	bnx2x/bnx2x-e1-7.10.51.0.fw \
-	bnx2x/bnx2x-e1h-7.10.51.0.fw \
-	bnx2x/bnx2x-e2-7.10.51.0.fw
+LINUX_FIRMWARE_FILES += bnx2x/*
 # No license file; the license is in the file WHENCE
 # which is installed unconditionally
 endif
