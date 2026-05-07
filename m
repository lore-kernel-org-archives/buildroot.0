Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A78BCD3442
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 17:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00C7741195;
	Thu,  7 May 2026 17:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2qnKwEDpD1Ok; Thu,  7 May 2026 17:40:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 262F7411DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778175636;
	bh=1u+6VIiwycZB0qHu2qEWRM5Ohb+Qi8elTlmYuVFAeiA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SpAdfZKSRj25yhiabBwngSKcASZiGVzu787JnGCULn+5HYHdwJiW57rzVdpfRo8lR
	 CTHTy1TlaXlNxC1QTeLKiQlZq53OCJLotddOS92HV7X5XAzcp3BcakwV5GwgrXihCD
	 fhufPZlHm3zxqfjOeHZe/7m9ZrW/6+A0XnkrOdW8BpSXEzUX4CJFNGvCnej6HtvYXA
	 Kx4hKmIb7pf7FVGyAyLCz9iQzDMV+A46TSjT/ETe2is3G2hs64ggEf4ca8KVCXkwal
	 xcmQYau8PN0/JRE72szSdExeNHmBJEDx3m8xNJaXzTdRxK7Nd6meguiIOIKvj/JsgM
	 sc1U6g3pVxvNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 262F7411DA;
	Thu,  7 May 2026 17:40:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 41A472FA
 for <buildroot@buildroot.org>; Thu,  7 May 2026 17:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 273B8405DE
 for <buildroot@buildroot.org>; Thu,  7 May 2026 17:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7gmr66zk8FCr for <buildroot@buildroot.org>;
 Thu,  7 May 2026 17:40:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 455FE40084
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 455FE40084
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 455FE40084
 for <buildroot@buildroot.org>; Thu,  7 May 2026 17:40:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c188.dip0.t-ipconnect.de [79.214.193.136])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 77A2AA4C16C5
 for <buildroot@buildroot.org>; Thu,  7 May 2026 19:40:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60386)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wL2i7-000000005lW-0bbt
 for buildroot@buildroot.org; Thu, 07 May 2026 17:40:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  7 May 2026 19:40:31 +0200
Message-ID: <20260507174031.4074853-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778175631;
 bh=s+TOb4kK9ZNKAfkYv5l0DhFnDJ32ocLvQMcpxLjad/M=;
 h=From:To:Subject:Date:From;
 b=Rf+elq0jIdunhCgm8t8fpTPOi6uMq1bBdou0mWCJHPIa5nmQM24UCmEymyHMX/HTQ
 /kbkywBLeQxw4QZuMvYSuMdqOGrsBbZ6vXGrgEdCISzBVkKowODe5hbjiK31iSh3VQ
 ji5dSTvifg2WR8ZiWGTTmuysWHBNpKN+D7bqGV77dUy1hETP/1RY+hl7VChDmLAJDk
 +OdpXKCQ87/gpoHH6BuN+SwEuluqGdNLwwKfyUwsooXDC/fQHUq3yO1Q2m4OBH+ivx
 NX0CpMTKArUjhYUuZez9M32aPiXPCJzE0N+M36eHfQ5mP+JPXW/ftOccUHfATkYXj4
 oL+XaMwPWHIMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Rf+elq0j
Subject: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.9.8
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

Version 0.4.9.7 fixes the following security bugs:
https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.7/ReleaseNotes

Fixes TROVE-2026-011, TROVE-2026-010, TROVE-2026-009, TROVE-2026-008,
TROVE-2026-007, TROVE-2026-006:
https://gitlab.torproject.org/tpo/core/team/-/wikis/NetworkTeam/TROVE

Version 0.4.9.8 fixes a bug introduced by the bump to 0.4.9.7:
https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.8/ReleaseNotes

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index a70b9e9baf..f748afecfc 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.6.tar.gz.sha256sum
-sha256  a89aba97052e9963a654b40df2d46be07e8a6b6e24e5437917fd81acd90a7017  tor-0.4.9.6.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.8.tar.gz.sha256sum
+sha256  ac1f394e2dd2ab0877d27d928fd0d9e86662fe3ca6afdffb9fd9b6f0f96d05de  tor-0.4.9.8.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index f11afcc449..a24708ddad 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.6
+TOR_VERSION = 0.4.9.8
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
