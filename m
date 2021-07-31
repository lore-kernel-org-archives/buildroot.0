Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B84DFC4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 20:06:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68B2860F35
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 20:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 68B2860F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12D09400C3;
	Sat, 31 Jul 2021 20:06:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CFADoD3PD_Cq; Sat, 31 Jul 2021 20:06:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E10B840240;
	Sat, 31 Jul 2021 20:06:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AFD601BF34F
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 20:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D79982C21
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 20:06:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V2o4WK-cGpxl for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 20:06:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9AAF282B08
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 20:06:06 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id l18so16099358wrv.5
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 13:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DnsJjKM40+j2YGrqaCv+G53Pk8zk/ryGwDzIcAJihzM=;
 b=Pq14kDXY8+rTfDGR2xOXJKeJ8zNWEwGEsF0iCRib1bSqHvzvRj08GBHpnX1M7yug6D
 lvkQLSjjsUhtaQejsIrlNdbu/pl/g3GlZOv4Hp9x1wy860+CZkIpE4bDK9CnLf0p08AB
 vnFfgXY9pbRyReUHIhTKt8ZXukP0p33nXJh2h7elnBWZTi0YMeBopPXCRCD0zJUApP2Q
 p4SfTgfd5d7KMlNbWYN993rYIposMyXSe0RNKGcUveTdnpwHttG7cSn876eFwpBpfIGa
 pYuxsvdlMsbluZwiup1+tB2sfWxMXXG9IA3yTLBuNHLKpMj49ix02GwC0YQrWUG3pMfq
 gOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DnsJjKM40+j2YGrqaCv+G53Pk8zk/ryGwDzIcAJihzM=;
 b=XLFGJUE4fxYBFVN5XHoCX08wH+GJHP2oQrStoqCyrSMOFO/sHeqfbRf3P7tnTbD1ZY
 8miHe1hcW4qKO5M0Z/a9nCs1O0fza85EqMOPT7MCTsl18jqw5awc+W+wiTNnp6LykKpS
 cJhERVlR3GBjsOquaGLE0pyoOWztaq4qRZtGQ4ttYexrjVeXiI662otBDh/tPA2waJFz
 jfrY2Y97nmHNI5zrvJMuw4lrEZmHNtPlJgKyLysdBaBQcpEzi4yyn/4qW822vdxnOSZO
 hYoqjXmWibgtcTQvNVni8y81TU0+l9aBZewc/jPFhZTXuqLLWXwgWYNS5eIi58TEw54T
 EZAw==
X-Gm-Message-State: AOAM530TxvRy34lj87Kc2/gL1qb4PB58XgaUo8sMzehTT1CTYCuXF0NL
 rxtDFXwM6aAVPKecnO1QrrT0CgZmaRR1Ag==
X-Google-Smtp-Source: ABdhPJzvKeSyc9klodBhQmgdZKEWe3Mq7H4R3Nwz22HvZA2yVur0DJMAK81H2CEpOE2G/NBaGurjkQ==
X-Received: by 2002:a5d:526a:: with SMTP id l10mr9740543wrc.40.1627761964537; 
 Sat, 31 Jul 2021 13:06:04 -0700 (PDT)
Received: from kali.home (pop.92-184-116-174.mobile.abo.orange.fr.
 [92.184.116.174])
 by smtp.gmail.com with ESMTPSA id s9sm5884256wra.80.2021.07.31.13.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 13:06:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 22:05:55 +0200
Message-Id: <20210731200555.1236377-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gtest: needs gcc >= 4.9
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Michael Nosthoff <buildroot@heine.tech>, Stephan Hoffmann <sho@relinux.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

gtest unconditionally uses is_trivially_copy_constructible since
version 1.11.0 and
https://github.com/google/googletest/commit/c13c27a513ecd1cbf5700a45fe590e85e8ae6770

So add a dependency on gcc >= 4.9 to avoid a build failure since commit
9dfbbbb4105c47602da048c9bb9499fb8862e768

Fixes:
 - http://autobuild.buildroot.org/results/3d23d7c2c340c23e468890e4df73a9b3b142ecf6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gtest/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/gtest/Config.in b/package/gtest/Config.in
index 3f1f38556f..d8bcf6343f 100644
--- a/package/gtest/Config.in
+++ b/package/gtest/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GTEST
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	depends on BR2_USE_MMU # fork()
 	help
 	  Google's framework for writing C++ tests on a variety of
@@ -48,7 +49,8 @@ config BR2_PACKAGE_GTEST_GMOCK
 
 endif # BR2_PACKAGE_GTEST
 
-comment "gtest needs a toolchain w/ C++, wchar, threads"
+comment "gtest needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INSTALL_LIBSTDCPP
+		!BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
