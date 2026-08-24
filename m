Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8529FC5DF94
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 08:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C39E640698;
	Mon, 24 Aug 2026 08:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5rFnYqTlheen; Mon, 24 Aug 2026 08:46:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787561201;
	bh=N/DfOi/1wcIqbt7bXyWFX9hSA8oUhKg47lHqUHNcJ5Y=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SuihxsjY3yxSpnKzdMRy4RVFXyNMrZtT7e08d3sJx0EolBDv2OCV3700rlMj7Vav1
	 7N29x4d49o9FubBKlxAuD+c6j6QV/lVoW5joUIjQ73yar1zTvp1mX/4Qa/BDWWnT0j
	 uUeW0cHP2FufzDSbCQwA16ALrGwh+KCyCsJDkEfJ4ES8ygzWIt7ubUmlWKcSmqRf59
	 +1hj4K3xbaSUd2oFyk39Iwr/xlFTlLLvO5XFmK4Ii8+fbt14BLPWVm+7o2YDq9Sc+h
	 dmw5mnrvn0iLb2dKlaW51/EnUp3Rg9iyxFJM48Vv6pF8N6xAO0x3+WLPOaDlmPgEu5
	 hf4hsF/5Ws0VQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EE514054D;
	Mon, 24 Aug 2026 08:46:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A48D6230
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 08:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 869184054D
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 08:46:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k2iKtTVlZmbB for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 08:46:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=nx7MUTYE
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 946C840545
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 08:46:37 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-c214321dc32so626025166b.0
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 01:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787561196; x=1788165996; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=oBW0WYpSkeClcopWyZxV8Ja5kl4ZpWgNPl89nZ/TmCw=;
 b=nx7MUTYEovatUA/CMuEggiGwUPawAK6N9na49xHakvomBMIwVSRWu7QK009cfl5MbC
 6z0B313xhXbU5yM/EOa+RgeIrAYXNLK2+D4wbz20ZQAPozl33k7EwdwX1c4aVOfQLv7Y
 HYteSGTPhKxcd0RM/V+yJp3bGqAwKhOnQwoXH4QFL1cGZtZNLAso4cQw2JD0LqB1KM7X
 KENIvQLwgDuQTf+HOwVdta4hhV8XHzkhpI/WOxwk3xgY8neSNJeZ5lVWHRPta1JZoqkF
 feWVuAOo11ZAYmXahF/nG7IM0Bx8ZCYiD4YZl9yzUkiJnJim8o96Eg9NFZaabgsgKXuA
 UUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787561196; x=1788165996;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oBW0WYpSkeClcopWyZxV8Ja5kl4ZpWgNPl89nZ/TmCw=;
 b=RbLupECGeiPsdE7ulNUikVz0RckGwjXfMEAlOZR3XxOqBxOPlTeom6Hb/AZnBftLeB
 /V3j8blJZ3RGC4J5PEvBcOqMhpEkxlO1YuGGJxX15O5Aoim/7HDSZ+KjhhRZJPWCvhRy
 pyQ1e7Urp/8QmaMxGVTRl3HGWB4NTS+ORWU9lLnD4/Ph0Cu1M5Ki6IM90WUhqgHFfgJI
 ZFxlgkHICHyxRnfkNMcr+h7X3baa4RLxUH/ZSI5EIfPkgcvLJyS3hz5Ycj8SdgOLFMHC
 S/Q93lXfCzYTkzUXxhMbAphfpD6l41hQxIvVvHI11mxrqhHjAG17DztLKkMsPotrVqje
 h0Ow==
X-Gm-Message-State: AFuF++nUoauTPITqIMsrnieSvY1BU0VTOCbzIvtL8JTNpUWKHRYia0BL
 Ut14bgbOj6rEmwyBDpc4QGbhnIbD9Lo+li5dfj9U3Cl1TbylxnJn2DUHDlGofGM=
X-Gm-Gg: AR+sD13zAvet7EWYHPVtq1mWj58Z+h4KDd7iQjVjCtnzFRXi3IVobzBzyjCEj6/EtN9
 DrDNBk5f6Ty4tNIu09GT6e6iFkaODjqUhggFzLud/rmKuhI75AMCmzCJjG4guJs3VrWTTDfH18N
 q0qg4uKEd4cEu7VMwcpCvLpg/3kT85sQUFs8PGdWjh1/z5KnRKJyr+yUrKKZD6398pFYNJ1zfXq
 KepLxeN868+k1Vahh3GzzcrmRB9qbUYX4vobocKLpovFC64voMd1r2dfi7Y8RZBFUjCanYd6U3E
 dD7oviSsfk57PieuMXnEQV3t9ODTnQ5Ah9FYxssD2sVUjto3XCfixqAmkooJ0taeh/zEk3yVTV9
 9O/rM/NLwxbyM8IapFIvndEBRSB9AY6i6pExpk5oPw5CiZRzrQ+SgGgq8xNTmhgnnK+IwpXph6b
 ZdwKiPNa9Q/GGFubWzgryVdbDCwqkLxcDV10IjazKKl5mZixK8XiIA2V0+ahv6gY1M0V2lXHRuI
 Ek=
X-Received: by 2002:a17:907:3e16:b0:c16:3074:657f with SMTP id
 a640c23a62f3a-c246a4ce3b8mr2793651566b.9.1787561195617; 
 Mon, 24 Aug 2026 01:46:35 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249606b696sm1289639666b.7.2026.08.24.01.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2026 01:46:35 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Mon, 24 Aug 2026 10:46:24 +0200
Message-ID: <20260824084631.26721-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/zellij: bump to version 0.45.0
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

Changelog: https://github.com/zellij-org/zellij/blob/v0.45.0/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 package/zellij/zellij.hash | 2 +-
 package/zellij/zellij.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zellij/zellij.hash b/package/zellij/zellij.hash
index ac6a219270..73ef5729db 100644
--- a/package/zellij/zellij.hash
+++ b/package/zellij/zellij.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  2a565f28d89c9e8caf2bad7a0f07f03747e3d3ee2d988297a41d1ffcfb034237  zellij-0.44.3-cargo6.tar.gz
+sha256  ca775a98e78fc8b721dc3c67ca511733c3eaa106423652e621ae66b6d10ecbf8  zellij-0.45.0-cargo6.tar.gz
 sha256  9aa6c363b18a48eeecbffe13ff390c76ede2c90eb37ba17dfbbaffc42892d87d  LICENSE.md
diff --git a/package/zellij/zellij.mk b/package/zellij/zellij.mk
index 4b4e7d6a3f..39cfe2e460 100644
--- a/package/zellij/zellij.mk
+++ b/package/zellij/zellij.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZELLIJ_VERSION = 0.44.3
+ZELLIJ_VERSION = 0.45.0
 ZELLIJ_SITE = $(call github,zellij-org,zellij,v$(ZELLIJ_VERSION))
 ZELLIJ_LICENSE = MIT
 ZELLIJ_LICENSE_FILES = LICENSE.md
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
