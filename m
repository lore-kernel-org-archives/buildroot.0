Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77376CCF9E9
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 01:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A87DF4125F;
	Mon, 27 Oct 2025 01:42:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vu13CEYGIHUs; Mon, 27 Oct 2025 01:42:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBC7641256
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBC7641256;
	Mon, 27 Oct 2025 01:42:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DD44CD7
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 01:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEE1541256
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 01:42:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MVqCn7ujftpl for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 01:42:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.105.4.254;
 helo=tor.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DB8814124E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB8814124E
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB8814124E
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 01:42:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E4784602E8
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 01:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38350C4CEE7;
 Mon, 27 Oct 2025 01:42:11 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>
Date: Mon, 27 Oct 2025 03:41:58 +0200
Message-Id: <20251027014158.865598-3-jarkko@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251027014158.865598-1-jarkko@kernel.org>
References: <20251027014158.865598-1-jarkko@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1761529331;
 bh=rgGvy2niZ3BH5FUfozQhFzUZkCjgMYlMHdkdfrNa2Ew=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QLVNmN/M56A4kjKK+sqKA5F5Gbp36K5JjFat3x0htJRkitNGwLnnZAoqZmOf/Hx8d
 1s9jA1rsZIsovhuhXv+dnJwDpQUv83U5Mz3pU6DiR3Lrr3lmWFwuotTWUTZb3jeTJN
 9NLUoAgI6lIZubMe3g4jiFe396fWaayw+LLKZqEh4yOuXkw7mREKzqNdcQArJvX8Ux
 zWYdks8F3VL+ZZyCrhJYD1Znx3sRfVUh7eiKCHF38g5xYzJXW97Yor4HNOgpUyY5H6
 1EQVs+ODYHi5S4qbtGnB8KipaZzD+XUm34071R1MzC2j2Q3BTRE/xFm/6JOZbY11Mq
 31jV1iUIm/BVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=QLVNmN/M
Subject: [Buildroot] [PATCH 2/2] package/swtpm: bump version to 0.10.1
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
From: Jarkko Sakkinen via buildroot <buildroot@buildroot.org>
Reply-To: Jarkko Sakkinen <jarkko@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/stefanberger/swtpm/releases/tag/v0.10.1

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 package/swtpm/swtpm.hash | 1 +
 package/swtpm/swtpm.mk   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/swtpm/swtpm.hash b/package/swtpm/swtpm.hash
index 934d3b6ee0..fe7f646ec2 100644
--- a/package/swtpm/swtpm.hash
+++ b/package/swtpm/swtpm.hash
@@ -1,2 +1,3 @@
 sha256  b281b4e8c39f68e1928675f788abc70072e4081152e129144359a8c5c304c06b  swtpm-0.8.2.tar.gz
+sha256  f8da11cadfed27e26d26c5f58a7b8f2d14d684e691927348906b5891f525c684  swtpm-0.10.1.tar.gz
 sha256  19d27d6e96d07022e5e688f75c974f1ceb9aae9e90e0fccae68666d02099cc4b  LICENSE
diff --git a/package/swtpm/swtpm.mk b/package/swtpm/swtpm.mk
index 598d56cf1d..25377f5771 100644
--- a/package/swtpm/swtpm.mk
+++ b/package/swtpm/swtpm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWTPM_VERSION = 0.8.2
+SWTPM_VERSION = 0.10.1
 SWTPM_SITE = $(call github,stefanberger,swtpm,v$(SWTPM_VERSION))
 SWTPM_LICENSE = BSD-4-Clause
 SWTPM_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
