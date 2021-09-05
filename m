Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F282CC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 06:57:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7175860F8F
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 06:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7175860F8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A19540460;
	Sun,  5 Sep 2021 06:57:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LVChMnaZtZm3; Sun,  5 Sep 2021 06:57:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 982374045B;
	Sun,  5 Sep 2021 06:57:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 253291BF5D7
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 06:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22D098194A
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 06:57:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FHmu0FjFzqSL for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 06:57:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4FA7D81992
 for <buildroot@busybox.net>; Sun,  5 Sep 2021 06:57:15 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q11so4785831wrr.9
 for <buildroot@busybox.net>; Sat, 04 Sep 2021 23:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zEZpF/KQxXImMRhEy8Nub+kNacqlrlp9uCIqINesdQ0=;
 b=HLBetTVWtH6rchOYjoveLuAKfsLT4Z3Dr6cmbf+v+LSlxSZIkGzTaPQ78d42RD39qm
 MY8kjqU5OLxm+FHJyNKH7Flp0bnYB+6fe+nNn8XxyqC2558YGEh/3nqc535DtrTnWi2/
 EQvE3ne2k5B2PAV/ZeRVZsM7ubFCyp8sUbD3crZvZzI2he2giCRIocCnnw/XuqNBPKWD
 4eQiSo7OllZ/ZciuV2RouIBhpgDTtbftPUHus5UpdMwO8h8xEqTWhH1juJxYUbRRthYa
 M1VvFfNPgGTfHsS+wm76nBWx9aBLHkB4MJZ174Ng2o/q/McxkrwRppBvWKuRaW+vqlll
 Ddwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zEZpF/KQxXImMRhEy8Nub+kNacqlrlp9uCIqINesdQ0=;
 b=p5QRThNlBkjFOMdt+spfYfIoeTXVvetUWWL6N1O02eeb2uHRwok6s32NhgJ60bx8XB
 7IGN/6QsPMcSxx9aIwSO5Exg0dCvHkD04uR3B2HghzKzuZ0AX1KpzQlFLH5LlRMmnhzX
 oipjTiZ6iwSQSY6weA16SUGS0Pp07BET69bIPZ/mWFGViJfImy+GvrRmEpSiNL3qeaJx
 yNs2PXnD/OnH5O7G5iSzo9lLnoPj8bAHj1ciXC0mqO++J8Wr5Z8iAyZYAVYTaxRjJoGb
 ZT1QSZW1avqzDClzh66OF9YyaQAkxU4my/5LjRXQpjCc2jBjMJJiV5ZwNkcIfBidn5bc
 v+vg==
X-Gm-Message-State: AOAM533+3oqrYITeSUKO3/C2IjLnYsB5UlIX5CLzm/rk3YGbR8GbMtjD
 mQFqrzWvqNQgXguxWqGp/Mhjf4t6xpU=
X-Google-Smtp-Source: ABdhPJwuxjhBaoEMLsl3kVVp5sUWtf2OqV7AsxkmaKVLsXDKgqHzCyK0GnJ4wAr5zk0JZlv1h+q34A==
X-Received: by 2002:a5d:538e:: with SMTP id d14mr7022970wrv.192.1630825033647; 
 Sat, 04 Sep 2021 23:57:13 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id y6sm4766114wrm.54.2021.09.04.23.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 23:57:13 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun,  5 Sep 2021 08:57:04 +0200
Message-Id: <20210905065704.1828632-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/sqlite: bump to version 3.36.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index ec6654322..bd736fa64 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f52b72a5c319c3e516ed7a92e123139a6e87af08a2dc43d7757724f6132e6db0  sqlite-autoconf-3350500.tar.gz
+sha256  bd90c3eb96bee996206b83be7065c9ce19aef38c3f4fb53073ada0d0b69bbce3  sqlite-autoconf-3360000.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 0c2f27f12..3f716b14b 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.35.5
-SQLITE_TAR_VERSION = 3350500
+SQLITE_VERSION = 3.36.0
+SQLITE_TAR_VERSION = 3360000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2021
 SQLITE_LICENSE = Public domain
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
