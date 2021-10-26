Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE737C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:45:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E3CA60C4A
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E3CA60C4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E5E080EDF;
	Tue, 26 Oct 2021 19:45:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AMNxT7RipL7c; Tue, 26 Oct 2021 19:45:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D335080EC5;
	Tue, 26 Oct 2021 19:45:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F25361BF3CD
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E13A1607AE
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:45:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PLzD_DSAC5b9 for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:45:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71BAD606AF
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:45:32 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 z81-20020a1c7e54000000b0032cc97975e4so336400wmc.4
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e8Ouvmu3ta4OA9WflnzqqW1YGB6mz0QhpLzPaifDlAs=;
 b=MxaiAS64Bk2vTkAtpadcgXBU3Yvef2/xaZ6etr12BG4ebttl5LWMB4a3ej4oMDWjxm
 HVfsAChgdYRuaX70sHZs9r6PALko+S3SXB7RjTQLvkbuaAa4NNGMdby+0NHpPGICMkvS
 keK/Jza5A7Wl6m24xawF7am++BhRltvK4kUs4TeCjQ5DFcFQa7OKoot8+LyUauliuRph
 j60OMdcL/duxIVZmqgDmmqcC2BZXebMNL68nPp+lmQuB5kBlnpZmQ5klANNuQhXsVPCL
 hI34BRQpDLu5b5DMszuiDoywGTW97ZS2DP2cEM2oor1KmRQGwcEa8Ss1u5BEUaG1KpQt
 n4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e8Ouvmu3ta4OA9WflnzqqW1YGB6mz0QhpLzPaifDlAs=;
 b=c1LKapnLasxKgwrqpzMj7+Q+3bTormndjzDKqzQ+BNbkJj6Df6fdYUQUv/vt/S+dfV
 0QkfulznfEnFppuCtZXHuSReyicszQA16nemhtQxsG1kq8ccKvt2CsJr2jCeHVmtMRag
 SuGLSKckiXNl2zIx+ddYJUm3xe4Myb5W7XDYdeUm74duBJ6FQtw13xDX2yM3voN3DpIJ
 9oTEIC/5zljWEWuFyDKKG7vfTvAkhJfE1EILjqAeYWX/N/xv+32pVzIcl7jXsUEnpNd0
 rX3jwNgqP7E7rxGadd/SZzr6fOhopSReqwgBf0LIo6iCGN8rM6g0GQpfGjIbTPu1xoS3
 9/FA==
X-Gm-Message-State: AOAM532Aq2nse+bIpBqVdajZvAvtC1rvRMS6ZS1PpiU/OEzlGmcG97Pa
 KB5rh1M/mCSzXH9/B4OQtOHQi6D0yk8=
X-Google-Smtp-Source: ABdhPJzif2ufczr4gl+aalPl0wwRS5D1iCn1slVqRkEJmu44U9a1GexlhXnyE1D3y0+l26YOmXutlw==
X-Received: by 2002:a7b:cc87:: with SMTP id p7mr837553wma.8.1635277530504;
 Tue, 26 Oct 2021 12:45:30 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id p18sm1583339wmq.4.2021.10.26.12.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 12:45:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 21:43:29 +0200
Message-Id: <20211026194329.4054644-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cryptodev-linux: bump to version
 1.12
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

Update indentation in hash file (two spaces)

https://github.com/cryptodev-linux/cryptodev-linux/compare/fabe5989a3dc9fba0cd0a40b612247cdde351c01...cryptodev-linux-1.12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cryptodev-linux/cryptodev-linux.hash | 4 ++--
 package/cryptodev-linux/cryptodev-linux.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/cryptodev-linux/cryptodev-linux.hash b/package/cryptodev-linux/cryptodev-linux.hash
index 1cbc2e8597..d649e8934a 100644
--- a/package/cryptodev-linux/cryptodev-linux.hash
+++ b/package/cryptodev-linux/cryptodev-linux.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 0e2d30cf440a55e1125c815f0df229350192cfddbb38e6571e97de19069c97c6 cryptodev-linux-fabe5989a3dc9fba0cd0a40b612247cdde351c01.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
+sha256  f51c2254749233b1b1d7ec9445158bd709f124f88e1c650fe2faac83c3a81938  cryptodev-linux-1.12.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index 2a65755aa2..f9026053c8 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CRYPTODEV_LINUX_VERSION = fabe5989a3dc9fba0cd0a40b612247cdde351c01
-CRYPTODEV_LINUX_SITE = $(call github,cryptodev-linux,cryptodev-linux,$(CRYPTODEV_LINUX_VERSION))
+CRYPTODEV_LINUX_VERSION = 1.12
+CRYPTODEV_LINUX_SITE = $(call github,cryptodev-linux,cryptodev-linux,cryptodev-linux-$(CRYPTODEV_LINUX_VERSION))
 CRYPTODEV_LINUX_INSTALL_STAGING = YES
 CRYPTODEV_LINUX_LICENSE = GPL-2.0+
 CRYPTODEV_LINUX_LICENSE_FILES = COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
