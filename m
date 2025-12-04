Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6D7D20691
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 13:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EA77846BD;
	Thu,  4 Dec 2025 13:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UFSOckh25clB; Thu,  4 Dec 2025 13:48:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7730284669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764856084;
	bh=Gh2318imOJ9iolnMhKsE6gKFdQdcMB9388dODgmGdPc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MZOR12veL76658UDrWU5akKkxDGVNBigXbMQiPfsH+pyG7i26UiQNXYu1N+iAc7GB
	 8nuzefi0veyJYciOXLUicNAI7NG7NkTKvAWfAjTP0zXNuAhpaxE17g9b/xfnNsuPp5
	 9FtiAirYaR3OCxY9XxhZuCWST7JwJyDNQuIuUI3NtWYiCbQpl8lbrJMI+Hn4iqcBac
	 21j2lnTuNdRyHiiKXIlKHugZEpANNzt0+uzzYlZq4pXNPf4laqKhwDMdDnZC46CL2O
	 DJNZelGX5kZXxz/lQutiMJ04J42zFwF6R3HZ2f2tcajVmVvyNwDvqtHtcsDs9DJ58u
	 CZhHCVUduMTeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7730284669;
	Thu,  4 Dec 2025 13:48:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 68BFCE7
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5044A40871
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:48:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LEwd1K-6pzAt for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 13:48:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 53AED40870
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53AED40870
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53AED40870
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:48:00 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47795f6f5c0so6658755e9.1
 for <buildroot@buildroot.org>; Thu, 04 Dec 2025 05:48:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764856078; x=1765460878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=viqkD1AWf+OB/lXMi0fK4fEbGZRZscF9KMwMgRPiU9Q=;
 b=C8vUkqK3f5d8B/x+icl/tXOxlO+2qTzb6hdLYpK/zv5RWIhE1uI1v/83sQC/2LW+FW
 cAMTpflQex/ZUozZUkz6VUimyFl9H/ajEg/EA5/7a3mcg9Nnbkz1PW8fGar5Q7U3TMX6
 WPRvywQq48WbA3d7OYDbk9eRt3ahk16+ju1i2l5x/6ZUofWOEjI0xGo+OmVxNsKALwVf
 /rHk+qmw5z1Zv2rnG6J8q9ezFlXrx1xvLI3FhmBAfvAPQxdB44sSobDczjlXDVFVK9ba
 o/nnCPhnXc6fSkoEmO20h7FTv+2wy55QHtzxD4KRlMUdEpeF7zA2JYc86Ggdc4G2ECs3
 CYww==
X-Gm-Message-State: AOJu0Yx1Ckt7uxzlMBhyOg6CSgy2oZaO3GTH3DnlH8eTk9aDPCb4XSOQ
 0Dm4XXg2y5YGyNl+YO4IGm5KXdlUC9wDjEEiyylHCtdC26CwBJeYuJK0hWeJ+Q==
X-Gm-Gg: ASbGncuSF+kJCkKHw6CBoCst/h0UfQhnk1n37ob0nEIabfs6VwUCvYGlHKSwBrEdHl6
 DLvpzQqMIq79bb9HdEftI6fkaqSjgf17TBrlKcepPV6r4l1/razVwxS4m5GbaurmaDiCpiAQVVg
 Bsx1J84RAa20SLSlVN0AT4brXpyO9jOvD+aaOIh5ia+b709W2anZMtXoh8wSNtOTBQ5iXQhMpLA
 PO/f/wGgCEfLCvm+0tj7DUpOIVme2K6kjwnWRcN9tUOBx+7G40assOgCH37+vY8BmAuX2hEA4pr
 muztJCO0RKayH4NlG8aJhXgmCnt5DcSYmKonxZYLtZ2xsuWlniuAE9PTw7zp4r9zoHlcckOiCp2
 EFv/vzmwZPAO+cevlQaJVq2CLqo0yi442DtLWb3dvVVPRu6Hxm6Sd9yGjV421m7JEBlErFK30f/
 adJArhmlVHE5cZzw==
X-Google-Smtp-Source: AGHT+IE9Jn5BUaXKFuw6GpQe3uleqFTHzVao8z4xLYxvWvBZw8KaqYakUUcQ/e3V+Qr5cgQzRwzvAA==
X-Received: by 2002:a05:600c:198a:b0:477:5aaa:57a6 with SMTP id
 5b1f17b1804b1-4792aef1c83mr62529185e9.10.1764856078039; 
 Thu, 04 Dec 2025 05:47:58 -0800 (PST)
Received: from freepad.proxad.net ([213.228.1.188])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479311fbaf4sm28817255e9.15.2025.12.04.05.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 05:47:57 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Maxime Leroy <maxime@leroys.fr>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>
Date: Thu,  4 Dec 2025 14:47:36 +0100
Message-ID: <20251204134742.406507-2-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204134742.406507-1-maxime@leroys.fr>
References: <20251204134742.406507-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764856078; x=1765460878; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=viqkD1AWf+OB/lXMi0fK4fEbGZRZscF9KMwMgRPiU9Q=;
 b=hu0MqUrpkiIGeJAOqiNQf8QcEmx5HjnN5MhPcANaWydiWK+zzOG0njhqzgQelQB+wu
 oeXAZ3HIvpqO8oYhLlbG0zdYrDt1omjb7Z0ZopsNLXn/9DtYOy6KI2Da26BT/urbmOdd
 f18w6nxc5248CE63lFDa49Z2AFHLLbGKDLvUb8OK1SfsUTRzoPs+quMCiRe8uq7EzOBg
 L31TtARVjUdcsbgT60X/HArbhmVI6gEHl3Cf5Cddps5eYLlzt7IBh1MCbJVs1Mk1Q64K
 7U1RxnCjWdHVIUMnEUJbCZreZzSL2sabZ+FZ8r8iwiwTSIbGo9QNzUU2RI93F/81GQa6
 6+Iw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hu0MqUrp
Subject: [Buildroot] [PATCH 1/7] package/dpdk: bump to 25.11 version
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
