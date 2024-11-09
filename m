Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2293D5E381
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 22:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DA01813FA;
	Sat,  9 Nov 2024 22:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pfuT4h02e605; Sat,  9 Nov 2024 22:17:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04B0A81367
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04B0A81367;
	Sat,  9 Nov 2024 22:17:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DA29C2
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47E5540177
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nsss9r4J2Ppo for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 22:16:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7132F40159
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7132F40159
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7132F40159
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:43 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3a5e0a3ac48so14385915ab.1
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 14:16:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731190602; x=1731795402;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ipIr+anUeGP7tuQkZAHSal0X94t9gJaRUuX0NPiOB5A=;
 b=KqKvpFKWROBHnz/cJOKxG++rEfk5Nn0n+Nmsf7NYz2gLQTjv1R2TARoEgRucyTRBDE
 QWTDhZ3ZBRFm2lKyGDcLKQKjbFIoKtHW/JsHx7VlPkVMm4sqZSYRlSRb25A0cVeQTxEF
 DQLOkjZUxtYUvkIIIlR1LsK8xZUUDF/l52nFMEIhNfgMJnYQyongcIzvAgShmEWfblZ2
 SQte9agLz5EsMToacD8o50jNM42nvKt2o8r1hpZK/33wXTfjeYyFEcFvCzOQ5vekImOP
 GUNVa9Yr9Nb+r7iXGt8NmvD2sV+QAjDR5lwZgLMPe2gvvNXyVh355toC8ZExRV32TgAr
 6ndg==
X-Gm-Message-State: AOJu0YwZRfnday7me96wXHvDXwOOl/0NerTip521Tgv21JeVVjTRtKQo
 qZXjCt0pjT1SJgngZHj0WNVZ3fWB4WfN5Vw3kJaqTFk3Hf/v2xAl
X-Google-Smtp-Source: AGHT+IHtdf0nFD1jvK3xvSN8eb8KEya23udVl8i/yY8/d3xXObjERU0vmY/o7N4nptp9uRuYSzmbXQ==
X-Received: by 2002:a05:6e02:1545:b0:3a0:8c5f:90c0 with SMTP id
 e9e14a558f8ab-3a6f19f3ff0mr87787035ab.10.1731190602360; 
 Sat, 09 Nov 2024 14:16:42 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6f98484e5sm5566805ab.43.2024.11.09.14.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 14:16:41 -0800 (PST)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sat, 09 Nov 2024 16:16:28 -0600
MIME-Version: 1.0
Message-Id: <20241109-genimage-partition-type-uuid-v1-14-9f23180c7195@gmail.com>
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
In-Reply-To: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Niklas Cassel <cassel@kernel.org>, Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731190602; x=1731795402; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ipIr+anUeGP7tuQkZAHSal0X94t9gJaRUuX0NPiOB5A=;
 b=iuHp1MQ/TjKe4ZcqW47h2D0NGGabT8SCgkM/i88HDlPuSUq8VamcojnpJ77iS9W6oO
 /lqHF18IVkiY93vdgkvX5SH2bkE4ujfd6LCy0l3EknvjFQa3JgiNluCgoYk6TodGYwln
 sIPE59BQCFvj+Q+UxrTOvM0Uyku3O0EwfqLtbryXPCAxKHiLWknTP1LLl7/5gkDRUEvB
 50EvLn6wHHia86H3JuPcMP5FB7PCFK8xZpzTWdeLPZr4Jv1DzWPg0C4HPHQ0eP/egm8C
 MbueDMnNNdQZib/DKovFXKrXbaCu/DqeS2vIafdcNkXZDw1gRcGT9J5sCi8XnS+IMT3F
 CrvQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iuHp1MQ/
Subject: [Buildroot] [PATCH 14/17] board/qemu/aarch64-ebbr: use
 partition-type-uuid "root-arm64"
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

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
---
 board/qemu/aarch64-ebbr/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/aarch64-ebbr/genimage.cfg b/board/qemu/aarch64-ebbr/genimage.cfg
index 1ca8332b9cd005625a0dc60a3383b6284485a9f2..0d468953c131df43f87417473ea7be0f386df7bf 100644
--- a/board/qemu/aarch64-ebbr/genimage.cfg
+++ b/board/qemu/aarch64-ebbr/genimage.cfg
@@ -25,7 +25,7 @@ image disk.img {
 	}
 
 	partition root {
-		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
+		partition-type-uuid = root-arm64
 		image = "rootfs.ext2"
 	}
 }

-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
