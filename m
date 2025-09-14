Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B4DCAC587
	for <buildroot@archiver.kernel.org>; Sun, 14 Sep 2025 21:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D5C741910;
	Sun, 14 Sep 2025 21:08:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wl6n4mv4xk7f; Sun, 14 Sep 2025 21:08:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56CD741949
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56CD741949;
	Sun, 14 Sep 2025 21:08:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 15CA112D
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 21:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07A296F6B3
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 21:08:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uDEGksDn01op for <buildroot@buildroot.org>;
 Sun, 14 Sep 2025 21:08:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 02CFD6F6A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02CFD6F6A4
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 02CFD6F6A4
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 21:08:39 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b0787fc3008so521222066b.3
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 14:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757884117; x=1758488917;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jbYfQIXmU9occKd8wTSi62d5rr/6CLMfBNg3iRC/rIw=;
 b=odrKh5MZ+0LqQmOl8ndqY8nZ3s2x6pRxaJilGR9Gq2G+uh6rLbFQHt+81AaRa8Dlh2
 V5e6xfCvB47d06YXHCdslX99pC509cBWpAWzVRx49vbQdRBmPprejsoHUE8bEYWGwryu
 784v2YQx7J8XMFMWuXQz6+6p05Vaf5SKac8IS+D/q+NKQv2Jz1q6AdCpr6N33sURlAQ+
 jTCd+ZPPx/U9uObTrjAOd6ays8PRNMyUlrAHtV2eNKJ/QKifXzo/OF9VQZBQZWlIdCgE
 T7UXL+CJzFVDRDHlByAGm7Gs397LaxGmhIl6lkWN/PKgprRw48/1pytxNDgozjAhdmtf
 4ZTQ==
X-Gm-Message-State: AOJu0YwdmROQMmbkhTRZH+eDdjH1138opfJdmvbYZw+cmI0IJgMocZOM
 HzmTTdRvTLwrNDadXTUqOJfWYf32d/7pmK935lUOhi35o9v1pOnQTvOD5AlHBA==
X-Gm-Gg: ASbGncvb1xEM7b6ivADu6+FyUYv7tKksomFt/6/8qDVucHrDkvQJla1XAoA1HnoML34
 EKods9ubtJ60qgN7gzHpRO8OdBU505We3TJrSscxa1aGkYueAFNXG6Gg7rBc/ZaWJFtTB68eNdg
 CtRFr7YkGsZ3ztHJjiiMzd1gt8GXB9V1y93tfpbsYJNOgEqTo8giYuUMoSAmtVDWs1Q6Gpo0+5V
 FGYuUcWROuSpchGHsXpkv6L+NdoURbh+8a3gMC5xrEeJSOBwbcyPVcF3IgpTN9ol0zj5XdKdus1
 +rOe8n0B34v9cU6oTJ0UYWdzp8rNLBbqO5RF7cZ3v+Bg3aBvjJ0hlETk2DTFnqD9+YL/e4Ai9Ax
 Pr9T8LDl3VBdaqgB166wEU08CCmIXdte7RB4IE2sX1vZR0n8tJbo+nSSFSsGGO4ayXJR+q+JWnb
 s0ENM=
X-Google-Smtp-Source: AGHT+IF76afCGKCzDUQ5VQfZzyV8dB/6TLNszk90E8R/g7r6555ndG0DKG8CFowT4bQYpPViuSzXkQ==
X-Received: by 2002:a17:906:f40d:b0:b07:dad7:e4cd with SMTP id
 a640c23a62f3a-b07dad7ecbemr681580666b.53.1757884117150; 
 Sun, 14 Sep 2025 14:08:37 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b30da58asm829997266b.5.2025.09.14.14.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Sep 2025 14:08:36 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 14 Sep 2025 23:08:11 +0200
Message-Id: <20250914210811.489994-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1757884117; x=1758488917; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jbYfQIXmU9occKd8wTSi62d5rr/6CLMfBNg3iRC/rIw=;
 b=NLQjKQlOo0P1LX6RAwF/G5okU6NrNpZpwgJx6ufPRS9mPvC8KKONZ3AdwyMpbb9nTb
 u291AXZqmmNBedIRSU2oTNnT6mqfzcPVgyyMKhbMqKHFlkvTxu23uhjbKdp8LlcD10TU
 gTG1GVFia4xi85/tqFqFFL1/f4ofgwzr+FIGAbjYkXo6Z51ETXg7v6Pdn8XaIHEwfQ6o
 Aiq1gx1WiLHr8jd4T5UVNc31/aVMc+RVgZptFvzCVjHmrchyvsWoEYU2Wcs3BYgvvskK
 ZCZDkAtQO6FMMtUQ0qUqkhXHC0Hop67VgHfRfiMZMdk0JXjO9kHsNtvKG77FWieGJgv6
 2n9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NLQjKQlO
Subject: [Buildroot] [PATCH] package/libxmlrpc: add BR2_USE_MMU dependency
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: "Alvaro G . M" <alvaro.gamez@hazent.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Build fails with:
server.c: In function 'ServerDaemonize':
server.c:1590:13: error: implicit declaration of function 'fork'
[-Wimplicit-function-declaration]
 1590 |     switch (fork()) {
      |             ^~~~

Hence, add BR2_USE_MMU to avoid building with toolchains without MMU
support.

Fixes:
https://autobuild.buildroot.org/results/10464159f2a9ff41ea0921a45ce12ecd0fa50ae7/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libxmlrpc/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libxmlrpc/Config.in b/package/libxmlrpc/Config.in
index 33d512328e..fa1b1674da 100644
--- a/package/libxmlrpc/Config.in
+++ b/package/libxmlrpc/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBXMLRPC
 	bool "libxmlrpc"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBCURL
+	depends on BR2_USE_MMU # fork()
 	help
 	  XML-RPC is a quick-and-easy way to make procedure calls over
 	  the Internet. It converts the procedure call into an XML
@@ -24,4 +25,5 @@ comment "cli tool needs a toolchain w/ dynamic library"
 endif # BR2_PACKAGE_LIBXMLRPC
 
 comment "libxmlrpc needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
