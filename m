Return-Path: <SRS0=JPVL=O4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A650FC433F5
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 21:13:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF01260F92
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 21:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF01260F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9968D4029F;
	Fri,  8 Oct 2021 21:13:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z1l3ygdnSG7r; Fri,  8 Oct 2021 21:13:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE919401BC;
	Fri,  8 Oct 2021 21:13:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B76811BF2F6
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 21:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A56DA401BC
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 21:13:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JlB3wu9r7vQU for <buildroot@lists.busybox.net>;
 Fri,  8 Oct 2021 21:13:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E8744000B
 for <buildroot@buildroot.org>; Fri,  8 Oct 2021 21:13:46 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id s15so33525268wrv.11
 for <buildroot@buildroot.org>; Fri, 08 Oct 2021 14:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ccRz4jfL/J2TZUdtPx3mnCCOZMshTJhEkQaXpU08OrE=;
 b=Lqoni3onoHppZAu0nE+DEB7LkvbQAbXKimhpA9RrKF35XIX3f6XrDlwJ0ARd6t7iVp
 rJiijo6ysi5k91mqFclrqJaxoKOoV86em6SHaHZQkcQoJasjpbSwXFeGAQ4cotP1OvAA
 V7sKAtXk5IKBkhYfkbbrwPz0+ZpflF/aXQgS+Lf/L3F/RH7gmBCf/+EnRdnVlQS0/bif
 W9Khd1p91oy86MXlTNQnhHa6mYBiQEwWTSkhDtUorfb3/kfZbhvfljjltJccDsqt/vnf
 xpKKSCQD6vAOR3qRiVU7NGTsz0mTwiFUnQSHwaAQmPbUFYsr0qbUc8x1eVGOMleJnASy
 7Tyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ccRz4jfL/J2TZUdtPx3mnCCOZMshTJhEkQaXpU08OrE=;
 b=lVpgqYdfxp0pcoICPYMq1W0u5VKgUpFfWgxY2GG4AoLDRU/ws03CZ2UaYjXpP7pWAI
 m6T/RfVkBY4ujP7bfJkqL7hukhDLYr/0QKSD08MEydmMSboXaNbE/ba7GGpKpmcHZi80
 lD5LznqtacKDS/3U2a7rPMYdwzO5qg4Zs1A+QqAELZ8AoA/3EGNqZFkU6w02B/HfpVYd
 tvDKu83mv38KM17L1BMJBIZq9m8UMOGh2cP/YqU9ZCQsN8Bk62lx7qe9J9O5ZOgUy7po
 ge2lnCT9cMxAxFi1YLnRZo8n3qJk8WRntAt8k4K6wu/6mH5zhHruDv3c59rs8qGcrDWj
 u2Ag==
X-Gm-Message-State: AOAM53319gqVxlPmZPc/CGWTBYDtcW4mfdrKJ8SBTVLwn3zXv5RWWORQ
 CzV8YD6ZL8ELtr7f1Q+mBOjtY4jad10=
X-Google-Smtp-Source: ABdhPJxeGeyveVElh80ywk/NJwQZDUj0FNd3FFktuwOzKIx8dkkFQykRDsUacHe7gKaQO1OSBX4UPw==
X-Received: by 2002:adf:97d4:: with SMTP id t20mr6830185wrb.174.1633727624319; 
 Fri, 08 Oct 2021 14:13:44 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id a81sm281473wmd.30.2021.10.08.14.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 14:13:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  8 Oct 2021 23:12:38 +0200
Message-Id: <20211008211238.138841-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libcurl: fix build with wolfssl
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Select BR2_PACKAGE_WOLFSSL_ALL as suggested by upstream in
https://github.com/curl/curl/issues/7745 to fix the following build
failure raised since bump to version 7.79.1 in commit
6d6842130b456499d3ff230a3b70cec756cbccd1:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/riscv64-buildroot-linux-uclibc/10.3.0/../../../../riscv64-buildroot-linux-uclibc/bin/ld: ../lib/.libs/libcurl.so: undefined reference to `wolfSSL_ERR_clear_error'

Fixes:
 - http://autobuild.buildroot.org/results/2956c8fb91a16d2ab59fb1c7babec46a6c8399e5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcurl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 33525d80cd..033091173b 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -73,6 +73,7 @@ config BR2_PACKAGE_LIBCURL_MBEDTLS
 config BR2_PACKAGE_LIBCURL_WOLFSSL
 	bool "WolfSSL"
 	depends on BR2_PACKAGE_WOLFSSL
+	select BR2_PACKAGE_WOLFSSL_ALL
 
 config BR2_PACKAGE_LIBCURL_TLS_NONE
 	bool "None"
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
