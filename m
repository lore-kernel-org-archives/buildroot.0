Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47695CD5BAC
	for <buildroot@archiver.kernel.org>; Sat, 23 May 2026 09:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2C8140EC3;
	Sat, 23 May 2026 09:33:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jr24yAAfHZar; Sat, 23 May 2026 09:33:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B29940ED1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779528806;
	bh=TdChjTB+OjGoF1WdX6yncc99a3r91Qq9CfJRGyEd7Ho=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oVLC7Z+bmC8g6/reyR/AWF58oDd0NoLjKCVA3Ry+K77qR10nUHBd8Jr8ouSpQKRsU
	 /+4K++yzjDg3zIQH4gWgUWySS3x7tQ2KGAGbmTmxPhSZjRzIylsJgLC/v06uMVBtOH
	 BGtpr9+wfjNFQzmfH/zbfZO4xTCMU9uFCOjSPLP66vqId9ZexWol29XAydWgWSkPkO
	 CaGOw9Npv6MA8v/C6sSbTYlux2g3CFmsLmdWxPCHKBueheJU+2plsOwY71moc3/PKo
	 sjyA/qcN2pAHj6iRc9k+OsOfhdhq65X2WDs+PB9rVtESbIcogKFjYddnX58+3sk0bv
	 jZdO6TYal4v3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B29940ED1;
	Sat, 23 May 2026 09:33:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AEB6A263
 for <buildroot@buildroot.org>; Sat, 23 May 2026 09:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A01FB813B7
 for <buildroot@buildroot.org>; Sat, 23 May 2026 09:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mKXpBh9oEK8F for <buildroot@buildroot.org>;
 Sat, 23 May 2026 09:33:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9873A81396
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9873A81396
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9873A81396
 for <buildroot@buildroot.org>; Sat, 23 May 2026 09:33:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b5dd.dip0.t-ipconnect.de [84.161.181.221])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AB505A4C05B8
 for <buildroot@buildroot.org>; Sat, 23 May 2026 11:33:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41374)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wQijE-000000004vl-0FvU
 for buildroot@buildroot.org; Sat, 23 May 2026 09:33:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 23 May 2026 11:33:08 +0200
Message-ID: <20260523093308.186597-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260523093308.186597-1-bernd@kuhls.net>
References: <20260523093308.186597-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779528788;
 bh=IbFP0xyJU9HbxV8wywMnviJyV3Xrae2ALdZCOjtj3NQ=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=YAJrCQkDpU+zaLs+ZDcI6zniaybIT9PhtlqbLgyjqZqenXB9QzW++9VEU/m7qBmNC
 /mafXcpkjfTLn/AP1HYwJ62hm1njFLUqArFA2yMBe0gSTk8NdPoH1LoWlq1Rzn8+e3
 6wv0o//YR+MgaJ/kOjJGhtuNiwLE/2hIHjk98lf17yC5swm/KFDbqbBM0UzYvaomqT
 QP/LvY/U/Zp7xBnG9PBPThkF+bSLpSbpylMcQ/1wKxE/B31EGXvWOD37PQ1/rjZQ+k
 KsN65bHPZ5ORvsM8UG47KiTKq8ZjNc3Vjw38KhKv8v1nFfi575Lb+uv7K5xr8GkVg8
 x4CScH6R3J2Dg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=YAJrCQkD
Subject: [Buildroot] [PATCH/next 2/2] package/fontconfig: bump version to
 2.18.0
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

https://lists.freedesktop.org/archives/fontconfig/2026-May/007334.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/fontconfig/fontconfig.hash | 4 ++--
 package/fontconfig/fontconfig.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fontconfig/fontconfig.hash b/package/fontconfig/fontconfig.hash
index e6f2e0771c..ab102216bb 100644
--- a/package/fontconfig/fontconfig.hash
+++ b/package/fontconfig/fontconfig.hash
@@ -1,5 +1,5 @@
-# From https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/2.17.1/fontconfig-2.17.1.tar.xz.sha256sum
-sha256  9f5cae93f4fffc1fbc05ae99cdfc708cd60dfd6612ffc0512827025c026fa541  fontconfig-2.17.1.tar.xz
+# From https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/2.18.0/fontconfig-2.18.0.tar.xz.sha256sum
+sha256  e7064a4725431ddba06ff8b971ec5a4b422e23b0169ce215747beedcb30e9073  fontconfig-2.18.0.tar.xz
 
 # Locally calculated
 sha256  51a51aa9823704fd90bccc616cdd17ebabb5b2b3e9cbde886ca02c7002288067  COPYING
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 639f6ed51d..12673babf9 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FONTCONFIG_VERSION = 2.17.1
+FONTCONFIG_VERSION = 2.18.0
 FONTCONFIG_SITE = https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/$(FONTCONFIG_VERSION)
 FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.xz
 FONTCONFIG_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
