Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28746CD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 16:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22269827BB;
	Wed,  6 May 2026 16:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gz22X0ukVs6l; Wed,  6 May 2026 16:50:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5C8482733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778086231;
	bh=KhXV6ppx73faK4B27S3KI9gKJYtCFkxCA5P2OSHySqE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ifu8XKbLg4h43qmdfgUbFBZK7IIVI7dEO0theCWcrG55kNHW9FqIdsACvR4lJmbE0
	 8djgdNSG0J7ylRvUiR902ANmUvZUY05wAy7nTQlpd2Jr3x9aSUeTAvlSfyg1fyqn3L
	 UKtAmn6CcxypIkLh+v2mPxrTrZGGpw8YVdmTutSsPCgbCKmxvgR73Q1jm3Ang69ouR
	 Ms9OQ9kIvEYCruWQJ/+XSVw7UI31IzYJ/CAliG+Nb+QiHDe4yB/VP+i9zyjhgAuHW9
	 0O3bygI743rg9QgwVhVo6J8mQpdhqQGdWUgBa3HgRhIm2WfJeFwJTEBCmYNrPdTt6D
	 fhs6uG3EAYlJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5C8482733;
	Wed,  6 May 2026 16:50:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BB2D11B
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D87F40EB7
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MdhcH3_HZOwo for <buildroot@buildroot.org>;
 Wed,  6 May 2026 16:50:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6A4B340EB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A4B340EB4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A4B340EB4
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:50:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc94.dip0.t-ipconnect.de [79.214.204.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A9101A4C0E73
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:50:27 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49460)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKfS6-000000005s1-3eYB
 for buildroot@buildroot.org; Wed, 06 May 2026 16:50:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 18:50:27 +0200
Message-ID: <20260506165027.1340687-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778086227;
 bh=x/gEzWKPOOSfMOtEy8S1wl7YBCWtV+88v0lszp7D3cA=;
 h=From:To:Subject:Date:From;
 b=bcxPK9CdKOi1l/yGueDS+VD4C7/SVENiPBNrmptg17DRDSE6HmOuBT/4vvmY/caUq
 v/MpdE6evflfzMkeJca6GrYlzfIC5KOvRy4dj79Qh09lc/q5iPM2GwlCc/0NmkEz5O
 H2LIqYJVydQyy4lngWNjuwXSE1j809VN2Q5bflqo1cEcyBl4EraInrL3q0qfvMTOUB
 8d5u1rGSIex/AemiQ1dBq19YRDEgwjPSCC8v3DxWuaBAQaT/+jk0darmzHP8sXdS1l
 iBL3IHQk6TwQZutAtzbvqXWQJDYwBuCCp3sZ1BUhSQWVBJgHVCljRVY74P0+OWZl2Y
 sQfPzyysPPp5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=bcxPK9Cd
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-zattoo: bump version to
 21.0.7-Omega
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
index ecec000e3d..8b5509d947 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f6df1fa29ec3778f591281f57190099bf5a510c293c711ea978497556765352f  kodi-pvr-zattoo-21.0.6-Omega.tar.gz
+sha256  d57efceff2f451cc8864d429abed6c7d808ea5092fddf3ece3f598d4a5e26b1f  kodi-pvr-zattoo-21.0.7-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
index 2de33b26b5..12d2d5ff09 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ZATTOO_VERSION = 21.0.6-Omega
+KODI_PVR_ZATTOO_VERSION = 21.0.7-Omega
 KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
 KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
 KODI_PVR_ZATTOO_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
