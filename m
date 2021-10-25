Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA5BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 07:35:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A87561029
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 07:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A87561029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB94C80DEF;
	Mon, 25 Oct 2021 07:35:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UeGLo0eCwybo; Mon, 25 Oct 2021 07:35:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC45980DE5;
	Mon, 25 Oct 2021 07:35:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 726731BF2CC
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 07:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DFC44010C
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 07:35:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9KmePxNoA_Ln for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 07:35:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0012D400DA
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 07:35:04 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id k7so6428407wrd.13
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 00:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=4/zrMCJBd//gdse1EUU9elUGOKQ9bX0lB1OghNnFbyg=;
 b=xN2ZjjrmBMrusE08kLuvX9siwzw8nzfYkLgW9UKT6esXFa5tdqSRue6x+sB40JQT5F
 VroJYlKF4704W11e+KwcUdusZydPWXe4Us7HVgbjzM/u6YbDRMA33hvQSxAfgn/hodC+
 3awK/wijEpz9J2+cS6odasVbRD+dC0Mp0qTK/ClpCvQmRQJ5qN3XN6jAH2X9jwuHZvSO
 li8XEoPkYwVwrf2fK3Msyce8xujz7m7DEV9ZvyHFFSZlGcrBuguRpDv+gZLVngjF1pFt
 k6yKqZBlaF1yTXaZm4HljUyldos62Q/mi8NA6O7aOidl2794tiNxKEwIQ8C1x7ZLmPz8
 9zFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=4/zrMCJBd//gdse1EUU9elUGOKQ9bX0lB1OghNnFbyg=;
 b=Nub4D0hosjtYXzPULaPN4vzdopcchjGBSQnMiCjtY4Kkuv2fCkzSsYqLpWORT59Acl
 zcLhdtt5EztfKlcBmdXeAf6PCelPzMuFI0N7ibH7Fs/uKbeA6VPk0X8ukctZTglB6nZN
 kvqou5MZGF9YMlipP726yImeVoxNyTUQjpQJmXA/QUP+sjMnffyhwtvsOWcjYZ9BTfIz
 Qlocs8V6UoByHazBO1hpvRRIYxHS03bg0DsXfV4GC2dYyyizEctR8RzUNJzjFOs0fUUK
 9vX8kNmzkJQoZrgD5D2sGJcHcjCWXbnkBqLZ5x1evZUJq5Usl+CpMGTEXTN3UUPO0S54
 excA==
X-Gm-Message-State: AOAM53109J8ngQcPJW9rQn2vJQKhjPKoRj3KF/wFGEaAdJh2zf1cdLzR
 uKxKlOEMbFpE10LTcevPgvrLB5oXis4msg==
X-Google-Smtp-Source: ABdhPJxjQX3BbZwT8fAOKtxazQaYnZfJikTqLouwbeQKMf0X6w9uyvUqQa3O5cEMRZG0TbZIpq63ZA==
X-Received: by 2002:adf:f2cd:: with SMTP id d13mr20833299wrp.18.1635147302870; 
 Mon, 25 Oct 2021 00:35:02 -0700 (PDT)
Received: from lmecxl0524.lme.st.com
 ([2a04:cec0:1002:3347:f8bd:7b81:c866:9456])
 by smtp.gmail.com with ESMTPSA id k10sm17984194wmr.32.2021.10.25.00.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 00:35:02 -0700 (PDT)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 09:34:52 +0200
Message-Id: <20211025073458.8576-1-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.17.1
Subject: [Buildroot] [PATCH 1/7] boot/optee-os: bump to version 3.15.0
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump OP-TEE OS package version to OP-TEE release 3.15.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 boot/optee-os/Config.in     | 4 ++--
 boot/optee-os/optee-os.hash | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 4679fd2fde..0974578484 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -18,7 +18,7 @@ choice
 	  Select the version of OP-TEE OS you want to use
 
 config BR2_TARGET_OPTEE_OS_LATEST
-	bool "3.13.0"
+	bool "3.15.0"
 	help
 	  Use the latest release tag from the OP-TEE OS official Git
 	  repository.
@@ -50,7 +50,7 @@ endif
 
 config BR2_TARGET_OPTEE_OS_VERSION
 	string
-	default "3.13.0"	if BR2_TARGET_OPTEE_OS_LATEST
+	default "3.15.0"	if BR2_TARGET_OPTEE_OS_LATEST
 	default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
 
diff --git a/boot/optee-os/optee-os.hash b/boot/optee-os/optee-os.hash
index 3803a69797..3c32e25b36 100644
--- a/boot/optee-os/optee-os.hash
+++ b/boot/optee-os/optee-os.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_os/archive/3.13.0/optee-os-3.13.0.tar.gz
-sha256 c6629ba54f62a2624299f7d17cf6df2dadc902e6a862c62f85d1b6da6c909c3f  optee-os-3.13.0.tar.gz
+# From https://github.com/OP-TEE/optee_os/archive/3.15.0/optee-os-3.15.0.tar.gz
+sha256 e5bb3d9eedaf7785af091602addac5b52118f4cdc108af9cd6f6c96b21503ab8  optee-os-3.15.0.tar.gz
 # Locally computed
 sha256 1247ee90858f4037b6cac63cbffddfed435d0d73c631b37d78c1e6e6ab3e5d1a  LICENSE
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
