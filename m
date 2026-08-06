Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31945C56205
	for <buildroot@archiver.kernel.org>; Thu,  6 Aug 2026 16:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C09D880ED6;
	Thu,  6 Aug 2026 16:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 15EhopUBqurn; Thu,  6 Aug 2026 16:40:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0B5A80EDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786034440;
	bh=uLKlKs/C00whWnek1GVND9/h4Y+rUuNzlrYtdRAV43k=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=egl20VWLFwKvStEnu0T6zMDztn56OVNKmRYoi9ntv8eMM8H2/nMMlhKYbpJblYKk/
	 3sRLlFMxOQP0F+wkamCFpdYBoXd44khVy2WQH5S+AV/Vbsk0Dwq3tR3bUpsLWMoBcr
	 Af66ubs45i+JGdkRnx3eiPQI316taaKiOKAk11RkvItzkDRGQnM2IOlPcQmc9uRACl
	 /8slRumKINb15EvVFOEbl1Mb6SL6v5R2dSKFPHLyOzIv+/N/mPhQZuEfr+sB9oRBcK
	 lhQrHgd9BPszHOXaW2LY4sRyoxqtyT2uvdN5A3Ym42/onzdXB9agKESzOPuLSB3tdF
	 9trqeOblMPEqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0B5A80EDE;
	Thu,  6 Aug 2026 16:40:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B40AB392
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 16:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99D384084A
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 16:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qhXu_7ZLdUGt for <buildroot@buildroot.org>;
 Thu,  6 Aug 2026 16:40:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7A58F4083C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A58F4083C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A58F4083C
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 16:40:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b3cd.dip0.t-ipconnect.de [84.161.179.205])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5DBECA4C47CF
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 18:40:34 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54530)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1ws18z-000000005MC-2pgE
 for buildroot@buildroot.org; Thu, 06 Aug 2026 16:40:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  6 Aug 2026 18:40:33 +0200
Message-ID: <20260806164033.1428655-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1786034434;
 bh=2eU51/VJ5osb2O8c/vYVV//3b9dfvDmrGBZHpJaH9b8=;
 h=From:To:Subject:Date:From;
 b=fVRRmdh2Rk/vwgH9f2I/Rw360Plds8VEdqaF2jFMmT3ySSO717mDIRZIMfVGOtIbm
 Il/kYWTjcokaP5XuzXtOyq5qySNvkcPlc23QAogwAqEyRHhJmjOvhbkRlm7luDW7Vd
 5eYoLK0HdQb9q18XHsP1hI9v94ShhwL7P/SwkrdY4uJS7hfnDUr7wlJXDoLfXTqc8N
 scS3SIdTrBw8zw+MnDBO0dpdKh2fUldzkp24AZf8Oz1dpn33+YBVGuVuiqB2dZCU3a
 j1gQ0rNEg9+xEW2/LhHh8/PFF1RMhEZDndI2Ztlb/ihLI3qxbh7fhcwckyYnZOKYY1
 ZmUmlagipVRsA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=fVRRmdh2
Subject: [Buildroot] [PATCH 1/1] package/libudev-zero: bump version to 1.0.5
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

https://github.com/illiliti/libudev-zero/releases/tag/1.0.5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/297c1a5b62418869992c53409c2969136dc4f11c

 package/libudev-zero/libudev-zero.hash | 2 +-
 package/libudev-zero/libudev-zero.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libudev-zero/libudev-zero.hash b/package/libudev-zero/libudev-zero.hash
index fbff8e65e3..45643c68f9 100644
--- a/package/libudev-zero/libudev-zero.hash
+++ b/package/libudev-zero/libudev-zero.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  10148cfd6047d387bf71eca72cd19c177084224d96434a118d8def6e0a3d6316  libudev-zero-1.0.4.tar.gz
+sha256  bf4372f79ddbe6b0e266a3d2994ffac7018a7edf4f87632aecb5176565d96138  libudev-zero-1.0.5.tar.gz
 sha256  9169cc15bda9e4597784ea29530d6754af6fb00adce5907bf0a794c575591d3f  LICENSE
diff --git a/package/libudev-zero/libudev-zero.mk b/package/libudev-zero/libudev-zero.mk
index ba41fe09f3..9d648dd345 100644
--- a/package/libudev-zero/libudev-zero.mk
+++ b/package/libudev-zero/libudev-zero.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUDEV_ZERO_VERSION = 1.0.4
+LIBUDEV_ZERO_VERSION = 1.0.5
 LIBUDEV_ZERO_SITE = $(call github,illiliti,libudev-zero,$(LIBUDEV_ZERO_VERSION))
 LIBUDEV_ZERO_LICENSE = ISC
 LIBUDEV_ZERO_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
