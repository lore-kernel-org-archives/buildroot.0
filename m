Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB22BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 07:36:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 522D260FD7
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 07:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 522D260FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28D7180DED;
	Mon, 25 Oct 2021 07:36:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CSvhx1p23q6p; Mon, 25 Oct 2021 07:36:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7046A80DE5;
	Mon, 25 Oct 2021 07:36:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22C0E1BF2CC
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 07:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F8BB80DE5
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 07:35:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xQ-XQud60x1I for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 07:35:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0429380DED
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 07:35:08 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id a16so9825147wrh.12
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 00:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mfy/3UhIZNYgYstpgmlLbQ0ehlTl7aLkaMVDhI4zhoU=;
 b=wQk3Jf4Nk9w1fy+dfflSF2FUY0ISlSxxt6yHvVPF3tn43vlX3ynAdVyxgIbI/q5iWp
 BwdFz+rUiAbkFj2nsZKhN34WE5BegvBM8fUUGSc0gnvcubv/YxDz2KgRSzDf3zXTqUF1
 R+O3A+HByvMPyxcf2kyHp9KB9WeuADhUHM1D8Uy+0QZ1AmWwFwz5EtZVCFU//PIu4mDv
 /ReSfkHqh9bAZlPZKBmKTWuVSO1oEFEqwvjoQ7vrfZ3emmjkn5U6nzBzbv49JIP8V3WR
 KL77cAm86uFWKtKLZ9rG8TS6A1Rj4RkFQ2lWyli7dx9kTEiqB3rCQEz0sE7/WbkLB3sH
 gdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mfy/3UhIZNYgYstpgmlLbQ0ehlTl7aLkaMVDhI4zhoU=;
 b=Ts2xWZYC1DQgNGXsCQ3JWpbVaNMG+56IxucAEJf4fWmIpzmZUTV3pKApUwt8RKYl7n
 B/0GJWcaIov2XHn8Cf7YUYnwkLz3yrM10cLFSa2zmgGsJZgNz14D88XEwdSrYxSrwl8c
 g+k62EO1mPFkV8KHy5cT6FcWAAebiLaQTbbDimyRqA+ANRLtoo7C3QAjb0GS5b7SUhsi
 nMH7iHiwNBmaVO+AmHjgpPDvqnpv0igSdXT9uOMVxmaiV5uCVAvAiTxbiYocr2VJ1xgX
 fWPpGyEaatrbqOZQI3MvSBWpUfV6eFqBbDUpswVhybe97v2fRR0+7J95V0QKkZMkjNlC
 RI6Q==
X-Gm-Message-State: AOAM533ZuYY8ROFb+1Ect4DyTFE0C93X5YNpvJDMgtl8+EN+Sp+BjOHm
 LzyQW5yFSaPOtGYK6YFWZdeULmRDlKeNtQ==
X-Google-Smtp-Source: ABdhPJwL7UlL8ZSEa2g2ZS8urTDGV0Py9PUerSsH1U3sphhVjAtFYp9TlpVLZ1PUf97xjPcEru5fmQ==
X-Received: by 2002:a5d:47c3:: with SMTP id o3mr21381145wrc.25.1635147306866; 
 Mon, 25 Oct 2021 00:35:06 -0700 (PDT)
Received: from lmecxl0524.lme.st.com
 ([2a04:cec0:1002:3347:f8bd:7b81:c866:9456])
 by smtp.gmail.com with ESMTPSA id k10sm17984194wmr.32.2021.10.25.00.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 00:35:06 -0700 (PDT)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 09:34:57 +0200
Message-Id: <20211025073458.8576-6-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211025073458.8576-1-etienne.carriere@linaro.org>
References: <20211025073458.8576-1-etienne.carriere@linaro.org>
Subject: [Buildroot] [PATCH 6/7] package/optee-client: remove dependency on
 BR2_STATIC_LIBS
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

Restore support for BR2_STATIC_LIBS in optee-client, removed by
[1] to overcome an issue introduced in OP-TEE 3.13.0 that mandates
support for shared libraries.

As OP-TEE expects to be functional on OSes without dynamic shared
library support, change [2] was merged in OP-TEE tag 3.15.0 to fix the
initial issue introducing new configuration switch CFG_TEE_SUPP_PLUGIN.
When disabled, optee-client plugin support is not embedded and
optee-client can built with static libraries support only.

Link: [1] commit 321a850bc734 ("package/optee-client: add dependency on !BR2_STATIC_LIBS")
Link: [2] https://github.com/OP-TEE/optee_client/commit/f59114370f267f0b3341870b6cf1e1c88d184b3f
Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/optee-client/Config.in       | 12 +++++++++---
 package/optee-client/optee-client.mk |  6 ++++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
index 2765f49308..2547fc0ce3 100644
--- a/package/optee-client/Config.in
+++ b/package/optee-client/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_OPTEE_CLIENT
 	bool "optee-client"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3 # MMC_IOC_MULTI_CMD
 	help
 	  Enable the OP-TEE client package that brings non-secure
@@ -25,8 +24,15 @@ config BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH
 	  normal world OS providing the actual storage via
 	  tee-supplicant.
 
+config BR2_PACKAGE_OPTEE_CLIENT_SUPP_PLUGINS
+	bool "Enable TEE supplicant plugins"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	default y
+	help
+	  Enable TEE supplicant plugin support.
+
 endif
 
-comment "optee-client needs a toolchain w/ threads, dynamic library, headers >= 4.3"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+comment "optee-client needs a toolchain w/ threads, headers >= 4.3"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index 20147c89a8..9a73a8a761 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -14,6 +14,12 @@ OPTEE_CLIENT_CONF_OPTS = \
 	-DCFG_TEE_FS_PARENT_PATH=$(BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH) \
 	-DCFG_WERROR=OFF
 
+ifeq ($(BR2_PACKAGE_OPTEE_CLIENT_SUPP_PLUGINS),y)
+OPTEE_CLIENT_CONF_OPTS += -DCFG_TEE_SUPP_PLUGINS=ON
+else
+OPTEE_CLIENT_CONF_OPTS += -DCFG_TEE_SUPP_PLUGINS=OFF
+endif
+
 define OPTEE_CLIENT_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D $(OPTEE_CLIENT_PKGDIR)/S30optee \
 		$(TARGET_DIR)/etc/init.d/S30optee
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
