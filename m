Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FD6CA0FED
	for <buildroot@archiver.kernel.org>; Tue,  9 Sep 2025 16:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 264D884291;
	Tue,  9 Sep 2025 16:12:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6KhhH6sV_o_g; Tue,  9 Sep 2025 16:12:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46C24842AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46C24842AA;
	Tue,  9 Sep 2025 16:12:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B594186
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 16:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CBB8842AA
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 16:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LIyKSv2skOcK for <buildroot@buildroot.org>;
 Tue,  9 Sep 2025 16:11:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1FAA584291
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FAA584291
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FAA584291
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 16:11:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b0bb.dip0.t-ipconnect.de [84.161.176.187])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7DBA9A4C0ED2
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 18:11:56 +0200 (CEST)
Received: from [192.168.1.144] (port=60158 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uw0wl-000000000J1-3lwn
 for buildroot@buildroot.org; Tue, 09 Sep 2025 16:11:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Sep 2025 18:11:56 +0200
Message-ID: <20250909161156.59592-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1757434316;
 bh=qrZnFuBGUhCzAV9c7PsOEPdhgwfxaX+m/dzOp6VvYjE=;
 h=From:To:Subject:Date:From;
 b=ltiGCpYpHscPIEPi/SERQr3Fxkp/sC31Oa1FwGgQ2voW5fHEiYQUn5a9/hB0p719d
 vkrxNE3Y8dMVKdIMYJUiRVlbS+NIWyCXqatdLMaDjTmAlk7Fmap+dn1ySksMX/kBNf
 moBvn2vahCDETkOzdm1fAI8JqJDlJ5ugQDEvpEDHdzxP04xF0VVP6XVRIVhYoV2Mzr
 Q2YOmgsBgcXTEAizQ+HDuGzTt+elNDjwMhiTFuDptnAyKUnrO4W+QFcXBa+NzaadWk
 +5a7ZJ5GGQXYk7n/KYj+PE5eskvIQkEVu5NFaEqyeQ0YNLByiJb3pVuN1xCm3lJPRA
 wL9VCgFu/ajdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=ltiGCpYp
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.22.4
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
https://www.samba.org/samba/history/samba-4.22.4.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 069b08feb4..f0e19d8741 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.22.3.tar.asc
-sha256  8fd7092629a3596d935cd7567d934979f94272918ec3affd0cc807934ecf22ba  samba-4.22.3.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.22.4.tar.asc
+sha256  a41a828848abdf5e942c900ca178597e18aab7b61d3c06a9b5ba43661988010b  samba-4.22.4.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 270a55593b..c1d1b0b160 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.22.3
+SAMBA4_VERSION = 4.22.4
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
