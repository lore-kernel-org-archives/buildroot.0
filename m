Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860FFC3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 18:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54190813D0;
	Thu, 22 Aug 2024 18:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNybuFScXIm6; Thu, 22 Aug 2024 18:20:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44ACB819D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44ACB819D2;
	Thu, 22 Aug 2024 18:20:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A88DA1BF381
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9405040C9F
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z6_Zb1JYknPk for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 18:20:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6286E40C9B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6286E40C9B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6286E40C9B
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 18:20:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a54.dip0.t-ipconnect.de [91.58.10.84])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 762F5A4C2579;
 Thu, 22 Aug 2024 20:20:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51750)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1shCQT-0000000060E-35Lp;
 Thu, 22 Aug 2024 18:20:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 20:20:38 +0200
Message-Id: <20240822182050.65230-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1724350850;
 bh=UvKdPGXnfZa6v23tQSGr5AV05h+Dy0eyo+hJkcNHgUE=;
 h=From:To:Cc:Subject:Date:From;
 b=RTg3iLRE6oo14XX6KCVIeAzweAyqbcHvylqpZ1vGBWmOjEEx7rgjeB5q61ZVt08BZ
 T3P00GpDWAOti5S0321NY4Nzi06swej785HePhVjlduZPtE/H29Qcx0139npXgMhff
 NzO/fYPFbeZTvyJM0TjtmA20oJSzW8NijGfx6CeCduplcXEH8bIzzMGk1YPgEIFOGi
 7/C2hBTJIskBIectEvThf9zdI5J3JLJ0InMI2ucHqkV348JTlK0G4nrqdrSY/cGslm
 VuJrkmSHXvBIG+130H7AIgSAO6tnYdt3FjNUTqOsXXZ/7RU4yvJWnCEragmeEmTOmi
 zGtMTkz1LRkjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=RTg3iLRE
Subject: [Buildroot] [PATCH/next 01/13] package/exfatprogs: bump version to
 1.2.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Marcin Bis <marcin@bis.org.pl>,
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>,
 Petr Vorel <petr.vorel@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Louis-Paul Cordier <lpdev@cordier.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/exfatprogs/exfatprogs/blob/1.2.5/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/exfatprogs/exfatprogs.hash | 4 ++--
 package/exfatprogs/exfatprogs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exfatprogs/exfatprogs.hash b/package/exfatprogs/exfatprogs.hash
index 9f3100db7f..5ccad03ca2 100644
--- a/package/exfatprogs/exfatprogs.hash
+++ b/package/exfatprogs/exfatprogs.hash
@@ -1,5 +1,5 @@
-# From https://github.com/exfatprogs/exfatprogs/releases/download/1.2.2/exfatprogs-1.2.2.tar.xz.sha256
-sha256  61d517231f8ec177eeb5955fd6edb89748d3f88ba412c48bcb32741b430e359a  exfatprogs-1.2.2.tar.xz
+# From https://github.com/exfatprogs/exfatprogs/releases/download/1.2.5/exfatprogs-1.2.5.tar.xz.sha256
+sha256  f27160dcc1ddd17c96cd41a6ceef7037adc2796ab5c5633d3d85cf532c3ee2f0  exfatprogs-1.2.5.tar.xz
 
 # Hash for license file
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/exfatprogs/exfatprogs.mk b/package/exfatprogs/exfatprogs.mk
index 40d9072571..a541a63116 100644
--- a/package/exfatprogs/exfatprogs.mk
+++ b/package/exfatprogs/exfatprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXFATPROGS_VERSION = 1.2.2
+EXFATPROGS_VERSION = 1.2.5
 EXFATPROGS_SOURCE = exfatprogs-$(EXFATPROGS_VERSION).tar.xz
 EXFATPROGS_SITE = https://github.com/exfatprogs/exfatprogs/releases/download/$(EXFATPROGS_VERSION)
 EXFATPROGS_LICENSE = GPL-2.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
