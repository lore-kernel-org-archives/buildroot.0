Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DC8C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 13:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA8FB83868;
	Fri,  1 Mar 2024 13:37:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hK_xpxfKh9hq; Fri,  1 Mar 2024 13:37:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AA008382F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AA008382F;
	Fri,  1 Mar 2024 13:37:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 21FF91BF2C1
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F97D4196A
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lXmNEs2pULBs for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 13:36:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 12AB14016D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12AB14016D
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12AB14016D
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 13:36:50 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-563bb51c36eso3165791a12.2
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 05:36:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709300208; x=1709905008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WwSGWzgDHPuhEvYqTDpITbJ0hwIhdHsY5P8sh+JBGAY=;
 b=LT2I0g0Jo3rrmrR0ex+RGyqfMUAmTOW1WYuKBtrEMfBI4fyPwL+WEALE6dKpKIwmwI
 AD6TsBrtVeUG8MLyPpN/TjiNKxBFjvsGGDA5nk9EPXxgS1VhUaEtAoqPWYf0oXZzyVKS
 FCCMVIEH50BBJSYwNsociRL/UmuwSMQxfwhHSyGVbTk8OkN4XM8RX7uu2r764fzGPAJw
 bs0qjSv2ZbEHJXHiPwwGOxHguPeNhRr8FipupyeyqVh6ixskKQ23nZvxbvSmrs6PH1Cq
 svCgazehfPfRle8Qbz0hNUxdKQnrTAgYm6aiqS4Z4MvoiPmPQ+J7J9vvWyHz6Jt+kL+1
 bz6g==
X-Gm-Message-State: AOJu0Ywq7vlOjCMfup81DYn9euk5pDG0F2IkTNq5jTsobq7y/Bw89S/u
 6WByy3RjbgW+2gplvm228ev4hYvo5uHlkDFbARjSaSD6uL5BoWIuq7stTpyR5SJQ4x0CouRmkbk
 4o2U=
X-Google-Smtp-Source: AGHT+IFjuOXDueOB9YSLcHOnhAKzgldpgpjTlwDrTkOGxRbfREmZhvp8q1XnTMnwRgV+H/rNv74/9Q==
X-Received: by 2002:aa7:d60b:0:b0:565:e294:5119 with SMTP id
 c11-20020aa7d60b000000b00565e2945119mr1263872edr.18.1709300208116; 
 Fri, 01 Mar 2024 05:36:48 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:5260:58bc:42cc:9d46])
 by smtp.gmail.com with ESMTPSA id
 q28-20020a056402033c00b005659ea1caf0sm1566608edw.6.2024.03.01.05.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 05:36:47 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 14:36:17 +0100
Message-ID: <20240301133620.3547430-21-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
References: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709300208; x=1709905008;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WwSGWzgDHPuhEvYqTDpITbJ0hwIhdHsY5P8sh+JBGAY=;
 b=qNhilnDL0po0WV+I+1N6i1eqW7YCMY89hBi24H9OYNmAZfPkEuorb6kmvzl2/cu+av
 zKkqGT6GxFY9yjomBtCGOU8yamRrCJUCCKvuE6Z7+Jvw3K/bGYfUD7NRyhC5TYxzqruI
 bhSa6wWpB0QzZIDjfLyq0hFI1sCcA6ZI6hvxo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=qNhilnDL
Subject: [Buildroot] [PATCH v8 20/23] package/ti-k3: fix
 BR2_PACKAGE_TI_K3_SOC setting for am64x SOC
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
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In the case of SOC am64x, ti-k3-r5-loader creates the following
tiboot3.bin files:
- GP    -> tiboot3_am64x-gp-evm.bin
- HS    -> tiboot3_am64x_sr2-hs-evm.bin
- HS_FS -> tiboot3_am64x_sr2-hs-fs-evm.bin

The patch allows you to identify the correct file based on the SEC_TYPE
option.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Added in v8

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/ti-k3/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ti-k3/Config.in b/package/ti-k3/Config.in
index b8545b7bca62..9c61f8880a15 100644
--- a/package/ti-k3/Config.in
+++ b/package/ti-k3/Config.in
@@ -43,7 +43,8 @@ config BR2_PACKAGE_TI_K3_SOC
 	string
 	default "am62ax" if BR2_PACKAGE_TI_K3_SOC_AM62AX
 	default "am62x"  if BR2_PACKAGE_TI_K3_SOC_AM62X
-	default "am64x"  if BR2_PACKAGE_TI_K3_SOC_AM64X
+	default "am64x"  if BR2_PACKAGE_TI_K3_SOC_AM64X && BR2_PACKAGE_TI_K3_SECTYPE_GP
+	default "am64x_sr2"  if BR2_PACKAGE_TI_K3_SOC_AM64X && !BR2_PACKAGE_TI_K3_SECTYPE_GP
 	default "am65x"  if BR2_PACKAGE_TI_K3_SOC_AM65X
 
 config BR2_PACKAGE_TI_K3_SECTYPE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
