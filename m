Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60791C433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 21:14:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9CDB61159
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 21:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9CDB61159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A90B1400BE;
	Fri,  5 Nov 2021 21:14:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qFF6Ky_aefwm; Fri,  5 Nov 2021 21:14:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBCEA401E1;
	Fri,  5 Nov 2021 21:14:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 119BD1BF5B5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 21:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3C6C8264C
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 21:14:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1oGSEtokZsNI for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 21:14:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D85B82640
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 21:14:27 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id 71so8145728wma.4
 for <buildroot@buildroot.org>; Fri, 05 Nov 2021 14:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eV/ZVDVrR49XcjrfLwf8Ha0WN92XOmEgz89qv9tWARE=;
 b=CCyrWa0ViPsUOdTMMGbrFjpw5+KoU+RQZDgWTaAtud1tdqkGp1Gq3TJd2JXqc7DAXq
 tbpj6iEZx0CUgq6uvHJJebJ133HWF6zsiEzfwcoYdDfllpti3DTioF74KghmHqW/5AtU
 V0DNkYp1O6dKgGv9Y1CThq0EbbldrW/fQIsd/YfQnI1elQ/YSoMZky8pvUk4f3kGufbu
 lO+1BqezdGTSD/J4wB8mna/Ieoi0+c+JKdXYOUcHvn909rG+/QHxuUDzWp6W9iFxHRB+
 Lw7jVzX8hrcjndQ6BDhoh1n1OReMSeMgS9ZGAv84BpeEIsjRzB6iZVivsIsdUd4kgULY
 biJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eV/ZVDVrR49XcjrfLwf8Ha0WN92XOmEgz89qv9tWARE=;
 b=0hOtQqDPYsjmQcLVaP+RgkFhIQV3lh2Glt6/CPEJOCRq7+9337SkKpX0gmYzww1crb
 WEguHQsDMoWzjK7Jw2nBbhhSOLlvGtflMk+JcmDg2odwIWzetGGNweZWx5z8Ux2PEYCc
 21KXKH/s6ehACaSy6H31NYFfMUF7h4Qe6/P1tuxz20OvJi8ukZ7FDKk0yTn3Hdw9+a66
 DAAQ76Sd3KME7FjscXrNSuqLUSk0aFjbT6MsqnJooih2JK1rSkHBT1fxzVgYw0Yuwncc
 NZ3awgq0Te4vnyw/4RZTV/0dQGD/VMasZDrFuCzr4/XmmCuTfmBIgNXBH5Q/k3BJFypS
 DIoQ==
X-Gm-Message-State: AOAM532R49hzI2JrKbnqtbRFgeqi5E4RaP7Wal0k5cjjJtKt79cYLMG7
 n73PN0IN9J9g65p0KVwZI/HD7cZoE7I=
X-Google-Smtp-Source: ABdhPJwP8rLh6ZaAnTpUDLiEICcSvhPrC+/utS8OiLi8rJbSkuMmPM4Lfbi0gbxk+YGX0lPUFyygSQ==
X-Received: by 2002:a7b:c04b:: with SMTP id u11mr33264945wmc.127.1636146866376; 
 Fri, 05 Nov 2021 14:14:26 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id q4sm9002252wrs.56.2021.11.05.14.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 14:14:25 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Nov 2021 22:14:23 +0100
Message-Id: <20211105211423.941806-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/systemd: enable selinux xdg module
 for refpolicy
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
Cc: Romain Naour <romain.naour@gmail.com>, Antoine Tenart <atenart@kernel.org>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Without the selinux xgd module enabled by systemd package, refpolicy
fail to build due to policy/modules/system/systemd.te [1]

policy/modules/system/systemd.te:288:ERROR 'attribute xdg_config_type is not declared' at token ';' on line 508447:

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552468
https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552470

[1] https://github.com/SELinuxProject/refpolicy/blob/RELEASE_2_20210908/policy/modules/system/systemd.te#L288

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Antoine Tenart <atenart@kernel.org>
---
v2: enable xdg module from syslinux instead of refpolicy (Adam, Thomas)
    http://lists.busybox.net/pipermail/buildroot/2021-November/627371.html
---
 package/systemd/systemd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 8c187d2ec3..a8b11faa5e 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -20,7 +20,7 @@ SYSTEMD_DEPENDENCIES = \
 	util-linux-libs \
 	$(TARGET_NLS_DEPENDENCIES)
 
-SYSTEMD_SELINUX_MODULES = systemd udev
+SYSTEMD_SELINUX_MODULES = systemd udev xdg
 
 SYSTEMD_PROVIDES = udev
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
