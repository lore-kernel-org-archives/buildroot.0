Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE54D277C1
	for <buildroot@archiver.kernel.org>; Sat, 10 Jan 2026 18:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 389316084B;
	Sat, 10 Jan 2026 18:07:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 63S9-DPrAVkg; Sat, 10 Jan 2026 18:07:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6494E60793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768068432;
	bh=RCiGmoyk+0T86QkW7fKiC/c1vz4QZt+VuSVAmboKSMk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GEWKwU4B7yTESSX0b8Bt07eCDIjD5sBNMBL9wPwkOLY0Ed43jqbRBqWpYT/BTdqlW
	 bABrjaqS5xqJSwORq6W2X0PeiSNVXYxCi+HwKHk3Tq3hHfU7dfRQAyxUxGFb7rnBq+
	 LasVNDBRGPIfjh+YxLf2oQvE/uQxabF4LrM+YIDTvbNTa7xE+I3c4AVzul/TsRnu/7
	 oTH5Z9OK+cMLi+pE1rQ5eBzxFP4W0MVVf386aGiZC5Cv+pHcaeo09uBAMXEDo7ssyU
	 mW3wgUqo5T6mNGx+sbiGoM7y0dar8TOMFMGVMM8263tDPNfsc6h71clj4CwH5aK+qv
	 oO0IQB/XoTfZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6494E60793;
	Sat, 10 Jan 2026 18:07:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A153131
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 18:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D22D40460
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 18:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GMWSVzY0xEuw for <buildroot@buildroot.org>;
 Sat, 10 Jan 2026 18:07:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5C2B040748
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C2B040748
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C2B040748
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 18:07:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 80F1CA4C3651
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 19:06:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56224)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vedMV-000000007xO-0xVo
 for buildroot@buildroot.org; Sat, 10 Jan 2026 18:06:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 10 Jan 2026 19:06:55 +0100
Message-ID: <20260110180655.2221592-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260110180655.2221592-1-bernd@kuhls.net>
References: <20260110180655.2221592-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768068415;
 bh=MhOTAJ1i9x83QgOte5bwTPPtMHM8t3CxcQKZMd4L7Iw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Kn2XlqleaRcEN84szo4LN1xco1YDgDUNf+9Jdcv1vbINbmmZOin1kfNAb8KMZl2/u
 fmeQDDz6BmMpSyUzU0Exi8n0egvO1FxL4M6emXfMOEvcaPLtneY1uYhfVG80sOzZIP
 MSJrq6DxU7UjTQHvEa9+MuWDbhs/SnOUq6p/qBMLA/K1SqqNp2O7i+5HgbepVzaRvU
 cqI6nw/kh4shmPwy41HDNT4ZnjK5uuMGNnitXp7CqyAAAYa4v/U/vQ/KUxMj14Szcx
 1xbJ/Hpaer2a66pzE0Fk3AGGpPbm6ksK5OhVIGJWYsevFyDMFcDv3kECA8HC4e8u9X
 kKsVpD/XqFBSA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Kn2Xlqle
Subject: [Buildroot] [PATCH 2/2] package/alsa-utils: bump version to 1.2.15.2
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

https://www.alsa-project.org/wiki/Changes_v1.2.15.1_v1.2.15.2#alsa-utils

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/alsa-utils/alsa-utils.hash | 2 +-
 package/alsa-utils/alsa-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
index ee47d43ab9..5f6ecc2be6 100644
--- a/package/alsa-utils/alsa-utils.hash
+++ b/package/alsa-utils/alsa-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5ad79f349e59c30c9a4929ad4995ebee33267473e0e632d7c1a30e2b093d3327  alsa-utils-1.2.15.1.tar.bz2
+sha256  7aaaafbfb01942113ec0c31e51f705910e81079205088ca2f8f137a3869e1a3a  alsa-utils-1.2.15.2.tar.bz2
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 9af2d0136e..9eeec1d50b 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_UTILS_VERSION = 1.2.15.1
+ALSA_UTILS_VERSION = 1.2.15.2
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = https://www.alsa-project.org/files/pub/utils
 ALSA_UTILS_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
