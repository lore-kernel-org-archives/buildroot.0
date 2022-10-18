Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B984C4332F
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 18:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A82AF416DC;
	Tue, 18 Oct 2022 18:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A82AF416DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aHODCl1KRYys; Tue, 18 Oct 2022 18:37:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA2EF40922;
	Tue, 18 Oct 2022 18:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA2EF40922
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3272A1BF5AA
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 18:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E9BC61112
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 18:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E9BC61112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dA0a8Lr3m3wV for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 18:37:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90E706110F
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90E706110F
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 18:37:41 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id sc25so34408903ejc.12
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 11:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l7kxrZN2JGjWaqdOnSXF2C8OiZBb+A/JCM5fIiocVIg=;
 b=p+Xe03XD42ksrW42Ri2P3ld2RWJnCvzzgW1uniHXbZnCEfSdP2/xOzL7+MWM37QGWu
 b9z0BqfPy45GKF133j7NWbu470Y8ZPAklM1bdHKUuQ6wALJT9MxN5MRGVFx+hA4lpY9A
 jPyzovxYSyjZ0xwC+fpcbnGk5bjmjqSOnyjNRcFEldd09ukhK/dyo80AGL3AaGhKfSoB
 cBqBhqswN00qy+SjhGBIxXFyl5zoT3SbORO/CKoP6pNF9xhu8G4mec0Dn1rHTTDfqEfh
 stONHNmrLPo42vlLnunX8BqBRJV226VIgfdXBc9Vbnnt3aFwqIS/pthm791bMwXVzwKp
 pAow==
X-Gm-Message-State: ACrzQf2ekuYt/kJs66+zlwMBDIk2M1C0fNtHdt9pK2oiE+wr6vUHEiVp
 XX9CsghoC7N2HP2Qnlr/yx53+Np9svw=
X-Google-Smtp-Source: AMsMyM6VekVKRoHutlzyldVj74Z+L4yXRKlcBPBuJiw3SyeOsJB8XLl00I515KsjOjjhJsTA7oAnDQ==
X-Received: by 2002:a17:907:7f25:b0:78d:e85e:fe12 with SMTP id
 qf37-20020a1709077f2500b0078de85efe12mr3522127ejc.553.1666118259217; 
 Tue, 18 Oct 2022 11:37:39 -0700 (PDT)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 ss5-20020a170907038500b0073c80d008d5sm7701839ejb.122.2022.10.18.11.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 11:37:38 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Oct 2022 20:37:24 +0200
Message-Id: <20221018183724.2377-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l7kxrZN2JGjWaqdOnSXF2C8OiZBb+A/JCM5fIiocVIg=;
 b=IG+wMX5Zrx54xUVXHnOQwVJeiVtZTEfqjQdSBPvbojcYNldoyb7Dempgk3tQgLYGkZ
 A1Ut+VDK2e130hnV+MUVU4O5dUqL5QijkAuJCyLb9FCsmucmKrkLPXuiJxPodK60wBLl
 P44OokAhpYYimSLpYBSBpQ2fFBD0AB0Jrd4eJWOBqewdMOpmr72kpLtwEuf7tQZSgtvT
 xkw9HkBsDWIigKkluD1/zUhS5+gy05B/KmeMvyToBrT8XAGq0gb7Xq1CbZFuVZjlAzN6
 HDHaYmJXcTHnm7gUVvhCyGENdNBoJcuKlFYPvLST45xeQHzBEsnGpdmtJ3JjDkDUZKMa
 t7+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IG+wMX5Z
Subject: [Buildroot] [PATCH v2] configs/kontron_smarc_sal28: use U-Boot
 2022.10
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
Cc: Michael Walle <michael@walle.cc>, Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add BR2_TARGET_UBOOT_NEEDS_GNUTLS=y and BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
since this are dependencies for building mkeficapsule u-boot tool.

Change the offset of the rootfs to left enough space for the U-Boot that
has increased.

Cc: Michael Walle <michael@walle.cc>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 board/kontron/smarc-sal28/genimage.cfg | 2 +-
 configs/kontron_smarc_sal28_defconfig  | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/board/kontron/smarc-sal28/genimage.cfg b/board/kontron/smarc-sal28/genimage.cfg
index c885cd51a6..82bab26fec 100644
--- a/board/kontron/smarc-sal28/genimage.cfg
+++ b/board/kontron/smarc-sal28/genimage.cfg
@@ -17,7 +17,7 @@ image sdcard-emmc.img {
 	}
 
 	partition rootfs {
-		offset = 2M
+		offset = 4M
 		image = rootfs.ext4
 		partition-uuid = %PARTUUID%
 	}
diff --git a/configs/kontron_smarc_sal28_defconfig b/configs/kontron_smarc_sal28_defconfig
index 877903a1fe..25846c8cbd 100644
--- a/configs/kontron_smarc_sal28_defconfig
+++ b/configs/kontron_smarc_sal28_defconfig
@@ -22,11 +22,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron_sl28"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.rom"
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
