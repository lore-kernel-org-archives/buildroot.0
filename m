Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8316DC3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1450F60E80;
	Wed, 10 Jul 2024 21:12:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EP84DoWg9785; Wed, 10 Jul 2024 21:12:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E0C160876
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E0C160876;
	Wed, 10 Jul 2024 21:12:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E0CF11BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDAAB81F7D
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:12:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mhz4BlENN3Fb for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:12:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2031880C65
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2031880C65
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:12:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05310846F6; Wed, 10 Jul 2024 21:12:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 23:09:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5778d9209c57fd19651f7493a74d20de8ab68ff9
X-Git-Newrev: e9f949d4831e9b1568cbfc0ed31a76f5f1fb2372
X-Patchwork-Hint: ignore
Message-Id: <20240710211240.05310846F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openocd: add config option for
 imx_gpio driver
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e9f949d4831e9b1568cbfc0ed31a76f5f1fb2372
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

imx_gpio driver is used on NXP i.MX family of SoCs and required e.g. for
programming noridc microcontrollers on SolidRun SolidSense family of
devices.

Add new config variable BR2_PACKAGE_OPENOCD_IMXGPIO for imx_gpio driver.

Signed-off-by: Josua Mayer <josua@solid-run.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openocd/Config.in  | 6 ++++++
 package/openocd/openocd.mk | 1 +
 2 files changed, 7 insertions(+)

diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index cef109b511..a7e068f10d 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -200,6 +200,12 @@ config BR2_PACKAGE_OPENOCD_BCM2835
 	  Enable building support for bitbanging on BCM2835
 	  (as found in Raspberry Pi)
 
+config BR2_PACKAGE_OPENOCD_IMXGPIO
+	bool "bitbanging on NXP i.MX family"
+	help
+	  Enable support for bitbanging on NXP i.MX family
+	  (as found in SolidSense N6, N8, etc.)
+
 endif # BR2_arm || BR2_aarch64
 
 config BR2_PACKAGE_OPENOCD_GW16012
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index b24d1eacf0..6b9f5541cd 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -90,6 +90,7 @@ OPENOCD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_OPENOCD_AT91RM),--enable-at91rm9200,--disable-at91rm9200) \
 	$(if $(BR2_PACKAGE_OPENOCD_BCM2835),--enable-bcm2835gpio,--disable-bcm2835gpio) \
 	$(if $(BR2_PACKAGE_OPENOCD_GW16012),--enable-gw16012,--disable-gw16012) \
+	$(if $(BR2_PACKAGE_OPENOCD_IMXGPIO),--enable-imx_gpio,--disable-imx_gpio) \
 	$(if $(BR2_PACKAGE_OPENOCD_PRESTO),--enable-presto,--disable-presto) \
 	$(if $(BR2_PACKAGE_OPENOCD_OPENJTAG),--enable-openjtag,--disable-openjtag) \
 	$(if $(BR2_PACKAGE_OPENOCD_BUSPIRATE),--enable-buspirate,--disable-buspirate) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
