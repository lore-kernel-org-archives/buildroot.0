Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17520CD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 13:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E37D160A9E;
	Sun, 31 May 2026 13:48:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J5cteaKo23pF; Sun, 31 May 2026 13:48:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DE5C60865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780235287;
	bh=0JdPVZxXsfX1ddI0Yb8yUInraq5kjE+sJSo1DiX9iho=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kUJ2bSh05s4mE9WHc6DhkkLdO7qCLkWhCYsFt5lW+uL+ltpoKPWAA7EFWfliDEpwu
	 5CcGfDxFnQh4B7d1xJucPsr6GVPUiL/BRifN91UErKzwsyFCMPeuYrlPKyVbm2Cccr
	 NTyEBdpDFCtnjrg0rfV7cZeerk4ZuQjMKe5nLBr6FhRL/Qj6knwv+m1e8SsF40Z34R
	 ULbjDG2p60baqdR9Ylg50tEV5uxF7hbbc96xUnYWlBnIUKW4oBt+84yo4rd4mgA2fG
	 352I9CbpsbD4jQR2lp2EgHVviC6vDNmm8nwDjI5f0WrJ+PnD8N0FR6AM8ZjVkN+g+p
	 WhMELm07W1yTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DE5C60865;
	Sun, 31 May 2026 13:48:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C781257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 13:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DAD481140
 for <buildroot@buildroot.org>; Sun, 31 May 2026 13:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fRc1d1Pc-DKm for <buildroot@buildroot.org>;
 Sun, 31 May 2026 13:48:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1C4FF81119
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C4FF81119
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C4FF81119
 for <buildroot@buildroot.org>; Sun, 31 May 2026 13:48:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3298CA4C2E86
 for <buildroot@buildroot.org>; Sun, 31 May 2026 15:48:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45948)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTgWI-000000000I4-09rF
 for buildroot@buildroot.org; Sun, 31 May 2026 13:48:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 15:48:01 +0200
Message-ID: <20260531134801.2890152-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780235282;
 bh=tQAqY39Azj9GCNMONammyTqDrj07qngS9j3cP0qSNvU=;
 h=From:To:Subject:Date:From;
 b=CqGH38zXnmNtfH6ig0snQHF1KOUi/0MbbKP88j3JY2fc4LP+OZpBg9i0wu8lNEIW6
 NdMRGPAyrX/fqXMcL2RaV9fVwSxTVsxvoBKS+wAFnaN1JSz/WpMpPqVGgq2dmSfsY5
 1h9ZxFx18xTVbf21xsp1RU/VUzXefZWF2NgGqWXgGuJQBTVLe2tbDf3rOUyk9Qwql+
 GAQ69tLC+tj9dFY4XhUMMBGYOcrfmWuF6YrNk8zHh1cUfwlq7oQedArV03zpKkvOwC
 ea1yhLVxa09PBS3/AqhWFh+pDG55bDjj+kklnWDyxgHlyqkPXzRHzPjUFOuV93jObI
 tvZ3zCUSY1y4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=CqGH38zX
Subject: [Buildroot] [PATCH 1/1] package/libheif: security bump version to
 1.23.0
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

https://github.com/strukturag/libheif/releases/tag/v1.23.0
https://github.com/strukturag/libheif/security/advisories/GHSA-jvmp-j3cw-84mh

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/34066d789a5d7ba7a5d49233aa05b98cbac62535

with the exception of an unrelated build error of the libvips package
with the bootlin-arcle-hs38-uclibc defconfig.

 package/libheif/libheif.hash | 4 ++--
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 22697f307c..780059facf 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libheif/releases/tag/v1.22.2
-sha256  eea48e4841f83fbe51d029337ffd2d14512d0203015dad40b90213d872958af3  libheif-1.22.2.tar.gz
+# From https://github.com/strukturag/libheif/releases/tag/v1.23.0
+sha256  4c9182b18897617182eed12ab5eb9f9d855b3aa3a736d6bdb31abc034ec7d393  libheif-1.23.0.tar.gz
 # Locally computed:
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 4b23f1fda3..be97b18bd0 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.22.2
+LIBHEIF_VERSION = 1.23.0
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
