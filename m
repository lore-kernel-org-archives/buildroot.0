Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E93CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 17:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 887F94081A;
	Fri, 29 May 2026 17:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WiWf1m1zuyc1; Fri, 29 May 2026 17:21:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC6FD409B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780075282;
	bh=iXy+sDQNy1JtnnlI94gXVf5Rf+S7xa0pms87+eIKSBA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JK3MjMyf5oFCxfMUhv4tNisdYJmM0igvUSRvML2KWX5GPf8z26uTeyXJia+98AUOJ
	 CEnD17Na7ncfKrpydeJy4UZSwtttJS9gxCFH61qPkqBFhKw2Pnbi89KIXUF83ikGL8
	 riA90y63Lya+68H/EMYRxA2mdosGAYNHyzktrBpsG0GtRbvDzRxOVSw4JXRIGD3MCz
	 wZLSIhhcp08zJp8PizTClRXay7AHz+G9eHTMImnFPXqldAdM9t/BFjYx5auKhWDRqb
	 zG2BW2LVXUuZQZeR5aYXJmzURHx+3aRkL7+1JzrgKaxBYpMKvgcCP3aDYxDH4rqlMz
	 jYdgkQYBIOMHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC6FD409B0;
	Fri, 29 May 2026 17:21:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DB14CD3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB3218441A
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dgDUu-0TDCRz for <buildroot@buildroot.org>;
 Fri, 29 May 2026 17:21:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7D34E84417
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D34E84417
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D34E84417
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:21:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a09fc.dip0.t-ipconnect.de [91.58.9.252])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 55E24A4C3047
 for <buildroot@buildroot.org>; Fri, 29 May 2026 19:21:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37110)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wT0tL-000000000Fx-2FdP
 for buildroot@buildroot.org; Fri, 29 May 2026 17:21:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 19:21:03 +0200
Message-ID: <20260529172103.1359117-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260529172103.1359117-1-bernd@kuhls.net>
References: <20260529172103.1359117-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780075264;
 bh=vjVdAr8b0RdKERIqux70js+KkzpJfNRsr2rRDVNl+NI=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=evaKG4JjV/l890XQxkSrTlyh7b0HzefNXUxoA4pdMj5pzaYDumhovIKhBklb+A1ye
 6T945FkDflyDj60i59LjpF3NuSvNCB5UIXB+MIHs0VgR76eWgWDYPQdDiLxBkYOCEb
 H5HexSZMypqY8OOKELVwN2hRkvu184QjWU+aatplUQqLjyOe3UiDT9QRQtKrjKh0DD
 XYv+hsREN8/4DVs/MX0SMavJyh+RgsQLe06l1/5nZYJwoQb9W5I3lX94qPuYJx3PHw
 vmGEPnIkmt+lxLr0W8UAjrqzxXc2IfUmJsMONhbTe6vyPGOAuIAlvxdai25J0HRfVm
 mMz6+TrBDXdzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=evaKG4Jj
Subject: [Buildroot] [PATCH/next 2/2] package/libdrm: bump version to 2.4.134
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

2.4.134: https://lists.x.org/archives/xorg-announce/2026-May/003701.html

2.4.132 & 2.4.133:
https://gitlab.freedesktop.org/mesa/libdrm/-/compare/libdrm-2.4.131...libdrm-2.4.133

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/b109d911fb06a8a099f8ff715de96cb7906721c1

 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 52bf0c6228..80e10e0985 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2025-December/003647.html
-sha256  45ba9983b51c896406a3d654de81d313b953b76e6391e2797073d543c5f617d5  libdrm-2.4.131.tar.xz
-sha512  d75894215600b648e25bbe13422901b650fb94bba8276d77971a49db7dc001819c9fc4b7e90ed82275f170a331687960ca5752cbb12064b2eec9c5c8eb60bf3c  libdrm-2.4.131.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-May/003701.html
+sha256  ac5e74d157830eb8bee44c6a6bf3ad49774ef0dd2a72bdad74a8f20308b52a95  libdrm-2.4.134.tar.xz
+sha512  ef2abddea59d1e93c83a48de920431b839ab50d6071ef4da3cf126e7d64ba7b235f2e34e1169d49ad9de2937a0a18acd66bb8d324b067239b1136e0ddbe792a1  libdrm-2.4.134.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index cafff8781e..6a23746db6 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.131
+LIBDRM_VERSION = 2.4.134
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
