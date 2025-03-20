Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B45EC28B30
	for <buildroot@archiver.kernel.org>; Thu, 20 Mar 2025 22:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 064B441E71;
	Thu, 20 Mar 2025 22:36:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EdvrIzSB70hC; Thu, 20 Mar 2025 22:36:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CC8041E6D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CC8041E6D;
	Thu, 20 Mar 2025 22:36:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 375871A0
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 292BB80CF9
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H9VHQ-e4QjzQ for <buildroot@buildroot.org>;
 Thu, 20 Mar 2025 22:35:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CB65880C60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB65880C60
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB65880C60
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:35:57 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B99C1B0053E;
 Thu, 20 Mar 2025 23:35:54 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Thu, 20 Mar 2025 23:35:49 +0100
Message-ID: <20250320223549.138974-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742510156;
 bh=zzAfsPXa3Mmw3g6opfPZPo/wbPJJWSBAIKLLEZs/Nws=;
 h=From:To:Cc:Subject:Date:From;
 b=nrmhL9BxhalgckpFlTwJRZaUfP3ktTka1rrCaKC/Es7dlRCsp5fBxbZ1/uJEimRO2
 eOZ2rtnapSKM9CIhoIgb3YqdjSR9e8dz4jjQaDVPHcA0Xs6mHj+0CA1f4JGyxH+9Jb
 sqGPdjE3q4u2euhNySYKVcqm78iFaRKD94Zsfopk2HURvHmd8v2qF75/4N3jauiuKY
 Moslf3UxU+9gGnXCquKWnQ5fk2g3wdQg2SsHrlKumTSYi5iawioba/GbLxox4qeDhK
 B1CErB62Qv8ZtK3HtzooGx9ibbQH1qyJ0BN8V4QiFXiEumBuTvaZm9dfC+7IKGfcaF
 ZaYIW3H/BswJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nrmhL9Bx
Subject: [Buildroot] [PATCH 1/1] Config.in: introduce
 BR2_HOST_GCC_AT_LEAST_{12..15}
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

Fedora 42 is planned to be released on 2025-04-22 [1].
It is also planned to include the upcoming gcc 15 release.
Gcc 15 is changing the default C language from -std=gnu17
to -std=gnu23 [2].

This change is expected to possibly introduce build failures [3].
In order to be prepared to fix those, this commit introduces the
BR2_HOST_GCC_AT_LEAST_{12..15} symbols.

[1] https://fedorapeople.org/groups/schedule/f-42/f-42-key-tasks.html
[2] https://gcc.gnu.org/gcc-15/changes.html#c
[3] https://savannah.gnu.org/support/?111150

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in | 20 ++++++++++++++++++++
 Makefile  |  2 +-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index a543091d4f..d730f2034b 100644
--- a/Config.in
+++ b/Config.in
@@ -74,6 +74,26 @@ config BR2_HOST_GCC_AT_LEAST_11
 	default y if BR2_HOST_GCC_VERSION = "11"
 	select BR2_HOST_GCC_AT_LEAST_10
 
+config BR2_HOST_GCC_AT_LEAST_12
+	bool
+	default y if BR2_HOST_GCC_VERSION = "12"
+	select BR2_HOST_GCC_AT_LEAST_11
+
+config BR2_HOST_GCC_AT_LEAST_13
+	bool
+	default y if BR2_HOST_GCC_VERSION = "13"
+	select BR2_HOST_GCC_AT_LEAST_12
+
+config BR2_HOST_GCC_AT_LEAST_14
+	bool
+	default y if BR2_HOST_GCC_VERSION = "14"
+	select BR2_HOST_GCC_AT_LEAST_13
+
+config BR2_HOST_GCC_AT_LEAST_15
+	bool
+	default y if BR2_HOST_GCC_VERSION = "15"
+	select BR2_HOST_GCC_AT_LEAST_14
+
 # When adding new entries above, be sure to update
 # the HOSTCC_MAX_VERSION variable in the Makefile.
 
diff --git a/Makefile b/Makefile
index 5bf5abfe3b..411e1de515 100644
--- a/Makefile
+++ b/Makefile
@@ -353,7 +353,7 @@ export HOSTARCH := $(shell LC_ALL=C $(HOSTCC_NOCCACHE) -v 2>&1 | \
 
 # When adding a new host gcc version in Config.in,
 # update the HOSTCC_MAX_VERSION variable:
-HOSTCC_MAX_VERSION := 11
+HOSTCC_MAX_VERSION := 15
 
 HOSTCC_VERSION := $(shell V=$$($(HOSTCC_NOCCACHE) --version | \
 	sed -n -r 's/^.* ([0-9]*)\.([0-9]*)\.([0-9]*)[ ]*.*/\1 \2/p'); \
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
