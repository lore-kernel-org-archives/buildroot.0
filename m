Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39855ECAAD5
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 13:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 745CA408C6;
	Sun, 28 Aug 2022 13:05:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 745CA408C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KvodVpyW56dq; Sun, 28 Aug 2022 13:05:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5754B408AA;
	Sun, 28 Aug 2022 13:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5754B408AA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE51A1BF59F
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 13:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B388F60BD4
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 13:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B388F60BD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UwuHQRElqJ_A for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 13:05:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E48260BC2
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E48260BC2
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 13:05:25 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id p18so2354952ljc.9
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 06:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=ql6XoyRZdCbnojj46hl/eGiGcYZNk1e4tST5M6WDYRE=;
 b=X87TD9/yBqu1Qneoeuts7fGeOgOUGYVgZ/iWh8VIwdGpKc9y83svIlm1js7qSh6dH9
 UHoKmTVbamZFbHGj474wvlxT4GTGSo90YXdgLfGeTh9SkMIOni5WvocVWoeWvqGuTlyN
 FrEnCq4KyyWpib8rSVh14nUL5w1Mw5iEvRIeLOwjzx38ollighi1v30KDOyqoLkFRS3n
 f6+sWpUpvh1hkGFXiiWZZABMuKqGUJTVFTT97dSSqjVDYoMNLs1ntyaehIpvh9wo0NJw
 aQcidTTGc75iPadsJ6x9OR+1hYNs3qcZE4HpyMDeQCAwgJ+6qlYKNVHEmam6IieHr+0d
 YRMA==
X-Gm-Message-State: ACgBeo3p720sO2xeQvFtXEw/Mf/Z8raIfcnxJVKrVIFJIe3l+vtd5bbC
 us+rWSg4m//xN5eecda2/Dm/IpkzxEMwzg==
X-Google-Smtp-Source: AA6agR4oukLzgvfHuRgFdpbVoduTjj4QDRCfFOFJno1psdlbfR5l7tv2fYfHhAV3sLH8enxeH8vzGw==
X-Received: by 2002:a2e:934f:0:b0:24f:ea1:6232 with SMTP id
 m15-20020a2e934f000000b0024f0ea16232mr4619763ljh.135.1661691922946; 
 Sun, 28 Aug 2022 06:05:22 -0700 (PDT)
Received: from trainer-arch.doty.ru ([2a02:2168:8c12:1d00:325a:3aff:fe53:1b3f])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a056512370500b00489f0c8bddesm229656lfr.207.2022.08.28.06.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 06:05:22 -0700 (PDT)
From: Dmitry Ilyin <dima@doty.ru>
To: buildroot@buildroot.org
Date: Sun, 28 Aug 2022 16:05:19 +0300
Message-Id: <20220828130520.26945-1-dima@doty.ru>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=doty-ru.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=ql6XoyRZdCbnojj46hl/eGiGcYZNk1e4tST5M6WDYRE=;
 b=E4n3jlQsu+1C51LE7/xCvxZiypbx4oR3JAfHEuLGd/Jlvs84mIpxFYyeoQtKYA1Zb9
 2f32giKfccdiepPH95F+gmGNdPXXdtQq9FTvbnOv7epogpI0kfc1hHwtXbnpm/5S8moJ
 UQyOVJS1I+rTB3ELjqXUaVTEgdwbaLvRHv05S4QgbCRFsYHAXkH3hhLKQzJz/WUTuclt
 rdj0p+k//9VIakVQqgzcrypGLH8E9EVhtbVe2oxB7YFpt0s8cb71MVfsKE5YgvdUisBn
 RKO1noqRpve+MsMhPHgfNFfQAQUTbHcRnAHLkgLm0gk9Ym2RJiU8FuVz0S13x+NMIrMm
 ThMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=doty-ru.20210112.gappssmtp.com
 header.i=@doty-ru.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=E4n3jlQs
Subject: [Buildroot] [PATCH] package/mbedtls: add configurable SRTP support
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
Cc: Dmitry Ilyin <dima@doty.ru>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This adds new BR2_PACKAGE_MBEDTLS_SRTP_SUPPORT option to have MbedTLS
builds that support SRTP (required option for AWS WebRTC library)
---
 package/mbedtls/Config.in  | 6 ++++++
 package/mbedtls/mbedtls.mk | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/mbedtls/Config.in b/package/mbedtls/Config.in
index a39ba65d98..f06a27fc5c 100644
--- a/package/mbedtls/Config.in
+++ b/package/mbedtls/Config.in
@@ -29,4 +29,10 @@ config BR2_PACKAGE_MBEDTLS_COMPRESSION
 	  sure CRIME and similar attacks are not applicable to your
 	  particular situation.
 
+config BR2_PACKAGE_MBEDTLS_SRTP
+	bool "enable SRTP support"
+	help
+	  Enable support for negotiation of DTLS-SRTP (RFC 5764)
+	  through the use_srtp extension.
+
 endif
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index af87d62b30..9f9aee1fec 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -72,4 +72,12 @@ else ifeq ($(BR2_microblaze)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
 MBEDTLS_POST_CONFIGURE_HOOKS += MBEDTLS_DISABLE_ASM
 endif
 
+ifeq ($(BR2_PACKAGE_MBEDTLS_SRTP_SUPPORT),y)
+define MBEDTLS_ENABLE_SRTP
+	$(SED) "s://#define MBEDTLS_SSL_DTLS_SRTP:#define MBEDTLS_SSL_DTLS_SRTP:" \
+		$(@D)/include/mbedtls/config.h
+endef
+MBEDTLS_POST_PATCH_HOOKS += MBEDTLS_ENABLE_SRTP
+endif
+
 $(eval $(cmake-package))
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
