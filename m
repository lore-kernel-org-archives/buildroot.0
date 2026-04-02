Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584B6D6AAEC
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 16:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF55740F90;
	Thu,  2 Apr 2026 16:55:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vfp5iIwfDAYP; Thu,  2 Apr 2026 16:55:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CBCD40FC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775148956;
	bh=EjcL1tP9eNN76x/DU0OrjYqgpcfwQl8/NQpd0ISdyCU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cO6jIELr3e4BP5fk6naaVgGzmFOgOpPPHEG3Y1PSp4bMdZJ2gXp5ebsijisFqNz6i
	 eYiJ+J0A6CW+hdwQWOU9GwNqlcTiI08NmcMObQpMhGRIoDu+uCEHijA8d8lN5iri2U
	 5/lVLsOQQFxUZyv1AE4OEyZ2fLUN4PIu7tXRr/jFq6IIKsGheC4lUXBeECLA7JghBs
	 QrJ0dugIripW5R6ZIDmDWXuNzkMHQyQHWaFgv/oh8540705j2DPxrjSAHLbDiKInWi
	 rKqzQjg4UM9+fqSqnneA5dIqVAfXH2hUwb0yVli3bnni4+FwhoUBvVJN6U910D+t9A
	 XId5iC6zDeejg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CBCD40FC2;
	Thu,  2 Apr 2026 16:55:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CF2E2A2
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 16:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EC6360712
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 16:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nk-f5ofCK4Yc for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 16:55:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.176;
 helo=smtpcmd15176.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 08B686070A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08B686070A
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08B686070A
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 16:55:53 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 8LKhwElSQwf0D8LKhwveH5; Thu, 02 Apr 2026 18:55:51 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu,  2 Apr 2026 18:55:50 +0200
Message-ID: <20260402165550.1470995-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOggtlAm8QepGMOEP7fV+zyDpjqABoW8DrdtQlqgLira+UiqcmIMS3QCeHst/Zbwje3SxtN57/F7ypdE8Xzo6JWQS4WduSv4eX8PTWMkm0ILmLXTrtdn
 Lq4nw94drCxEMf7aEuRQc0Cshew0fhmbXAYVpZKKM11Flb8wmEDV3jaxl4r3XDBzdG4zQGTq8QPqPfncirVdvhIEpUAQ52OuUoJ8vCCkVp5Skm8RnEhiiaa/
 wppMXzt4ETgPldqoOf9Uf5PqdCxHF2/NPJTvv+2sGOY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1775148951; bh=Nqre59gsUGznFOwTYzLsRQ7Ux11zJb/5N0mrPAfSmlI=;
 h=From:To:Subject:Date:MIME-Version;
 b=brnYRtShfAYYJhnHQi48de+EJqiH3iyIE5GLVYZdA7JjgRNOSlnSE/BnthaO2KOkk
 9ZNpqdzgbAYbXlLcdjgi1l+lRoLiQ/FpAQiE9mT/Zt7qcYn7BnN3ujyTzUVsOq/BJL
 hJQdwexCCaUnl1hAiy7w3ruAujlrj9WZ9MhaiH1qgHZj3vK/HIoJa/QgwNnh3EQord
 5oWWxT3nDBe4IopalaATNHZhjycRU12ira6y++vGBClUWiUzAG3BxxiYB2ZhihH1jl
 IjoRZAS7Cx9k2xEVKpfe5ccGg7+8fAwJI1Ipt0U0XWm3+c+fgMkLyk+OYM+Tluqjp5
 K3ecX94KRp77w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=brnYRtSh
Subject: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.8.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release note, see:
https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.5/docs/v2.8.5-ReleaseNotes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index 49126a4a2f..c8e76bab9e 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.8/sha256sums.asc
-sha256  443e46f8964c9acc780f455afbb8e23aa0e8ed7ec504cfc59e04f406fa1e8a83  cryptsetup-2.8.4.tar.xz
+sha256  46f7a5b5b228b28ce17f43bcb891b442dc0f1f56df2370646131131e4d702e92  cryptsetup-2.8.5.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  docs/licenses/COPYING.Apache-2.0
 sha256  28a9529c7d0bb4dc51f4bf5c116a3d16ef247a052f7591466768ddf563fd1cf5  docs/licenses/COPYING.CC-BY-SA-4.0
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 6be05e6457..80abf88a94 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 2.8
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).4
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).5
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
