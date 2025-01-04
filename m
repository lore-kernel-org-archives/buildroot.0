Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760DEE77188
	for <buildroot@archiver.kernel.org>; Sat,  4 Jan 2025 21:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 223806065D;
	Sat,  4 Jan 2025 21:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3OevLlYHeur; Sat,  4 Jan 2025 21:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 297BD60A3E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 297BD60A3E;
	Sat,  4 Jan 2025 21:38:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4017AF27
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 21:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2062580A83
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 21:38:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eG4cNSF5C8Lz for <buildroot@buildroot.org>;
 Sat,  4 Jan 2025 21:38:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3421081010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3421081010
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3421081010
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 21:38:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 25B1E1BF203;
 Sat,  4 Jan 2025 21:38:44 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  4 Jan 2025 22:38:41 +0100
Message-ID: <20250104213844.825123-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736026725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=uNAVWwZfDdFqdJ88YFXZoI7KQ6wQLIa1HerV7MlHSaQ=;
 b=kReGZPWfZ/l0C92QB9IYkwjsuY5ewXRwznZXDnF0ytRJ2Qf+6ZgFcDDs14IBMDHy8gwBe3
 QJpLPGLOY3R+IBJW19u9pZScXkSMWpicF0QP/JWNttDcIToGy5xL5LrOGOQB3q1Kw4sxfb
 hiDBviigzUicpIE+ZwTHUnBCQsEbahfXb8L7Ly6Zez3fQTh2KKEp4SkrM9HPOus3oq5om+
 QfMWeWrN1+XR6oJyudX4FQxi1Uxlofvp8w8E/6QVDxP+R6lvgflipj5mOsHVf7EBhI8pU1
 vOoGJYvA+0l7SipuzkbGRal8467eUO61KvMbFQtA0nJ9xfRAKq+NOcmu6fujKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kReGZPWf
Subject: [Buildroot] [PATCH 1/2] package/cryptodev-linux: ensure
 <pkg>_LINUX_CONFIG_FIXUPS has an effect
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The variable <pkg>_LINUX_CONFIG_FIXUPS defined in the
cryptodev-linux... has no effect. Indeed, the variable is only named
CRYPTODEV_LINUX_CONFIG_FIXUPS.

But the variable name being <pkg>_LINUX_CONFIG_FIXUPS and the package
name being CRYPTODEV_LINUX, the correct variable name is
CRYPTODEV_LINUX_LINUX_CONFIG_FIXUPS.

Prior to this commit, a configuration with cryptodev-linux enabled
would result in:

$ make VARS=PACKAGES_LINUX_CONFIG_FIXUPS printvars
$

Aka, empty, while PACKAGES_LINUX_CONFIG_FIXUPS collects in
package/pkg-generic.mk the value of the <pkg>_LINUX_CONFIG_FIXUPS
variables from all enabled packages.

With this patch applied:

$ make VARS=PACKAGES_LINUX_CONFIG_FIXUPS printvars
PACKAGES_LINUX_CONFIG_FIXUPS=		@if ! grep -q '^CONFIG_CRYPTO=[my]' /; then 	/usr/bin/sed -i -e '/^\(# \)\?CONFIG_CRYPTO\>/d' / && echo 'CONFIG_CRYPTO=y' >> /; fi
		@if ! grep -q '^CONFIG_CRYPTO_USER_API_AEAD=[my]' /; then 	/usr/bin/sed -i -e '/^\(# \)\?CONFIG_CRYPTO_USER_API_AEAD\>/d' / && echo 'CONFIG_CRYPTO_USER_API_AEAD=y' >> /; fi
$

As one would expect.

Fixes: 4b12336d1fad12fbb82b4d9144e6cb5636a12256 ("package/cryptodev-linux: needs CONFIG_CRYPTO_USER_API_AEAD")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cryptodev-linux/cryptodev-linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index 580ea89520..550a248a27 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -21,7 +21,7 @@ define CRYPTODEV_LINUX_INSTALL_STAGING_CMDS
 		$(STAGING_DIR)/usr/include/crypto/cryptodev.h
 endef
 
-define CRYPTODEV_LINUX_CONFIG_FIXUPS
+define CRYPTODEV_LINUX_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_USER_API_AEAD)
 endef
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
