Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BD5C3A5A7
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 22:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A515481E90;
	Tue,  6 Dec 2022 22:12:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A515481E90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4aNKy-6kipB9; Tue,  6 Dec 2022 22:12:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC8E081E7B;
	Tue,  6 Dec 2022 22:12:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC8E081E7B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 68D691BF39E
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 22:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 422BA408D0
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 22:12:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 422BA408D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tAS-PF8rvErY for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 22:12:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03871403F5
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03871403F5
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 22:12:26 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 r65-20020a1c4444000000b003d1e906ca23so1383102wma.3
 for <buildroot@buildroot.org>; Tue, 06 Dec 2022 14:12:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u8Y0ZOHbuiQRPERy33omo6jLA4x2AEwBvAMYrWNwd6o=;
 b=tqXXYLZiQMvUNmVY60LANAa3gv0QfFXIYu/9KqrwlX6hK7kZQvkJTr9u6Q1rgW8///
 WdxrGpPPX5mezpsSlrNnMgwBERFXCmKw3DiVtxw14DaCxJ8ehFKHNLDE9iHuobL1AXvn
 RGv23xuQiHElYU7JbGd0o9eiNExIhhE5ZLocxiD40z9VIY3Gkg7V4MXNAEqQalnIFMDp
 xDniwVokwUtpCd8N7xoOrMPBDL1TE7q9renYFTUvCGyp4DzcfLt4Gxuv9LzF+Y//qzlV
 LrXEcjJcyq1Gl1qEw2C350DUT2B8TomMp9Pdik9fNatKihLRfUutYAjeDrflyQBKMZ8N
 rFow==
X-Gm-Message-State: ANoB5pm+an/MveeJkzxhhfZ3E7Gf62Cs0Z3zy0WjFqW5EiFQ/NP3Oj0s
 fryc8shI5kQz4GYb5Fqc8XNn+8YLvT0=
X-Google-Smtp-Source: AA0mqf7BpPaWQk1eqk5sxBKwMrtS2cbOuBoJWorycxlXTwySnx6Ljme5ayvMfNsqzUpKQv5cWbIyDA==
X-Received: by 2002:a7b:c048:0:b0:3a8:3e58:bb9b with SMTP id
 u8-20020a7bc048000000b003a83e58bb9bmr54154414wmc.168.1670364744721; 
 Tue, 06 Dec 2022 14:12:24 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 u14-20020a05600c19ce00b003cfd42821dasm24482722wmq.3.2022.12.06.14.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 14:12:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Dec 2022 23:12:20 +0100
Message-Id: <20221206221221.1355052-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u8Y0ZOHbuiQRPERy33omo6jLA4x2AEwBvAMYrWNwd6o=;
 b=Vh74jCvuTDhg2+14uKSGIjBHeqHpOHmidKyCVrONu9bF34gNVykx75woKXvzAv0S+G
 FqTzEWO/zFXpcxM75Z3rZmBcbxj0gysJR/+GHLds5uS7kREDMtAgBVTQiybcgJJcHkqT
 f6DdR5+Xbrs1vyJtFlCO948pLTZ0QF5BOZ4YwI5z8sp4C0lcoknxXe7i3clIB0qy/3NU
 ioORaE2sgCymJxbsMgl0//lszeZQGaIuVtBxETfA56JMngkap/wAdikr0pBpz0iCu0bp
 XYXiliSalLNtVWDdnG35qJKvmZHTnmm1KnLGB1qU0td41aytIviJPBXMwqCocnnG7g/h
 CUtw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Vh74jCvu
Subject: [Buildroot] [PATCH 1/1] package/botan: security bump to version
 2.19.3
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

Fix CVE-2022-43705: In Botan before 2.19.3, it is possible to forge OCSP
responses due to a certificate verification error. This issue was
introduced in Botan 1.11.34 (November 2016).

https://github.com/randombit/botan/security/advisories/GHSA-4v9w-qvcq-6q7w
https://github.com/randombit/botan/blob/2.19.3/news.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/botan/botan.hash | 2 +-
 package/botan/botan.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/botan/botan.hash b/package/botan/botan.hash
index d768c669ea..64da04415e 100644
--- a/package/botan/botan.hash
+++ b/package/botan/botan.hash
@@ -1,4 +1,4 @@
 # From https://botan.randombit.net/releases/sha256sums.txt
-sha256  3af5f17615c6b5cd8b832d269fb6cb4d54ec64f9eb09ddbf1add5093941b4d75  Botan-2.19.2.tar.xz
+sha256  dae047f399c5a47f087db5d3d9d9e8f11ae4985d14c928d71da1aff801802d55  Botan-2.19.3.tar.xz
 # Locally computed
 sha256  472faf6d2231130382779f96de506be19296473750356449fc426ddc9cb03b50  license.txt
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index b0ebe594b1..59fbc950b0 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOTAN_VERSION = 2.19.2
+BOTAN_VERSION = 2.19.3
 BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
