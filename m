Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6D0E7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 21:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2761E4062D;
	Mon, 16 Dec 2024 21:31:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0dqONwj5dq0l; Mon, 16 Dec 2024 21:31:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 071D540679
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 071D540679;
	Mon, 16 Dec 2024 21:31:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B59EBCE
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 21:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 963A161108
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 21:31:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MXWo9vA_wBAO for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 21:31:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6F32F6112C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F32F6112C
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F32F6112C
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 21:31:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 79C0D20005;
 Mon, 16 Dec 2024 21:31:04 +0000 (UTC)
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Mon, 16 Dec 2024 22:30:52 +0100
MIME-Version: 1.0
Message-Id: <20241216-fix_quickjs_prefix-v1-1-88ed52e67b76@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAucYGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0ND3bTMivjC0szk7Kzi+IKiVCBX18gi0dDC2DzNIMXMVAmoESIMNjQ
 6trYWAEjlEwJkAAAA
X-Change-ID: 20241211-fix_quickjs_prefix-28a1837f0d65
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1734384664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dSivoMFppeIh1jgCclhAC3aQPRNoh25wGFAcvk/ceGQ=;
 b=XbXWKeE47KQ3TcpJji33S1dlIwQcRasTKVIXRzpQz2yqxT7j37nFrD1xTw88gjsZWsCZzR
 DkO99hnVWchPjYp4TmqVayUJe6BEWKGKKv3lDwfMeMCcYKL8ApnnX9yzkEstQfp2h3luNJ
 1BsGnEeGW5lQQ6GdvroznXkVPfd3sPXp0jh12F76Pnayq8KICrg/iOW0LwQwi3uGur7RVB
 8Orx0lGmA6zK3b5Cwnfn6zKa93ZezY6YWCVIY57Yr3AFQk+rOPluhtsnRpfrlixn9yT5jg
 lfiXh41WppWQT3q15G9zgC6uJeu36tFtFDzwCzrLSemtY/Ast9kFfuwugKRLyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XbXWKeE4
Subject: [Buildroot] [PATCH] package/quickjs: fix typo in prefix
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
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The quickjs Makefile expects the variable PREFIX to be set [1] but
prefix is set instead.
Without this parameter quickjs is installed to /usr/local by default [2]
instead of /usr as requested.
This commit fixed this error.

[1]: https://github.com/bellard/quickjs/blob/master/Makefile#L383
[2]: https://github.com/bellard/quickjs/blob/master/Makefile#L43

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 package/quickjs/quickjs.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
index e745923b87bff3cdeb2f872264be5e65466020cf..2bd9da1392cb853e57492253c6202a65187fb81e 100644
--- a/package/quickjs/quickjs.mk
+++ b/package/quickjs/quickjs.mk
@@ -29,7 +29,7 @@ define QUICKJS_INSTALL_STAGING_CMDS
 		EXTRA_LIBS="$(QUICKJS_EXTRA_LIBS)" \
 		DESTDIR=$(STAGING_DIR) \
 		STRIP=/bin/true \
-		prefix=/usr \
+		PREFIX=/usr \
 		install
 endef
 
@@ -39,7 +39,7 @@ define QUICKJS_INSTALL_TARGET_CMDS
 		EXTRA_LIBS="$(QUICKJS_EXTRA_LIBS)" \
 		DESTDIR=$(TARGET_DIR) \
 		STRIP=/bin/true \
-		prefix=/usr \
+		PREFIX=/usr \
 		install
 endef
 

---
base-commit: ed9da089449c53519be02204f97c3452abba5cc3
change-id: 20241211-fix_quickjs_prefix-28a1837f0d65

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
