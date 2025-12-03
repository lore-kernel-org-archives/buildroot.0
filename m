Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF1DD1BDFF
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61F0540672;
	Wed,  3 Dec 2025 22:04:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9MfkPaSIc_tK; Wed,  3 Dec 2025 22:04:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 801ED40733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799475;
	bh=qTnm6nsuNfmgk/QqV3trop7opFgeIevmFlnVIR28YeI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TCaTD3MXkPJb96iTRbLCOd5BubT0HGwFkW81WZOff+jtzueYK1Wm6GmsaSM7GyaF6
	 rTwKQfNt7BEVewXX7mGIZYTWfH0tC1UOmW3R1zbnHPkUJClae39u4LcMflZ15TVEHJ
	 PTimHkPeNNxfIh+eBvsXgwUXFppB/vOb/3BBzmm/EIzZBc2GxAiOzl99fJoh5yMNWS
	 1UmOpbXhsvTTwJ6ZtEV7Lu+/tFUo5CnxZ2WRl/AIrFsBlkmQTmKqLfl7aHZJjJhNAy
	 vnNApE/CE0Icx1veIDwACjkPvkRmatqlux8mP5bMmSG+B3q62A8u2eQR3XrewTtylM
	 OWd900nde08gA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 801ED40733;
	Wed,  3 Dec 2025 22:04:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AAD10D3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 912A5401D4
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:04:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q3R1JIW2Ud8M for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:04:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 793B84004E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 793B84004E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 793B84004E
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:04:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CD492A4C79D3;
 Wed,  3 Dec 2025 22:59:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56204)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQuqh-000000002OS-3fMe;
 Wed, 03 Dec 2025 21:57:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Dec 2025 22:57:17 +0100
Message-ID: <20251203215723.2323032-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203215723.2323032-1-bernd@kuhls.net>
References: <20251203215723.2323032-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799146;
 bh=ZXTPbL2GzlmvL+lpvA7AdESKoG+xpPMHsis+F8dfkA0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ZLpe//7ENWqwW2i1PdK1GvVuKdeC10kBmxVSbL6v1rDnZns2OHsf7nulpp2dadAXD
 fP6ZOXm3rzfkgoazngzb49ytucu76L+eG6v8MjpLIyWyG7QG8SQljRhuj8ApRJ8Ah5
 PwAnpFoHE3mqSVXDUBdbVbXkeZV5jn48XgRtNWKdRvQeUglR2OvNgHZTXMo2/sIIQR
 //m2A1KSMZyNs7VYS/drnEA62UWTtDZ3WMyH23Y/byu/GrgVxyAFELURMruQn6MZ9R
 ZssdsvEzbgrwOCDW+IN8xTkX+lkmc7iSIMdU9IsAryBq7kSrKx5i7/JjQROdmeNMgd
 vZ5kLA/BIaFrA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ZLpe//7E
Subject: [Buildroot] [PATCH/next 10/16] package/igh-ethercat: bump version
 to 1.6.8
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, RJ Ascani <rj.ascani@gmail.com>,
 Daniel Nicoletti <dantti12@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://gitlab.com/etherlab.org/ethercat/-/blob/1.6.8/NEWS.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/igh-ethercat/igh-ethercat.hash | 2 +-
 package/igh-ethercat/igh-ethercat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/igh-ethercat/igh-ethercat.hash b/package/igh-ethercat/igh-ethercat.hash
index daa9aca8d0..9f1172464b 100644
--- a/package/igh-ethercat/igh-ethercat.hash
+++ b/package/igh-ethercat/igh-ethercat.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  3fa09d623c2a9488bc6c40072b080ef719a4e78d89e30cc0ddbaabacd4875e37  igh-ethercat-1.6.3.tar.gz
+sha256  e9b97d4a8c3a1224fe9119ada448f4024bacea2ca940a811073170e42d828b76  igh-ethercat-1.6.8.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
index 1d93d473da..03f004d2b4 100644
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IGH_ETHERCAT_VERSION = 1.6.3
+IGH_ETHERCAT_VERSION = 1.6.8
 IGH_ETHERCAT_SITE = $(call gitlab,etherlab.org,ethercat,$(IGH_ETHERCAT_VERSION))
 IGH_ETHERCAT_LICENSE = GPL-2.0 (IgH EtherCAT master), LGPL-2.1 (libraries)
 IGH_ETHERCAT_LICENSE_FILES = COPYING COPYING.LESSER
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
