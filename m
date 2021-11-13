Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78BD1C433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:18:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3535661106
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3535661106
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06EC880E39;
	Sat, 13 Nov 2021 17:18:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KZ2BeCmq4Fxs; Sat, 13 Nov 2021 17:18:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4096880C2B;
	Sat, 13 Nov 2021 17:18:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 363791BF370
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25D4840241
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:18:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vQn20AMbMa9C for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 17:18:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 314B240238
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 17:18:54 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 y84-20020a1c7d57000000b00330cb84834fso12360248wmc.2
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 09:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jmYAT8K1aqlLqwrWCHl6co83FMIDwvavp/oUvaS8VUQ=;
 b=IsELphkJ3RlQAK3DCA1YkCtwBRpL/L4IcRca12RFF9wfnfNNUJ2JGujuY+1cdV5R+x
 oFj4s6K6sdePQ2lr3BBXULEi8vuvGRNQaUku/LFTgPX3A45ezK+MhcdfKkbxyb7N+yhb
 8kAVOS5WEkQ7fBrFf0tAB9lWb5uXlTTP5MXMseRG1E6jUI+tahle0eVh74dxgrDqXlAR
 GkgyejsvwArLBmtPu8VioWxZwI4ulc4fJeOH4Y0/ym4K2KJGXGIO6/oAX8VgHs+njF1K
 BkBO6AO5weDmT1E8iYNZwEpn9+3tw90LKqTTkFNUfE/4o405Ud7FBLsHPFPCiiLJLAWo
 KJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jmYAT8K1aqlLqwrWCHl6co83FMIDwvavp/oUvaS8VUQ=;
 b=iYNNCcnGukR+wPv2VEPMWaW+uE0OazUahpysXxLyaVYSKfKMLvwxFwfJi8i4xEQ5Qc
 le+xfxxqVL6SmbrvK6Qq83VmMHPqx2j1Addbh8iw7BHzt4D8Dx0xlbE/L/Z+kIafSctG
 krCHZXAjhLmtNiGSEfr9nVJyAB1mxRqGfP6+FHylRZshOGs14aageKoCnjdR+1GNbTzo
 jEitfcu6LNI38wxUv5AC7AGvxIuBJOB2jeahpuOjwKj+G35j6ajsnt6Q9n8Tp5TmL43C
 C0GAsQvcBlGQUAscnn7sONbpOCX5njnd+As8p9qbNj3P+rpvaR7a8vjuRFiZpzXIzYUv
 b5qA==
X-Gm-Message-State: AOAM5333lydCGAz19YwD8Nv7wNGIoV1gfzc1fiq2NGrnJwngO/vwuyTq
 bd+id6n0/v4qXJzqx8D+wft5NVN36FI=
X-Google-Smtp-Source: ABdhPJzXH9Tdwh7sxf0Kf0Vt4W9r68qiWkWMsarhDTnFRzhG50qGXuXJHs1xUYD5BgcyfjVAKDKqIg==
X-Received: by 2002:a05:600c:35cb:: with SMTP id
 r11mr45412267wmq.190.1636823932265; 
 Sat, 13 Nov 2021 09:18:52 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id g13sm8681181wmk.37.2021.11.13.09.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 09:18:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 18:16:50 +0100
Message-Id: <20211113171650.579634-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/dehydrated: bump to version
 0.7.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/dehydrated-io/dehydrated/releases/tag/v0.7.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dehydrated/Config.in       | 2 +-
 package/dehydrated/dehydrated.hash | 4 ++--
 package/dehydrated/dehydrated.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/dehydrated/Config.in b/package/dehydrated/Config.in
index 979938d70c..13b3632f9d 100644
--- a/package/dehydrated/Config.in
+++ b/package/dehydrated/Config.in
@@ -30,4 +30,4 @@ config BR2_PACKAGE_DEHYDRATED
 	  You probably need to install a custom /etc/dehydrated/config
 	  with the rootfs overlay.
 
-	  https://github.com/lukas2511/dehydrated
+	  https://github.com/dehydrated-io/dehydrated
diff --git a/package/dehydrated/dehydrated.hash b/package/dehydrated/dehydrated.hash
index 388dd24749..0452645256 100644
--- a/package/dehydrated/dehydrated.hash
+++ b/package/dehydrated/dehydrated.hash
@@ -1,6 +1,6 @@
 # Locally computed after verifying
-# https://github.com/lukas2511/dehydrated/releases/download/v0.6.5/dehydrated-0.6.5.tar.gz.asc
+# https://github.com/dehydrated-io/dehydrated/releases/download/v0.7.0/dehydrated-0.7.0.tar.gz.asc
 # with key 3C2F2605E078A1E18F4793909C4DBE6CF438F333 from https://keybase.io/lukas2511
-sha256  10aabd0027450bc70a18e49acaca7a9697e0cfb92368d3e508b7a4d6d69bfa35 dehydrated-0.6.5.tar.gz
+sha256  1c5f12c2e57e64b1762803f82f0f7e767a72e65a6ce68e4d1ec197e61b9dc4f9  dehydrated-0.7.0.tar.gz
 # License, locally computed
 sha256  b4583b7dd07e3e2a08906de38e7e329d41f921ed9dcb6310b3886e013a6b8723  LICENSE
diff --git a/package/dehydrated/dehydrated.mk b/package/dehydrated/dehydrated.mk
index 17c67b8478..28fb5a4912 100644
--- a/package/dehydrated/dehydrated.mk
+++ b/package/dehydrated/dehydrated.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DEHYDRATED_VERSION = 0.6.5
-DEHYDRATED_SITE = https://github.com/lukas2511/dehydrated/releases/download/v$(DEHYDRATED_VERSION)
+DEHYDRATED_VERSION = 0.7.0
+DEHYDRATED_SITE = https://github.com/dehydrated-io/dehydrated/releases/download/v$(DEHYDRATED_VERSION)
 
 DEHYDRATED_LICENSE = MIT
 DEHYDRATED_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
