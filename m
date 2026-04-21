Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55346F94CA5
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 18:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3EBD40E7E;
	Tue, 21 Apr 2026 18:39:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8NM1-TjOHitd; Tue, 21 Apr 2026 18:39:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B8BB41073
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776796757;
	bh=3VymCwUD3DhTjW+4BXNP+3C0jSSDdHygDFMKKwjjBwM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OrW4XRLRsgsgQrG7P0wvkIL59cmQAP2FiR0tX+SiVehuMMWG94DnOw34w9EeFNL6a
	 vtzc+hq8gozFaZc8NGFk8xf2m0UhBh4wrVpGCQEW+okiVgL11w/fxQwbN37QqeVHba
	 O7efC43UGDxAq7c3qrUfSUYAajVCDGYgdmsAnsiVK1MZUGW8o+qTZq1cZ+oLsej3r/
	 SgVjYSq9/6PTwB/8GjjlW2qaxOko511TyAC8Bw7gbtklNUm7mVMLYj0MsWVzJqoLeY
	 KP8KcAgdEHHeyOnX8LqqDu8B3gK+7T7V0dM5sRxEIBLhLPlJ5Iq+tAW8xK11T77mGZ
	 Mn9Kd5sJZhArQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B8BB41073;
	Tue, 21 Apr 2026 18:39:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DD90C183
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 18:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF8776086B
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 18:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3SP_Yi9qDJTn for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 18:39:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C304260843
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C304260843
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C304260843
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 18:39:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0177.dip0.t-ipconnect.de [91.58.1.119])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4D00CA4C063C
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 20:38:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42168)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wFFzh-000000007x8-48bY
 for buildroot@buildroot.org; Tue, 21 Apr 2026 18:38:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 21 Apr 2026 20:38:45 +0200
Message-ID: <20260421183845.2456995-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260421183845.2456995-1-bernd@kuhls.net>
References: <20260421183845.2456995-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776796726;
 bh=Bs+LeTlcDRddDHGLePnxZ96pGVlRjO6xpJQOJzh+xJ8=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=srcTnDFxvkC+FIjNDRPBs/elAd3nYZhRdfm5DWYRGh7L3iJH7OTZ2JRNpRVNRImwP
 D6uHAShcwdRXMfmTfNPMrBOJqO+VNfxPoh+8fX7ILPGXbELT4RAJAeDwYsGgKw7aLH
 LLTzzb8+wNCQbOYnOyuOWrBiTnmGUmnfoMVZiZ+xW7bupK7ezus36zxFuPI+5h6iKB
 nmB37+lcyo4+dBUXeWx1GV1ciPOzR1GfZ1IB87a0v2T4jukSHcx4x/RV5HBuXWWxX/
 tmb1GTrThqSrl3U86tN7tq6vaMyBDS0GKIH/C7FlRCc1OgrobsNizBoNt9n0beGCm9
 dTGXEyZJnLBfA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=srcTnDFx
Subject: [Buildroot] [PATCH 3/3] package/neon: bump version to 0.37.1
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

https://github.com/notroj/neon/blob/0.37.1/NEWS

Updated license hash due to a copyright year bump:
https://github.com/notroj/neon/commit/dc575f32f479895762548bdeb0b4ff81e929047f

This bump depends on the bump of davfs2 to 1.7.3.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/neon/neon.hash | 4 ++--
 package/neon/neon.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/neon/neon.hash b/package/neon/neon.hash
index d773b0f316..c5964ba669 100644
--- a/package/neon/neon.hash
+++ b/package/neon/neon.hash
@@ -1,6 +1,6 @@
 # Locally computed
-sha256  659a5cc9cea05e6e7864094f1e13a77abbbdbab452f04d751a8c16a9447cf4b8  neon-0.33.0.tar.gz
+sha256  a99b7262525a454d1065cf76dd17240fd808dfc4ef15636990ff83a5d0d9e740  neon-0.37.1.tar.gz
 # Hash for license files
-sha256  6c4f5d59a60a66cc970642c0f3799cf03b40a81c9dccbc4a254f20487d143f74  README.md
+sha256  a982d694ca4b8c3ae8b05bf07c701e7e8c7013a416356caa0746354d2d86c7e1  README.md
 sha256  d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  src/COPYING.LIB
 sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  test/COPYING
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 39abbaef48..71bad567a1 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEON_VERSION = 0.33.0
+NEON_VERSION = 0.37.1
 NEON_SITE = https://notroj.github.io/neon
 NEON_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (manual and tests)
 NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
