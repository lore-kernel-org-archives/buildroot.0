Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03627C87FCF
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 16:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B862060F4C;
	Sun, 10 Aug 2025 16:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jqqu21XchVYG; Sun, 10 Aug 2025 16:30:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBB5660ED8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBB5660ED8;
	Sun, 10 Aug 2025 16:30:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B7C67138
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 16:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9BBA40ABE
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 16:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VAoF4sW213lj for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 16:30:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AAA8F40AA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAA8F40AA6
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AAA8F40AA6
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 16:30:37 +0000 (UTC)
Received: from eos.home.n621.de (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 15BCAE00346;
 Sun, 10 Aug 2025 18:30:35 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Simon Dawson <spdawson@gmail.com>, Romain Naour <romain.naour@smile.fr>,
 Florian Larysch <fl@n621.de>
Date: Sun, 10 Aug 2025 18:30:26 +0200
Message-ID: <20250810163029.19877-2-fl@n621.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810163029.19877-1-fl@n621.de>
References: <20250810163029.19877-1-fl@n621.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1754843435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rq2JtvbCO1ykGBKK0Jm9RA36M814G1+tIboX6bWzzIo=;
 b=cPfxGsMza88knQQ2+U2LYlvRZdbvdSADyNvuuwmbmxX23vzr5OrAnts2ALUtD9oH4LWqSN
 W4VJVVrcdXBZUULDtQ3UTiQA29bem1zKQf0mYjGy15EbU8ap9D5I2rZf6M+6Up2M0g/pRu
 prlPq3tcn/5nV3RfIkWS2xaNNX/Wuxo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=cPfxGsMz
Subject: [Buildroot] [PATCH v2 1/2] package/nanocom: fix build with GCC 14
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

GCC 14 made implicit function definitions an error and the forward declaration
for display_state() was using the wrong name, causing a compilation
failure at the call site.

Fixes: https://autobuild.buildroot.org/results/ebf/ebf500c48aaa357aaac3a88d87ef8f5c07cd78b6

Signed-off-by: Florian Larysch <fl@n621.de>
---
 .../nanocom/0002-fix-build-with-gcc-14.patch  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/nanocom/0002-fix-build-with-gcc-14.patch

diff --git a/package/nanocom/0002-fix-build-with-gcc-14.patch b/package/nanocom/0002-fix-build-with-gcc-14.patch
new file mode 100644
index 0000000000..87df33a04d
--- /dev/null
+++ b/package/nanocom/0002-fix-build-with-gcc-14.patch
@@ -0,0 +1,19 @@
+GCC 14 made implicit function definitions an error and the forward declaration
+for display_state() was using the wrong name, causing a compilation
+failure at the call site.
+
+Upstream: Submitted to author via email
+Signed-off-by: Florian Larysch <fl@n621.de>
+
+diff -purN old/nanocom.h new/nanocom.h
+--- old/nanocom.h	2025-08-10 01:34:12.000284003 +0200
++++ new/nanocom.h	2025-08-10 01:27:59.545821909 +0200
+@@ -56,7 +56,7 @@ void cleanup_termios(int signal);
+ void init_stdin(struct termios *sts);
+ void init_comm();
+ void usage( char *str);
+-void display_status();
++void display_state();
+ 
+ 
+ /*typedef to represent the current line state
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
