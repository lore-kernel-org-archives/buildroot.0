Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA6EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 22:59:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DC536101D
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 22:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0DC536101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADDD080D6E;
	Thu, 14 Oct 2021 22:59:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BFIg9CYHF92E; Thu, 14 Oct 2021 22:59:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D94A8002D;
	Thu, 14 Oct 2021 22:59:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A64811BF37B
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95B9F40589
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:58:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JRJlcM1sGidu for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 22:58:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 681D540581
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 22:58:53 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so5882201pjb.4
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 15:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VtdhwQ2sSPIXcIoZLaDSstNN2CIgQbeCkU7s9/OCiDY=;
 b=jOLoRpHNVD3UvS5yOtvIk/dR2LrKkfYNytD9g2HKzTAYAqeSZjSkgQ2d32syj4yECQ
 LVnhvkJ3ztWKn/MBzXoPedrbaSENQhlL3zf6iaTaKSxPgg15v+ErlkL/1gOysRvGoVu2
 OIlDGZSoMfp9/OBnGe6T+vS2dUGBKjiKuF8zRT9H098cAlKpRzAmjKfLxLfpqqgBzY6q
 uhYtcOFjuRK6P98oEt/XIf7sqCuM4yx5yPwOw48QzncRdNc/d1r+aSV809gsdSvUJA6p
 ZePgNRAdz4fY5u4zejeJQk7PzcBdszDue8h4eyZ9NODQkKqGsJriuRXWGoKluHu0vdHP
 4F3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VtdhwQ2sSPIXcIoZLaDSstNN2CIgQbeCkU7s9/OCiDY=;
 b=QNu2BGkKbXfuiGaKgUP5v2haS6Jb8JzUxxr4sqe1Vv8yxDaxMUMw2MCrYnXPR9Astl
 zvZJxYb5agyzyd71F7rvRpqtct7P8YjCKkDQgOz968AgsKu8kR/fXdcfr/iD6hlGamW+
 jH7TyVr7QAYn0bRd0gp9kIUIpN500ufQOYzUPdXG1Yrer7Kf3gqoHI1tya4FiWmEW9Fo
 fLUpGHyiZnqrlgSfC4IHWkCtgiPcE1R5e+OuG1GNyQDS25khNQIjIZGuCYnQyZxqQEKr
 EilaakYVWBDwxU72vzGkC7kY5MTgrtcbyoMuhLz0a3AQ2y2ePYBKlhTg1jmWUxgkW0La
 MIHA==
X-Gm-Message-State: AOAM531vwPGBIkYL93Reg/CZBwQKH5B1CmqIACj/vBpFtthytmv4jOk0
 SRtZwKma0pIIfE17DA7dgvnDvlBMaMo=
X-Google-Smtp-Source: ABdhPJwTlw29T8P35kccE35BSvtZ0OO/LlrbwDv5Ts+tm8f7WVLJZ4bjbjgD+hmThX4DRroU3qqLJA==
X-Received: by 2002:a17:902:ea0d:b0:13f:2b62:adeb with SMTP id
 s13-20020a170902ea0d00b0013f2b62adebmr7642860plg.1.1634252332730; 
 Thu, 14 Oct 2021 15:58:52 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id w19sm10171319pjy.9.2021.10.14.15.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 15:58:52 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 15:58:39 -0700
Message-Id: <20211014225849.832479-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211014225849.832479-1-aduskett@gmail.com>
References: <20211014225849.832479-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 01/11] package/util-linux: bump to version
 2.37.2
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/util-linux/util-linux.hash | 4 ++--
 package/util-linux/util-linux.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 3f9fe39818..eafbe9254a 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,5 +1,5 @@
-# From https://www.kernel.org/pub/linux/utils/util-linux/v2.36/sha256sums.asc
-sha256  f7516ba9d8689343594356f0e5e1a5f0da34adfbc89023437735872bb5024c5f  util-linux-2.36.2.tar.xz
+# From https://www.kernel.org/pub/linux/utils/util-linux/v2.37/sha256sums.asc
+sha256  6a0764c1aae7fb607ef8a6dd2c0f6c47d5e5fd27aa08820abaad9ec14e28e9d9  util-linux-2.37.2.tar.xz
 # License files, locally calculated
 sha256  869660b5269f4f40a8a679da7f403ea3a6e71d46087aab5e14871b09bcb55955  README.licensing
 sha256  9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 4bc7a11294..cf0fee409b 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -7,7 +7,7 @@
 # When making changes to this file, please check if
 # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
 
-UTIL_LINUX_VERSION_MAJOR = 2.36
+UTIL_LINUX_VERSION_MAJOR = 2.37
 UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
