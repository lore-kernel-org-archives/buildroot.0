Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A503C4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 07:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADBA1410DF;
	Fri,  9 Dec 2022 07:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADBA1410DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rvN_as-ttbuZ; Fri,  9 Dec 2022 07:51:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC9CC410C4;
	Fri,  9 Dec 2022 07:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC9CC410C4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7348C1BF5DE
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 07:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BACC4014B
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 07:51:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BACC4014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0WKJf2jOVwgF for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 07:51:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C92840127
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C92840127
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 07:51:15 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id o5so4373580wrm.1
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 23:51:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jC1QUsXfMlRDdl2sP2egoMj1Z8y/mqsPr5U1zYeJrUY=;
 b=xDNpHx4MNGXlI3k0YRekFNYpe4+wpd4ZFh+Upic0Qoz6Us0BYhbzFlZKA6F/8sL0ua
 cXUHR7nEeT9lsb6x9XR6TLCJSu16C/ZBOjN7f7V9l6O60+GueeO6rU0SgXTeEyMIZY+V
 M1jgP4Lk654COhuWprkyCNtQLJW9KoZ7HeCNJipbbkQ0M4PIz0DUzcmR8ahyU6quocPU
 tzHpxCR4ePr3O7XLEi3ycMtJDtJ+X8ZeK+QauscbZwLB66TdtIQbkAEE/5NgMxAET7BY
 ubGSJWrKPQRB1zO//uz9pY/F+WUVjk0xwpYpim4h+OQEQo5PgVA8Sw/ily5FrdhvJFRg
 GPKw==
X-Gm-Message-State: ANoB5pnSXnDnYmCHaztyqpSwOgc9tBZZPsFufnU9TmWGIrmvf63jdIcv
 7YahMzBxBv0s6Af2UjRZ/Xmo95H4M+nTm0X5
X-Google-Smtp-Source: AA0mqf7xUsBanmioLluusLw7i/rbvGKMArWpc9XW/4QmazNcliyAGjjL4Db3TqO1W0piDzTE1xczWg==
X-Received: by 2002:a5d:4086:0:b0:242:509a:ad42 with SMTP id
 o6-20020a5d4086000000b00242509aad42mr3000343wrp.36.1670572273182; 
 Thu, 08 Dec 2022 23:51:13 -0800 (PST)
Received: from lmecxl1178.home (lfbn-nan-1-127-214.w90-49.abo.wanadoo.fr.
 [90.49.211.214]) by smtp.gmail.com with ESMTPSA id
 bp3-20020a5d5a83000000b002415dd45320sm664507wrb.112.2022.12.08.23.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 23:51:12 -0800 (PST)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Fri,  9 Dec 2022 08:51:00 +0100
Message-Id: <20221209075104.1168297-1-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jC1QUsXfMlRDdl2sP2egoMj1Z8y/mqsPr5U1zYeJrUY=;
 b=YJLDwNGD7U5YoDu0uTXmsadbdLV293lBrKsuUXuyg3JSPJDkbh36knZzhcs174tStI
 1CgdruegLI04KtUTT5+eWXQZJ9mGkVOZdDArycJ7o9hT9sqb5bgZgvVsanfu1VgLLrtn
 gn0xMJi4pBWqMLZxr2cIDaIgT+8dqAWxeb4I0yvi7RZIXl2maxsm4I2UVlNzlqSQIC+P
 KEPhNABrPTfYeykRbhb0jJ0TrvqDia/4Yi+2s1Y/df92adnY0JG3B9x4OvymPHv+q0jB
 HtEu+YVLw3qeuwoGJYU7V+1W1uL0raM7DR9XB8LSewD3T/CUEEpWtXoUAWE0zLD6RzDw
 EFbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=YJLDwNGD
Subject: [Buildroot] [PATCH v2 1/5] boot/optee-os: bump to version 3.19.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bumps OP-TEE OS package version to OP-TEE release 3.19.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
No change since v1
---
 boot/optee-os/Config.in     | 4 ++--
 boot/optee-os/optee-os.hash | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 5244700bc2..8bcce22306 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -18,7 +18,7 @@ choice
 	  Select the version of OP-TEE OS you want to use
 
 config BR2_TARGET_OPTEE_OS_LATEST
-	bool "3.18.0"
+	bool "3.19.0"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	select BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY
 	help
@@ -70,7 +70,7 @@ endif
 
 config BR2_TARGET_OPTEE_OS_VERSION
 	string
-	default "3.18.0"	if BR2_TARGET_OPTEE_OS_LATEST
+	default "3.19.0"	if BR2_TARGET_OPTEE_OS_LATEST
 	default "custom"	if BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
 	default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
diff --git a/boot/optee-os/optee-os.hash b/boot/optee-os/optee-os.hash
index 38f68bec5d..a87f21a9bf 100644
--- a/boot/optee-os/optee-os.hash
+++ b/boot/optee-os/optee-os.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_os/archive/3.18.0/optee-os-3.18.0.tar.gz
-sha256  bdd309697745ec4406951652094b50d9adb06c3612f01bd8a3d72682ec8e03e8  optee-os-3.18.0.tar.gz
+# From https://github.com/OP-TEE/optee_os/archive/3.19.0/optee-os-3.19.0.tar.gz
+sha256  5e0c03bbc4d106f262a6bd33333c002c3380205ae6b82334aa7b644721ff7868  optee-os-3.19.0.tar.gz
 # Locally computed
 sha256  1247ee90858f4037b6cac63cbffddfed435d0d73c631b37d78c1e6e6ab3e5d1a  LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
