Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50CCCF256B
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 15:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 731136060A;
	Sat, 12 Oct 2024 15:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1NF7WMKARzd; Sat, 12 Oct 2024 15:24:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9711260635
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9711260635;
	Sat, 12 Oct 2024 15:24:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 78C761BF3F3
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6709240186
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2dkUilOr_wpr for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 15:24:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 44C9240162
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44C9240162
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44C9240162
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 15:24:28 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a99b1f43aceso361917766b.0
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 08:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728746666; x=1729351466;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ebJDRQEK2WBkYuo2u90Alm7kEAn8Ng0e21lleaw7QME=;
 b=aA9gJ8iwFjuwwrr+z6wXc9AKZDnz2X9fMlqvcMncmnoTCFlPE7vI34CudMJxJFu63w
 16Cmmp9w5Kxd9y/yi8akMn+ZMWgov6ej1B5Fj7wviSPMcvXaiW8iKBIYsVGjcIRHRHL4
 wVM8gRDkEhJFYjEGbHQz7LbW8JXX+fFiuqGWvTO39iFZ/Eo4oH6tgQyVYlH4IyPeJNue
 49JggX2bbw74QxmU2NiI6prHPEdxLk0RE6n0BQ8lKvpeOzktScr0JcWVywG1jyVfjSzy
 QxrQvlckPb1afvcXJnf1QoSLcu0luiO5v2gxqptwn8yRiuaL/a6gm4e+f7xROup/S/d6
 X+ww==
X-Gm-Message-State: AOJu0YzscoJkRRHu7Gx0BkkpzclphPxR1QjjQPg38rBEawE4kk8P7j4x
 dZMwyknvKgIZ1HN+fGBRuqQVaKos9gDoXrwFbZfONn/hj8KtYGF3A7zAlr5G1KCk+l/La69JOyf
 jiH8=
X-Google-Smtp-Source: AGHT+IGwk/BV/JxFybMWwqde6jFsae2jcqDxmH7UbmwtZWz3TfhgSKltnC+HOQs+jYFWFhv9mTm/Jg==
X-Received: by 2002:a17:907:7ba9:b0:a99:4c71:704 with SMTP id
 a640c23a62f3a-a99b899df18mr566552766b.26.1728746666075; 
 Sat, 12 Oct 2024 08:24:26 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.51])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a7ede936sm334538966b.35.2024.10.12.08.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Oct 2024 08:24:25 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 17:24:17 +0200
Message-ID: <20241012152417.986582-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241012152417.986582-1-dario.binacchi@amarulasolutions.com>
References: <20241012152417.986582-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728746666; x=1729351466;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ebJDRQEK2WBkYuo2u90Alm7kEAn8Ng0e21lleaw7QME=;
 b=Z8Ucpkg3gp3OEEDERAKSZCu1+YrZ3dp/HAJcHqbbq+ZH2V/ONJf9+hyfvnHbLEnmnN
 jwjFKQkjD7frRb0IBMwDTri7Yl1s+3F8NqQQL4GepltsA45n/hi7id++zW1RTvkkIySQ
 2AK2t1V0AyiFY5BreAcdkFyUWwxZ+hsJKPu1c=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Z8Ucpkg3
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Dario Binacchi for aespipe
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 44b19474876b..5156302ddab1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -795,6 +795,7 @@ F:	configs/imx8mn_bsh_smm_s2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
 F:	configs/stm32f746_disco_sd_defconfig
 F:	configs/stm32f769_disco_sd_defconfig
+F:	package/aespipe
 F:	package/armadillo/
 F:	package/babeld/
 F:	package/iana-assignments/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
