Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B27CD4F35
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 14:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 306EF40E38;
	Tue, 12 May 2026 14:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OwrmXKuCSWpa; Tue, 12 May 2026 14:06:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 582FC40F21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778594806;
	bh=i7msTnHbM6KbF51ASMeX5cVE92TYYUN5LCSrygjHcHg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=la025QPcUQsvh/EROSKazdiLY7TRWML0x7VNVNSjZDLx6m2iOim4iYKvPvYRmt9iJ
	 A5QX+1cSIggUsdhX3nsyqGDzx9Ea7NxlutNxnOI2e9mAACmZFxz+FbbQ63BbP1+y/T
	 20WbpHjT5tG/MOn07/Ki+vf9N38Z6Eh/3ps5xo9MUPgs4oO/3Gkg3mMHxCEHBXT4ow
	 lAITZ684koVkwYlVQcZlNBw3Vz7DW54PoaY1a/oTyCHGVPcqeRpKc5QhZQxUq3zQmu
	 mZayHVXJg41W6mmzgInR85iyLE/z0VUk/PHKaYbkrcnSEI4AR+4mbUe5FWcoAv+ffX
	 ai2ckMpxrjyeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 582FC40F21;
	Tue, 12 May 2026 14:06:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 97CE6223
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89B6E60DA8
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pin5Q6GSAw1T for <buildroot@buildroot.org>;
 Tue, 12 May 2026 14:06:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 50EA560DA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50EA560DA6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50EA560DA6
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:06:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b10b.dip0.t-ipconnect.de [84.161.177.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 73271A4C0933
 for <buildroot@buildroot.org>; Tue, 12 May 2026 16:06:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40788)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMnkw-000000004wE-0fNC
 for buildroot@buildroot.org; Tue, 12 May 2026 14:06:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 16:06:42 +0200
Message-ID: <20260512140642.52234-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778594802;
 bh=BTar/O9cUjI22r0w0snZ8Rg2BAkOeFHqu3Ln/WuztJI=;
 h=From:To:Subject:Date:From;
 b=H+MZcom9Kfg1THKdR1X54MPz8P/E1CkLKLoRRb1lCWNThHTdqzZ39B+TTICDH5a62
 KI23DlPSlTeE+/8nRl9VcRsEQ1T64sgW7EmrrX5UAukbdUFVeLj+HVddhmtFb7zlXh
 f0bOIIVAZr4KeCqh7aky3+GYP2G/ky7NviNkZDza6G33fdM7Xi5mPh2Z08giY1+Kid
 arWl+mXCSfA+NHEK8gc2iO4sYAqjC13mj2N6VdlUm/UZ1xFoEtHG2iBNR9HECNpwC7
 68uKLSo12STfxWRQ/yS3RNfVr9HIE8uCDyKl0/EmJKRNZ5MxWvJH7Bwi4kr1Tc5rCW
 u9D76O7KztBcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=H+MZcom9
Subject: [Buildroot] [PATCH/next 1/1] package/taglib: bump version to 2.3
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

https://github.com/taglib/taglib/blob/v2.3/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/taglib/taglib.hash | 4 ++--
 package/taglib/taglib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/taglib/taglib.hash b/package/taglib/taglib.hash
index 0db3cfa8d6..b118f610ec 100644
--- a/package/taglib/taglib.hash
+++ b/package/taglib/taglib.hash
@@ -1,5 +1,5 @@
-# From https://github.com/taglib/taglib/releases/tag/v2.2.1
-sha256  7e76b5299dcef427c486bffe455098470c8da91cf3ccb9ea804893df57389b5e  taglib-2.2.1.tar.gz
+# From https://github.com/taglib/taglib/releases/tag/v2.3
+sha256  7349f6fd942418bc7009ebe743eb7c9d055f02921ec56fa436ec25007c47fd38  taglib-2.3.tar.gz
 # Locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256  53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f  COPYING.MPL
diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index cac9f924fc..924d3f339d 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAGLIB_VERSION = 2.2.1
+TAGLIB_VERSION = 2.3
 TAGLIB_SITE = https://taglib.org/releases
 TAGLIB_INSTALL_STAGING = YES
 TAGLIB_DEPENDENCIES = utfcpp
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
