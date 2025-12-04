Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190F9D2A54F
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 21:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 979214099C;
	Thu,  4 Dec 2025 21:54:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id csduVeybOLdx; Thu,  4 Dec 2025 21:54:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C72DB407B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764885296;
	bh=A/L0xMaDv/AuVmDnzm830/RV3J5Vf/+Fbuj0uVwiGak=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BfZWKm+X5b+LRUOenz3VtrY3R7FlTzNtO5wEnGt8BXNEwN0PxC/EeqhnY8Y/6tR6Y
	 fXrdIX6piYDUogKV850KfwQXADyROyIUmDcZwqJLvgiKz2mCViPWr4I/YBcSpgiCnF
	 fT4Fs9ynG5wttYrqKTd9kWb6WWG8ZuSAcOsWOwXE7fTy5Wis5CpvMBCohOmBdPR9IJ
	 OoBc8e4jqr+vBhVVNai1eg6h9uzwdnZ6xaH89QR0tYJTTPOwY9/4iPHgs52WNe53nG
	 mEytMWkvc/M46SKYgu3CNhe1ub0O3pqLTEu9Yr6vVGQr6OBrh3DvjADUjROFpGWxnQ
	 dUAW+AA5J5cfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C72DB407B6;
	Thu,  4 Dec 2025 21:54:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EF354E7
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 21:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E12A0402F1
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 21:54:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oeDse_avK3yt for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 21:54:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.50;
 helo=mail-wm1-f50.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EABBB4026F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EABBB4026F
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EABBB4026F
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 21:54:53 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so14653275e9.1
 for <buildroot@buildroot.org>; Thu, 04 Dec 2025 13:54:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764885292; x=1765490092;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HXqD44PeJSZ0lKb5s/D9oYIiyGrsVbyJa5Spq3ifKxE=;
 b=VZe3P3AMaxc4fbmVo6pFS7uQpm1ssoNJsqcChp6B97ERnO8k95GteZ+8qarvktyIc4
 6x46SC6X3DxEWbfTie4KU0ky03e0wxMP+Pqkh4TbcFr4UDPte44JJmMjEaWd13C3GulD
 Gzy9HZTRHln1Y/z1up1NvggItRho2bO3jnhpfh6VkF/0sga1TP/G6EZ/Oz8GA615Og1v
 A2V7Sx/DNStDo0zbuz/qaHNUm8rkaP+zFM30OHhRmzNPHGa6F20cEefvOry4NGhph+Q3
 c+CMYA5A7xyc2a4yixpyXEbhPXEXOIJ+klyKqaFdcZ0Mo3bi59iEpzayhz9p0H7S0qzq
 +tSQ==
X-Gm-Message-State: AOJu0YwMAHqXRG373WJfJHZ8Fr4xFJbBuxMdV02i9wWULY7MrVnOC0v3
 HnXK3DvPLL8oYHcD0v0BKvAfyV5qxC2WP+R8HDC5Hl49jmdPCBWOzkFycyxenw==
X-Gm-Gg: ASbGncsbzRj2sOM++6PQ2MVZsc99rzSJTky7ZyEkx4BM53sAF02UkwNVNC3W2uSc7Tv
 I0eHl2bkBkSJn9ILMlNnR+4DOw+0dvGGtSqRehKA3wWDaQEfdAUcfNPf62tJKAiXGtOuIwIuXUx
 EUZ/nz/IlOj3bVn4o6sbzFXrs2k/fmG4IaTVpbwmzusNSQ8pYlFHD2t2EDFoG+LMUjvBC1VUdk9
 xv7569JOGtxVLSyPjaV4/jxW6/08CVvIZF07PaSk8+TGgKfJknpLUd/RvEVOXvnnmotr+vj+XF+
 f+ytaXysiRsGMqHW7aKu1KooFxQl0mRPyQnflUIKTeMm44nW8IhriAWT8Gbu7ewqfpAA8j7BiRz
 75kq81Vq+KQUhMZkwZDYXw9soMBGR+pZRF2Qwpm+f3Y/315djo89mzxAYpApjASZbTZTNXz6Mzj
 Vh7aspz7i8ogseVgtreTjf3LmNOA==
X-Google-Smtp-Source: AGHT+IGNhJSvsihgULV6E5oxOwfjsL+SopYZa6PpJ0DqyKHnKJWN3jk/5JeTAr02H9geXX6NaCU9tg==
X-Received: by 2002:a05:600c:4711:b0:476:84e9:b571 with SMTP id
 5b1f17b1804b1-4792f25f316mr43931875e9.14.1764885291541; 
 Thu, 04 Dec 2025 13:54:51 -0800 (PST)
Received: from KORLIN44614.barco.com ([2a02:a03f:eb6f:7900:fe8:a388:45b9:7db1])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-47930c90e67sm51001515e9.12.2025.12.04.13.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 13:54:50 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Date: Thu,  4 Dec 2025 22:54:46 +0100
Message-ID: <20251204215446.49667-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH] docs/manual: fix typo in
 migrating-golang-packages
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

Commit 00230e7 "package/pkg-golang: catch use of legacy FOO_INSTALL_BINS"
introduced a small typo, fixing that.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 docs/manual/migrating.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index 130d7a10121..9ded46bfa24 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -227,4 +227,4 @@ your kernel or use an alternative network manager.
 === Migrating to 2025.11
 In 2025.11, the +FOO_INSTALL_BINS+ variable for golang packages is no longer
 supported; the list of binaries to install is automatically derived from
-the +FOO_BULD_TARGETS+ variable.
+the +FOO_BUILD_TARGETS+ variable.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
