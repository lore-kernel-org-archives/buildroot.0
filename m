Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34F9C52D7C
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 18:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C59D813D0;
	Thu, 22 Aug 2024 18:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UMCCZ83SvRJw; Thu, 22 Aug 2024 18:21:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0AF081E07
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0AF081E07;
	Thu, 22 Aug 2024 18:21:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EC4CD1BF381
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D931B40CA3
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FpseP-W6__v4 for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 18:21:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A5FFB40C9B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5FFB40C9B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5FFB40C9B
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 18:21:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a54.dip0.t-ipconnect.de [91.58.10.84])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ADA0EA4C2613;
 Thu, 22 Aug 2024 20:20:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51750)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1shCQT-0000000060E-3qaC;
 Thu, 22 Aug 2024 18:20:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 20:20:40 +0200
Message-Id: <20240822182050.65230-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822182050.65230-1-bernd@kuhls.net>
References: <20240822182050.65230-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1724350850;
 bh=WiZyRDSS+lcxIoyA/8dVD7Hmkt01mQOMe6yhrbnQYmk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RFVR2VCwMsS3EVNM2AqBvAPSpo/yxplZgPnXSEWvZwo1xp9784r09OiSgERxPh5Hz
 3VNTV3CBvGvoi48s7gsUimoKb7cEEKIPYRNE1RnSqdPz2MDPf3/ZVX1/bR8Pj7pCZS
 0bSdAZ/BqZ2KRgWwvGXTZbhQadJnowKh/80ZE3myBDPbhiOu7zuAXGC+EgNkQWrZEM
 BjnaYl+x9vsOlhcVuTEMTpuVeFoFVor5ticB5Q40g+TZ+80KNYwcAWo4kY+FA+zH/I
 mhpPT4Pc2IP4owngq7ksNU/ojucKXCAYMQ5MT/TbolGwcdv7nbu9fUjs3eru8Ljyn+
 kVfGDkwFRnHxA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=RFVR2VCw
Subject: [Buildroot] [PATCH/next 03/13] package/libheif: bump version to
 1.18.2
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
https://github.com/strukturag/libheif/releases/tag/v1.18.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libheif/libheif.hash | 2 +-
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index ed1a083d7c..26b21e1897 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  8702564b0f288707ea72b260b3bf4ba9bf7abfa7dac01353def3a86acd6bbb76  libheif-1.18.1.tar.gz
+sha256  c4002a622bec9f519f29d84bfdc6024e33fd67953a5fb4dc2c2f11f67d5e45bf  libheif-1.18.2.tar.gz
 sha256  b2eb4f6588b005bebac44cfb2dfd23f6a16c5ca9b8a619a315158b0215a917a3  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index e2c3a328bc..4783ada19e 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.18.1
+LIBHEIF_VERSION = 1.18.2
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
