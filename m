Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2B2EE49A6
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 13:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 077228116B;
	Wed, 11 Sep 2024 13:19:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_IcN-qxgmub; Wed, 11 Sep 2024 13:19:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BAC38132F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BAC38132F;
	Wed, 11 Sep 2024 13:19:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A6C7B1BF342
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A32128132F
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AbUTUNpf_sb7 for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 13:19:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.243.197.30;
 helo=mail.hostpark.net; envelope-from=christian@klarinett.li;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 783C08116B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 783C08116B
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 783C08116B
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 13:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id A6BB2164E2;
 Wed, 11 Sep 2024 15:19:32 +0200 (CEST)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail0.hostpark.net [127.0.0.1]) (amavisd-new, port 10224)
 with ESMTP id ZcGxsRl9pRGZ; Wed, 11 Sep 2024 15:19:32 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.hostpark.net (Postfix) with ESMTPSA id 0BF94164DB;
 Wed, 11 Sep 2024 15:19:28 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 15:19:23 +0200
Message-ID: <20240911131924.2315851-1-christian@klarinett.li>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=klarinett.li; h=
 content-transfer-encoding:mime-version:x-mailer:message-id:date
 :date:subject:subject:from:from; s=sel2011a; t=1726060772; bh=7Z
 HNJgq1N8ORzlM33cmSBnYfND0NqkZQ+/WluOVAkD8=; b=tv7DOTWsr2cGbHOZ3i
 XGmQKsjAyB/6SvMY5EWKVXbP1cwX28DEWJ7an8ijVpQkJJ+yaiC7vBlp3If/5oki
 QHE+eXIjzlnUYguRBaIdEfdAnPn7frGpEq56v/pwiTvMjEEjz+/S47jynNsL+0fL
 FtWOOpokzQjS08Jqp8h+m+bTI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=klarinett.li
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=klarinett.li header.i=@klarinett.li header.a=rsa-sha256
 header.s=sel2011a header.b=tv7DOTWs
Subject: [Buildroot] [PATCH] package/qt6/qt6core5compat: enable QML compat
 modules
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
From: Christian Hitz via buildroot <buildroot@buildroot.org>
Reply-To: Christian Hitz <christian@klarinett.li>
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Christian Hitz <christian.hitz@bbv.ch>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Christian Hitz <christian.hitz@bbv.ch>

When BR2_PACKAGE_QT6DECLARATIVE_QUICK is enabled the QML compatibility
modules should be built and installed.

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
---
 package/qt6/qt6core5compat/qt6core5compat.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qt6/qt6core5compat/qt6core5compat.mk b/package/qt6/qt6core5compat/qt6core5compat.mk
index 0b6d9369cb..cf6158dd17 100644
--- a/package/qt6/qt6core5compat/qt6core5compat.mk
+++ b/package/qt6/qt6core5compat/qt6core5compat.mk
@@ -36,4 +36,8 @@ QT6CORE5COMPAT_DEPENDENCIES = \
 	host-pkgconf \
 	qt6base
 
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE_QUICK),y)
+QT6CORE5COMPAT_DEPENDENCIES += qt6declarative
+endif
+
 $(eval $(cmake-package))
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
