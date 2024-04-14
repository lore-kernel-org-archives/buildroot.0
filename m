Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593A3C4345F
	for <buildroot@archiver.kernel.org>; Sun, 14 Apr 2024 13:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CA2F60750;
	Sun, 14 Apr 2024 13:05:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VYAOZ4F-fTM5; Sun, 14 Apr 2024 13:05:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7053760759
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7053760759;
	Sun, 14 Apr 2024 13:05:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9425B1BF379
 for <buildroot@lists.busybox.net>; Sun, 14 Apr 2024 13:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D786814B3
 for <buildroot@lists.busybox.net>; Sun, 14 Apr 2024 13:05:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TX25-GuRhq7y for <buildroot@lists.busybox.net>;
 Sun, 14 Apr 2024 13:05:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B10881570
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B10881570
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B10881570
 for <buildroot@buildroot.org>; Sun, 14 Apr 2024 13:05:27 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-343f62d8124so1976602f8f.2
 for <buildroot@buildroot.org>; Sun, 14 Apr 2024 06:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713099926; x=1713704726;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SjmVJplpiMbnGqkqWNtx3qDDOh+5rafI7yp1fxHaJno=;
 b=G+6gRvjaBJrkiIhFHbNXO/Nl0vvYxgqX2eK2Lx7tP1+SA1cmr2kmCxaXMrxgL1rNkQ
 fxzcnhCNyaU6RVTLMCUfX3NeDbiCpowgnMtqyZt2B1F9RqonIsTnWSJI20TcOZSEgYfK
 PqHHi7dIvhvA3OWkgxA6FAo37DiJNLaaD2kzzH2zOi0Spazhs2f/HeH7BZtuzgfWodFT
 kK9s+jpP/dI6HBNHWIi0xReB83aEHnUPXmzvlHrOTVq4TPcsSfhPTFUbiNAiT7ppYpwb
 nGDyvCCaW2583GmxbuPik74IVQdqzUg8J7lrRsPrznTb8e1pFVEfKHhf4vgKRkPhrraT
 fAqQ==
X-Gm-Message-State: AOJu0YyJVp5cov2c4C+Zyzo92rNUhu4UWvAysr1OuBbnDgkA8FpDX/rC
 jTKOrMKy2Cfog+zC1yNeAoeWwB7Eh+1W5GbMrmi2T61lvha4JUP+4dyB9HXgwhzTzV4p5+q53Re
 PQQY=
X-Google-Smtp-Source: AGHT+IFQZiuPv5z06qbBaJIU4yOyzzYh2YVm/np0FjdRD8pFipkS2r5wz5aEYVsYrN92rwLTBrAeRw==
X-Received: by 2002:adf:fb45:0:b0:33e:c924:5486 with SMTP id
 c5-20020adffb45000000b0033ec9245486mr4388615wrs.46.1713099925808; 
 Sun, 14 Apr 2024 06:05:25 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([176.201.31.28])
 by smtp.gmail.com with ESMTPSA id
 i10-20020adffc0a000000b003456c693fa4sm9083686wrr.93.2024.04.14.06.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Apr 2024 06:05:25 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 14 Apr 2024 15:05:19 +0200
Message-ID: <20240414130520.3647875-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240414130520.3647875-1-dario.binacchi@amarulasolutions.com>
References: <20240414130520.3647875-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1713099926; x=1713704726;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SjmVJplpiMbnGqkqWNtx3qDDOh+5rafI7yp1fxHaJno=;
 b=LWIFLEiTgwhmICWzlKvpJFtQUGY4XaRXRv6g2KciTEA4oAdQk9RnDr8QpNZY8h3Gk+
 aNDAPD1eg2QJm60O/ovCV3Q1r/dwvP2yHsEjt4XTcHMy33ES00HqlsJqLkXoqjUdkcTX
 L93umQukq7qifahZZONtCNMbPx7eOQrekrU1o=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=LWIFLEiT
Subject: [Buildroot] [PATCH v2 2/3] package/bmap-tools: rename Kconfig
 prompt to bmaptool
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
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 "Yann E . Morin" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Historically, the package was named bmap-tools, and that's the name
under which it was introduced in Buildroot. Since then, it has moved to
a new home (i. e. to https://github.com/yoctoproject/bmaptool) under the
Yocto Project umbrella, and got renamed to bmaptool. To avoid useless
churn, we keep the old symbols, and just refer to bmaptool in the
prompt.

Link: https://patchwork.ozlabs.org/project/buildroot/patch/20240413131757.3627575-2-dario.binacchi@amarulasolutions.com
Suggested-by: Yann E. Morin <yann.morin.1998@free.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes v1 -> v2:
- Don't change the BMAP_TOOLS symbols into BMAPTOOL, but change
  only the Kconfig prompt from bmap-tools to bmaptool.

 package/bmap-tools/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/bmap-tools/Config.in b/package/bmap-tools/Config.in
index 425b7dfb9e07..b5ccce786e58 100644
--- a/package/bmap-tools/Config.in
+++ b/package/bmap-tools/Config.in
@@ -1,5 +1,9 @@
+# Historically, the package was named bmap-tools, and that's the name
+# under which it was introduced in Buildroot. Since then, it has moved
+# to a new home, and got renamed to bmaptool. To avoid useless churn,
+# we keep the old symbols, and just refer to bmaptool in the prompt.
 config BR2_PACKAGE_BMAP_TOOLS
-	bool "bmap-tools"
+	bool "bmaptool (formerly bmap-tools)"
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime, pkg_resources
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
