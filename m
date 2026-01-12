Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA14BD25044
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81F01614E6;
	Mon, 12 Jan 2026 08:11:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8aXKqhZAPfd; Mon, 12 Jan 2026 08:11:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44C6F61148
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205516;
	bh=HJ6aMCIQqCtAIuO2HuxdfBw2dVBXAGK0rD65F/yT2JA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=klFbSGgOXxBPDAKX5NnptFP04/l0pffflXzqEqP6BKtu1HqSjzqhdMIVF2ElGQq5f
	 hEhVrKWaK8RTAudT76PW75iNWj22KRlzCuGmZBr1kN/mDY8xkwAOuDMI8bDg7M4BfP
	 +JjwRY/XdL2Ik2PE0QnjHCzGuavDbGYKRNOGsKmaBAGWwiG1v6EIi6fPFAJA5DNY+A
	 mEIrrXV+sjmnGwsGSVDRe9HW93PqawmshIRNTSF+qBQkXJ+CZ1kWLTV9IrwDLZ63SZ
	 olmycvLKQ8UKYADo/wxQPd2+LgeVD4DSkOS4ELPnU7CI95hhWHdT+8Tez9ac9R82ok
	 YPsOIABNonttg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44C6F61148;
	Mon, 12 Jan 2026 08:11:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3198212E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18B8184456
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kXgbTZSon_rB for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:11:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 132BF80F59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 132BF80F59
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 132BF80F59
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:11:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 886A7A4C3C03
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:20 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCua-000000003M6-2S3X
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:04:01 +0100
Message-ID: <20260112080419.2516889-86-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205120;
 bh=g4xS0RrUKcZ3+bwiy1iRBNpMVjnSwgHwWYTzZ5hztU8=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=iEVSAVbf/ExalkmFQPTH66vSnH19uNOhoEoUYC1DtVBbP5/3XuT21n/BYVP3Tky3q
 Fpbv7b3i/FMFa4L0TSAbl6qXCq3uNhZUze1wydt7TyqOgPOkAJP9HedlGeAr0TLiV4
 TM9/iEUHJhmLFLcDCAA4Ottv1x1Hkuthol9yHVkxUOk+8EV28pVD/OcNTty+3I+94k
 ZXr2H+qL45Ab4QDczO2SxIG2BcWby4fpA9CGbJRmLqEpzW1UWWO79AhfXuOZ/IFyZL
 nMNt5/TntFv5KZo29mNXhX7CK9Kw3dxsON/CiGqDsoZUavgop0nvLpu7nAAzmZ/GpB
 J57LVlP3EVfgQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=iEVSAVbf
Subject: [Buildroot] [PATCH 086/104] package/x11r7/xlib_libXdmcp: bump
 version to 1.1.5
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

https://lists.x.org/archives/xorg-announce/2024-March/003467.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash | 6 +++---
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash
index 83609413fd..e11058dd08 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-November/003260.html
-sha256  2dce5cc317f8f0b484ec347d87d81d552cdbebb178bd13c5d8193b6b7cd6ad00  libXdmcp-1.1.4.tar.xz
-sha512  83b384d43bfb034c395f83f97d1c6e73aa3d5faa8f8756b08e697c0b9c3c87189651b51e8213fbd1f5f9cbc2d8136cbf143627481744345d78cfe0ff2ad074a9  libXdmcp-1.1.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003467.html
+sha256  d8a5222828c3adab70adf69a5583f1d32eb5ece04304f7f8392b6a353aa2228c  libXdmcp-1.1.5.tar.xz
+sha512  d7a1d70a58b7d34ddd01a91d3ccbc086a36626b7081cfcbb150d24288c6adad612b042ba7ea63a218595afb2ee04384c0f8ba84ee3c6bd29913724b54e898d83  libXdmcp-1.1.5.tar.xz
 # Locally computed
 sha256  8a3c3f35b0dbcb60a4e242b9e4394a352a65bb27deb2938ea1e2e62a626e16e9  COPYING
diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
index a79e2615db..28b2f9eded 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXDMCP_VERSION = 1.1.4
+XLIB_LIBXDMCP_VERSION = 1.1.5
 XLIB_LIBXDMCP_SOURCE = libXdmcp-$(XLIB_LIBXDMCP_VERSION).tar.xz
 XLIB_LIBXDMCP_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXDMCP_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
