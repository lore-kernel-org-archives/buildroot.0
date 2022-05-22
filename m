Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C237C433F5
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 10:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0018F60D5E;
	Sun, 22 May 2022 10:23:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GEVOwbivOaRs; Sun, 22 May 2022 10:23:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6884C60C0F;
	Sun, 22 May 2022 10:23:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF7831BF47E
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 196EE82768
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:22:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XXZIHODpr-hi for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 10:22:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F4EE825BF
 for <buildroot@buildroot.org>; Sun, 22 May 2022 10:22:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 79AC785FDC; Sun, 22 May 2022 10:10:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 22 May 2022 12:04:48 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 9853cb9580caa3b6d9db551b124e38ddf5efbb04
X-Git-Newrev: f56e0361c5493cf0b3d0c02fe570ac609c372841
X-Patchwork-Hint: ignore
Message-Id: <20220522101055.79AC785FDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/wpa_supplicant:
 enable libnl for the WIRED driver
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f56e0361c5493cf0b3d0c02fe570ac609c372841
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

BR2_PACKAGE_WPA_SUPPLICANT_WIRED also enables the MACSEC_LINUX
driver. This driver requires libnl.

Also fix CONFIG_DRIVER_MACSEC option to enable only the generic
Linux driver and not QCA extensions.

Fixes:
http://autobuild.buildroot.net/results/2dea7dee521794b306cc610601fda322987e6cd0

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Sergey Matyukevich <geomatsi@gmail.com>
[Arnout: add Config.in comment, simplify CONFIG_ENABLE]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 4bd8bbe9fb7e5c34e6062004de53948eff78e6c9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpa_supplicant/Config.in         |  5 +++++
 package/wpa_supplicant/wpa_supplicant.mk | 11 +++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 8f095cdf2d..f2b0754ee1 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -41,12 +41,17 @@ config BR2_PACKAGE_WPA_SUPPLICANT_WEXT
 
 config BR2_PACKAGE_WPA_SUPPLICANT_WIRED
 	bool "Enable wired support"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	select BR2_PACKAGE_LIBNL
 	select BR2_PACKAGE_WPA_SUPPLICANT_EAP
 	help
 	  Include the "wired" driver, so the internal IEEE 802.1x
 	  supplicant can be used with Ethernet.  This also enables
 	  support for MACSEC.
 
+comment "wired support needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 comment "wpa_supplicant will be useless without at least one driver"
 	depends on !BR2_PACKAGE_WPA_SUPPLICANT_NL80211 && \
 		!BR2_PACKAGE_WPA_SUPPLICANT_WEXT && \
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index f0eb36e083..5ad4aa10a7 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -63,11 +63,18 @@ WPA_SUPPLICANT_CONFIG_DISABLE += \
 	CONFIG_FILS
 endif
 
-ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WIRED),)
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WIRED),y)
+WPA_SUPPLICANT_DEPENDENCIES += host-pkgconf libnl
+WPA_SUPPLICANT_CONFIG_ENABLE += \
+	CONFIG_LIBNL32 \
+	CONFIG_DRIVER_WIRED \
+	CONFIG_MACSEC \
+	CONFIG_DRIVER_MACSEC_LINUX
+else
 WPA_SUPPLICANT_CONFIG_DISABLE += \
 	CONFIG_DRIVER_WIRED \
 	CONFIG_MACSEC \
-	CONFIG_DRIVER_MACSEC
+	CONFIG_DRIVER_MACSEC_LINUX
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
