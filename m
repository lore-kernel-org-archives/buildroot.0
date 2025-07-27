Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8D2C87FCC
	for <buildroot@archiver.kernel.org>; Sun, 27 Jul 2025 19:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A6DE416BA;
	Sun, 27 Jul 2025 19:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yBE5hU-F-oXy; Sun, 27 Jul 2025 19:25:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FED140D5D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FED140D5D;
	Sun, 27 Jul 2025 19:25:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B8A4231
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 19:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08C1D83EC4
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 19:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tqbO6p4Xv1p9 for <buildroot@buildroot.org>;
 Sun, 27 Jul 2025 19:25:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D9EDC83EC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9EDC83EC1
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9EDC83EC1
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 19:25:41 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b7892609a5so35754f8f.1
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 12:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753644339; x=1754249139;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fggxQExQd8KF2sXHxldnyTlT4e8FUxwiTbCIcIyVwK4=;
 b=upFk7Z41Vq+F043VGA1p236jbpNuQV1uNp1Eb7v509G08mg+GxkoWWXhMY1EMaRqfi
 SY1Rs0ZnGPSy1XOn2Zb1zdKe7+xUDTrBaRlD2I/Ly4rGig8heEWWcJ6hvL9pkILBpuZy
 +8O9fNL1jwv7BLtSz1dO01qLywXipKNTpFempP0iojVttvCF/8i4RtZsj2hpDLRIdvB4
 aa6pQ10yT09YCbfrCWaJgc7oeSyTjs3GOxj9nbWE6hpkv74s7pvt30LScSv57qCpCskU
 qSqJOGMD6CfqOGfoo7W+pqObzZt5PT63ER4FO/FOdb8GrEuTlzddhlDkbcWIwsEfHTyW
 AdGg==
X-Gm-Message-State: AOJu0YwQV5QeAXAQPgecXGhq7P9utZtxxFtkmgqKRzX36zoz8QVI7ZZD
 twzRqzV459ubwJOfdOr9SEgpWw6bcV7yeoDH6419wKuvlLZDGrm7ZFndnjBZT1dfhlBKGblvMaD
 QjPcn
X-Gm-Gg: ASbGncuAxQryXRi3LwUxed7+V6E9qSR5NyVzxZjO4zOaGilCgtK2kIVJXY28kPQsU1G
 BqX8xudwOmzxpXqPK4qyQeWUzAI/cyFMH4Ypm2yRYK/bgkZAM3b0lGRY6O6vGqx6uqPenGlwGKW
 Lzgqb9btucmdzoeUtH7PyFfnsect6c42WkW7A/kgN7GUpX9abQXVnbC35QoK0GHoBSdwlQNJ7H+
 1eEwZOLfkIDqYjK0/quMevTU2N4dwLyOo03SQBKPquLTiWQxBRsN6/hB4Z2YhGJXWaGgD2DGwnw
 HeLF/Yt7QYLBJc5fPazTssCe0Jo83QgwSpc1Hvkc+e5K7y7JDS2o3PQHUj/U7ftozp97X5y/zVz
 gPD0vZ9GdemkzCA==
X-Google-Smtp-Source: AGHT+IEelP+NhINdkuYPZLjGckNIrTfb130Z+nYbNxQq+B/z6NJGllI3JlMH9HW4TR65zn2waXDiyQ==
X-Received: by 2002:a05:6000:2385:b0:3a5:1410:71c0 with SMTP id
 ffacd0b85a97d-3b77675bd59mr6571941f8f.38.1753644338931; 
 Sun, 27 Jul 2025 12:25:38 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458705ce775sm128269805e9.32.2025.07.27.12.25.38
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 12:25:38 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 27 Jul 2025 21:25:37 +0200
Message-ID: <20250727192537.1164560-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1753644339; x=1754249139; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=fggxQExQd8KF2sXHxldnyTlT4e8FUxwiTbCIcIyVwK4=;
 b=YrHz9IfsvUTEivCvtnG+/jYHVIrSEc+BxdBdwonck93w1eUBgQP3WOUXZ9CdmduXzc
 803BxoFPHnRSeh+TcO98N27cBNPAkz891wJnC/krKH/Tel7pFGfqRUf8GEIcvJpXZ6pZ
 FcFgWnNHeGFTs68hMKald5kSuOAnP+b8xHJysN8/We0EfSy5iA+QOgFduigt+LrxiMmg
 t+mxrv3kFQGaoY0oMUqNzBOGw4RKSYH48tI0ao+sSTtf03uW7Uh2tId9xW8aJ6RmqApq
 CBhurfZMVBp1WEq4Y9wmvBvvZrURFVNpqXuFon3N5wQXYa52bXE87PAnPJCn14MiFj/9
 1H4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YrHz9Ifs
Subject: [Buildroot] [PATCH] package/aardvark-dns: add CPE identifier
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The cpe:2.3:a:containers:aardvark-dns:*:*:*:*:*:*:*:* is
valid for this package.

See https://nvd.nist.gov/products/cpe/detail/5F79D5CD-D716-4190-BE08-31EB5EEB233F

The CPE version strip the 'v' prefix from the version.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/aardvark-dns/aardvark-dns.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/aardvark-dns/aardvark-dns.mk b/package/aardvark-dns/aardvark-dns.mk
index 1d2e06fd03..1394218fbc 100644
--- a/package/aardvark-dns/aardvark-dns.mk
+++ b/package/aardvark-dns/aardvark-dns.mk
@@ -11,5 +11,7 @@ AARDVARK_DNS_SITE_METHOD = git
 
 AARDVARK_DNS_LICENSE = Apache-2.0
 AARDVARK_DNS_LICENSE_FILES = LICENSE
+AARDVARK_DNS_CPE_ID_VENDOR = containers
+AARDVARK_DNS_CPE_ID_VERSION = $(subst v,,$(AARDVARK_DNS_VERSION))
 
 $(eval $(cargo-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
