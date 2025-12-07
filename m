Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E38D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 320B3821BF;
	Sun,  7 Dec 2025 14:44:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eC5hG3qjqDYG; Sun,  7 Dec 2025 14:44:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C80082144
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118642;
	bh=Xz+33YUwWNRZjeIPemHFjD8UVZpewr6wCUKn0DrQfBg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MUeF6eCbTOmEVdgajJpvnf5dOFwH1sKTVrAXi4zJijy2AVT6p0l43K+sxWsJswFU3
	 4VmFnDkObTfnO2isBAhvN91xxw/f1pZT1iN3LAm66eJvmjAASlOFFWn5Ly4R2RscX5
	 q+Vxn1JFMjsGxD4bCmGmW74l8BLA6HNyv15SB5oLFnXjMRH3T2vM1oJDqENIxw7IgQ
	 7hg+hOLmfx8HxNOYMLBjD/RElzoIm4snAP4Q+gsFRl6UQdJlIKvpmHcNI5+8zOKnhY
	 qlRo6cnYEcEP5A0zhXpIpJUOyRZL8sDTJ2vHEiNoOpgoAgMtSn7NAPpClUfdQwF15u
	 WBjtCpCnfcRcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C80082144;
	Sun,  7 Dec 2025 14:44:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E9B9151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7048240208
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K-0r9a5WcQPQ for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:43:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 65EAC40166
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65EAC40166
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65EAC40166
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:43:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EA5C4A4C097F;
 Sun,  7 Dec 2025 15:42:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyF-00000000416-3h7o;
 Sun, 07 Dec 2025 14:42:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:14 +0100
Message-ID: <20251207144243.3696572-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ----
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118573;
 bh=tQJyLw3QSGP1p1uhELy5V/pivquaRKWCGxTTHop7o8k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=N136fY+FvBALjJMxwv/fX6VT3QPPJa5NZbfZFrBrokyWAtJyAe5ZPYoAKIOzrBIIf
 bz7yHM807oL4eh+t8kyN+ce/bdqbxIkUomEUhyl6NYk/uCq76xv7TaWsZl9rYswoS0
 i2hV0CUVBiSx8p7zRgo2SY8ewL6Lnzq7ollErB34XTBvVduNcm0L45842ZukYsMhxr
 fcEANI+9RMIgOKwPkeH8m737iYufAqnE5JWCi9BefTaOpP3jEZ+sIchIbB7nGTxIV7
 V8stPHK3GOmPOlTrDQO/9E8+1tUrWjUvPPvLuZJcGiOd0NPoPHiVvCAoIgTwqv5qLI
 eHwxy5U8eOh6Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=N136fY+F
Subject: [Buildroot] [PATCH/next 05/33] package/neon-2-sse: bump version
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
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Jean Burgat <jeanburgat33@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Alessandro Partesotti <a.partesotti@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Prabhu Sannachi <prabhu.sannachi@collins.com>,
 Denis Bodor <lefinnois@lefinnois.net>,
 James Hilliard <james.hilliard1@gmail.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 James Knight <james.knight@collins.com>, Simon Dawson <spdawson@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/intel/ARM_NEON_2_x86_SSE/commits/662a85912e8f86ec808f9b15ce77f8715ba53316/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/neon-2-sse/neon-2-sse.hash | 2 +-
 package/neon-2-sse/neon-2-sse.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/neon-2-sse/neon-2-sse.hash b/package/neon-2-sse/neon-2-sse.hash
index f964d2fa61..828358e693 100644
--- a/package/neon-2-sse/neon-2-sse.hash
+++ b/package/neon-2-sse/neon-2-sse.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  4567ca8c8cbc8ce0ea3ddb9dc0f158707eb85c631cb400fd7010cd299cdc5377  neon-2-sse-097a5ecacd527d5b5c3006e360fb9cb1c1c48a1f.tar.gz
+sha256  bf46151b3b6dbf9e724d96e21f83f154251127bd1142e47cd0e1bf624cb579c3  neon-2-sse-662a85912e8f86ec808f9b15ce77f8715ba53316.tar.gz
 # License files, locally calculated
 sha256  7022f51b439a5915e933ecc270c83e24ca0cb2cceeb08b0132dcd4dbb03ed2dc  LICENSE
diff --git a/package/neon-2-sse/neon-2-sse.mk b/package/neon-2-sse/neon-2-sse.mk
index ee6f5446b6..20c4976f33 100644
--- a/package/neon-2-sse/neon-2-sse.mk
+++ b/package/neon-2-sse/neon-2-sse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEON_2_SSE_VERSION = 097a5ecacd527d5b5c3006e360fb9cb1c1c48a1f
+NEON_2_SSE_VERSION = 662a85912e8f86ec808f9b15ce77f8715ba53316
 NEON_2_SSE_SITE = $(call github,intel,ARM_NEON_2_x86_SSE,$(NEON_2_SSE_VERSION))
 NEON_2_SSE_LICENSE = BSD-2-Clause
 NEON_2_SSE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
