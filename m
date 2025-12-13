Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B66D5AE45
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 11:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3B8940C22;
	Sat, 13 Dec 2025 11:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4kY5oTqP9bnN; Sat, 13 Dec 2025 11:55:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2495140B89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765626951;
	bh=liTb0mkgmmTN+h7l+IaDynbC54fKd0wf4KegFgzk2e4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mZ8rjyR0QLGjy7tY5G7SXJS3E8TG4+1T9QaZIEFaDgnEb3dXtNsjtZ1xhCNANa+en
	 Is5oBV8YseGRwuEQLT42G17UFAaIoaYUYEK4r+LlTmcnelAfJsheiR/z4Luofpn3dr
	 KyLCZgHLxuf6suAC/vW7wpSCrLJimzVYcvkVQBwX0uYi1ayvRM8QwJqNE1JMxKzt/f
	 HIIVn83lH8IlCaP16X13I3loj2byt6M8TKe2mGFBL74I7JHBujPuEau7cFWLwBssqa
	 XMPU6bZ+urhik552QxAkyEs6geFlEzQUhR1jxEiEnXL2O3yECcLQVuL0W+Mr1LeTYZ
	 ysYCmF6wISZaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2495140B89;
	Sat, 13 Dec 2025 11:55:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 491F72C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F2E460D6C
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hgh6Kg1b0taW for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 11:55:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 47205605FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47205605FC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47205605FC
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:55:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 46E64A4C341C
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 12:55:44 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60020)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUODv-000000006bO-2K6D
 for buildroot@buildroot.org; Sat, 13 Dec 2025 11:55:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 12:55:43 +0100
Message-ID: <20251213115543.1277009-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765626944;
 bh=znvhxb7/B9/A7YmnU0TSLpIO56aqImG7Ftv43nbZGqw=;
 h=From:To:Subject:Date:From;
 b=gCVttxbnBVsovx0TljthtTpfttdbr2CcH+ScvLfTwjmNXByKfWVHB5uQUJ7FBGdAG
 ne3XxlO3WHxE85a3qSvRuSTZJS8cBzGybAeSwnAnySmgzHT7Yxsee1vCQJSlEb8JbU
 PHKoIQGqW83Ia+MWrhjvziClgcVJDCSs8ffYATNK+mHarxOEYJJGEaw3XGZZ1f4jZs
 Y0uu6K03cUNAXPUOMW7IR9axIpvT0E9OgQ482FjDYPsrfM8c4iRPrWABBDgCiqul7H
 rv7op1jovG1ut6XgtII8QCJiHufTlP3ZDo5NoObRWTDJOdI6sdJewjsAPt4c3WY6m9
 CcrUA1PttyLqw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=gCVttxbn
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.131
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

Release notes:
https://lists.x.org/archives/xorg-announce/2025-December/003647.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 22c69f1979..52bf0c6228 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2025-December/003646.html
-sha256  a5c585ba8484c85fa8029bc8d0aad2af814e800b36e0f67150971b5037716ea5  libdrm-2.4.130.tar.xz
-sha512  1346df2d25552346ceea526ac7b1f0c3c9e4815ac246ba4ca61f54b9e27a5938d0e8041f22348eadce267cd8f6fd27d8ec2b0630f39451c3ec61ff2254896341  libdrm-2.4.130.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-December/003647.html
+sha256  45ba9983b51c896406a3d654de81d313b953b76e6391e2797073d543c5f617d5  libdrm-2.4.131.tar.xz
+sha512  d75894215600b648e25bbe13422901b650fb94bba8276d77971a49db7dc001819c9fc4b7e90ed82275f170a331687960ca5752cbb12064b2eec9c5c8eb60bf3c  libdrm-2.4.131.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index f64c9ad44c..240c09b8b1 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.130
+LIBDRM_VERSION = 2.4.131
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
