Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3320C61DB6
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 07:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6951560688;
	Tue, 25 Aug 2026 07:36:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LhfXU85Dq_3H; Tue, 25 Aug 2026 07:36:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787643418;
	bh=q/G9ebEA4wGoWoknZ5vEU9FIeWLAmsC8wKZdQ1SyjK8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mKZGsi7uOCuVGDLAMdZBLp2KB61xGT23R3/j+ceLUei2zgYHkzUVn9lSWbh6GpwWx
	 vzSG1b2YLhPm28bIi6LFltDLmXPLA1rvTKm5THwp9ehrRZ6vyFV8vhlj0SGuvfSQs2
	 Jg6De2ZwlEFR8Z85zVoOeCHRXFVfo95FcCKqw5aYtAGziIAKiXOwSYcYPdV8flTI6E
	 rirSPglt3zusFBZfEfc2CmtwvREHpIv8S98XItmxOQXtWx3F4ymFGeUULLODHD3wCF
	 GfABscMYdd5zpB5kv2o6kBsvibJw0IXG/2uWaqObiardRvOGRaY8RHmbYvqksKu2lo
	 aivsKBGb7Er1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8026960667;
	Tue, 25 Aug 2026 07:36:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DA09F396
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 07:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7F80405E7
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 07:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id phZFjtFAHQLl for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 07:36:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:67c:2050:102:465::203; helo=mout-b-203.mailbox.org;
 envelope-from=sebastian.michel@oss.othermo.de; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=1U1V32QE
Received: from mout-b-203.mailbox.org (mout-b-203.mailbox.org
 [IPv6:2001:67c:2050:102:465::203])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E3DF405E6
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 07:36:54 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-b-203.mailbox.org (Postfix) with ESMTPS id 4hTfjv1xp7zLlrf;
 Tue, 25 Aug 2026 09:36:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oss.othermo.de;
 s=MBO0001; t=1787643411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=7QyuX4OwT1NSisy8/5P9OuAgskFkqDcWdTsl/tTPIa0=;
 b=1U1V32QEDFC7awWVj0H7eQVjGnEOxeoGLiGVAnu7zeNyAYi3+RKelRHpAEel/qI/vAc3ON
 bYh1mGrqhIR9OFp82lRy3mLqiiySJveUtRT6Y4jrC/gO6I4qYF7WrSWWzNeMYG65AFPSWJ
 Hds1qmw+dey1RJ+q6k8/yHU8ji0QNYjINbo3WwEwmQRWBUEt85cADUX6ZpStNXrfnO1dSn
 qIuysgBRyKLmMvNh5DMT7k3QUyAZme642AWYUl4QwmR0/BP/PMar4F3wAiQ9PW64NFCLMG
 URTGOgeSn1d0x+b2pLaaGoh7U3gAFY3uZ5IdnS26FyPjCqacr7sslrz8WD+ERg==
Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of sebastian.michel@oss.othermo.de
 designates 2001:67c:2050:b231:465::2 as permitted sender)
 smtp.mailfrom=sebastian.michel@oss.othermo.de
From: Sebastian Michel <sebastian.michel@oss.othermo.de>
To: buildroot@buildroot.org
Cc: Sebastian Michel <sebastian.michel@oss.othermo.de>
Date: Tue, 25 Aug 2026 09:36:05 +0200
Message-ID: <20260825073605.68465-1-sebastian.michel@oss.othermo.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4hTfjv1xp7zLlrf
Subject: [Buildroot] [PATCH] package/mali-t76x: add missing license
 information
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Added MALI_T76X_STRIP_COMPONENTS = 0 as tar archive follows nonstandard layout with license file being in the topmost directory

Signed-off-by: Sebastian Michel <sebastian.michel@oss.othermo.de>
---
 package/mali-t76x/mali-t76x.hash | 1 +
 package/mali-t76x/mali-t76x.mk   | 9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/mali-t76x/mali-t76x.hash b/package/mali-t76x/mali-t76x.hash
index a754b98074..751d0e7bf2 100644
--- a/package/mali-t76x/mali-t76x.hash
+++ b/package/mali-t76x/mali-t76x.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  5a0b00438edc8066b374481d3332a43c07ec2bd3bc73265983a968970f754902  mali-t76x_r5p0-06rel0_linux_1+fbdev.tar.gz
+sha256  b0ca7cedaf4f604a1c863ea71f741d6ca1474aebac7e606ec43d725b3c74cc63  END_USER_LICENCE_AGREEMENT.txt
\ No newline at end of file
diff --git a/package/mali-t76x/mali-t76x.mk b/package/mali-t76x/mali-t76x.mk
index 387685c033..05d7d4812c 100644
--- a/package/mali-t76x/mali-t76x.mk
+++ b/package/mali-t76x/mali-t76x.mk
@@ -10,9 +10,14 @@ MALI_T76X_SITE = http://malideveloper.arm.com/downloads/drivers/binary/$(MALI_T7
 MALI_T76X_DEPENDENCIES = mesa3d-headers
 MALI_T76X_INSTALL_STAGING = YES
 MALI_T76X_PROVIDES = libegl libgles
+MALI_T76X_LICENSE = ARM Mali GPU EULA (LES-PRE-20376)
+MALI_T76X_LICENSE_FILES = END_USER_LICENCE_AGREEMENT.txt
+MALI_T76X_REDISTRIBUTE = NO
+MALI_T76X_STRIP_COMPONENTS = 0
+
 
 define MALI_T76X_INSTALL_STAGING_CMDS
-	$(INSTALL) -m 755 $(@D)/*.so $(STAGING_DIR)/usr/lib/
+	$(INSTALL) -m 755 $(@D)/fbdev/*.so $(STAGING_DIR)/usr/lib/
 
 	$(INSTALL) -D -m 0644 package/mali-t76x/egl.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
@@ -21,7 +26,7 @@ define MALI_T76X_INSTALL_STAGING_CMDS
 endef
 
 define MALI_T76X_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 755 $(@D)/*.so $(TARGET_DIR)/usr/lib/
+	$(INSTALL) -m 755 $(@D)/fbdev/*.so $(TARGET_DIR)/usr/lib/
 endef
 
 $(eval $(generic-package))
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
