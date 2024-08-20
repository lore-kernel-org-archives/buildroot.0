Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA43C531DF
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 09:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C79F405B8;
	Tue, 20 Aug 2024 09:36:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CTaRupMNSrB2; Tue, 20 Aug 2024 09:36:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 211DB405B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 211DB405B0;
	Tue, 20 Aug 2024 09:36:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 395361BF97A
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 09:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2645D4059E
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 09:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8MEQj_lOqbIM for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 09:36:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7578740582
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7578740582
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7578740582
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 09:36:17 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id CE2D2C174F
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 09:36:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23BE1240004;
 Tue, 20 Aug 2024 09:36:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1sgLHc-00GKnS-13;
 Tue, 20 Aug 2024 11:36:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 11:35:58 +0200
Message-Id: <20240820093559.3893162-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240820093559.3893162-1-peter@korsgaard.com>
References: <20240820093559.3893162-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH-NEXT 2/2] package/eudev: make kmod support
 optional
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Eudev can be built without kmod support, E.G.  for setups not using a
modular kernel - So support that.

Make the option default y for backwards compatibility.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/eudev/Config.in | 8 +++++++-
 package/eudev/eudev.mk  | 9 ++++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 669a8a15ae..65cfc1d2de 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -9,7 +9,6 @@ config BR2_PACKAGE_EUDEV
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBS
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	select BR2_PACKAGE_KMOD
 	help
 	  eudev is a fork of systemd-udev with the goal of obtaining
 	  better compatibility with existing software such as OpenRC and
@@ -23,6 +22,13 @@ if BR2_PACKAGE_EUDEV
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "eudev"
 
+config BR2_PACKAGE_EUDEV_MODULE_LOADING
+	bool "enable kernel module loading"
+	default y
+	select BR2_PACKAGE_KMOD
+	help
+	  Enable kernel module loading support
+
 config BR2_PACKAGE_EUDEV_RULES_GEN
 	bool "enable rules generator"
 	help
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 33cc638291..8318bc1ed4 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -19,13 +19,20 @@ EUDEV_CONF_OPTS = \
 	--enable-blkid
 
 # eudev requires only the util-linux libraries at build time
-EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux-libs kmod
+EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux-libs
 EUDEV_PROVIDES = udev
 
 ifeq ($(BR2_ROOTFS_MERGED_USR),)
 EUDEV_CONF_OPTS += --with-rootlibdir=/lib --enable-split-usr
 endif
 
+ifeq ($(BR2_PACKAGE_EUDEV_MODULE_LOADING),y)
+EUDEV_CONF_OPTS += --enable-kmod
+EUDEV_DEPENDENCIES += kmod
+else
+EUDEV_CONF_OPTS += --disable-kmod
+endif
+
 ifeq ($(BR2_PACKAGE_EUDEV_RULES_GEN),y)
 EUDEV_CONF_OPTS += --enable-rule-generator
 else
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
