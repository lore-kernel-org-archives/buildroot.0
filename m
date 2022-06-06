Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A8BC43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 21:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F7FC6105D;
	Mon,  6 Jun 2022 21:30:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AdDYkPwSWPnS; Mon,  6 Jun 2022 21:30:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6201561052;
	Mon,  6 Jun 2022 21:30:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E55A1BF279
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 21:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B6A383E3F
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 21:30:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u1qx72htDmFL for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 21:30:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22C0783E0A
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 21:30:24 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id x17so21501818wrg.6
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 14:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q6DpYbpD4fT/5GlEWzo2+uCqP36aGYVKD3kyNuKCyCU=;
 b=UQ+enJauyJF1fnU7WBPZMRPULL2asSrZYmn+fJudl+xQ0qJmWssjlK7asFinQO3rOk
 AUoahvkOaO37VbWc7hrgfuGVSNhxtjXeUdJ/Q6xb04GyZ45zDr3suiWVtPohenZpO8nK
 5Tp5x2SVHkmA+JOUUDjMM/YuDI09Sl772qR2YxAhQ0M3FDl1MCHj2o7UAAMcpXzmxo7Q
 dhYhMAib2V1u/IaX/G495rKyz2pvJFiYAJUSkyZGQdZL8qnS2KL+QHzIWRBt456wSW3H
 vO5R3xMCPjRIoIolNhKMS5wY0iZUnqvO1SoZhxkq0gS7f4ks8meLnijLc/Em9P3XizdM
 F0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q6DpYbpD4fT/5GlEWzo2+uCqP36aGYVKD3kyNuKCyCU=;
 b=LUdkYe6rv/NOh3mjW+eDg7k5nKc4YfV6SxLKZ3Rm2odR8bnq3K7/5OPIbKKyhnFxsw
 RRC3P7fBy8E5dogwcBPadfTw0d9k0nrqLEy3Bldgr28sjJpEgopkNBw4SDQxhsL10kn0
 dDIMkFQL4X+qQ9+hfWDQW0FEnBlCcW4r89lUkYtE6/XM4jC4Soogy2rjwRXDqEjWnKnV
 N4V2p0FGYh9+Y2uDrtc8CWo8Z4mm9bRlRKBaEiHWin3jY2/AvbnJVMDpTmTmMSOO8a0k
 3wwGCjTh9VkZQGDMmXHkqth/JdJui8L+VllmkeINkYmyoY30cr7woWNw9vQz5M6EwYBC
 9oyg==
X-Gm-Message-State: AOAM530QAdeXsC/N/sIszzrWZ1NEhRjnwmb5nsrneKFgtMws4ziPvDJ1
 xCZQJzlNX5ADGJv0vj49qTSsgBNZFFg=
X-Google-Smtp-Source: ABdhPJzyWe6zCl9X7YUY6B5pQIqM3hooHHV0RoOc+pJtKfp5BZROlypGldpTbFr8L6GaPJTSdGMwhg==
X-Received: by 2002:adf:fe8c:0:b0:215:a70d:53ff with SMTP id
 l12-20020adffe8c000000b00215a70d53ffmr16028910wrr.138.1654551022118; 
 Mon, 06 Jun 2022 14:30:22 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a5d688b000000b0020e63ab5d78sm16145759wru.26.2022.06.06.14.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 14:30:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Jun 2022 23:27:42 +0200
Message-Id: <20220606212742.13576-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libaio: bump to version 0.3.113
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libaio/libaio.hash | 2 +-
 package/libaio/libaio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libaio/libaio.hash b/package/libaio/libaio.hash
index ac815a73b5..4ddc97334f 100644
--- a/package/libaio/libaio.hash
+++ b/package/libaio/libaio.hash
@@ -1,5 +1,5 @@
 # From https://releases.pagure.org/libaio/CHECKSUMS
-sha256  ab0462f2c9d546683e5147b1ce9c195fe95d07fac5bf362f6c01637955c3b492 libaio-0.3.112.tar.gz
+sha512  65c30a102433bf8386581b03fc706d84bd341be249fbdee11a032b237a7b239e8c27413504fef15e2797b1acd67f752526637005889590ecb380e2e120ab0b71  libaio-0.3.113.tar.gz
 
 # Hash for license file:
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index 34f08b75e7..e13e49346b 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBAIO_VERSION = 0.3.112
+LIBAIO_VERSION = 0.3.113
 LIBAIO_SITE = https://releases.pagure.org/libaio
 LIBAIO_INSTALL_STAGING = YES
 LIBAIO_LICENSE = LGPL-2.1+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
