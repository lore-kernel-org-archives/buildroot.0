Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8713FCAC5A0
	for <buildroot@archiver.kernel.org>; Sat, 20 Sep 2025 09:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48F1140C4C;
	Sat, 20 Sep 2025 09:46:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0fP-LxrUVrBv; Sat, 20 Sep 2025 09:46:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8B6340721
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8B6340721;
	Sat, 20 Sep 2025 09:46:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E55A219
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 09:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14CDD40695
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 09:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UJ4ESgDZT9Pi for <buildroot@buildroot.org>;
 Sat, 20 Sep 2025 09:46:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3D66E40721
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D66E40721
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D66E40721
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 09:46:47 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-62fc89cd630so2137143a12.2
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 02:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758361605; x=1758966405;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+OJmZxRvibsbyjxEgtacECyovV0clYbsEikosxWt5uE=;
 b=Wg+YqEw7VxXNLe2KRF2t4IwfE4/q3L1RNRybgTN11aZlsAkJ19nsWVwU58FPwALz2p
 2kv74ge2pJZx7s8zwtoIcYzCzJusmFgbuEuxacoo8u33s1qqpdG7q/Hx9tdyoJSubeGK
 012g/l1RmI3fQdjvOBwLbxZW6gJgliyej8/eWeqQqAngd1bgwj+PlWlXETuaw8LtOjgI
 cRcoTEv2kXy/7Jog/dbmq9DAKUn+wQysyY7T4q1Aq1fmqakbcWrjWSjMvBE2ldgSqmWB
 BDL9Wf8X3je7uG4kpdpl4RQImNqI/ayj5N8d+PZSYpyBlTgeMAruQD6EalE270h/ARvW
 aTcQ==
X-Gm-Message-State: AOJu0YyWwMZO3p1D3RQZnldHMwixs591tQ3FwgZxlACphu/ZgC5Dy0XO
 6wfPMIeal2beI9uL1wZt3cbkvHYUbmT7bZU3sGPWtcpiI1I3ACXfh7pfoGDlqqU3jdt6EQOC710
 96TIW
X-Gm-Gg: ASbGncs/HC0UL8xxRon7CMlpfXj+dtX5Zg5jp2BA0S5Gc2dw3x1lZyfOC6SEHu9tLwG
 PAlqo7y0L7r4d5H/7GTb+++tvSd5l/lyMbUf72U0CjfZvwm7cDxUQXwPXfxaH7dz25gHEZfDl60
 HrUVrwjleVHBZPtjXKBeCWjWQzSw/9lIDvrKZUVz2b5utRSx5+3px1IzfLghfZCJsqNcjPgGTcx
 by3hTUp7WFx32hfLRUGTPDjNU41uNEUbzhD5k4FFlDZtvip+/fAXfJBqYC//ISWdzjzqQ/nbLId
 MecbBN3yfauO0nImSdicKqt1wrp39F6swnYZP6lQtXpOFjocb9k4ZGZn7P2utcqPmT+6BCoFNn4
 pCOZwfLF9s/B9nSx0dpsfsUdgmRksD097D/SSd4Bu5ajT99gqDVbHJydfNAgNrl4y+NP15wBeGp
 nkvjj1xB8khOaslHsbJ4tGPgtxjjLd/sVgiTmik8Q+phxcFramL7dDSbeEbmEgEHvQ
X-Google-Smtp-Source: AGHT+IEJYejVpJ3n82yMelA2dqCxyaMQekbmOifFsIyWxPNDOkpaf23I13Pbd/XIiruG6flhpBi3/Q==
X-Received: by 2002:a05:6402:4405:b0:61c:8efa:9c24 with SMTP id
 4fb4d7f45d1cf-62fc0b3325amr5365020a12.37.1758361605049; 
 Sat, 20 Sep 2025 02:46:45 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62fa5d51e5asm4977621a12.21.2025.09.20.02.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Sep 2025 02:46:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Sat, 20 Sep 2025 11:46:17 +0200
Message-ID: <20250920094617.2571648-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250920094617.2571648-1-dario.binacchi@amarulasolutions.com>
References: <20250920094617.2571648-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1758361605; x=1758966405;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+OJmZxRvibsbyjxEgtacECyovV0clYbsEikosxWt5uE=;
 b=SgQRjZCMnvrApNyG66NURkmvyb1kRrAX8ubVESumc+M7xfCd8noGvqQUuHOTKLImPz
 yMknQ+hDq5EQ5ilQ0yYMw1GDfKT/6k0IwYJpu9e3fTKRe0p6l4yHmteLKpcKZhrEq5SZ
 QuL/KVClDUMWN9v4S9d1bnaGCMSNeqE6v2MTk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=SgQRjZCM
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Dario Binacchi for atf
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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 16d9ee892bdb..2f2a76334d08 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -805,6 +805,7 @@ F:	configs/stm32f746_disco_sd_defconfig
 F:	configs/stm32f769_disco_sd_defconfig
 F:	package/aespipe/
 F:	package/armadillo/
+F:	package/atf/
 F:	package/babeld/
 F:	package/iana-assignments/
 F:	package/inih/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
