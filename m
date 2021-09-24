Return-Path: <SRS0=OK8R=OO=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E128C433F5
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 15:18:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F344C610C7
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 15:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F344C610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3454401DE;
	Fri, 24 Sep 2021 15:18:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jGU7h8z7WgPh; Fri, 24 Sep 2021 15:18:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22D52401D1;
	Fri, 24 Sep 2021 15:18:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F26201BF57F
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 15:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE99A60606
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 15:18:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id to7nL8X_-LcW for <buildroot@lists.busybox.net>;
 Fri, 24 Sep 2021 15:18:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0373860760
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 15:18:44 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u18so28607002wrg.5
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 08:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Aj3s3YOiKrvP4GqofFkeFn1vCa5cXURhISalxRH1L4U=;
 b=gmQrmZmUhHqje0PZ3uQ1TpVVOIT1DKTqCedjhKTJnHgOnwrrveFR7dM9ch218JezSH
 JINgV8hJ2I0XMcNDRDpmm+0u0BbTmpgSFUfeRWmKcP/Laau9dAs7HmkExMRA1j1XLV0A
 rVDt2wEDuDjc00i5EsIrjYVR39coIbFHk5VriXdKg6Juhok682w9MoRfWC54z3qGhfWO
 /xyJf/G38o0yIcDGRtH+U5M4/cYtaWBNJOND7EfNXNCG1As6CZHWKkUFAAvExPVLD3+m
 VjPz5H/Wu7VeXalrBZdQSbKm0JiGYbvyWRbDtJJcUxbTqryrLP9ZH9AWakmVIEVPEtot
 gIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Aj3s3YOiKrvP4GqofFkeFn1vCa5cXURhISalxRH1L4U=;
 b=wMmbWQ6IkMVfa6q9rhVOQqOqc95Fcq2TwBjc9g1xalrqAseR7fTTCRuGKwMWeoqyzC
 lgm88I6r7NXOXXCzA10DV/2xwzLbsw9tX/oZfOm426Ai3YrR0JpT9FtgORW/jzJDLeVM
 si8lBRa7HAnIXMb0wlYJ0dnTCVuzdlxTxU+FNrKa/cLUHP55WiJhyiw5IiyC7EgtAogK
 322gT/T6Vv4BULzzdOsi+i2RsHnBB3LX3AW/+tr7gbWWaweJxTEc4bly2OOp6iWCLwUF
 lRndfbInJkPITklxP8iXzY7h+tfIzJh3SiM/cQXiv4c/V7wv+m5q7XNrH1YE87nIMiUn
 8p1w==
X-Gm-Message-State: AOAM5339++aDnQDlGMAjg4tv5auU50aLHUQR2KyRplOHa/Xv5mroYRNn
 8v8Xmflgdhn0Mr87XK0h9GA7JT60NM4=
X-Google-Smtp-Source: ABdhPJyOrgBxvtdpDCv3cwK9BhxOHX0xp1vcXAJwudx9TOL24vmGZiomm6swu8yWqfQWopEgB77Qsg==
X-Received: by 2002:adf:f2c4:: with SMTP id d4mr12277469wrp.434.1632496722809; 
 Fri, 24 Sep 2021 08:18:42 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id o13sm10169073wri.53.2021.09.24.08.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 08:18:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Sep 2021 17:18:21 +0200
Message-Id: <20210924151821.1745669-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wavemon: needs libnl tools
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
Cc: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

libnl tools is needed since bump to version 0.9.4 in commit
5cae1a0d675eca41125b6430157d3d0d78d1220c and
https://github.com/uoaerg/wavemon/commit/2a22c3dac0675c1d8985263c1a5b62d0a0f9a5e6
to avoid the following build failure:

checking for LIBNL3_CLI... no
configure: error: need libnl-cli-3.0 >= 3.2

Fixes:
 - http://autobuild.buildroot.org/results/3e5886e2c96c92e9626b2f6b2cd2b8f43c06da2e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wavemon/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/wavemon/Config.in b/package/wavemon/Config.in
index 0cb4cb5c69..0e087bd0c8 100644
--- a/package/wavemon/Config.in
+++ b/package/wavemon/Config.in
@@ -1,8 +1,10 @@
 config BR2_PACKAGE_WAVEMON
 	bool "wavemon"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS # libnl tools
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_LIBNL_TOOLS
 	help
 	  wavemon is a wireless device monitoring application that
 	  allows you to watch signal and noise levels, packet
@@ -15,5 +17,5 @@ config BR2_PACKAGE_WAVEMON
 
 	  https://github.com/uoaerg/wavemon
 
-comment "wavemon needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "wavemon needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
