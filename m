Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CE4FC6165
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 23:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFF0840830;
	Fri,  2 Jan 2026 23:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9eFsy33la-vr; Fri,  2 Jan 2026 23:13:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D88A840831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767395600;
	bh=BW9IpeoLSVSRUB9NlF2znBeQC2eDVAeRh2N5QSt+3Yw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MOaB9GeX0zyFmLHOKmx0eYOVYi8YLwD2Yo3XtDFplOY7iKpmm2SjRdBKvhEiYsc20
	 khH+8ykrtK/3PxATKfJ+Q4bqtxtLNrg75YJB4Ia2wOnpB0Q3LfWKBB5N9z8mGOVr7j
	 ruMCofr3WNSzBm381HFWEMe79RggwaYLCNd4+8c56uFi6ZHXBK3yPlju9P5cqu979o
	 Xgap4OOjbZnArQFQPxR33XQKEZMI4Y3d55PBe+OwHen4aD51l6Y2iI+80OOFKLSQj6
	 knUBlN48GjsrdF4gL2eSdY/3A8lOwAZ0Pvqrs/li0Vz1uK9G5hpkkuBonRDSmydCOo
	 t0udiC7K36eVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D88A840831;
	Fri,  2 Jan 2026 23:13:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A1A17440
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 23:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87BF2821A1
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 23:13:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bMPkJ18wjX9A for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 23:13:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.116;
 helo=smtpdh17-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5522A8219F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5522A8219F
Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5522A8219F
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 23:13:15 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id boKVv7157BhI9boKWvGoSJ; Sat, 03 Jan 2026 00:13:12 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Sat,  3 Jan 2026 00:13:11 +0100
Message-ID: <20260102231311.131465-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFXBn+HoRw+EnK8UZXgbkgDgv5h7R/ukjT0wcqB/tzLEPq8UALoRNIWb14khb4/xN3fgJNuEPdldCJ0EQRX6Aowg149eVoZ8ADTQW2xIU0JC/4HB6d0+
 WA2DI6Ra62EaJAWce2u+RtX2yXk0r20ydDtAppMzOUAN6g4YFF761WnaCeFhkvBy+RLdf2tsjoQodV5lJlvlATU6ekft9b1yU2MQdAM7c19r2f+CXR4UA/Nn
 sEA36QniNm2V0iWs0CGN4PbEHhNdLGAlyzEDv16t798Z2tdaLj94zkbL1Ld6LqlCUh/1e9E9KY1WvYWB3/FeoTbwCTBjdrxxMj+hRbOocx8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1767395592; bh=MttPASrhKg4jMBlNfzWUevp5nQI6AaYgyFhEh6KHQvU=;
 h=From:To:Subject:Date:MIME-Version;
 b=Dcj16lRonlMpwxw2KP+D8po3B/TCV9XQLyd7Z0eaZ3qbN8lzlzaecCDAn4blHD98K
 xCTTu9AMYAOU9l1hyyWXK/dNOznPYc+dvFhmDo8CEJU/kEOYR+L7xO52uVcM85kHHs
 hgoI2xTTSeSGjSUANzyyVJhRgVkcvoRe4hn4p0HSJspihqgiKoTgdE7Aq6gGZp5zq3
 /On75r5utFeehNz5F6/SIjhBcSOVtVbokaFy1Xgp+8It++9OZiUB6lwGpRhhld6Mag
 0kswETzYZ/ADwpjnYBV5HH4U6/0KVLDgnig76gSCWGIYuZpMQU0KoFvLO6hvHXh985
 /O1qmAtN0pvfA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Dcj16lRo
Subject: [Buildroot] [PATCH] package/libtracefs: bump to version 1.8.3
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

Release notes:
https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/tag/?h=libtracefs-1.8.3

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libtracefs/libtracefs.hash | 2 +-
 package/libtracefs/libtracefs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtracefs/libtracefs.hash b/package/libtracefs/libtracefs.hash
index 17036c3f00..d4f6b95094 100644
--- a/package/libtracefs/libtracefs.hash
+++ b/package/libtracefs/libtracefs.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  255980e1da5648fbbc32777ed8457b485b2b96f3449674610b46d9c437271209  libtracefs-1.8.2.tar.gz
+sha256  a9cd9cbae81b7fff71b3f72d2b819e49cec0402529e5f252e1d9319a62a356cb  libtracefs-1.8.3.tar.gz
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
 sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSES/LGPL-2.1
diff --git a/package/libtracefs/libtracefs.mk b/package/libtracefs/libtracefs.mk
index 6b8f838c2e..e9e577d985 100644
--- a/package/libtracefs/libtracefs.mk
+++ b/package/libtracefs/libtracefs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTRACEFS_VERSION = 1.8.2
+LIBTRACEFS_VERSION = 1.8.3
 LIBTRACEFS_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/snapshot
 LIBTRACEFS_INSTALL_STAGING = YES
 LIBTRACEFS_LICENSE = GPL-2.0, LGPL-2.1
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
