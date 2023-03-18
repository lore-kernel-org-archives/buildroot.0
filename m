Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF70C74A5B
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 12:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A30940530;
	Sat, 18 Mar 2023 12:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A30940530
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mhqn2pmD-5g4; Sat, 18 Mar 2023 12:31:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3EBF40147;
	Sat, 18 Mar 2023 12:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3EBF40147
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E1C361BF834
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 12:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC77540147
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 12:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC77540147
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k7sDJUL_uko1 for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 12:31:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFC74400C5
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BFC74400C5
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 12:31:12 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id l12so6543812wrm.10
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 05:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679142670;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NpWJKzcqSejtCaL4bUN3Jep5Q2vU0saTRo36uZH7zgA=;
 b=FEE/85Pk7MMyoP87oY60LPmAZv5MGVYYdqkrDFchgyg4D5676Yf/cKLT4YeJNhyqyP
 qXJo1Hushm404FCjHCrmGU2ksOF8KmEWnSpJdlVYImBQZtFoQOHCfygnp6d33DJJOabH
 d0wLZbNyK1sqIPT+jepXaiqF85ESnBMDJY0K4tGgz56NM01+Ou/57QqxS7NA7fmVbjsj
 6uq5MtLfM5ZWLS8s9oWVGNEzUf/5lQHlcF7nbbYeH6krBtqIjq0GESgggafxs4TamOhD
 NUzhCmJUQsH80w3g2c1Kallq+NVnLueKusPX6+lchuiuRI+Pnb42DoiMQGIUp8o58r5C
 t27w==
X-Gm-Message-State: AO0yUKVyYL/Zk0oZ9aCy/1bIqZd1UtdiWPrdd360d+ztFiCNnB0zLfPz
 +HCU01kDkWKFkxqNXOxN8Ncf/8bAVAU=
X-Google-Smtp-Source: AK7set/QsNq6qMcSdA0Xhgbj2WdR4OXgJwfLoXmMnU7AuYVS2WtEaznFojYZ/Wdgr/wvgiP1Fd4KfA==
X-Received: by 2002:a5d:61c7:0:b0:2ce:a697:75c7 with SMTP id
 q7-20020a5d61c7000000b002cea69775c7mr8282136wrv.33.1679142670375; 
 Sat, 18 Mar 2023 05:31:10 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 h5-20020a5d4305000000b002c3f81c51b6sm4207479wrq.90.2023.03.18.05.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 05:31:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 18 Mar 2023 13:30:58 +0100
Message-Id: <20230318123058.4103-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679142670;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NpWJKzcqSejtCaL4bUN3Jep5Q2vU0saTRo36uZH7zgA=;
 b=af9OuvZG3/mhb4Q7y2sRn9bmodtMoh+Y7MomYrX1gVnStsKV+vk8JTxlNXt0mDRBDr
 zdEKIHvAFKTKqJFXo0IaqjsOjzcuCV3N6bgqZ6i1DFahT59Zg7TesWoDAYOsMwfM7diy
 0shxxz3zdUGKBVomlT9xhL6MlGcPLzEB3vWx+uksv+hrxVgLj2jcT9hNFXmrvXNv6UJC
 PwwsF0N9FbuaB7xcjoUvX12KcdTTKpjgEbmC9UWTLABU5B27kF7NPy3H3+/Yebd2q5Ee
 WjmfY0+zPY9R1m2fWM3u5YK4b3+ao9jGnYwuZKuWmrK518zkP1obg7rwDN6nxaQ/28OZ
 nvtg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=af9OuvZG
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: needs OpenSSL-enabled
 libcurl
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Alexander Egorenkov <egorenar@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised bump to version 2.17.0 in commit
eab9110afbef9c39569c4cc988aed15c48f7ce44 and
https://github.com/ibm-s390-linux/s390-tools/commit/56fecf1832c3ebc4626ddf5c598762833c362d5e:

Error: libcurl is not built with the OpenSSL backend

Fixes:
 - http://autobuild.buildroot.org/results/32aa8f0bece5da2a16d761f175d46c7d3e0a8965
 - http://autobuild.buildroot.org/results/535253f483c927da456c0be292df6a58c1f39737

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/s390-tools/s390-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index 8cd5491405..ec01a18cb0 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -14,7 +14,7 @@ S390_TOOLS_MAKE_OPTS = \
 	ARCH=$(BR2_ARCH) \
 	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
-ifeq ($(BR2_PACKAGE_LIBCURL),y)
+ifeq ($(BR2_PACKAGE_LIBCURL_OPENSSL),y)
 S390_TOOLS_DEPENDENCIES += libcurl
 S390_TOOLS_MAKE_OPTS += \
 	CURL_CONFIG=$(STAGING_DIR)/usr/bin/curl-config \
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
