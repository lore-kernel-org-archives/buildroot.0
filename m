Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBC5C5CFCF
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 05:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CADA4077B;
	Fri, 14 Aug 2026 05:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQte40J3WUQr; Fri, 14 Aug 2026 05:50:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 903F840831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786686657;
	bh=0q76VGsTGt9uYKoMq0jW1QQsDDX9T+GYmKbB0hMwN/Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q0a29OC14uzbnC4MX1+OFOTT1ZlwkZfSHEqJkl/mdaMPVtOdDsIMbL8S4ibmxiWXC
	 WmCuDBMnBW2RKtS5ShJiVguQUFhoH9lXcMKt/kK/iHrG8SOrqgE4XZ/eT9AncYUEBA
	 7F+13q3vWzPQ74wz2TOECVQFC0ywIvglM6akcVsMhFeHe2ZojErksT3s1plplbqOq4
	 c/HqLq8n7hr4MuO0QzspQCIESioOH8IlD4Lud+4surCNbIS55b2lcT2MavfvIVC4MJ
	 Ri5JNpXLoUG0ZksTy6L5xiAxuqcTsvRBTiTKfGGLjQ/4kIkjaJLa1I3y5223+bF58h
	 nmaMhVLGSdl4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 903F840831;
	Fri, 14 Aug 2026 05:50:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EF713A0
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 05:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E349080DB5
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 05:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jZzptcCqT8Af for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 05:50:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 504D280DB3
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 504D280DB3
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=htoi+yab
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 504D280DB3
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 05:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1786686653;
 bh=f9smVi/7X8sHRvoGX8Jbo//enzW483hU18t417mANX4=;
 h=From:To:Subject:Date:From;
 b=htoi+yabkW5CxC1X79M6i6Mes6C/B9h2MzyEQn4yKaL1raaWeI70f1A9XqdE0XRLA
 kJAL0KJu9hgQ47Iw9YhYxyxOds3NjmUgeHknySGrYeA+U21tusDHp8CNBdY4iRMrt5
 r6/3QtfumEMGGp8GKVeFVLHpmPTVHuoGK7PcIDRB/BuNU14pSngiF8PuLPAPDAnasP
 Dyv00LuS7aGVIxONwew864gTvSxmupkjmriCSRxDS92sk+WcVp84MM5ULiiMg1RoHt
 EDCUQymp+VSNrTCj/DcfeZJR9bhWm8FO//ri6ePecIUM701kKSR2otJhQqxYDa6NLa
 oCJCZadCBrUSA==
Received: from fli4l.lan.fli4l (p54a1bf47.dip0.t-ipconnect.de [84.161.191.71])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 25E38A4C0596
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:50:53 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55022)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wukoe-000000006Oi-2HEI
 for buildroot@buildroot.org; Fri, 14 Aug 2026 05:50:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 14 Aug 2026 07:50:52 +0200
Message-ID: <20260814055052.11891-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/rsync: security bump to version
 3.5.0
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

https://download.samba.org/pub/rsync/NEWS#3.5.0

Fixes CVE-2026-53802, CVE-2026-53803, CVE-2026-53785, CVE-2026-53784,
CVE-2026-53793, CVE-2026-53795, CVE-2026-53796, CVE-2026-53797,
CVE-2026-53799, CVE-2026-53800, CVE-2026-53801, CVE-2026-53783,
CVE-2026-53786, CVE-2026-53798, CVE-2026-53788, CVE-2026-53789,
CVE-2026-53791, CVE-2026-53790, CVE-2026-53792, CVE-2026-53794,
CVE-2026-70461, CVE-2026-70458, CVE-2026-70456, CVE-2026-70457,
CVE-2026-70459, CVE-2026-70464, CVE-2026-70455, CVE-2026-70453,
CVE-2026-70452, CVE-2026-70463, CVE-2026-70460, CVE-2026-70462 &
CVE-2026-70454.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/b7a97a0e85618ed5338043c7c57513821234c72f

 package/rsync/rsync.hash | 4 ++--
 package/rsync/rsync.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
index 2deaed0674..84cdaf680b 100644
--- a/package/rsync/rsync.hash
+++ b/package/rsync/rsync.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.4.tar.gz.asc
-sha256  bd88cf82fa653da32314fb229136407c5c90f80d1758d8f4b091767877d8fa96  rsync-3.4.4.tar.gz
+# https://rsync.samba.org/ftp/rsync/src/rsync-3.5.0.tar.gz.asc
+sha256  c7ffd1ef653e99540f661e47cb00b7f9cad1ee6b972399b16f93d672656e0d33  rsync-3.5.0.tar.gz
 # Locally calculated
 sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 5dd89a82d2..391659a33d 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.4.4
+RSYNC_VERSION = 3.5.0
 RSYNC_SITE = https://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPL-3.0+ with exceptions
 RSYNC_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
