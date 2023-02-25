Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6DAC7EE2D
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 23:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC59560B1C;
	Sat, 25 Feb 2023 23:22:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC59560B1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 88vLck1NIBof; Sat, 25 Feb 2023 23:22:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2988260AC4;
	Sat, 25 Feb 2023 23:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2988260AC4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6588A1BF5E6
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 23:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B67B60AC4
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 23:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B67B60AC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wq7uDvHIs2bg for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 23:22:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1244960A91
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1244960A91
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 23:22:24 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id j3so2061904wms.2
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 15:22:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=idQT4VPOePZOTrlOMXPHeAblbhsI5meuRidyBRzl+tM=;
 b=eBHCnctln9UCLjfvjieIMrf9ihDaZ1kR6CbOBHTvF7R171hyfZ4XPzWVbV6RAuU+Ab
 s2bR1dPkrTyAv00xiW21VEgbI+dGbk1jCgCEpTbIOob4WMPDq2DNUt1NzVvw2glmrKYI
 PIlWjgeT8ojQWwWg+j0tTtGDKfE0ANVzLIgrk2TfiKm3m98PFyE+0q6eAJisjMXXLBck
 zPiSXUNAK6K+thixRioccP1vUfw4K9mSrc8GMDCUvbpSf0Ct9lAIKi2vuIad5i8gP/1B
 gjRI2sEAKumDuKmMwtz3hwcUDRcylXZaZEWYiDGQyW9YhnLlzowGglOd2M+B89DVRBxH
 OArw==
X-Gm-Message-State: AO0yUKUbfA53o02VHR15GXo+DEmMW8i2jE2peLDXGXeN+dMqqdH3rlEZ
 W72qnLiE9hZhb+6z4uamEoiAEkyzbl4=
X-Google-Smtp-Source: AK7set/ijRdUEbXrfgztr6gg6u+qrIeZvoP3tKP9rZM06Dccxfa9zH2Fnl+3ZVvezG8gxyBDVK/UwA==
X-Received: by 2002:a05:600c:170a:b0:3eb:37ce:4c3d with SMTP id
 c10-20020a05600c170a00b003eb37ce4c3dmr1861345wmn.38.1677367342559; 
 Sat, 25 Feb 2023 15:22:22 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 h16-20020adff4d0000000b002c70851fdd8sm2886612wrp.75.2023.02.25.15.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 15:22:22 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Feb 2023 00:22:17 +0100
Message-Id: <20230225232217.27171-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=idQT4VPOePZOTrlOMXPHeAblbhsI5meuRidyBRzl+tM=;
 b=UKIuRg28s3UD3cF8FNqUAd+Z/eWoBhPRRoakj5IRloXiomxCdUb4JCD8KrmLdMZOZv
 YyN7YyeYHnTYWhlfmtQsswRqnDx2wjNuKP5b26wd7t82kfi2QcnB3XVdCrfEJ9BTk+UP
 AnByqDrgKEN2WTnFJbnqktKuEkkV0wVQ3X+tqzGDisx9LnElr0DadxFdLMfuozBtDdtQ
 DKRG9A6kjS0JFCQhmhDy3O8p4fjPG9HedqRtUfIcm+wz+s/04bClzzqxOy6oJ1UaFLsK
 L+UxOaPatzYyRLmyOAX8Sry34/HKK/JnG6IOGb9ACubPtaZjI8gdoRRKyOib/FDkuoKi
 Vb/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UKIuRg28
Subject: [Buildroot] [PATCH 1/1] package/flac: drop unrecognized option
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

xmms-plugin has been dropped since version 1.4.2 and
https://github.com/xiph/flac/commit/8fbeff238c41464fe220cd23c45861c9302d1172

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/flac/flac.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index ebb4778521..595c2379b0 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -17,7 +17,6 @@ FLAC_CONF_OPTS = \
 	$(if $(BR2_POWERPC_CPU_HAS_ALTIVEC),--enable-altivec,--disable-altivec) \
 	$(if $(BR2_INSTALL_LIBSTDCPP),--enable-cpplibs,--disable-cpplibs) \
 	$(if $(BR2_POWERPC_CPU_HAS_VSX),--enable-vsx,--disable-vsx) \
-	--disable-xmms-plugin \
 	--disable-stack-smash-protection
 
 ifeq ($(BR2_PACKAGE_LIBOGG),y)
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
