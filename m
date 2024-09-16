Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DBFC3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 09:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 523744013B;
	Mon, 16 Sep 2024 09:32:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7otFeCB-tbG; Mon, 16 Sep 2024 09:32:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B4A740110
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B4A740110;
	Mon, 16 Sep 2024 09:32:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C9C5D1BF95A
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 09:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B85C86061F
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 09:32:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nYqrxLtkrfVt for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 09:32:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.44.123;
 helo=mail1.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D51AC605CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D51AC605CB
Received: from mail1.insia.net (mail1.insia.net [188.165.44.123])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D51AC605CB
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 09:32:19 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail1.insia.net (Postfix) with ESMTP id 51C6F3FA3D;
 Mon, 16 Sep 2024 11:32:13 +0200 (CEST)
Received: from sb-dev-build.insia.net. (gw-servers.insia.net [192.168.1.1])
 by smtp.insia.net (Postfix) with ESMTP id 364DE5F497;
 Mon, 16 Sep 2024 11:27:43 +0200 (CEST)
From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 11:31:45 +0200
Message-Id: <20240916093146.2957308-1-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail1; t=1726479133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=nGdvyHVqOWTLwXKU4h8Zvp22K7U0wjAa+dZxnUzdVEc=;
 b=Q8F4hog0uzFVijhV3A/7e6F/Lb+n4ipNKGGcWZeCbz30oVhZYh0b62MvN12XEe9OJqSCCs
 vYscfHUvnZ9rJCCgmXxV7i+8j7w27K9vKwtIdVV0XDf3B+ud9lYPKU8yfd0wn3mByEjlKI
 V0Hfw65Mvcow+JXcs/lq2Rsqca7WV+K7G43h4xf3rCtzP1PIC/UctxAnleCC7VnxeHSeSB
 BOF95eyr4+jApRs1N1cSgU/UGRql8W0vSHiukjHb/qCPDGfEI693JvMyRaDpxr3gYQnsUu
 OKZc2c4t+OyWTqM40PlDayUDrRqQXzdpqcL+3pf5e82KICBo/SblvL0yEkc01A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail1 header.b=Q8F4hog0
Subject: [Buildroot] [PATCHv3 1/2] package/gdk-pixbuf: fix loader cache
 update hook
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
Cc: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
