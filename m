Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5860CC05027
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 09:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E62F460F95;
	Mon, 20 Feb 2023 09:09:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E62F460F95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oCtNc0aZQSxX; Mon, 20 Feb 2023 09:09:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4121C60EE4;
	Mon, 20 Feb 2023 09:09:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4121C60EE4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 229881BF403
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 09:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0977A41517
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 09:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0977A41517
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hgTKecllBLDZ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 09:09:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2DA44097A
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2DA44097A
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 09:09:35 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 n11-20020a05600c3b8b00b003ddca7a2bcbso338703wms.3
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 01:09:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dyr3Ak6zbGIzjp4RerBetJuW72ob069i8s+c2Gpu4nw=;
 b=lTtS8MucANceMZJrIR+ZNjFOr2KAqaPsbjjsnLaHxcR9p4+J3K+1vJHse5X+OXIoZd
 JVxvUhR0cWcKSgS1egQ+FPmkbseGPBdkXx7SKa0gktgIrbKtZwFBDhfQHPsstulufsWf
 spOmB2Hfc7BYFzxPuNH+SZTBuaqf4YLmrvbV46LIMZvHGbHOp0BSXpozITR/DiRIluG4
 HO5ONuB2HgtVL3zcVpG66UtEec2JYEkVDJEXtNt2rAKsXGBkPRDnvPrBFNO6jUhjF/3E
 Dps+plZWVBaJpgHSU6OTLeMgODwiJt0nbOvyy6VwX0D26M2AOnCEiW/Mhb4jQpHkjBKy
 7xiA==
X-Gm-Message-State: AO0yUKXdhbEuBxSpEjFpSPOXypM4xZLMaF4QmJ2B34aLjcM3i2aM1ZKc
 utiewmrCmuecemPfmj1DprJnav+60LeDT4gZ
X-Google-Smtp-Source: AK7set/qRmUAAtfB8xTwYrJDqCQO52O1PJtLYs8Ni9x38qHZSQ0W/JhfPx2YhlJtX7rkeNVWPS7KDA==
X-Received: by 2002:a05:600c:130f:b0:3dc:557f:6126 with SMTP id
 j15-20020a05600c130f00b003dc557f6126mr285039wmf.4.1676884173449; 
 Mon, 20 Feb 2023 01:09:33 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 p15-20020a1c544f000000b003dc4a47605fsm471897wmi.8.2023.02.20.01.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 01:09:33 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 10:09:21 +0100
Message-Id: <20230220090923.2155635-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=Dyr3Ak6zbGIzjp4RerBetJuW72ob069i8s+c2Gpu4nw=;
 b=Olv/idYRTiifFP4ED+a5zHuBxFZma5jBYkqz+QJiS6pVqoUjIemYCjRVpEykcv/+UX
 NcM0Rf1RSqr4ONBtOSPf6OCelifZevG9GQzzsrOjcuKvKF9O5FZwwhX+42DIRxSZhDel
 HwVn/zYGTr+j5pz9lXItS2SerRdl2yW+jggrpvbHWmbFLHtPxTjNK5GisdGi1XhAMM8u
 fgPdCVB1EK9HCGi1JQ5c270OwlE5+UcDQNsXYbPbnlut8DbcSCPTUBRSKn0aAZCsjsVM
 dmnbTnAY1pTEj7ay+OccMyOizBnrcz+lWeZnSsj5rn5JK6ciIpoGbVa08yEq1JC1dZ71
 TA8Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Olv/idYR
Subject: [Buildroot] [PATCH v1 1/3] Revert "xorg-server: not available with
 musl on ARM"
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@gmail.com>

This reverts commit 9daafbcb75a7ab593ce8a1f21c6149c8437bc0bc.

Fixed since https://gitlab.freedesktop.org/xorg/xserver/-/issues/840.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
---
 package/x11r7/xserver_xorg-server/Config.in | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 865917c4ec..b933bd0285 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -1,11 +1,6 @@
-comment "xorg-server needs a glibc or uClibc toolchain"
-	depends on BR2_arm && BR2_TOOLCHAIN_USES_MUSL
-
 config BR2_PACKAGE_XSERVER_XORG_SERVER
 	bool "xorg-server"
 	depends on BR2_USE_MMU # fork()
-	# xserver uses inb/outb on arm, which aren't available with musl
-	depends on !(BR2_arm && BR2_TOOLCHAIN_USES_MUSL)
 	# We need a SHA1 implementation. If either openssl or
 	# libgcrypt are already part of the build, we'll use one of
 	# them, otherwise, use the small libsha1 library.
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
