Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFFDC52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 21:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95A5C40319;
	Sun, 18 Aug 2024 21:56:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bU2XaklWdfNc; Sun, 18 Aug 2024 21:56:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9233403E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9233403E9;
	Sun, 18 Aug 2024 21:56:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C3B861BF407
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 21:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FAB540051
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 21:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id obLg52jCo5mC for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 21:56:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 48DC34021B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48DC34021B
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48DC34021B
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 21:56:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id A53841BF204;
 Sun, 18 Aug 2024 21:56:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Aug 2024 23:56:26 +0200
Message-ID: <20240818215627.1055491-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240818215627.1055491-1-thomas.petazzoni@bootlin.com>
References: <20240818215627.1055491-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724018189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dvVAAG4EnRB9QcW7aQ2XMhq2X7DoKQEQRfQwkjK3XhA=;
 b=RUX+n+UXNmoveYTO4IF/5mrhFLwknoqFIIaZ5rXpjnwwkoCdEBjktbQDkQOQY4yIPQUzXU
 YrAAtWfIPyJpfVcIng4RNIs7nDf3kI3LykbFRjz+8MH7NKVQeELUOTOc2knNCkwj1T1Q2+
 P3AeyU5kIyhqsiD9HyiLXpBAxz5wgTSvY/fiEpFu1/zDD2TjhQfLD/D/cVdjjGgk852jLx
 jTRB720X8Tsq1PrP+PII6S4WTthN4Q+o+8+DbHqOs1doSCExd7NUiSA+8NYQZ6OP5qNEQK
 f8qXwVRMJ/wNKU3M0krFtTlpWHjiXlArHPFeO5UvUbIr8kM3vVxAb66IjZm/gA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RUX+n+UX
Subject: [Buildroot] [PATCH 2/2] package/flashrom: disable documentation and
 man-pages
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

The build of the manpage currently fails with:

ERROR: File 'doc/man8' could not be found
FAILED: meson-internal__install

As we don't care about man pages and documentation in Buildroot, let's
disable them. The issue has nevertheless been reported at
https://github.com/flashrom/flashrom/issues/329.

Fixes:

  http://autobuild.buildroot.net/results/885a957d1b5305d3b91339487cc2a0d64dc74f5e/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flashrom/flashrom.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 46d42640e9..8648965303 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -14,7 +14,9 @@ FLASHROM_CONF_OPTS = \
 	-Dich_descriptors_tool=enabled \
 	-Dtests=disabled \
 	-Duse_internal_dmi=true \
-	-Dwerror=false
+	-Dwerror=false \
+	-Dman-pages=disabled \
+	-Ddocumentation=disabled
 
 FLASHROM_PROGRAMMERS = \
 	buspirate_spi \
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
