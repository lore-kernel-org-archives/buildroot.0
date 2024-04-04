Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6447DCD1288
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 21:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2676241E20;
	Thu,  4 Apr 2024 21:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oXy7SlhRBwit; Thu,  4 Apr 2024 21:12:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E574341E6A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E574341E6A;
	Thu,  4 Apr 2024 21:12:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C33011BF361
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 21:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0D3340136
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 21:12:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id da9F6FgDiw2z for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 21:12:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8A8B840025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A8B840025
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A8B840025
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 21:12:37 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3438d7a05aaso907336f8f.0
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 14:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712265154; x=1712869954;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iWAr+uz1WbIgXb9H7JmFlMiuzkn3TuFRwEDvxKNFNHQ=;
 b=gRIrpCjxHXMxT4lDKlf1m8iNqFT8WBk4MNGJnPBR6vhuAI3F5eWcQN5rtECmPAuVNJ
 qJ7cKbVVlwy590ee+qpY4Xg3mJXTe06p+aogV1sjyflX7YKfMqw/Ia2gfH59sbQBdx5S
 Nqssl2zr5ymohewwlxgw/RjfVHWZc+57j66Zq3aoV2xY4dngPzNR1bnNDvI8uHmE7SDI
 X8vfDjMEMYFBbQVHm2V6NYWLcfFJis8HIaXwWJ0y8edOhfXplzSpwPU0QYBlPKtOQjMh
 zwawaturO6/VnReGsQ4hDCVUNorxjxmkf3uYiwB2PhP/64Eki/OUXneb73GOC5XoGIte
 wKNw==
X-Gm-Message-State: AOJu0YwlzMjocHkg0lAPO0oaadylKn4XnxhyuNp4F8sT1xH2q58rqRlg
 Uv8QYqdNSe/DG6okeoKwmtOnUZwDO9fNr8q4dzucPhFF5XaTeMj614/3QAf+
X-Google-Smtp-Source: AGHT+IGr3BkH6+ZKWiJEA2VTWrzXWU/j/nC5Er1tWwREevnW6ILeZPUEKFJjf+RxBYLyUxLcXce6jA==
X-Received: by 2002:a5d:6311:0:b0:33e:cbec:e98 with SMTP id
 i17-20020a5d6311000000b0033ecbec0e98mr509253wru.13.1712265154111; 
 Thu, 04 Apr 2024 14:12:34 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 r13-20020a05600c458d00b004162c25d54bsm1804111wmo.3.2024.04.04.14.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 14:12:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Apr 2024 23:12:28 +0200
Message-ID: <20240404211228.1979139-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712265154; x=1712869954; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iWAr+uz1WbIgXb9H7JmFlMiuzkn3TuFRwEDvxKNFNHQ=;
 b=aKWiG7z4f6guTERhNya/OD41F2Sb4bDFMzyGP6T9qbkfFgg1o7IANTAKO7y+RFFH//
 +04XQToRl3jXkzcHoRkLSPyw+fbiz0MWg5JxIkd6xWQ9js9QIek1M/OvU6Fq+SwmnYyN
 VNAwVD4gSA9MMPn8+HoleLIRsWVobF0ePucy41GPFrAQ+V5k04k4PsWQBpthDVUN1x11
 auEtVPl9DUGPfj1nQpkPoCYE8rF76p4rctQfSaazoPkB0TLjzXL7CamJIWXEu7hGpj75
 /KMAdrQaMRT6wPeqsn1MfvTfgghXko5YixqCBDJeK1ck6TIhXoUdpuDNUlh3jkFFks3W
 wEBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aKWiG7z4
Subject: [Buildroot] [PATCH 1/1] package/exim: add libxcrypt optional
 dependency
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

crypt16.c:45:10: fatal error: crypt.h: No such file or directory
   45 | #include <crypt.h>
      |          ^~~~~~~~~

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/3c846c763a05f2569db7a019af8b91b0563c8f42

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/exim/Config.in | 1 +
 package/exim/exim.mk   | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/exim/Config.in b/package/exim/Config.in
index 2557251fd1..0d2f5f4999 100644
--- a/package/exim/Config.in
+++ b/package/exim/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_EXIM
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_BERKELEYDB
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Exim is a message transfer agent (MTA) developed at the
 	  University of Cambridge for use on Unix systems connected to
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 84fe96218c..d78b95ad15 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -75,6 +75,10 @@ define EXIM_USE_DEFAULT_CONFIG_FILE_CLAMAV
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+EXIM_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 EXIM_DEPENDENCIES += host-openssl openssl
 define EXIM_USE_DEFAULT_CONFIG_FILE_OPENSSL
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
