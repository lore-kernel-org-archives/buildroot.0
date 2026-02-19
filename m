Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D99CE9A048
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 09:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81BAF821CB;
	Thu, 19 Feb 2026 09:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ztkKIO-YH_km; Thu, 19 Feb 2026 09:33:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12338821C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771493618;
	bh=oCsKzHGW/T/CUW89oL842JS3RnR6Y6mHLUqIOCvgtxg=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=CnGyrFrjej4ME3S1L99duXIQcAPDIdaZnVEi/CjZEhVcsOxyvvOrMEOY1QaYW1uu/
	 olbhPjtFElFCX3RxGImpTLWI4zNe5QEcBtLnyHMfhdGtZWoW3bTMCyeCxBOWzwoJyH
	 u1Bk4s/iDiCeVm4AtINjfbVQF46c5vZTAManpsepmVFrJGkrCqmuT7hLDhihDSY78V
	 cYrDgrEd8TLuGxBE0aNazOerrAVjqhTY5reirVYajUlTsUhkMj6hcHMiNc9bUdsrV7
	 bueSOxiznFDDvaZU76f23dMaT23YK/7zxk72GePEzXRDpWMtgc0samXW3W3e5P/ub8
	 BON36c574/c/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12338821C5;
	Thu, 19 Feb 2026 09:33:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EF611CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 09:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 706F24039D
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 09:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ej930gi0Qi8I for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 09:33:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6945240395
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6945240395
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6945240395
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 09:33:35 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id C90A72C83203;
 Thu, 19 Feb 2026 10:33:32 +0100 (CET)
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>,
	Sen Hastings <sen@hastings.org>
Date: Thu, 19 Feb 2026 10:33:47 +0100
Message-ID: <20260219093348.2147559-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1771493612; bh=4ZRF4GkNTyiWBgI1R0xl4W/x4voKMX4EeDdiPSPHCr4=;
 h=From:To:Cc:Subject:Date;
 b=bDNLYBE1wKH0gqNBrvYFZueZch6yukisyh3cTm7Pog/wRJhQpkKHkjxKbBwPHkaar
 IxotAeqnqfqXJksijH0oWSCDkyj5D53H2b5SzZRQcaPw5GPOPlrHaLHXvhyYShv9ME
 P0zVhng0FnmSfa1GvNUYLg7qNLBmX9yicIZ6Ge8DLyHvNKm3d4puD1C1jAvRtMUMRN
 JHqfvDLgoHxvB7C5FKusaxQ9AOINtjwfJX0fdiCC2FWP8AL2YRa1QMg7eBOnXmjXm9
 ifjDaLIvxlmIV/yD7WcDdCMwMIAd1TSAo24jTAWnR0yZpKrUeP0EeOLlpiXjaMu0Bn
 ZJCbNASflvCsQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=bDNLYBE1
Subject: [Buildroot] [PATCH] package/systemd: bump to 258.4
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes: https://github.com/systemd/systemd/compare/v258.3...v258.4

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 193c6b5eb0..d5a97ffcbd 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  a800facc2effb509bff67700ce1224da96a36fb658e29e03c843fb74fa1edbdc  systemd-258.3.tar.gz
+sha256  5c95e54e555b21594ab11e76f91a092c6383553ed725292eb0a929bf2fe028ae  systemd-258.4.tar.gz
 sha256  ac4985facb553559981f507982444d779115e3e3a4c8b7847ae956198490c1b3  LICENSE.GPL2
 sha256  6d9bb3b7fc818a8facc4cc296060a0883fef8710d6498f86165335846e82ee9d  LICENSE.LGPL2.1
 sha256  c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad  LICENSES/alg-sha1-public-domain.txt
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 7ed777b6e4..4b488857fd 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 258.3
+SYSTEMD_VERSION = 258.4
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
