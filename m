Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFDDC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 21:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16A6E40A06;
	Tue,  5 Apr 2022 21:35:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uMWGAjrFTKa3; Tue,  5 Apr 2022 21:35:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B7A240329;
	Tue,  5 Apr 2022 21:35:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B3221BF3A3
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 21:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8050B60B01
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 21:35:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XJJuiXr1R_ka for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 21:35:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D21A60ADC
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 21:35:38 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id p189so267886wmp.3
 for <buildroot@buildroot.org>; Tue, 05 Apr 2022 14:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6WE9cuirB7cKmvy1JgqLoum5MHqn3v/7eVA8uNFl868=;
 b=JAJskwGYQGE3EczbJ8mU9NUHxpZlsKr4pvqZvyCi6xJ924f4w08so0VidUnLCxz3de
 7KniK8CvSK/JkLaAR1ZEVazG5BO+C5uPO58Hv9dfMnQZLBWxihM72twKeNx8GpjDgx90
 to5GOv3wo4OQe8S37PCK4mSOgmGwAyAQ6wZSSZZii61MdjFDYqIdHNlnd1aK/ZIfx9p4
 PCUiB8UknHPhFqGQq5EuKswYb9vMAhvhBOWJI04/WCZEwm1pMrlg0ANHpuwKDAk0TuyC
 8blvCNAef8zM0IOUnW+n/zrLsEhcuPfJWBpG7wT0APENDqDD86+n1eG7Mul1vy+EqMXp
 lIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6WE9cuirB7cKmvy1JgqLoum5MHqn3v/7eVA8uNFl868=;
 b=7JmapIr3fugAmFQRIK7dAVOy0s5JrERpNOdDNJkJXKv1lDPqkuyAFRY7mXbDNk1nEa
 FagNfwTIYlkU9Mxhcf2QaP6sCmG78Vc6ioyci/ocm95HvPHqa5DpLRN3qtrEAowvDVy2
 OXXPHOc3hK1hVUIR+BOq78D5Csk/D/TPzVwye27wPv+uQor4uHTkTT54N/uGHqVN86ZO
 cKzSrAfNWUSi9Q5cqunlv6nCmjiNgquB0Y6+0sT5yBBaKcYUU/AWZx8Gp+FS2PrlNc/g
 zwQnGqPn4E6WdDn77NlwTfH2X0KrAQb9Rz6jCpv8tiRuc+ZFGTzdsUgIidzXk9V4+RCY
 6Hcw==
X-Gm-Message-State: AOAM5311yAMxsA3liMRrRyG84NthbK9237xFM2DMl63DzR4htQ4es4VP
 c/Uq5WSsJF8FoU8tkL/pPn+e21SgTIU=
X-Google-Smtp-Source: ABdhPJxBGx9AxpOhfDBzHM2gXmzxiECzKPc1IxBqAEap/bB8EByvt2aeMcQb03cZ8wbyQujpAe+HOA==
X-Received: by 2002:a05:600c:3d86:b0:38d:581:89ad with SMTP id
 bi6-20020a05600c3d8600b0038d058189admr4834637wmb.42.1649194536492; 
 Tue, 05 Apr 2022 14:35:36 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05600c0a4b00b0037c91e085ddsm3979834wmq.40.2022.04.05.14.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 14:35:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Apr 2022 23:33:51 +0200
Message-Id: <20220405213351.2487658-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libnss: fix build on powerpc
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set NSS_DISABLE_CRYPTO_VSX which is available since version 3.64 and
https://github.com/nss-dev/nss/commit/9dab43371d4d924419523e18ba84f02804880533
to avoid the following build failure on powerpc:

cc1: warning: '-mvsx' requires hardware floating point
cc1: error: '-mno-vsx' turns off '-mcrypto'

Fixes:
 - http://autobuild.buildroot.org/results/6bedb5b658f6c9c16c26c73a524a995e5e84fcc8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnss/libnss.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 2f7a265136..4582c55ada 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -51,6 +51,7 @@ LIBNSS_BUILD_VARS = \
 	NSPR_INCLUDE_DIR=$(STAGING_DIR)/usr/include/nspr \
 	NSPR_LIB_DIR=$(STAGING_DIR)/usr/lib \
 	NS_USE_GCC=1 \
+	NSS_DISABLE_CRYPTO_VSX=1 \
 	NSS_DISABLE_GTESTS=1 \
 	NSS_USE_SYSTEM_SQLITE=1 \
 	NATIVE_CC="$(HOSTCC)" \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
