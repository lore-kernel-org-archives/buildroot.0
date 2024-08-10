Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB049C3DA4A
	for <buildroot@archiver.kernel.org>; Sat, 10 Aug 2024 21:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A338C60690;
	Sat, 10 Aug 2024 21:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T3fx2kaZGe19; Sat, 10 Aug 2024 21:56:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4B7D606B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4B7D606B9;
	Sat, 10 Aug 2024 21:56:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12C9F1BF2C4
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 21:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BE9E81446
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 21:56:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZm6HNsU4euR for <buildroot@lists.busybox.net>;
 Sat, 10 Aug 2024 21:56:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 066758143C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 066758143C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 066758143C
 for <buildroot@buildroot.org>; Sat, 10 Aug 2024 21:56:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id B1AF9FF803;
 Sat, 10 Aug 2024 21:56:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Aug 2024 23:56:15 +0200
Message-ID: <20240810215624.482529-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240810215624.482529-1-thomas.petazzoni@bootlin.com>
References: <20240810215624.482529-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723326990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=01Js1jWMdc73xhJpfPuAvoqTXfsr2+LNN+bTC8IoZJE=;
 b=UtdVlAAGvShqBN+80deIhKltgmALT898cpF2ZK2PfM0Q5o8yTrYgYN1NbwCGipGWkJEbY2
 nxfoq2JSz0JhIzKjw1jsinlg8RPrn7d5d0s9fySpgpCdkiYNj0oXyJbTgnH3Mg99yYKURG
 omGTYB3pGugp+Gp5sWpYX06oqaa5a4hxuRMtNRb+tolxH2Upq124I3kJKYwszgDEPWvgC5
 jIzMjQIy1I4Q0SAywGEe7dR+y3hQku7tkjlbLpeLQbEaUU9e5oXXUC6/6AhjpIkeXF4pyM
 IFWuIixVpgl5SFrjYzju6mkZUTXaTH5/ORcCooA8ND6RJM6SnogueFk/6FnHKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UtdVlAAG
Subject: [Buildroot] [PATCH next 1/7] arch/Config.in: introduce
 BR2_ARCH_NEEDS_GCC_AT_LEAST_15
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

Since we're going to introduce external toolchains that are based on
GCC 14.x, we will need them to "depends on
!BR2_ARCH_NEEDS_GCC_AT_LEAST_15", so let's introduce this symbol
first.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index f39c33ef7f..2e7ac080ef 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -312,6 +312,10 @@ config BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	bool
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 
+config BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+
 # The following string values are defined by the individual
 # Config.in.$ARCH files
 config BR2_ARCH
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
