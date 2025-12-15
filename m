Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DD7D59D99
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 11:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAF1481496;
	Mon, 15 Dec 2025 11:43:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d5GKGNve-MU5; Mon, 15 Dec 2025 11:43:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D4F881470
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765798999;
	bh=Gh2318imOJ9iolnMhKsE6gKFdQdcMB9388dODgmGdPc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W8BoBHtvmQ6wVMmXCi19jT4gpTLIqnWuHmBLaI2Lalr7VW+5wNS6Hh5fJqWIaZHA6
	 jOjpTKcXNEwBcGWWGlhu+CxFbw+PnLmQN0VOpT0eU1OJack4BlzJ/ZQJp786AmxITE
	 fAeP8Pp3/okDqWmqaXf4EWXjmcO5zRmV7Ell0QUIVnNb9gf2fUCtFT9jgQ10QVa1gn
	 rZntA58It6LJB/ihiIf3FuqAJmSK65NGg6Q+fFoiVUt/6OTzht90nCnwydgxnC7oSi
	 sNvAvExC7gCfeuZGa7PaGsjHf/kuouRdEJEr8c/OslXNt9yX0w5wYjPA/7LIuqDhRx
	 OAXG9FnEFCwbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D4F881470;
	Mon, 15 Dec 2025 11:43:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E3F4A117
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 11:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA46440919
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 11:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0O5bMVuJdL9H for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 11:43:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F0F2408E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F0F2408E2
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F0F2408E2
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 11:43:16 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-430f3ef2d37so1090838f8f.3
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 03:43:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765798995; x=1766403795;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=viqkD1AWf+OB/lXMi0fK4fEbGZRZscF9KMwMgRPiU9Q=;
 b=QTt9zQfHvx8ibrd6IRW3e3c90MRdZb7ZhX+PX23J03mwtgvFS42FnTXPz+HwGrttBx
 0NCxP3H6zXH1rnnUwmf6Y7vdxVUUv9SfjmL5hq+8HCZiq5uu2pPkadgf8TGig0gcZZzP
 9HtUaDGOxDAWsct4x0e2sUfPp/v6riU4mOK38DZxX6PeUM1N2dN2zDgm23RQ39QnRMyt
 Uj45n2vXOFDkhZrAwX2T2jObMXeJhjpruBUy9DRC/IjvUwjyWt8gifLqVIpyxAO/058J
 5A7Fy4sNPV4dNvHYVzH8nQ/yUwv+JL4cWAZKJrgLsuNX2D32Qi1wnPLZ4IfBNJ6C+qmp
 PmUg==
X-Gm-Message-State: AOJu0YzFobQkM+kPLPsQMNA8RuHeK7v/OLmKXY+gB4nZOmycARaxZwmB
 jkqhY1B0TqrHhA+9dV42JayeOJ7qnm43nP00UHBjA1KvByMLcal0SBJt1tRaLg==
X-Gm-Gg: AY/fxX79mnk7y7D7Lc4LI/GvS1btkET0dgR8a5m6Fxvj9v1tcjG1gRxG9sP13hbs3oo
 s+AyhY4R69V2TifPEu0XUttf6jGeUITaqpKuv8UCm7R0erohsxCUTQUz5ElhTkoxgJsvilWj3jn
 VXeZmzrcDnyi4515SnHCW/CCFhrxj9uSXVnwOt9tr2TrPNHWP1cMdvdTLdpSaZQIKGPDULzC6Mn
 gsxA+IqpQQ9bgx1CNTBrwR+9ptB9y+FgJY+caSfcXK7JvuHA2CzHjxlJzfhf+NKM5pUusNGy2G4
 ghHTjhg+CrdAw41TtJGKnQNK6s6oOIjt1oJG0x94jyqNEfT559BKobho1jxiKvV2JERTPnHlXzi
 /KHXUml4Ixa6f+WsgQG4XXZkQQ0xtWbzE4AIwkL5bunzRSYfZdJJFqKzHzevbG9xljvPLRvb7c9
 5zZel9fURmdxsn3Q==
X-Google-Smtp-Source: AGHT+IF8UeyhndcOtxMSwqcMLpL9pCVJhWiW+Z4AHrT+oS5Ga84sqX2KeNRyAuOX5DKPYFiOzZx19Q==
X-Received: by 2002:a05:6000:3108:b0:430:f23f:4bc9 with SMTP id
 ffacd0b85a97d-430f23f5243mr7855068f8f.62.1765798994532; 
 Mon, 15 Dec 2025 03:43:14 -0800 (PST)
Received: from freepad.. ([2a01:e0a:6f:bdf0:a136:2350:a5d3:b428])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ff626b591sm16349117f8f.15.2025.12.15.03.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 03:43:14 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	vjardin@free.fr,
	Maxime Leroy <maxime@leroys.fr>
Date: Mon, 15 Dec 2025 12:42:56 +0100
Message-ID: <20251215114302.32596-2-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204134742.406507-1-maxime@leroys.fr>
References: <20251204134742.406507-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765798995; x=1766403795; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=viqkD1AWf+OB/lXMi0fK4fEbGZRZscF9KMwMgRPiU9Q=;
 b=J7Y16G1UEwe3Nu8oxzHZZCucUM8XpDYjNWZiTyfIlU/KTkYJKjhWukE0W2BBY3F/C+
 oRMZ2comA8r/05RrGJ2JYuIX+KF92v7IyHeFZ1FABSZlpwtVnUQ+eIu5TCOvW0AWSdvm
 +7kQqeuErFf5bQTQQsStQhaVlt6XN8A8lrDyKfxX0wsRazeazyYk3tiSkilFR2yinSaF
 nlB1b55Pakzphci8nuzQpb5d5UviDuWAgo6pDq+eRy+Fo3KUr9qedzCHA+qOpIvV5Gs0
 0rRpF6WI3s3e0fy7sAWceJgpUb/4mOHskLBmrlkj72WM492X1aN4cxkUkABlt1s9VOCa
 6+vg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=J7Y16G1U
Subject: [Buildroot] [PATCH v2 1/7] package/dpdk: bump to 25.11 version
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

See the release note of the new versions:
- https://doc.dpdk.org/guides/rel_notes/release_25_11.html

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/dpdk/dpdk.hash | 4 ++--
 package/dpdk/dpdk.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dpdk/dpdk.hash b/package/dpdk/dpdk.hash
index 5c9fd7c087..7e8ef0674c 100644
--- a/package/dpdk/dpdk.hash
+++ b/package/dpdk/dpdk.hash
@@ -1,6 +1,6 @@
 # Locally computed
-sha256  d5ae4cfaef05d6aa491af643d61b83d840e53ced96f9c9f60fda986313ed84b2  dpdk-24.11.3.tar.xz
+sha256  52e90d2a531ef3ded0283bd91abc94980698f1f6471fa09658a0217cf6609526  dpdk-25.11.tar.xz
 sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  license/bsd-3-clause.txt
-sha256  e19808bccd90c238fac06da2fc3683e094c64f7ba647e9d86f03a98cf5f2ce05  license/exceptions.txt
+sha256  ec514554f1b9e90c4f55167267c22da9d511f884877c32a5b18bee6b7c8b18cd  license/exceptions.txt
 sha256  6c54c4d44faf3cba829b3d0c21c6955953e758767018fd7244f809b01d4f4845  license/mit.txt
 sha256  cae178052c96959741acb7f00634a09a8294e6cafb5ad53e158d63e3510875ab  license/README
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index 1c7eada937..4843ba2667 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DPDK_VERSION = 24.11.3
+DPDK_VERSION = 25.11
 DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.xz
 DPDK_SITE = https://fast.dpdk.org/rel
 DPDK_LICENSE = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
