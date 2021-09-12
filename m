Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5568EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 07:54:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68461610FD
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 07:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 68461610FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1250C400AF;
	Sun, 12 Sep 2021 07:54:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y981tyh4PEFi; Sun, 12 Sep 2021 07:54:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10DC44011D;
	Sun, 12 Sep 2021 07:54:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5FB2C1BF584
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 07:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4915580E62
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 07:54:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pcsZwqhNVg6F for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 07:54:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BDFE80E4C
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 07:54:00 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id i21so13761476ejd.2
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 00:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wV6urf8XR6ytjL3A2BNj4IQ94dj5CByO36yGgcu4Ihk=;
 b=JSoSaTE8VZ3M3iiPfDBOTnnSk1uriNIyvv72DjwtW6dP2gxZCxlpDiQ9MO7xKThGVk
 FP2XMjSx0OfDCHhBiaUcexdzfMwwZDLCaSvMU7CmI3XrejrfI3IZlOdH/J5M6H/ZaxvE
 kaYcmysWhK0PVNPslGdvVEkh9dt9YD3vACMzkv1G3NZTBztIGWofX2S1mZF5kxkgJIGp
 nKhnxONwYNTer6Y7G5yHq+CiphUzILIQeG2GJMG5GG6R57MEBD6nwvjGEMKRDhdItQgc
 3b8KoaVxrtONIbCEFwy2WPvA3nQ4EQe0x6pYRwMCpOfxZewvYvRZKj+OFcLk+WzDpEEK
 pFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=wV6urf8XR6ytjL3A2BNj4IQ94dj5CByO36yGgcu4Ihk=;
 b=ipHHNmgRSmGtZjmSMLeoFxTeo1PCRaODDxoB2ZF5vSzoHvS6yAi01vjzOiQ9WZnBhn
 jb7ptxR+06bHYtxx1YHecxrT8ZQeYWLfzOz7+KBb5EJDxsk+ZNHPLBfh7uux7tOr6lpz
 M/gSsyQlS+DuVC7PVTkjnEUkel6FXLBh89RuGZrFImRLm6pozCW5Lq1OJ67UUfBo+Syr
 acVt8hUCXe4b2vjvl7OLP/bBUOH3NGdVq67SVcQOV7447PkNKpLScZHTGvgm6BXVJQAV
 i0iOchUrwVuEiju6gJx5AHu3f7jBBh2PcoFNB3mi9UtAnzfoZFYffLkq2KheMlRhwBSV
 Z12g==
X-Gm-Message-State: AOAM531368KFVxt7+MwHPUJ8gqs4QrYyscBfBZTG3sZ5f2z+5Hx+Xav7
 qV1CxWSVtzbveOx+kOyyp/Pvshlj/70=
X-Google-Smtp-Source: ABdhPJwkGQwUi8QUq6vVtQ5+mMJCuyHtQaLh8q5eVXClzRrvboIt/qnLNIRoXw8Akl0RJQmILc11Yg==
X-Received: by 2002:a17:906:c1c9:: with SMTP id
 bw9mr6364309ejb.3.1631433238590; 
 Sun, 12 Sep 2021 00:53:58 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 k6sm1949468edv.77.2021.09.12.00.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 00:53:57 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1mPKJI-0001hn-GV; Sun, 12 Sep 2021 09:53:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 09:53:53 +0200
Message-Id: <20210912075354.6509-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.{4, 10, 13, 14}.x series
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 16 ++++++++--------
 package/linux-headers/Config.in.host | 16 ++++++++--------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 270b825e22..ec4e4c5154 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.14" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.14.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.198-cip54" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.198-cip54-rt21" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 76bb9fe001..b98c2e4163 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  7e068b5e0d26a62b10e5320b25dce57588cbbc6f781c090442138c9c9c3271b2  linux-5.14.tar.xz
-sha256  72fe7cc1f0363523061659a21e24754697b27f405cb88a41a63038629636159a  linux-5.13.9.tar.xz
-sha256  00bbaeaac17f82d9a6d93cbc42cafd39d3b2fa3a6087333503d2344fa5e3142d  linux-5.10.57.tar.xz
-sha256  0471d0ccb7953cdae7d235192588ac5d72344851969962676d1703e69084a37f  linux-5.4.139.tar.xz
+sha256  c6c340be69e22021d9406c51467d03e2e28fb7221939b2ef114cac3d3602a8d8  linux-5.14.3.tar.xz
+sha256  495989174c16ae15817798f9e0722dfd782d7d2c78283b519ecc60f2d87e51d2  linux-5.13.16.tar.xz
+sha256  3eb84bd24a2de2b4749314e34597c02401c5d6831b055ed5224adb405c35e30a  linux-5.10.64.tar.xz
+sha256  5cf7782ec2e91417edf0d5e6555da6d556962c8985e33ba9e7dadba5cbdc68f9  linux-5.4.145.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  4bdf66494be66a1da857f09b40b95026a0388e373fb01a206c60f67834746cb4  linux-4.4.279.tar.xz
-sha256  21edb57dea0fe04a51fcfb6d4e8c0c052787a20015bc74a0a0e63329601f2e07  linux-4.9.279.tar.xz
-sha256  7f235d454d703112e86574150652807f42abead92f3837da32ea86b4f148b371  linux-4.14.243.tar.xz
-sha256  f2827d0506622fcae0dae0bc72b2f016469210f50c2d3dd1bdd1211a813dca27  linux-4.19.202.tar.xz
+sha256  02252f0002e65306f6765089e8bb51f621f4eaea974348c31991b0c508243bb5  linux-4.4.283.tar.xz
+sha256  67727389771a858406f773b4db62d7d3248209e26120df47507ea4a8898d2e15  linux-4.9.282.tar.xz
+sha256  9c5612ef428441b7c85cf211a455c06ce695b81a9a40c064d0ea424dd08bef3a  linux-4.14.246.tar.xz
+sha256  b7eb776f408b3ea71c97dde4888cc4549edf925a18cd158e7c9681d6ffa684c0  linux-4.19.206.tar.xz
 # Locally computed
 sha256  e6fc0a999a180ad272b08ff71cbc67f2d3fdc6773d4a8069aefb8781b8e07821  linux-cip-4.19.198-cip54.tar.gz
 sha256  449668d678e458ddaf30f944b7ca7f5ce6ea6664f57d43ea4eb90b176e03b9cb  linux-cip-4.19.198-cip54-rt21.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7123caf65f..bc4296d084 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -370,14 +370,14 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.279"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.279"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.243"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.202"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.139"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.57"	if BR2_KERNEL_HEADERS_5_10
-	default "5.13.9"	if BR2_KERNEL_HEADERS_5_13
-	default "5.14"		if BR2_KERNEL_HEADERS_5_14
+	default "4.4.283"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.282"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.246"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.206"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.145"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.64"	if BR2_KERNEL_HEADERS_5_10
+	default "5.13.16"	if BR2_KERNEL_HEADERS_5_13
+	default "5.14.3"	if BR2_KERNEL_HEADERS_5_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
