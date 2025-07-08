Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FE3C8303C
	for <buildroot@archiver.kernel.org>; Tue,  8 Jul 2025 13:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F31F60DB0;
	Tue,  8 Jul 2025 13:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0QnppG0-nUiw; Tue,  8 Jul 2025 13:14:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B70360E17
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B70360E17;
	Tue,  8 Jul 2025 13:14:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D71612E
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 13:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8062340727
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 13:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ip3ZtTd9F3On for <buildroot@buildroot.org>;
 Tue,  8 Jul 2025 13:14:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2C7524071F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C7524071F
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C7524071F
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 13:14:21 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id BE2922C845F4;
 Tue, 08 Jul 2025 15:14:18 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Date: Tue,  8 Jul 2025 15:14:16 +0200
Message-ID: <20250708131418.666495-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1751980458; bh=18YdrLQeXVY2g6aTizh1ctCQyPijwug0iOH5JFMDSZs=;
 h=From:To:Cc:Subject:Date;
 b=A+AuwT4xNUby5NqlpXxZBmvtHOZu/GZUVyEepvASwWLoacQANIXnDzUqP2BIzzakt
 oSovCdqf6ReAhdF+he0ULYpY5Qb754LzksGLaXOGPr3DVJRua08CE6Z2f0qk/8C+3m
 o63oZy+ADWPx8VggD8Uh9iDkUjcAK0sYtGhQkUWIf83miP1hofhL6yexH4KeFgrlyh
 ZoZBdr/2GvCVq7hNkdtynx4AkOkMMUmDNM7Xgt6YoCQgKBAxWkjzbhs7fllR5aLb5V
 Uj3Za5HTmdeZPtz7a08eW+FS+stIOAbjLthlXToGkOty9PAZQDxoyCoRa6JbPvaHpj
 HHmBCaSt4eSig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=A+AuwT4x
Subject: [Buildroot] [PATCH] package/sudo: fix SUDO_ENABLE_SUDO_GROUP_RULE
 following version bump
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Marcus Hoffmann <marcus.hoffmann@othermo.de>

Since the version bump of sudo to 1.9.17p1 [1], the sed command in
SUDO_ENABLE_SUDO_GROUP_RULE no longer matches the the line in the
example sudoers file shipped with the sudo package.

This commit fixes the regexp to match the new sudoers file.

[1] ee86844e632d5760355154ea4e928c9228f3dfd1

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/sudo/sudo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 4e1405eaf1..f57a86805a 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -73,7 +73,7 @@ define SUDO_USERS
 endef
 
 define SUDO_ENABLE_SUDO_GROUP_RULE
-	$(SED) '/^# \%sudo\tALL=(ALL:ALL) ALL/s/^# //' $(TARGET_DIR)/etc/sudoers
+	$(SED) '/^# \%sudo ALL=(ALL:ALL) ALL/s/^# //' $(TARGET_DIR)/etc/sudoers
 endef
 SUDO_POST_INSTALL_TARGET_HOOKS += SUDO_ENABLE_SUDO_GROUP_RULE
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
