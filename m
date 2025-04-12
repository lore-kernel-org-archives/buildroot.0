Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8361DC369AB
	for <buildroot@archiver.kernel.org>; Sat, 12 Apr 2025 09:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C77E60840;
	Sat, 12 Apr 2025 09:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rg0lKwPtzbpV; Sat, 12 Apr 2025 09:19:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5880560BB6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5880560BB6;
	Sat, 12 Apr 2025 09:19:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BD1FDE
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 09:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1903E6074D
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 09:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RgtMI-FBJoJ5 for <buildroot@buildroot.org>;
 Sat, 12 Apr 2025 09:19:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6AECF60724
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AECF60724
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6AECF60724
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 09:19:45 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ac2c663a3daso521279366b.2
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 02:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744449583; x=1745054383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vZv+iPZUlqEFwGAql914h5u9E2ltlwD2HzMm2yfAYfI=;
 b=mPtKimR5/or1kg2dQBVa+B6I2aAuten183bTQJCTDgA3jSWs6qlreAKBON1l1kRlcg
 0HsbdthpFTqzI4SFzATL1oyVBmKzRMQ1rBkCRPwdsR6Yrede9zcIBu+9IIkSCKJhSUV4
 BamfBfo6d4LbkVBnM9WvnJ5sS0dM34GMVViPqUO/PRdr+EJgoDDCenJy7xQOlF9H+h0D
 KSsGQTi4KjcpP/72KILitNdwcqZ2P7QjmONxQ2xrwqUftewH59dvKH/r9NR3R5Toh5Sw
 o9WK7IYhowhMfQ2zm5kelW0MCkFmLCZwZujgcgiIXC6GB31x2vI3VqvCbuop441795NS
 csxQ==
X-Gm-Message-State: AOJu0YwBomogtqUjZcdsGqLqMh4E56+cMraBjexSsWIc3/bLQLdOF60T
 1PVO8AcoZaYbincAssfo12KREgsU2m5QcdVvtOhPQDSgRkIna7VNlek4AzGdI+3cC3pNyuDiSpT
 1
X-Gm-Gg: ASbGncvNRztlzg7GWbD3AJvxnD8lIDYjV6R3B+HliAxgYk3qLH8mtnPB+TP2JSRvICM
 5VjxQsWUocNHGQlIr6tjOFOKtEXU17flrKYAQXH5hLcRYGANyeT7Gfq90j0b/tTbNYRTeO8unnG
 jPzyxbGMWawrses2qaNqQwhc5nHJF75E8VixJ2pr/Oesgrl7Ln7T0Zo5bW/S+ri9yZHwj1qiH/b
 CZLxeb1r259Q3Zp9F60aydGyI19itkWCrdQlEV6Rv2dl6Fir6cpZnZY5GQEG4IzGuWLSw1r9Nb1
 6vhan9EoBpT55RQA9L+7OXTzy8m61NCbjarLzvJMawKVujIkwldsBR16AhRz2xDMZhzjvouplKb
 2FqSovquH3r0aF7eJdcjyrwLlL0GpninI94alxXdVcMv8KQS+w/nU0rqpHDQjgGJXc7v+23CG3o
 6XEn3y0OiBZJQUJNgulA==
X-Google-Smtp-Source: AGHT+IGUfk29rd9xMED+sdKYpjP3mc/6rUcVqInhSvK/8/YF3n4d65CuHK05sBrfZ/aosuebhq0oxQ==
X-Received: by 2002:a17:907:c25:b0:aca:a686:8558 with SMTP id
 a640c23a62f3a-acad3437a6bmr516255166b.6.1744449583235; 
 Sat, 12 Apr 2025 02:19:43 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-25-86-232.retail.telecomitalia.it. [79.25.86.232])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1bed98esm570920966b.72.2025.04.12.02.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Apr 2025 02:19:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof <bb@ti.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Xuanhao Shi <X15000177@gmail.com>, linux-amarula@amarulasolutions.com
Date: Sat, 12 Apr 2025 11:19:36 +0200
Message-ID: <20250412091936.1251605-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250412091936.1251605-1-dario.binacchi@amarulasolutions.com>
References: <20250412091936.1251605-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1744449583; x=1745054383;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vZv+iPZUlqEFwGAql914h5u9E2ltlwD2HzMm2yfAYfI=;
 b=FKMxzFsEKb1ee1JwBvI9jFeha4w+M9c7oJXzi4FV4MqqBnSf0oBpBgm2RxfwSUQD7F
 6WKUbthbqNHIIXPXejkT+53Yee22r554TvKXRR8KrLTT5jFQF98Ub4uQkY05cCof1Upd
 1lkXDrVpHIvyiB4/RX7iqCgFvtVNZRydguIVQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=FKMxzFsE
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Dario Binacchi for
 ti-k3-boot-firmware
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
index 1c84f959435a..0d7841eb948b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -794,6 +794,7 @@ N:	Dario Binacchi <dario.binacchi@amarulasolutions.com>
 F:	board/bsh/
 F:	board/stmicroelectronics/stm32f746-disco/
 F:	board/stmicroelectronics/stm32f769-disco/
+F:	boot/ti-k3-boot-firmware/
 F:	configs/imx6ulz_bsh_smm_m2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
