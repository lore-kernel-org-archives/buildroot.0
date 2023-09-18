Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5979FCD37B0
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 11:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE24B61497;
	Mon, 18 Sep 2023 11:22:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE24B61497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KoM2xJT7WvXW; Mon, 18 Sep 2023 11:22:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F94E61488;
	Mon, 18 Sep 2023 11:22:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F94E61488
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11D611BF2C6
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 11:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF2C8819F3
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 11:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF2C8819F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RVtr-y5umrOq for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 11:22:46 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1A84819BE
 for <buildroot@busybox.net>; Mon, 18 Sep 2023 11:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1A84819BE
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-400a087b0bfso46909565e9.2
 for <buildroot@busybox.net>; Mon, 18 Sep 2023 04:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695036164; x=1695640964;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kaEdFnXpR5f6/Gh5cB4retCPd0V95NiXZj98+1BMk1E=;
 b=YrlCw4mOwN59ZajdqEyNM8GbaHXR2xb2AjDlHaokPMZsrbFKHQcuI9RurTOGWGqjCm
 Wt49ZaRUJzWI4nkAo4dPkAWA1ZAUAcLmQaCpZMePXbRrQKOELUPc9LTZP4YZIMiwYbZE
 nAS8DpCE/kTY6lA8bueVk9r8ZNteJsn8roWrh3kNOWdIN96eeAJT0Gvyic/E25T6XhI2
 K9avJHfWeFenpXf7EL9Paf5bHFYmBTl28DHEvB7p3SRtSXJuV20jju9oM/GCYG0te+wS
 xFcB4Zod0nhbhjxOA4wmaaKRAS66eq7X/jBhvvb/wKHga471h7TCvkKu4++KYUrHD6dv
 l+6g==
X-Gm-Message-State: AOJu0YwjBdowE+qYKZu+K1Z5e+ND6jAMQ3ioYglzT841O/bV9okjIOjF
 bRMK/7Mcl0J6/l5/ijf5f8omb0Emz0s=
X-Google-Smtp-Source: AGHT+IF8kFdd4UzYiAAkPAppdLU+HOz3t4gS0BbOoKftpUz4aojJKuHnlQXFbx5o5UFOOCpVJHbqgw==
X-Received: by 2002:a1c:7209:0:b0:401:bf62:9456 with SMTP id
 n9-20020a1c7209000000b00401bf629456mr6908706wmc.8.1695036163494; 
 Mon, 18 Sep 2023 04:22:43 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 y6-20020a7bcd86000000b003fee6e170f9sm12105248wmj.45.2023.09.18.04.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 04:22:43 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 18 Sep 2023 13:22:38 +0200
Message-Id: <20230918112238.2758145-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695036164; x=1695640964; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kaEdFnXpR5f6/Gh5cB4retCPd0V95NiXZj98+1BMk1E=;
 b=EwvSNAEUgbSLvPKe6dumtudXfGKW4pzhX1/qUB6mzRcRllOxes0zBOC89iztkAeyWL
 BBcJTErc8nVM5HCEa20oTQprV9yR1dH2tq6H+ULj0il4/IyeLms9ujC11At+n5oJ1UBk
 8kq0UGHefuYh002H09LKUH1OhtlSeOw+jgx6XPuHW8M4ifn/F5jOkkpHt7azMhTk1w/q
 ro/k/io1GZTpOls5leGcOnN1hDT58+k9YlERBaP9IbzQtHnvbfDgO63+O4BDZLKZqmmp
 jhnchabJKI7T2bMFm/EFyyrIWWPEqrNFP4jPCMS/ARYJH0MFZ2h6PA7tRUTH0WKYEzVQ
 +rnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EwvSNAEU
Subject: [Buildroot] [PATCH] package/open62541: bump to version 1.3.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/open62541/open62541.hash | 2 +-
 package/open62541/open62541.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/open62541/open62541.hash b/package/open62541/open62541.hash
index 2e650a125..941aadf4e 100644
--- a/package/open62541/open62541.hash
+++ b/package/open62541/open62541.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  372fd6b2d78823d3f9e8279f78fb43b6af2501603675450a194d2bac65925ca1  open62541-v1.3.6-br1.tar.gz
+sha256  410603b0e567970d7148c6e9c91ccabeedeb4f32780be859cd2a4aac08cb5b9e  open62541-v1.3.7-br1.tar.gz
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 672fb17be..43e1ad6b6 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN62541_VERSION = v1.3.6
+OPEN62541_VERSION = v1.3.7
 OPEN62541_SITE_METHOD = git
 OPEN62541_SITE = https://github.com/open62541/open62541.git
 OPEN62541_GIT_SUBMODULES = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
