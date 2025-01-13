Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979AEE7719F
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 10:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 236F060A7B;
	Mon, 13 Jan 2025 10:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J_Afegn-lMqY; Mon, 13 Jan 2025 10:52:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 071636083F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 071636083F;
	Mon, 13 Jan 2025 10:52:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B2BA495D
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 10:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92F1A403A3
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 10:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AEXrasAhVQ0H for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 10:51:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.44.123;
 helo=mail1.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BA66040510
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA66040510
Received: from mail1.insia.net (mail1.insia.net [188.165.44.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA66040510
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 10:51:56 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail1.insia.net (Postfix) with ESMTP id 4817C3F9E0;
 Mon, 13 Jan 2025 11:42:57 +0100 (CET)
Received: from sb-dev-build.insia.net. (gw-servers.insia.net [192.168.1.1])
 by smtp.insia.net (Postfix) with ESMTP id 74B7D5F497;
 Mon, 13 Jan 2025 11:28:47 +0100 (CET)
From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
Date: Mon, 13 Jan 2025 11:42:51 +0100
Message-Id: <20250113104252.889738-1-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail1; t=1736764977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=nGdvyHVqOWTLwXKU4h8Zvp22K7U0wjAa+dZxnUzdVEc=;
 b=OCkmIcDfS25dYK/duotL3vTSlUBwI2oBMnbeDOu/yNxNzXv/sP+HB0XS8/clQhf5V2fSb4
 V0yF9fgSfugdT7YbyFk9JwMFLSS7wE6HOaSmPv8yB1be+92WRjOIzF0UNmu70/n7kJ/4Kg
 0Im6UqeU5WxKpGtTjpo0ljQrvZtDir8LPMd2ZGEYsCB+AurFRxYQkakKbS052tGBjhFVTz
 zpPwN01iYkktGNlFsDAVjXPHikQrgScdTDgaRbSMdFV9fmV+4c4nF2g/10Xhf37G+xwnBJ
 SsmnzInq9UxQmqawNQKBQBRXNvZ6XBH53WI1VMtOJe8n8PM2ATplYaby4fcmag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail1 header.b=OCkmIcDf
Subject: [Buildroot] [PATCHv3 1/2] package/gdk-pixbuf: fix loader cache
 update hook
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

Build loaders.cache before rootfs, so it can include loader from
gdk-pixbuf and external loader (e.g.: librsvg) instead of just loader
from gdk-pixbuf.

Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
---
 package/gdk-pixbuf/gdk-pixbuf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index e041d2cbde..a8a21f0532 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -82,7 +82,7 @@ define GDK_PIXBUF_UPDATE_CACHE
 	$(SED) 's,^"lib,"/usr/lib,g' \
 		$(TARGET_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
 endef
-GDK_PIXBUF_POST_INSTALL_TARGET_HOOKS += GDK_PIXBUF_UPDATE_CACHE
+GDK_PIXBUF_ROOTFS_PRE_CMD_HOOKS += GDK_PIXBUF_UPDATE_CACHE
 endif
 
 # Target gdk-pixbuf needs loaders.cache populated to build for the
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
