Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9744C27C40
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 21:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CAE3404F5;
	Thu, 24 Aug 2023 21:08:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CAE3404F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id drA-RRBcCIKv; Thu, 24 Aug 2023 21:08:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 648E840438;
	Thu, 24 Aug 2023 21:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 648E840438
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BCFE1BF84C
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2564381A0D
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:08:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2564381A0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ORGPcP3dEjwQ for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 21:08:10 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB52981766
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 21:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB52981766
Received: by mail.gandi.net (Postfix) with ESMTPA id B5E7160002;
 Thu, 24 Aug 2023 21:08:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Aug 2023 23:08:00 +0200
Message-ID: <20230824210800.1589677-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692911287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=02kjdlS/gpGAxnpsqbSfe2D3rWx01swz4lMbONSal9E=;
 b=EQB543HKxHS5Rz6Y88jyDmryHrnFYWxsumcR4wx/NVctLRB1AAN9jG2W3ZfNImCf+PfEL0
 e6U1ISh+0FqKkxmFc8XBbTFTS4+Uv5xCrvrNQtwOW3QiYbom6xs8Ur3eIGc/ZXbGpmQ0S8
 8RBb1Bqqv6YjDCTGM5B773IFXWJbCK9LhYXEEY6KAfa/lwHQn/fQ0eK5Evv3NbWWlW4o/o
 XUlONcKvgpOYAzcvZXGf5H3i+P3BQKhk2dj39d0N4rWfnFmS2qNoS8wZnJt9yIQ+WlW4NW
 sezzYNN9J77uYUFxp+dGPHRdY7ONarkMiSQpJrQxt0m7F6beUYEx1pAbvsyzZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EQB543HK
Subject: [Buildroot] [PATCH] Makefile: remove $(TARGET_DIR)/usr/mkspecs in
 target-finalize
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

qt6base installs things in /usr/mkspecs, but also the soon to be added
qt6core5compat, and the existing package qwt as well. So let's move
the removal of /usr/mkspecs in target-finalize, where we already
remove lots of development-related directories.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile           | 1 +
 package/qwt/qwt.mk | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index da52a51716..f255b1e443 100644
--- a/Makefile
+++ b/Makefile
@@ -747,6 +747,7 @@ endif
 	rm -rf $(TARGET_DIR)/usr/info $(TARGET_DIR)/usr/share/info
 	rm -rf $(TARGET_DIR)/usr/doc $(TARGET_DIR)/usr/share/doc
 	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
+	rm -rf $(TARGET_DIR)/usr/mkspecs
 	rmdir $(TARGET_DIR)/usr/share 2>/dev/null || true
 ifneq ($(BR2_ENABLE_DEBUG):$(BR2_STRIP_strip),y:)
 	rm -rf $(TARGET_DIR)/lib/debug $(TARGET_DIR)/usr/lib/debug
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index 9f0b78655f..f344ca4e3a 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -58,7 +58,6 @@ endef
 
 define QWT_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install INSTALL_ROOT=$(TARGET_DIR)
-	rm -Rf $(TARGET_DIR)/usr/mkspecs
 endef
 
 $(eval $(qmake-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
