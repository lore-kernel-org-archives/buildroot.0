Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADCBC433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 18:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 455758328E;
	Fri,  3 Dec 2021 18:01:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gVVwYUjXeJFb; Fri,  3 Dec 2021 18:01:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A56A8329A;
	Fri,  3 Dec 2021 18:01:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 61D461BF2A2
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 18:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5217A409BF
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 18:01:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1_pcnE6WSo3I for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 18:01:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D75B540954
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 18:01:15 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id o4so3573720pfp.13
 for <buildroot@buildroot.org>; Fri, 03 Dec 2021 10:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4oqvzXsLBd2kL6sDtUK592OeyChVGneQA/KGgeVBCRs=;
 b=dEtb2bISZS57W+/UdqCHC3ZUtlt9gDnZqjtbWkKFhWjw7a1hZoyKeROhXY6wkHxB5Z
 cFyBJ4xkvNQiyzcZQQQ3HYQd8iH8VUd0zNPrbha1WWNEmG0PjG59gEU8mC11Lji8dtlO
 /AT1sLn3E0k953hpibUZCNlZZA9hk1NMR1NEsMg/G/AIUggBv2mt8ZU0/ieAacOre8nQ
 CyUqXzL4QSAThImnyHQ4oK4QuDBWAJC+OTcXXI41w4LKDnkK2fw5XtmwIjwfqACLjFo1
 MaTG0QkoF8dfStSGeKM06Ulqx7rmqspKbiOz1Eht1f07ZqAwhays8ZQLnngFojMuT/B6
 ITig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4oqvzXsLBd2kL6sDtUK592OeyChVGneQA/KGgeVBCRs=;
 b=b5Nn/ia2Gjfc/GivCVE/22YhurqKzZwQUFp4I4Fgg1Qf79rHtEbbecLVshkiSV6o85
 DshultkwHvibsc1nRVObSDOw3Sq9+1Mn2ozCy558gxLAtrKvPA4mkta74tF3HlXf6NDA
 TPCgy5MMUbLivph7G41heXTKekPy/YFqZhnGRyyErrx6SVvWMC1QhoE28TOiHUT1cz0Z
 H491HFCsjFdwW653c4YvwErmr9QUrMMLrtnO6/8AW6sxl5hEPP9odVgCRz9A6cqap5hq
 S3GKwv/YbYQNXe4PjiuCOcUFRbz0Z+S1n59mNYQZtDFAnHbs9MLR/aN/ZZwKtX1STwSB
 jMcQ==
X-Gm-Message-State: AOAM531viaSTL/iOlW4Smr/Kk6B3UXAyV8aqoFTgmqE7LRzMipzYPlI6
 otQq1iMLfKAeIDJVEiA76aChhxb0NuTQ2Q==
X-Google-Smtp-Source: ABdhPJyITxeLyUmuXSwuFvhave5ibIurjGfnA4cVRo9sLzgNpc3wMqt5KjTFs5jza9vEg3+hqsiJ+g==
X-Received: by 2002:a63:448:: with SMTP id 69mr5549946pge.141.1638554475030;
 Fri, 03 Dec 2021 10:01:15 -0800 (PST)
Received: from localhost.localdomain ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id x37sm4011278pfh.116.2021.12.03.10.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 10:01:14 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Dec 2021 10:01:05 -0800
Message-Id: <20211203180105.1165486-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211203180105.1165486-1-aduskett@gmail.com>
References: <20211203180105.1165486-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/coreutils: enable selinux support
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
Cc: Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable SELinux support if libselinux is selected. This allows utilities such as
ls to read and display extended attributes with ls -lZ

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/coreutils/coreutils.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 6822c58a32..78bafb635b 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -98,6 +98,13 @@ else
 COREUTILS_CONF_OPTS += --disable-libcap
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+COREUTILS_DEPENDENCIES += libselinux
+COREUTILS_CONF_OPTS += --with-selinux
+else
+COREUTILS_CONF_OPTS += --without-selinux
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 COREUTILS_CONF_OPTS += --with-openssl=yes
 COREUTILS_DEPENDENCIES += openssl
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
