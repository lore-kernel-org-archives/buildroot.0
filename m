Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C4FCD3427
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 05:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FBF381E15;
	Thu,  7 May 2026 05:45:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yOjCyCoyNWbB; Thu,  7 May 2026 05:45:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D568381DEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778132715;
	bh=fn0BVnLmdnUf6O3wCBvvYk7k2mcuz+mw489v4hBMuOk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LTsMgM6fOKECYwkob//tDt0KVBVPlOM5n64TDWOf26dvPQ79ItRhvhENj//FT3BFA
	 vQB0BzorlCSlpfL/2KkQgxrvtRe7jIp8WVfjg6i9jx+8P3TlJFaKjRQ+onIEeyLQXj
	 hLwDcGjepJ5sTKD6Iz/2LgSvzoU3OrN54AlKoCa0FfQAz77YHz0d8Pe15u/nLlnkIh
	 WNjHPIXmN1DJdCoOsiApu2YdzvoUDs4NA0KSc8U9gAMtmDCJ0fNaCE545rM6VxpkcB
	 aMrxhQOZPtvxj9YkfeMTZZEn3lXl5mJa4B6bGYDaK66WWSZeHH2fNCDA9eB8YdYzKQ
	 fgjZtBVw9ipNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D568381DEF;
	Thu,  7 May 2026 05:45:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D710280
 for <buildroot@buildroot.org>; Thu,  7 May 2026 05:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 706474102D
 for <buildroot@buildroot.org>; Thu,  7 May 2026 05:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vVL4ZU-Ifagf for <buildroot@buildroot.org>;
 Thu,  7 May 2026 05:45:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7F0834102C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F0834102C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F0834102C
 for <buildroot@buildroot.org>; Thu,  7 May 2026 05:45:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bec8.dip0.t-ipconnect.de [84.161.190.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3C199A4C17A5
 for <buildroot@buildroot.org>; Thu,  7 May 2026 07:45:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36960)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKrXo-000000004ZZ-2L4e
 for buildroot@buildroot.org; Thu, 07 May 2026 05:45:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  7 May 2026 07:45:08 +0200
Message-ID: <20260507054508.22755-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778132709;
 bh=241RicwFDOnMmEoP4Fu5G/ZyPGFSR/S5uKcph+XLumc=;
 h=From:To:Subject:Date:From;
 b=j1C64EPV3UaKQ6GLZMnhq5kexV1ffp/feOhW/w4bGYuUWE30LyjsgoRoiZ7ucFsqL
 O5/qitQ2FXW5QGYlG5fBjqNYXvYycCEidw0yrY+J4W44PjHF7jQ2lh1HP9MItORT6o
 LNYjzQQJ+nTNYktXrbNQS2vF4psT93hpkshlQIERy3ryOyHdCcVh18uPEZWqlDWVQH
 pTZGNYZ+5sxOQ5NBxdfh7GIf9w+XiP7MWt3rISvJDsLB5rWm9e+RkEfMyY3tWgpJzk
 nmr04MrGoXBLTevQRjbFwADiza22YKkUBk15xsHAQjo7rirjAgzM421I3wwLQK09Ct
 mf59VjidfiWCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=j1C64EPV
Subject: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.9.7
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

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.7/ReleaseNotes

Fixes TROVE-2026-011, TROVE-2026-010, TROVE-2026-009, TROVE-2026-008,
TROVE-2026-007, TROVE-2026-006:
https://gitlab.torproject.org/tpo/core/team/-/wikis/NetworkTeam/TROVE

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index a70b9e9baf..dc7126174e 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.6.tar.gz.sha256sum
-sha256  a89aba97052e9963a654b40df2d46be07e8a6b6e24e5437917fd81acd90a7017  tor-0.4.9.6.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.7.tar.gz.sha256sum
+sha256  5a740f32f688ac89c066345c38b47ba286b0c4394d351b251ff48b6a5394618f  tor-0.4.9.7.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index f11afcc449..6d60bc135e 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.6
+TOR_VERSION = 0.4.9.7
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
