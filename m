Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9833C433EF
	for <buildroot@archiver.kernel.org>; Sat, 26 Feb 2022 18:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F8DA4091C;
	Sat, 26 Feb 2022 18:51:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D9JEVufQuYHS; Sat, 26 Feb 2022 18:51:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AEAC408D1;
	Sat, 26 Feb 2022 18:51:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FCD41BF281
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 18:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FFA340125
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 18:51:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nxOR8O3cqJX7 for <buildroot@lists.busybox.net>;
 Sat, 26 Feb 2022 18:50:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C84E400CB
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 18:50:59 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 v2-20020a7bcb42000000b0037b9d960079so3561802wmj.0
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 10:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4yyqXsL1j25WN01dQU/FyUI10khVoBUiraICagg2L6s=;
 b=n2973GzeRfaPcYOgX9l7EfkkIy+Q8xlODOlDfJJnhvqDq/zEv8VRmddZACousdm2Vn
 jfDArutMmN2ZuKKMX9dlPv0VyasbSSur3tbKzA+xQ3851DUeWstC+ntNK7TWPmBS9s1F
 ifNwDQDsCqClo+aibRW1WuaErfpdqufUC5jIRcyaUUUTmM95yFdCR6iF6lGPrr345qLU
 2hyULzapOTEONtKlw4uh/4GqwTzaTb3eQE8pH5zZklYwqPBQumIBIWv225293d+zKIgH
 kjWbDfse1puqSoi1InJTHkKmYNWib3G1fNwu+WqthUTya5TsXBEDJO/A3t6kDWCCugJP
 MPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4yyqXsL1j25WN01dQU/FyUI10khVoBUiraICagg2L6s=;
 b=rjFrSMsdZS+mitHfHOZMUDAV81Xnd/g1N5+tcSFrKWuDNPKcM3Iy4+BPb3qUt+Q5fy
 rce7TBge08NKPAQh/LfG38opqaw+S/OwznxrrGy80od5UAL6AIH0p07LJbaTHD+ECrqs
 587KzIlVjaHVMNGGQQ0kNZSxGvLlPeRtGtoV96zJl8Q9ZBwtOT88NPsVJGf7OgnQu0Bj
 Lf6Wwl7mYnxzt7GwshCL6Pi4n7K1f5LPkp0/otTQODI+fpAHoEUhOQvuNvIMq+vKOJqM
 0u5lt/OJBp0ZaR3PTN3gIHvJFTZ1YmJBW9KbMrhRK1cnD/rJaoDjaBCsPKWwtq1tEzXZ
 QBjw==
X-Gm-Message-State: AOAM532MF34Hyu8OBUtMNO+5ndNu4YxPvRUBz0zitjU6k4DklDBri/sE
 UWopeqC5G9TUR+q7AWrVDqSNRT2JhKI=
X-Google-Smtp-Source: ABdhPJxuEY3+wwrC/8z9r+8KX+6fDT5D8TFZW+ylEtLquPc3eBc6ZPf6azGy2annCcEi0uGRMc8PdA==
X-Received: by 2002:a05:600c:b4b:b0:381:4834:8c19 with SMTP id
 k11-20020a05600c0b4b00b0038148348c19mr2619290wmr.182.1645901456970; 
 Sat, 26 Feb 2022 10:50:56 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c4f5500b0037d342db78asm10255627wmq.35.2022.02.26.10.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 10:50:56 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Feb 2022 19:50:33 +0100
Message-Id: <20220226185033.3097401-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wolfssl: security bump to version
 5.2.0
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2021-44718, CVE-2022-23408, CVE-2022-25638 and CVE-2022-25640

https://www.wolfssl.com/docs/security-vulnerabilities
https://github.com/wolfSSL/wolfssl/blob/v5.2.0-stable/ChangeLog.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index 9896713ca7..63eebf93bb 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  50db45f348f47e00c93dd244c24108220120cb3cc9d01434789229c32937c444  wolfssl-4.8.1-stable.tar.gz
+sha256  409b4646c5f54f642de0e9f3544c3b83de7238134f5b1ff93fb44527bf119d05  wolfssl-5.2.0.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index d3dce0a401..bfb54445e4 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 4.8.1-stable
-WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION))
+WOLFSSL_VERSION = 5.2.0
+WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
 WOLFSSL_INSTALL_STAGING = YES
 
 WOLFSSL_LICENSE = GPL-2.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
