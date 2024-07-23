Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C97BC3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 15:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39804402C9;
	Tue, 23 Jul 2024 15:30:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4H4ePP-Jw5yr; Tue, 23 Jul 2024 15:30:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07851402DA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07851402DA;
	Tue, 23 Jul 2024 15:30:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ADDA81BF2A7
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 15:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BC4860615
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 15:30:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jhKfQY1DLOCk for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 15:30:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 56513605A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56513605A4
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56513605A4
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 15:30:43 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2f0271b0ae9so5121951fa.1
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 08:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721748641; x=1722353441;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f/RjJgtep4v0SCYeZaTjHXcpYr7w7dazGMszwfbAPYc=;
 b=T8VW1CJp5vlzwcLvXu/1/7hn6RiRxYItUXrG1M2iK3uKIUNHgZVb337V9g7teJpKfn
 VRGzGuVk3x//Cfe66zNOOBOMiRLp2zl7sYzTKu5YOHXWVwzSjuzC1Bes1wL7Ygru8oiW
 X9F2+HZ+MnK3kCnG2FU6yHy7QofRWGVFnEuq3gCRGPlheFq7y/7KNOVhC03lGNIotuVD
 v4s+wTErtgDihOZmrUHwGHFvz67SDPjs0IgXgguOyNveIuK5UyxkYlIYxI2oJUqmSsl1
 NdOYNBjQBAtVgTmCKgEupOYmUJWmdO/Wg6b2O4mvYzT5ljDUxjCZmZLYLCA7tE6T0CH9
 Wb3g==
X-Gm-Message-State: AOJu0YzOuk5QpJar9qxlS7rjXuP8fGMsqUKbU1JMB6S8cw27yWAyBhj1
 d7pBiPC5xfQ9/91hDqmMXkhEs92ciSQ3LAmcXymlbRrIN1NzfObMAIDhXQ==
X-Google-Smtp-Source: AGHT+IEs2Tx+zb+4LRVtGhIMzFTkJUcLFjPggJ3IJfU7pvR2DxkxqFuw+TIMl0YIWhJ9iMBnnhEshg==
X-Received: by 2002:a2e:8410:0:b0:2ed:275d:aa44 with SMTP id
 38308e7fff4ca-2f01ea6e046mr21491691fa.28.1721748640412; 
 Tue, 23 Jul 2024 08:30:40 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d68fa17csm179339175e9.2.2024.07.23.08.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 08:30:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 17:30:35 +0200
Message-ID: <20240723153035.260929-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721748641; x=1722353441; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f/RjJgtep4v0SCYeZaTjHXcpYr7w7dazGMszwfbAPYc=;
 b=FBWawqsdEHuWYkMyUJOvrJSXvxU6c37BK0Ntc8agPWMb6nshyjaHCvDFi/CL6GydiR
 02vl0ftdQt1+bFCQ1fijc+KnaCBH/JF7wt30tKT6GG1bebBVvXU4fYUmqaq5j1bgN8Gq
 /mP/BUga1xRqf1qWHUHE1z2iZ9Qz6iZg8WrVTQZ+OV3nmBUAZnpNTY/8uAOhoS+FAFUf
 iygt+1QsLzCWpdbe4NP9/ocPEL9PCgnjEG4FOVPKzCp0gx9bVEDR9phGoS4lw+uVsuWl
 yCDZz2e0tRQlM+6yJR5z3KmA1NjjBMOeG9E46gcw7yQNv17ZdPODNL4lZx0xsi6PXCmU
 IAaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FBWawqsd
Subject: [Buildroot] [PATCH 1/1] package/speex: ARM5E needs ARM mode
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

Add a dependency on ARM mode for ARM5E to fix the following build
failure on arm926ej-s which only supports Thumb2 mode:

/tmp/ccJHSu7y.s:158: Error: selected processor does not support `smulbb r1,r6,lr' in Thumb mode

Fixes:
 - http://autobuild.buildroot.org/results/1575da3a8ea2bcde7fa9885df317a12d5c36918f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/speex/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/speex/Config.in b/package/speex/Config.in
index c4e3df5dcd..134e6e4b35 100644
--- a/package/speex/Config.in
+++ b/package/speex/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_SPEEX_ARM4
 config BR2_PACKAGE_SPEEX_ARM5E
 	bool
 	default y
-	depends on BR2_arm && !BR2_PACKAGE_SPEEX_ARM4
+	depends on BR2_arm && BR2_ARM_CPU_HAS_ARM && \
+		!BR2_PACKAGE_SPEEX_ARM4
 
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
