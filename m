Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A419CD25051
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79E4E84617;
	Mon, 12 Jan 2026 08:43:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6LPaDQBQhi-c; Mon, 12 Jan 2026 08:43:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56BC084561
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207414;
	bh=EeyJFad6iMMPUHT0y779f4eWoj4erPHqNM2Hl2j/nQ4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ci5i11qPZzKCjMU1gW6j/tUE9emqRvhNp1mx9wWEAcZb/u89CbwuVIo1WCN7HzeHx
	 HFkDT2chtiyzIi1nCHc45MFIswVXOPBmsYHY48BdVySELIFSNCGxdumQcem26uBrgE
	 t/j4Ahqq8M7RPIHkuu58kgOZ50IRj49wp7byK/lgB0GcY7yE/doxNbmaj+/DeJAIDk
	 EayhMdPloKWc9EeN+x4mNDDuHsZtldykNWt9hTrcngCBzOfsaD2zqew3NFjoT7Ty/N
	 f3RzrYT0NlZa8QW4aicNQCC1AQ3MpTxxlax5ecKKlXUd2PPDfuaqiWqAK0cU0ONh68
	 bKrmj1CXHPgUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56BC084561;
	Mon, 12 Jan 2026 08:43:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EF9631CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC193416AA
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:43:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B9GPaCHWTRbI for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:43:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E4E19416A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4E19416A8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4E19416A8
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:43:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A0AE2A4C40E2
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJC-000000007z0-08IQ
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:27 +0100
Message-ID: <20260112082950.2528445-19-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206655;
 bh=RG372R8YM4wUHUX2b4oTv3dsgzuexoh05rfkm8jDvvc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=mBRcUvKARU43VVT5mx9ubp8/nq1x8vbLbcqw7yFB6glpQBNNIgyuwsGFpp8ba8LsB
 pF0H9sSXS2vtmb1q73yxVNJZajBB2M5o1K9tkHn/UDq1CO8csCaC08iX8kndlK3JHT
 m+7o1APhH8yYMPAbCO42HMgTYsrFU9qiuPlV0G/1IjzoXY8LNKt0rn/ktEeuTZJmYb
 ZedG5Y2BNqlf2WFV3HXEW2BD1Gut7Prxz7zIlJnyzFwrosJ7assyHMD0beWq98jRPN
 Asmoc3llc5CF3eX0CBiQlZ38CopLhjNffv8qU9Z1l2R55fvRGKholp/eZ4J+Ts0kw2
 23QI5W2P/S0BA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=mBRcUvKA
Subject: [Buildroot] [PATCH 019/102] package/x11r7/xapp_xeyes: bump version
 to 1.3.1
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

https://lists.x.org/archives/xorg-announce/2025-July/003618.html
https://lists.x.org/archives/xorg-announce/2023-July/003409.html

Switched tarball to xz.

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/app/xeyes/-/commit/7dc4f720f57471d2eccefd87cdca54494cf75eb5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xeyes/xapp_xeyes.hash | 8 ++++----
 package/x11r7/xapp_xeyes/xapp_xeyes.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_xeyes/xapp_xeyes.hash b/package/x11r7/xapp_xeyes/xapp_xeyes.hash
index 734492b6cd..ce058140ea 100644
--- a/package/x11r7/xapp_xeyes/xapp_xeyes.hash
+++ b/package/x11r7/xapp_xeyes/xapp_xeyes.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2021-August/003101.html
-sha256  f8a17e23146bef1ab345a1e303c6749e42aaa7bcf4f25428afad41770721b6db  xeyes-1.2.0.tar.bz2
-sha512  2d1614614b3ba3d1ebaa0e9801a2e159389b94aaacafb962d326b7e6dc712c1eb2c12a50ceb10b3135cf0eee6ae86bbf84e73098deb08e73792f14a60616b4d8  xeyes-1.2.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2025-July/003618.html
+sha256  5608d76b7b1aac5ed7f22f1b6b5ad74ef98c8693220f32b4b87dccee4a956eaa  xeyes-1.3.1.tar.xz
+sha512  c0c3e25b1685cc943c8d27f88c4d3ec79aa05c102ba7ac0cbd7dcebdf703111ecb2288f4bac55d9ffc5b7aa3b15cba58f28c21025a53b415a8a18bdb61688dcf  xeyes-1.3.1.tar.xz
 # Locally computed
-sha256  d8de1de40e16227d1eb4b19e95117ce3f990f71f71df096a2259b0bc9931e042  COPYING
+sha256  eb051f2b83cbc5c65b3b8c268747ee7fe5e37997375af47d269beca8ec58b362  COPYING
diff --git a/package/x11r7/xapp_xeyes/xapp_xeyes.mk b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
index 3f37aaee8c..29f8022170 100644
--- a/package/x11r7/xapp_xeyes/xapp_xeyes.mk
+++ b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XEYES_VERSION = 1.2.0
-XAPP_XEYES_SOURCE = xeyes-$(XAPP_XEYES_VERSION).tar.bz2
+XAPP_XEYES_VERSION = 1.3.1
+XAPP_XEYES_SOURCE = xeyes-$(XAPP_XEYES_VERSION).tar.xz
 XAPP_XEYES_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XEYES_LICENSE = MIT
 XAPP_XEYES_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
