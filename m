Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512D1CCF2C0
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 20:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A063360AB0;
	Mon,  5 Jan 2026 20:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N6NbQDgo0khM; Mon,  5 Jan 2026 20:35:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36D0D60692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767645318;
	bh=hbj2iD4Vr/54DIXQBsVe57jngH3r0JPaF9s5SyGcZ9c=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=aMgZma4jeWgj3ZonDg6gSZ3bPGvjNYfeRhbvNWIdr+SBhm8g7eDoBxAKdFD559KEn
	 0yiqiUfYwayy1SuvZzFbY6dfC71zDWL0MNVnv7bYlXY4oh/xLn2wxgrYXGURyDR+4o
	 UratCOuaSIKdn/LqtekX4EBqDCoRZ5Aq573Ga6+dpFcor/jvp6H1V+v9uvBGxzYWy6
	 Sb+1sR44jzH7NRYdVj/t9W1Khr/lWJRDFGzbII8NSnFN/8Ehu/C9A+guja4KCN1wWW
	 XGTiysy7f3ADtozLSxClwIDldgxVgv736atWWJT0sfWM7/Uw1YCfXAMjIh+/JD1Iiq
	 j07tSrBYg/M6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36D0D60692;
	Mon,  5 Jan 2026 20:35:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BDA0EE7
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C9CD8129A
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Hk8B2e8zJ2L for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 20:35:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3ED1381253
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3ED1381253
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3ED1381253
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:35:15 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 5D59C19F57E;
 Mon,  5 Jan 2026 21:35:12 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon,  5 Jan 2026 21:35:06 +0100
Message-ID: <20260105203506.997611-1-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767645313;
 bh=BK/VdNr6ptKencGLlufUaPpt3PN+c1jCmBihhGs3LRg=;
 h=From:To:Cc:Subject:Date:From;
 b=Kd9Xl5M1Y/kEdg1Gf+0UrJUvYnBKkVgpmAMUMDsrG2M5nnztNjKIO0W/MgLPliGRV
 c6cUIV1QjMaSQf7JhzvS2x9nybeqmK+gEZYMV0lWKD9yfpT5QJP6uAuYrmBD3iHrYt
 Gpd//jbzKsyyMhITAucbyHXktdiC/jWw/XLD8JGdghNoggvE6veX69H5UUCEJHDTRU
 QhYDY1EibiTx9F6O7CwYa32FYVeT62PcQVamw0X9kp7VJikPx+rrhPZ4/8Rhu0ZV6z
 fcl5WoXEIiCOQNL/kvvPIz+QzXNsZzinQ8zQn2WZs0X2XZGxp/4zQ8+hCN5CCgMZuh
 AapgrBEspafbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Kd9Xl5M1
Subject: [Buildroot] [PATCH 1/1] package/gnupg2: bump to version 2.5.16
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release announce, see:
https://lists.gnupg.org/pipermail/gnupg-announce/2025q4/000500.html

Quoting the announce:
"""
Note that the 2.5 series is now declared the stable version of GnuPG.
The oldstable 2.4 series will reach end-of-life in just 6 months.
"""

Also, an important feature in the 2.5 series is the introduction of
Kyber (aka ML-KEM or FIPS-203) as PQC (Post-Quantum Cryptography)
encryption algorithm.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/12610896917
https://gitlab.com/jolivain/buildroot/-/pipelines/2246006250
---
 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index ee37e6a3af..feafbb328b 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  d4b76a8de78631b64b8c6f3725ed28dede40bdb4  gnupg-2.4.9.tar.bz2
-sha256  dd17ab2e9a04fd79d39d853f599cbc852062ddb9ab52a4ddeb4176fd8b302964  gnupg-2.4.9.tar.bz2
+sha1  3acefeef08c82a4d4a8ba36f95c2986fb925d359  gnupg-2.5.16.tar.bz2
+sha256  05144040fedb828ced2a6bafa2c4a0479ee4cceacf3b6d68ccc75b175ac13b7e  gnupg-2.5.16.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index d083ea850a..fafc383ec8 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.4.9
+GNUPG2_VERSION = 2.5.16
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
