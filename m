Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C54E77188
	for <buildroot@archiver.kernel.org>; Tue, 24 Dec 2024 10:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDBEB605F1;
	Tue, 24 Dec 2024 10:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oXXjV91bsVaY; Tue, 24 Dec 2024 10:19:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2439606DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2439606DA;
	Tue, 24 Dec 2024 10:19:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EC079F16
 for <buildroot@buildroot.org>; Tue, 24 Dec 2024 10:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6CC681189
 for <buildroot@buildroot.org>; Tue, 24 Dec 2024 10:19:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VwELX8riA2Gl for <buildroot@buildroot.org>;
 Tue, 24 Dec 2024 10:19:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=aduskett@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 882BA81186
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 882BA81186
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 882BA81186
 for <buildroot@buildroot.org>; Tue, 24 Dec 2024 10:19:33 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43626213fffso36391085e9.1
 for <buildroot@buildroot.org>; Tue, 24 Dec 2024 02:19:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735035571; x=1735640371;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0KNp8AOsZbX2pCr022HGU69Kq1jWUZKLp7bSAu6Nmx8=;
 b=SBY5srSre7bEK2Kdu8almKmnmMWqXjpHnn6x1L+CNxQuezGSIItViVp0zc5QQBt284
 zNFS4Q9Z8sb7TJvYtZEB9DQSlhZnMg4KyxgtATwmAtIuBBt/yU7W0fYA4uxS9MrxO5z2
 72bJ7dnLcKJIccNTR8tu0ku8HfIN5Bhl3+FQI4DNJFyOAakY2gAzHruloalpA9w5uVvp
 OTTOQfp/nrc47utOAe9EvkBb/x7GCRW5WalCQA+zvqHBd1AkGuU0HG+9R3rQM369Ez5T
 jidr13LbPgSQv+6URq4Wr2N4t5vrJDvF6B0LaGmpMQKV0+Hn/cRtQl87+NOmmfQYCx0B
 a/0g==
X-Gm-Message-State: AOJu0Yyc/wQyL1dGAi2ha0vu3FsHS7MP6lPHGoTYoQ8fkKBai00fe3iX
 quqPAEZxvkNr2cRsV/CWWaPvvr8WlTEQ0bdl9rd9rteNtdRou/00kMQopUTCEd8=
X-Gm-Gg: ASbGnctEJpXPMkXka5jA1HCW9P/C74UkZfegwHrzzgTLrTuxlewaHRXtp31VRYpPhb1
 SLuvWndpM0Yy43krT8bAyyZU3CeZdQjRYUfRNrKWW66OcON6MXOqRaitIPt+6iJTTLS2dLVBlHN
 VF8CLiGi+y4CaxCCxH3k3igeMPjHO2g57cvkvKy/1EzYORnRTESKeanJegu2+WUjUSNXAN0fYtz
 GbJzCtT6dH/jCNtjuLvYge6pf0g3pB9yKjtUj7dQm1koP0usKgkZ6mwP5SfOVPSUYmE
X-Google-Smtp-Source: AGHT+IGSQd7T42hzaSsg6RXh3CBiMclP10LWJ0eflp+zEJwB84S2mx3T1G18dTIYrgGSIFNN+MyN+Q==
X-Received: by 2002:a05:600c:a296:b0:436:17a6:32ee with SMTP id
 5b1f17b1804b1-4365c792931mr173644775e9.10.1735035570524; 
 Tue, 24 Dec 2024 02:19:30 -0800 (PST)
Received: from localhost.localdomain ([212.22.143.210])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c832a90sm13626229f8f.28.2024.12.24.02.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 02:19:30 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Date: Tue, 24 Dec 2024 11:19:20 +0100
Message-ID: <20241224101920.532063-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735035571; x=1735640371; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0KNp8AOsZbX2pCr022HGU69Kq1jWUZKLp7bSAu6Nmx8=;
 b=P9WPTIrninFMuvX9IJ1HO4x1OrOGbgyHnROQle4d6bQ+8N+yw0p69Yt/PtMvhr7MeG
 KrttwCGHBelvEWTBiPtMFYzvFopGJjgu8DEGDWAE29+ORhg2pLgdq/OKUlqxBcLraBYQ
 6T4t9N8W6vC2azINlSDdVMpDd6qt1ey1WjKe4zZOQTvS5c7UWpiGwXDE7ytz4p8jyHBn
 Y8mX6nmzniHiyxxQuPlujxMNzzHTrFRE3GsfhrGKaJeuawLUhnNQTAEycluXel8+QSih
 zL/m+QaMqLu6JYs1xFsmsu3hnQW6Uu1aAhhMoPgQLfozXTZHqt9/MYjzFSAnidYz9Olx
 Dj0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=P9WPTIrn
Subject: [Buildroot] [PATCH 1/1] package/mender: Add warning text
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

Because updating mender is a complicated package, and maintainers have their
hands full with other packages, existing efforts to update the package may sit
for months at a time before being addressed or responded to. As such, the
version sitting in Buildroot is out of date by two full years! Much like the
mongodb package, one option would be to remove the package entirely.

Luckily, the official mender organization on GitHub hosts a buildroot-mender
repository with an external tree that contains up-to-date mender patches.
These patches offload the effort of the official Buildroot maintainers while
allowing users to use the latest version of mender. A win-win for both users
and maintainers of Buildroot.

Change the prompt in Config.in to direct the users to read the help text,
and in the help text, direct the users to the external tree provided by
mender.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/mender/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/mender/Config.in b/package/mender/Config.in
index c9b9d0b757..e254ae6f80 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_MENDER
-	bool "mender"
+	bool "mender (Caution! See help text!)"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -10,6 +10,10 @@ config BR2_PACKAGE_MENDER
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160
 	help
+	  WARNING: THIS PACKAGE IS VERY OLD AND OUT OF DATE! PLEASE
+	  REFER TO https://github.com/mendersoftware/buildroot-mender
+	  FOR THE LATEST VERSIONS!
+
 	  Mender is an open source over-the-air (OTA) software updater
 	  for embedded Linux devices. Mender comprises a client
 	  running at the embedded device, as well as a server that
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
