Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B15C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 16:48:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D243C60C4A
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 16:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D243C60C4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F606406DB;
	Tue, 12 Oct 2021 16:48:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mA9cO9r7Do8q; Tue, 12 Oct 2021 16:48:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E985E406DC;
	Tue, 12 Oct 2021 16:48:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F14451BF9B6
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 16:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE80480F8D
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 16:48:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GgJA3mBqJft7 for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 16:48:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83EA380F80
 for <buildroot@busybox.net>; Tue, 12 Oct 2021 16:48:07 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id r10so68844587wra.12
 for <buildroot@busybox.net>; Tue, 12 Oct 2021 09:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=10yHMmqLsaVEli7l2ChiroucHjzPTNKNQJQyn7rfdIQ=;
 b=lihxd3BKkgFmvaJyt9EwjQ08rrRo31LhdEGdW6fXbGsY8zpDXk6rN7I7qu4aKZvER/
 +6hrQ6j+PSKfhzI6gpwpJLQq4Gbi9tSfKfzB11Ss6WXUEYkgDvywaYoVO0O5rG4dtBNY
 SuKGS5BfGtmVtCHtvmEea21mtFk4ZJUlw1txiBMPYbDJA1zuMPyu0kM9AncbPPmIoyOE
 Rxubhik79x1riIud+uSxzXpSQ7GMEYgpLLKZ/ZsBMJ1Cz6UZUAGpxIahwasIHAUrYxtT
 t9GFl8JlG6teDL45kO+wIftBvWmINJabOcFJrShPrA9gaaA0JMXz+IIzEoemC96qBqfs
 QLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=10yHMmqLsaVEli7l2ChiroucHjzPTNKNQJQyn7rfdIQ=;
 b=lmBSY6eAvsAFNmnTZ+1ZXnX10o30LGIiRY+JY8JO/E9cPZOmdLQQK55d1EOE3W/+2j
 zJD9NT9XPe3dHEqS2h/XXbIhugrAUo9KJBlietAFBuvMTh0RpHzGkH4+/Rq5X6bMZr9O
 GmvmyQi1ktWf5reyxWnt28ECmx3EdXODhGwQSCzLtTYYuRNyydXozoh6UP/4va7kGaff
 mAT9GqumSupo75kWGMhtnqp3qNcOdMocNihlVhfg5WUZrSnsCQRNck9fZUkKAMRD0sG5
 SBp092yaTKQwjwWEWe/KBlF45BPqJF5kFAYFs5Xk56l9vbL5+JbIIx+9JfA3AiCTyyaW
 /XDw==
X-Gm-Message-State: AOAM5308ouVij9+9/WKM5gu40iiTqHKxMcfL2cbz9oNher6b3w6ecGNq
 RYVYUvCOsUi1KunE+N33bFKl2IhtSTo=
X-Google-Smtp-Source: ABdhPJywejK9UjPMUOSZ4LoEjYeDzFhcbEji1OvLHzSey2Iy/cdMTM5Zj2HE0f6zGqbi/3kTi6v4YA==
X-Received: by 2002:adf:97d0:: with SMTP id t16mr31847904wrb.124.1634057285533; 
 Tue, 12 Oct 2021 09:48:05 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id n17sm10058963wrq.11.2021.10.12.09.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:48:05 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 12 Oct 2021 18:47:56 +0200
Message-Id: <20211012164757.233855-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/bison: bump to version 3.8.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/bison/bison.hash | 4 ++--
 package/bison/bison.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bison/bison.hash b/package/bison/bison.hash
index 04b6ca03e..98ce5b97a 100644
--- a/package/bison/bison.hash
+++ b/package/bison/bison.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature from
-# http://mirror.keystealth.org/gnu/bison/bison-3.8.1.tar.xz.sig
-sha256  31fc602488aad6bdecf0ccc556e0fc72fc57cdc595cf92398f020e0cf4980f15  bison-3.8.1.tar.xz
+# http://mirror.keystealth.org/gnu/bison/bison-3.8.2.tar.xz.sig
+sha256  9bba0214ccf7f1079c5d59210045227bcf619519840ebfa80cd3849cff5a5bf2  bison-3.8.2.tar.xz
 # License files, locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 841323306..27038de67 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BISON_VERSION = 3.8.1
+BISON_VERSION = 3.8.2
 BISON_SOURCE = bison-$(BISON_VERSION).tar.xz
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
 BISON_LICENSE = GPL-3.0+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
