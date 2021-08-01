Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CCF7C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 20:18:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B046760C40
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 20:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B046760C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 769C4834FE;
	Sun,  1 Aug 2021 20:18:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o7_0nFC2js4L; Sun,  1 Aug 2021 20:18:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD0FB834E1;
	Sun,  1 Aug 2021 20:18:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F9C91BF5A2
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 20:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E8CD40469
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 20:18:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ywliRkrDE6n8 for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 20:18:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0153C403ED
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 20:18:09 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id n12so18939474wrr.2
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 13:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l93UKJEvcx75zIFlEHCt0qEnBqNbzAmCiJ1k04H/Nl0=;
 b=BN2DFBQrQJahWhHF5rGOsRAjrU3raJEcVo0rT2EwPFJxWlI4kIoiMBHjxv+vdSekT6
 Y8GdXOEQFlfnyPxxAgDGkNky8+lW0ZX1Q+5m34Icv4uhKzca4TFXsv8qUn2wucXf9+wr
 5QkFngTAVMCrI+EANs+y7SaAtz5Tiz1WaDAsuqmq6Ly/jUFzG4c9E2kbr8yIaoi5+ury
 9hu1pa0gX9yvJt/3iKbBB1nOL/5QCoCuJHTFzJeCNEzFOX0tGP6Dy8lwIOZVaStIn89C
 zzIG1h+MsME837SnWkLozbIgleH79aHqwxQwXxJWgbJ8M4oSHeXGFJe0D9i1jZKBvw1O
 UoEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l93UKJEvcx75zIFlEHCt0qEnBqNbzAmCiJ1k04H/Nl0=;
 b=Y9xGtKnyPqbfzZgHPfTt/b2WKhp1SahZkdpQRNAOIMCjO9v1H1n9zOl6oA/pAlS18k
 U/5ExCAjdk713rkysuouuc1Rasx5Bvp/K3Lb4UGfYuJJCBPV//0bb3Frmh6Arbw92CdM
 MzXbH/UHXCYm27CHBNxRq9t4jAHw2RHUkXAL9/ndJYQKkyih/4DiAi2oKfKiDjlXwW7R
 fcYQGDNQ4z5YR75SsfiWckbsFjiL4PigmgVWEj7zWeNAxSB8Ify/fMwuDd3+gDtyiBXl
 CUolgoFaxpD10Yp30eOoddC/f3fp3AESr6mNhzV2PAcnHO/cbtM1cYYhNGzooNn4SvY2
 vvtQ==
X-Gm-Message-State: AOAM530FiNNFS+AAgYMClMEKJzNlxxXwH4KvVFLJxecLoo/JGAR1+NZr
 jtb0gzxRKZnwIt/fmt8wiVV99RDiB7deAw==
X-Google-Smtp-Source: ABdhPJwD21RlozZ22qxnjTDMeUAQye0OZTrkSHPWnZYs2qpXORXR19Jus1I3s9eCFU0xOjFWeClX0w==
X-Received: by 2002:adf:ef4b:: with SMTP id c11mr13934731wrp.35.1627849087688; 
 Sun, 01 Aug 2021 13:18:07 -0700 (PDT)
Received: from kali.home (pop.92-184-106-251.mobile.abo.orange.fr.
 [92.184.106.251])
 by smtp.gmail.com with ESMTPSA id l41sm8978926wmp.23.2021.08.01.13.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 13:18:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 22:17:39 +0200
Message-Id: <20210801201739.4190294-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/fio: needs gcc >= 4.9
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

fio needs gcc >= 4.9 since version 3.22 and
https://github.com/axboe/fio/commit/bb012314f734b9de3b2fc198db2c4e3e060db240
as a result build fails since bump to version 3.27 in commit
5c788892102f0e22c9b5694facca0576b09f5ef4

Fixes:
 - http://autobuild.buildroot.org/results/01a1e2f4c02e86f3c5b0eb333ed5f4dd6568edf8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fio/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/fio/Config.in b/package/fio/Config.in
index 8da227db7c..7825209b4c 100644
--- a/package/fio/Config.in
+++ b/package/fio/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_FIO
 	bool "fio"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# fio uses fallocate() which becomes fallocate64() while compiling with
@@ -13,8 +14,9 @@ config BR2_PACKAGE_FIO
 
 	  http://git.kernel.dk/?p=fio.git;a=summary
 
-comment "fio needs a toolchain w/ dynamic library, threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+comment "fio needs a toolchain w/ dynamic library, threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_nios2
 	depends on BR2_USE_MMU
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
