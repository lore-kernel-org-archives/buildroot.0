Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A99C02188
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 08:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E3F370539;
	Sat, 18 Jan 2025 08:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FTEDsWdHDc2F; Sat, 18 Jan 2025 08:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E57570537
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E57570537;
	Sat, 18 Jan 2025 08:38:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D6BE2F6D
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 08:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E05860805
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 08:38:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tFF4T0hYhrcx for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 08:38:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6B5AF60650
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B5AF60650
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B5AF60650
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 08:37:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c706.dip0.t-ipconnect.de [79.214.199.6])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1E65BA4C465D
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 09:36:40 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56018)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tZ4Jr-000000001aJ-2Sf9
 for buildroot@buildroot.org; Sat, 18 Jan 2025 08:36:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 18 Jan 2025 09:36:34 +0100
Message-Id: <20250118083638.2882800-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250118083638.2882800-1-bernd@kuhls.net>
References: <20250118083638.2882800-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1737189400;
 bh=k1oKgr8/xCeeTOhRiNTfKYlLpmR1AZyaX7LgYyW0e4w=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=J5il+UyPsWGTWWlR4S57i6Ru+BY7gijSP7K+NhzkmaJLdUZbtWaSOIApUQlNDga5Z
 kY0EQSzfbAan4qg6YkSwlxeXleJ1V4qqK6pFz0s6x2AvZjCkpQiPxPyMfRR71wyZYc
 9meaqXIhxz04JunQDCDX510OTKYzPX7Fuvyv9y1kVW+SAoHhQfrm6wiGeG3uybt3fq
 37kX19avGgT1z/tokMVyRlI1lBlEosoYn0dP4otWzICWCAqFtspxO9gXpepUnieroF
 OkH4+S/muYSspH7avjEeORAV9Aoq8JO/Isq8d30jnT3KwegYG69IWzQzykH0fbIKXP
 7aAZQhe0jugDA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=J5il+UyP
Subject: [Buildroot] [PATCH 09/13] package/kodi-screensaver-rsxs: bump
 version to 21.1.2-Omega
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
 package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash | 2 +-
 package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
index 021b92c143..86174991f0 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7f3de3b68c4852290ad3aa2f3b77a356dbc3f26a78bec8356f04723f6d86be42  kodi-screensaver-rsxs-56bc68ef28a8d2a8cf345472df6105bc4c111a04.tar.gz
+sha256  76c1df60f3b4bf4c61f827e07ac61173e3b72defe6ab54d1a1fa34f1cd6f38ab  kodi-screensaver-rsxs-21.1.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
index caadbdb159..ff554a2e1a 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_RSXS_VERSION = 56bc68ef28a8d2a8cf345472df6105bc4c111a04
+KODI_SCREENSAVER_RSXS_VERSION = 21.1.2-Omega
 KODI_SCREENSAVER_RSXS_SITE = $(call github,xbmc,screensavers.rsxs,$(KODI_SCREENSAVER_RSXS_VERSION))
 KODI_SCREENSAVER_RSXS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_RSXS_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
