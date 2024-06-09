Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B22FC27C55
	for <buildroot@archiver.kernel.org>; Sun,  9 Jun 2024 19:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A4858209C;
	Sun,  9 Jun 2024 19:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uCRvONxLno-n; Sun,  9 Jun 2024 19:55:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ADE8820B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4ADE8820B5;
	Sun,  9 Jun 2024 19:55:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4367C1BF3E0
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 19:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FE2140619
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 19:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EyHDWQEk9oTk for <buildroot@lists.busybox.net>;
 Sun,  9 Jun 2024 19:55:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CA5B640611
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA5B640611
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA5B640611
 for <buildroot@buildroot.org>; Sun,  9 Jun 2024 19:55:22 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-421cd1e5f93so1791875e9.0
 for <buildroot@buildroot.org>; Sun, 09 Jun 2024 12:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717962921; x=1718567721;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4zSaJNAPqjRgYb5N8gSQXulQyHPdYA0t4f4/Q//3f+w=;
 b=o4SymH6MItZmNPqMlIm/sBzCw/ZfCiQYTn3WBcwhUCHuAJmGqW4I54XmkoFxnFsauv
 HLCXgu4/SNucKnykPqpoFe1YxD4w+Tjh0lfTVsAKkgesJ6rKq8S479QvhElFhEOMbuNV
 ltxFDlcUVBtrSq8sT0BaZu1nP3RNfK+AfIayVbVDq5H7NSfjpkWLjaygkUBEHs1w6xwT
 /KQDlJ+0KYfikQuNzq/68rPuCqVW9ymK3TTQCyvVZYG9mL3c6hozLCVBeNPb/hD8cza/
 FPBKXS/uP2MjaUnwZ5hOUnmjn6Bh4DJQkbrHiJK1+hovp7XjiHGKXsm32968vDZ58FxW
 hf5A==
X-Gm-Message-State: AOJu0Yyy38y943CnAgya/kRVpDV2Ih6ewiRoj2kw/Jacf1qKat/j4MTe
 yvzoiYgCuxj98OkYz110XCV19+5sL1E7n1v473OVgCOrNPFSTqKojtxrlg==
X-Google-Smtp-Source: AGHT+IEWepWBu+v6ReZbMktM5esqBa7zYoMRuNIftYKsv6yo+741Mtv5DibUP7OjjPrwDiSHpdl26w==
X-Received: by 2002:a05:600c:1c26:b0:421:ec3b:b7f0 with SMTP id
 5b1f17b1804b1-421ec3bb9f2mr1718915e9.17.1717962920527; 
 Sun, 09 Jun 2024 12:55:20 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4214a4a9aa9sm171961375e9.0.2024.06.09.12.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jun 2024 12:55:20 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  9 Jun 2024 21:55:19 +0200
Message-ID: <20240609195519.1154353-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717962921; x=1718567721; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=4zSaJNAPqjRgYb5N8gSQXulQyHPdYA0t4f4/Q//3f+w=;
 b=bbITguFryFSq+ffUmvF3KX+TqIVw3xgEt9F/ZryGqIc97wulAI6Dt9qmOMEYCkVJky
 hk5KmTqg3MmeMhWBYZWyQBL4W9loIIZYKVcF/VMMad2po7XOGcbTkau2JjkljV1ee5Jn
 S2oQQsoQTLxmrTmcvJU9Mnrz9g/j3IN1/1nmTL2cZ8qkcYFwcJNv2crKKqy+SxvOS2sF
 cRhSfb8UtlJC5BmCoqm1P31QkgklMlvVkDvN36wUvD4DGZH4xNHs18NJpqVLkbakyPOG
 ZInTz3ppnlkStjrhYk+kZHr+x87Fc/2Rg6e1VVz7unXGcq1C/T0XYGNT3Agt/o9xss5x
 KeWg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bbITguFr
Subject: [Buildroot] [PATCH] package/bcc: add missing dependencies to comment
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since its inception in 146498d13c48 (package/bcc: new package), not all
the dependencies of bcc are mirrored in the comment to be displayed when
those dependencies are not met.

Fix that by adding the missing pieces:
  - wchar,
  - threads
  - dynamic libs,

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bcc/Config.in | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/bcc/Config.in b/package/bcc/Config.in
index b91e0e5ee3..bf46f07d93 100644
--- a/package/bcc/Config.in
+++ b/package/bcc/Config.in
@@ -38,8 +38,13 @@ config BR2_PACKAGE_BCC
 	  https://github.com/iovisor/bcc
 	  http://www.ebpf.io
 
-comment "bcc needs a glibc toolchain, C++, gcc >= 7, host gcc >= 7"
+comment "bcc needs a glibc toolchain, C++, wchar, threads, dynamic libs, gcc >= 7, host gcc >= 7"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_HOST_GCC_AT_LEAST_7
+	depends on !BR2_TOOLCHAIN_USES_GLIBC \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7 \
+		|| !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_HOST_GCC_AT_LEAST_7 \
+		|| !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_STATIC_LIBS
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
