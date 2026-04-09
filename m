Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E68FEA3C4E
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 13:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F181B40DB8;
	Thu,  9 Apr 2026 13:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id buiF4iqssXcp; Thu,  9 Apr 2026 13:16:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4942241030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775740606;
	bh=ScdQP+Fgee0p/yhRNLCHop9omJ6nQYQw+cfUpkgqhDw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k/TbuXiPXfN5GGOqiSW1rPufcyQ2K8KkSepB2zHkD6YE7i327MNnsuaq/KCuL1X7C
	 KoPXGcLfDlcM+hl2vCCQ+3Di/UORf8FgE3HBmsPXjIS+vtKeIWT1kSG25wj8qbhrab
	 y31391YD1mlTu+3TNtJ+JIFMidUxu8keUZc5jwFPOLvl+rPOkxNYaL1Hcudkr7UUAe
	 ER7hf9lSJ8Q03aX0zLMUndg0kRNZ5CDl322GHpKwYFOACfIZeBk5XJquF2xF9dmNNE
	 e00F8m2svaRaXbcFDuZv2hd8L484uxxPjKOKR161KUA/qfQxATabk9bRhKw5qJ3Suu
	 m1s2BA5h8/H+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4942241030;
	Thu,  9 Apr 2026 13:16:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E4899237
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 13:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C948040340
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 13:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id juOfHzuUQIXA for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 13:16:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 16A9D400F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16A9D400F6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16A9D400F6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 13:16:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca66.dip0.t-ipconnect.de [79.214.202.102])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BFCB4A4C00FD
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 15:16:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38546)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wApFP-000000002Dm-2wkI
 for buildroot@buildroot.org; Thu, 09 Apr 2026 13:16:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  9 Apr 2026 15:16:39 +0200
Message-ID: <20260409131639.278687-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775740599;
 bh=yJhKy8bjC465O0DWL3pP875uKmQusF3rXYSRBiXjIE4=;
 h=From:To:Subject:Date:From;
 b=NmKBq0nlvmRoMeG9AIDUxc3nAyDLPVG1gjIW13CMvgG+0EQphxxCVpMmV5ZMOdE2R
 0EAQL4Vx2xyI7jw6M4wNKlqFN8XEaiqFttYMLowbLX4XNTb/dJO7l7k/A9wwoKZEEl
 Nq4mM4hxz5rQ104cxyECI0Z221Jfs+W9foOa18iZas1IZvvX35h5w4dEgwu94Tvs21
 t6uFBW8bRbsdQSrY6G/YfRxt4VKuVmBB60QvZROe+nCYH11+EvDuCLGNitIkr//pwa
 iX7i74R6SJl245XQBkc1139TN7yvaPTstFBXRjw8b18cfHruUsvZAo0sducH3FsDJW
 DkjWQdZxfrqfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=NmKBq0nl
Subject: [Buildroot] [PATCH 1/1] package/libpng: security bump to version
 1.6.57
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

https://github.com/pnggroup/libpng/blob/v1.6.57/ANNOUNCE

Fixes CVE-2026-34757:
https://github.com/pnggroup/libpng/security/advisories/GHSA-6fr7-g8h7-v645

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libpng/libpng.hash | 6 +++---
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index ae28eee087..977f8fcca4 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.56/
-sha1  71eb3636e60b6ea66f2f670cdf1f7160b7a1fa8b  libpng-1.6.56.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.57/
+sha1  866fb81e3355088bb885bb4ded39093ef80eb686  libpng-1.6.57.tar.xz
 # Locally computed:
-sha256  f7d8bf1601b7804f583a254ab343a6549ca6cf27d255c302c47af2d9d36a6f18  libpng-1.6.56.tar.xz
+sha256  d10c20d7171569804cae8dfc13ba6dcd0662c41ed39d43d4d429314aafb10a80  libpng-1.6.57.tar.xz
 sha256  bdb0a645ea18c60507d0368379b1ac5474b92255fcc2d115e07486a7672ba526  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 7c5bc35a77..0081406300 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.56
+LIBPNG_VERSION = 1.6.57
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
