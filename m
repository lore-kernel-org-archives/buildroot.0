Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9872FC52D6F
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 10:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C30B600CC;
	Wed, 21 Aug 2024 10:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RApSHczacPGX; Wed, 21 Aug 2024 10:38:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 917FD606FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 917FD606FD;
	Wed, 21 Aug 2024 10:38:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2992A1BF354
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 10:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16A75812E7
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 10:38:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y7ap7A7Spr0b for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 10:38:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6F895812E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F895812E6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F895812E6
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 10:38:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 49210240002;
 Wed, 21 Aug 2024 10:38:19 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>,
 Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Aug 2024 12:38:15 +0200
Message-ID: <20240821103816.1940502-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724236699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=1u2JnKsTvPewNHj6jh89EMtaIqkQgBCr/bjUhCyo1Mk=;
 b=JfFtZcyZJR2HXYNYEx3/Wtbk2xXwO6tFrX9HxVsP5wogqY8X7OSuRctYBwZUtsPp6jKE3c
 5eylXoZpSQH4UPKlV/An0mFmSW9FhOwH/fZzdes+AE82DiGI4c6eYSHjC+T2CDhPz3hH86
 MIeHyJ5vACJk+PLE4It4rAeSnwq9III8JnuhFcLz2gZM1eYWiXbm5JXDiSNW6cK4cn2j61
 TihT80UMgFiv3qq+eoL1bpFlx3Qpenvj5VnXTna190e5fidIuD586Tm6+WpVkDuy4b4fk6
 5KB9DEASxPMMLNP5YvmTphwP5AOIfuqMuRXEgWnKuvALSDWgYVTacgId7UgoQQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JfFtZcyZ
Subject: [Buildroot] [PATCH] package/fan-ctrl: remove package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For this package, we're downloading from the CVS repository viewer,
but it is gone. The only way would be to download from the CVS
repository itself, but really upstream is completely dead, and this
package has seen no update since it has been introduced in 2013, so
let's get rid of it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy               |  7 +++++++
 package/Config.in              |  1 -
 package/fan-ctrl/Config.in     | 11 -----------
 package/fan-ctrl/fan-ctrl.hash |  2 --
 package/fan-ctrl/fan-ctrl.mk   | 27 ---------------------------
 5 files changed, 7 insertions(+), 41 deletions(-)
 delete mode 100644 package/fan-ctrl/Config.in
 delete mode 100644 package/fan-ctrl/fan-ctrl.hash
 delete mode 100644 package/fan-ctrl/fan-ctrl.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index c1870613af..0bae66c3bb 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.08"
 
+config BR2_PACKAGE_FAN_CTRL
+	bool "fan-ctrl has been removed"
+	select BR2_LEGACY
+	help
+	  This package was no longer available from SourceForge, the
+	  upstream is completely dead.
+
 config BR2_PACKAGE_FLUTTER_DYNAMIC_LAYOUTS_EXAMPLE
 	bool "flutter-dynamic-layouts-example has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index f2c63ffb6e..317f859684 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -513,7 +513,6 @@ endmenu
 	source "package/ev3dev-linux-drivers/Config.in"
 	source "package/evemu/Config.in"
 	source "package/evtest/Config.in"
-	source "package/fan-ctrl/Config.in"
 	source "package/fbtft/Config.in"
 	source "package/fconfig/Config.in"
 	source "package/flashrom/Config.in"
diff --git a/package/fan-ctrl/Config.in b/package/fan-ctrl/Config.in
deleted file mode 100644
index 869631683b..0000000000
--- a/package/fan-ctrl/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_FAN_CTRL
-	bool "fan-ctrl"
-	depends on BR2_USE_MMU # fork()
-	help
-	  Fan-ctrl is a little daemon that controls the speed of one
-	  or more system or CPU fans. It does so by monitoring
-	  temperature inputs and selecting a fan speed from an array
-	  of available speeds based on a set of temperature
-	  thresholds.
-
-	  http://fan-ctrl.sourceforge.net/
diff --git a/package/fan-ctrl/fan-ctrl.hash b/package/fan-ctrl/fan-ctrl.hash
deleted file mode 100644
index 4f26696785..0000000000
--- a/package/fan-ctrl/fan-ctrl.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed
-sha1  d8ba5bac15e90c36a4e908ca1c98fac83bf702ea  fan-ctrl.c?revision=1.3
diff --git a/package/fan-ctrl/fan-ctrl.mk b/package/fan-ctrl/fan-ctrl.mk
deleted file mode 100644
index 81a52f1e9f..0000000000
--- a/package/fan-ctrl/fan-ctrl.mk
+++ /dev/null
@@ -1,27 +0,0 @@
-################################################################################
-#
-# fan-ctrl
-#
-################################################################################
-
-# no release, so grab .c file directly from viewvc
-FAN_CTRL_VERSION = 1.3
-FAN_CTRL_SOURCE = fan-ctrl.c?revision=$(FAN_CTRL_VERSION)
-FAN_CTRL_SITE = http://fan-ctrl.cvs.sourceforge.net/viewvc/fan-ctrl/fan-ctrl
-FAN_CTRL_LICENSE = GPL-2.0+
-FAN_CTRL_LICENSE_FILES = fan-ctrl.c
-
-define FAN_CTRL_EXTRACT_CMDS
-	cp $(FAN_CTRL_DL_DIR)/$(FAN_CTRL_SOURCE) $(@D)/fan-ctrl.c
-endef
-
-define FAN_CTRL_BUILD_CMDS
-	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
-		$(@D)/fan-ctrl.c -o $(@D)/fan-ctrl
-endef
-
-define FAN_CTRL_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 755 $(@D)/fan-ctrl $(TARGET_DIR)/usr/sbin/fan-ctrl
-endef
-
-$(eval $(generic-package))
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
