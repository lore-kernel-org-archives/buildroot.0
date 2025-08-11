Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2CBC88CB9
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 14:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51F344130C;
	Mon, 11 Aug 2025 14:01:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lyweFktTt_4W; Mon, 11 Aug 2025 14:01:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AC334130E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AC334130E;
	Mon, 11 Aug 2025 14:01:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 22754138
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 14:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08A1C4130A
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 14:00:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6SjI4GtHQUzN for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 14:00:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1DB4C41309
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DB4C41309
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1DB4C41309
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 14:00:57 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-459ddf83023so26617935e9.0
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 07:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754920856; x=1755525656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xef6MHl3W48Rlvd3wz6pzpAtbzv6HRd1WsffYE1d/Lg=;
 b=jgtNrW3eaU2A5XKXKt/mrKUpGRF1kLHG2OZ5+d3pKCWH/3S6NKhlS4d/ScWzhWyKRD
 q4NWU3PBdzDy+AQmWwuXd07t4GtIWDDabdyXghL8TeUJOlvHQEVkV0+ae+h88eDnfEEN
 CGEyAQ4e76zTWTrOB1nyt5V6kFGeTHexmsIISpcYF3wkk8iVm7EI+8P7HAXVkHbruTkt
 3KUV6wkzCO8Y0nBSHetd36O1wM1CpquGAFro3ft3zy+p0OTcRiZEj6R9TXr6l1s3yEb/
 yGv/8lrenrd2v/h3lfUTM2dZKO3agDe9lJmJslNb3D4nQ25BakXOgQcKn7pAaLjWxiCP
 PwoQ==
X-Gm-Message-State: AOJu0YziBPDYpLm0X731Ub0nhS2NR9hH5MD+E/KXk8y0grIO/9U2PqkJ
 RDiOUJ7siTkafBe/xdUq5zwZ6HzbkkXv/JxraiDdLAczLnFeUH+/UztHfA0C1Q==
X-Gm-Gg: ASbGncsWKJJRFPQ+4h7vclwwDGXYLqZLT9AP4sn0B4rfWH7F3bxaqN8P6ChR7uj/9jp
 vV/Zp6piowdC77291FWdWvxe+4oSqaDZMEzj/NTr1jc5LjYV3FfB1iUlXtxVZ54H7k53Me1Zo7C
 zB5KB/jAoBm1/CzIGdJa/4xc5ATwHUQapQXOd17Aytb7BDIwWuLctAfypgS5Fozte35ullbQtxM
 OMon/+TFaHL4ahgpqOzCu7NIZIDrIq5qYNZ/cZ7QdycXKO4wqhkepeke5ZSElUfMyWihRBgvFE+
 DhWRRBkSYwuMvnRTJE8MEChsCDQBGPaIP8pMjlJ0nRMOjvn5KKbLu93iJOtArIUcwKlgkI+yi1e
 JdPIU3aMZMiN7la4=
X-Google-Smtp-Source: AGHT+IGL2BrQkZpoPg8W3Ci8/EbMTilxst+Lno6NSJqjKjrx2slp3Yp49wUh0bYJi/K+l5KHZpFhtA==
X-Received: by 2002:a05:600c:3103:b0:456:28f4:a576 with SMTP id
 5b1f17b1804b1-459f4f2badbmr108657585e9.27.1754920855095; 
 Mon, 11 Aug 2025 07:00:55 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:91cb:8ca9:ea79:d987])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459dbba5210sm328560805e9.2.2025.08.11.07.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 07:00:54 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vadim Kochan <vadim4j@gmail.com>, ju.o@free.fr,
 Maxime Leroy <maxime@leroys.fr>
Date: Mon, 11 Aug 2025 16:00:28 +0200
Message-ID: <20250811140030.1043469-1-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250806132109.129355-1-maxime@leroys.fr>
References: <20250806132109.129355-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754920856; x=1755525656; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xef6MHl3W48Rlvd3wz6pzpAtbzv6HRd1WsffYE1d/Lg=;
 b=Eq8Z54QVQARQWZ2fJpsTBTdx2R1TBaqx2BYONrYyOXLYj52K8ULwsNRLSUVjZih+rF
 y9o8sQpij80A0laiaQZMGkZq3ZU5jKwgEBNcn3sWlRrKt3egGMKXtl/JnbTWeixx5hMf
 ENDwifDiliM5yZ0dtzyooQqdYKONAiP5DjwLCxj6dWvzY/A0BVz4Y99uGG5yFSKqAl/t
 hInJI0bX4D5tiS3BSR43Fk47tPdwuBqqtJCGhOp4hDjOku5S2QgbuXOsDNZwtPUr/E/B
 zm9PNYTM4QZeIiMsMbz4zrVuUtlem8G1xGGEsYZ0IqBRm4v6IY9jA1Sr7WRBuVWrQ1Xd
 f4tw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Eq8Z54QV
Subject: [Buildroot] [PATCH v2 0/2] update FRR to version 10.4.1
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

Changes v1 -> v2:
- Fix compilation with uClibc
- Add new option to configure enable-multipath

Maxime Leroy (2):
  package/frr: bump to version 10.4.1
  package/frr: make ECMP max configurable

 ...davg-optional-in-late-timer-warnings.patch | 48 +++++++++++++++++++
 package/frr/Config.in                         | 33 +++++++++----
 package/frr/frr.hash                          |  2 +-
 package/frr/frr.mk                            | 13 +++--
 4 files changed, 83 insertions(+), 13 deletions(-)
 create mode 100644 package/frr/0001-lib-make-getloadavg-optional-in-late-timer-warnings.patch

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
