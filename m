Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36972CD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 16:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10DDD40F0A;
	Wed,  6 May 2026 16:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ng0_4LD8hgMR; Wed,  6 May 2026 16:33:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C90A40F13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778085192;
	bh=8p/AnVab3K/lz5SMzT8SRGhrTgXh5MUpWiX4ZRRhLZ8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CJ2SEcxOjjn97eoGzB6dsq9LpI1JDFeJU42KITEEkdmtec/pzgo+OAQti0NaVVfqY
	 6LpyjKCBjX7DjeMl0YlyjloyxZFnoXqZnwpV9YaMbp7W3yfnvM+pXKR7T3VKvl6h6A
	 8nSmYL/1j9HXT9waA4Pr5kzvedqEAeYGeqZBPyrJkXeN60OaIneo68yTrlphmzkg4G
	 WdREtzHc3/a+2JtTK/TU2i1KBrhMXStXZPS/15MinNH4QJcORluXEjoVyRITqBOEft
	 TCS24Iq44IuTHyhypzt/VcBtNSRxu0gJem1awzFIJkqA0IxRDuuiSWDegYdXRyGtzX
	 dOMuSUHtGMxfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C90A40F13;
	Wed,  6 May 2026 16:33:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7631C11B
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6851C60E92
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:33:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eyMFMi-oG92P for <buildroot@buildroot.org>;
 Wed,  6 May 2026 16:33:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 58BED60E91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58BED60E91
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58BED60E91
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:33:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc94.dip0.t-ipconnect.de [79.214.204.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9F9BEA4C2093;
 Wed,  6 May 2026 18:31:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51906)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKf9u-000000002XI-1opv;
 Wed, 06 May 2026 16:31:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 18:31:17 +0200
Message-ID: <20260506163136.1330722-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506163136.1330722-1-bernd@kuhls.net>
References: <20260506163136.1330722-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778085114;
 bh=5Yl3yZsESPnL3JlF2q0RAPsyuUABPtsLNyCeNyRtcYw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=SghNqHxMS5UL21RjFzAL/rFs1SrUqtURYNUDY1/iixAThdn6Vr/WerkhkbYKDUPAF
 F7psJbBFwKPnEr0iUa+rydK19/N8MzRaxbXiTrcoL9dZsQkPF6kW1FCZ6ALipVTptt
 1VcF9bhZZZuBoavfVLT1vNbt7bHHSEu8nHsnsKAKjQSrSwdzMPo/LjImTZjhTkQbHF
 s14cAVGtTs6iO5sAsISGR1yYq6qbnw6jc9Tq/mlJyYnxgBqZ1o0jFHL1QmKzCs1xD6
 DdoTl0/EqnRd64aKWD+Jfr7DwuJ/XVMqyEHk3o+WGSk5xdRkjZpxa6FsHmLV6nR3Iz
 hcw4CY43NcyRg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=SghNqHxM
Subject: [Buildroot] [PATCH v5 04/22] package/dump1090: disable -Werror
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Tudor Holton <buildroot@tudorholton.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes build error with gcc 16.x:

interactive.c: In function 'interactiveShowData':
interactive.c:334:49: error: '%5d' directive output may be truncated
 writing between 5 and 11 bytes into a region of size 7
 [-Werror=format-truncation=]
  334 |                 snprintf(strFl, sizeof(strFl), "%5d ", convert_altitude(modeC * 100));
      |                                                 ^~~

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dump1090/dump1090.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/dump1090/dump1090.mk b/package/dump1090/dump1090.mk
index 1ecdfca47f..9a18c356cc 100644
--- a/package/dump1090/dump1090.mk
+++ b/package/dump1090/dump1090.mk
@@ -11,6 +11,11 @@ DUMP1090_LICENSE_FILES = LICENSE
 DUMP1090_DEPENDENCIES = host-pkgconf ncurses
 DUMP1090_MAKE_OPTS = BLADERF=no CPUFEATURES=no LIMESDR=no
 
+define DUMP1090_NO_WERROR
+	$(SED) 's/-Werror//' $(@D)/Makefile
+endef
+DUMP1090_POST_PATCH_HOOKS += DUMP1090_NO_WERROR
+
 ifeq ($(BR2_PACKAGE_HACKRF),y)
 DUMP1090_DEPENDENCIES += hackrf
 DUMP1090_MAKE_OPTS += HACKRF=yes
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
