Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C004FC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 06:58:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C66B60FBF
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 06:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C66B60FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37E21607A1;
	Sun,  5 Sep 2021 06:58:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yCu231ucIkvv; Sun,  5 Sep 2021 06:58:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94EA260796;
	Sun,  5 Sep 2021 06:58:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD3A81BF5D7
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 06:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDDCD81947
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 06:58:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tfg7r4D_e11Z for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 06:58:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9D278193E
 for <buildroot@busybox.net>; Sun,  5 Sep 2021 06:58:02 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id b10so4850641wru.0
 for <buildroot@busybox.net>; Sat, 04 Sep 2021 23:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/aTqkf/TcRAHGu/BLdh1/ZxufGoODrpmQ7baJZtUf8k=;
 b=dYMjgRtijSkPES6FhNjP4wBpfAXacH73N2fGgEnx1pQ3FH30o45YyCTse01p+rFRw5
 o7TlyhVCzirY8Z4q/CQia2VqzQTfUSmShhzlFtycWOq6A9AaWvkxb9eCwzY8cDD/uYVG
 0k9yZSGnOMT2EG6YTF8F7Isva7p++L91yZkRk0fPPy5OOmsagPI01DJTMT6epAw8eOUu
 N+9ozyZYd/Bzs5lHywtkXj2dRHLItfbD52Opid6zh/zasrlQYmUyHq35NQxtkqwCcsrN
 6jStRmIO6ED1MRQATC54hM3ZWOhjPkyD59BvEpsP8PgB10P2wKfbFx/kyajxLTYFjXIY
 4BKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/aTqkf/TcRAHGu/BLdh1/ZxufGoODrpmQ7baJZtUf8k=;
 b=BrNUrVoQ9rbQt6v5+gITCBJ3AJYTKYzAxqE+JFnSObLITgrHyIDP9G3P2yw4f9CcL0
 mD+o9eLneCInVz7wDSXt1qx7Q8vqQsaCuw4xrPfwS9J4aZxFJeUFx63c/nlsNBSE7qbS
 R/SzAUQ1UzO6WjiUd1VBcvTyKsvuhy6nrXkfuHJM1lNZfxM0m3XCzEKKWWDNX8AgdpN9
 AlL58ulOzMfN9BWJwgn5SKLooxsO/ab2Z2kR7W3XJhVe00CIkxn8ART2/aDtqtxxeZHk
 IEG/6777vctl1ytyYEkF7pJwRfaf5eO1sefcF2/ZVB4ca/7Ta0WMkzXQ0x07QBc1eLNM
 aBcw==
X-Gm-Message-State: AOAM533rFSfo/68GxvX/LMDGSWdnXI5IMy2bxfIs6bHSGytSl1Ww+hzu
 FSNCU6hFaUxmidTW5xjPi0mNnlcXEW4=
X-Google-Smtp-Source: ABdhPJyzCYHq7vFEVtFuKq/RDvqYt8laqa4IKt/VhItpwEvuDMAH7fKehy5r5pmbhZY+FUolgeTyMQ==
X-Received: by 2002:a5d:5241:: with SMTP id k1mr7146893wrc.14.1630825081240;
 Sat, 04 Sep 2021 23:58:01 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id g1sm4215480wrc.65.2021.09.04.23.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 23:58:00 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun,  5 Sep 2021 08:57:55 +0200
Message-Id: <20210905065755.1828799-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 2.9.0
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
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 774b3104a..a101f3e7d 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d58461395ce28b9dc03903254374dd70c38c8c28c5046db123c08f7ab9417be7  harfbuzz-2.8.2.tar.xz
+sha256  3e1c2e1d2c65d56364fd16d1c41a06b2a35795496f78dfff635c2b7414b54c5a  harfbuzz-2.9.0.tar.xz
 sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index c7f5dfe9d..ccb0d940d 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 2.8.2
+HARFBUZZ_VERSION = 2.9.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
