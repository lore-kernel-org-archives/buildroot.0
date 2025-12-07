Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C3BD2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB63760D50;
	Sun,  7 Dec 2025 14:47:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ha0qfqI--ypX; Sun,  7 Dec 2025 14:47:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D47760B14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118870;
	bh=sHdFad2COCBdUPowmXYCpsM0ru17LxyA4vRUDZVppKw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=N3RB1r/0MNCI2CHX07Cenj4NTrRnSkGkmZ1WZwyAxgXhlnzkmAnu98DfA+QlI2whi
	 4Q+AgvWaR0SJtMWLpH8jb3dfPEv4g/hIaUStUs9ymjl0pQHGbbrOU98XG38lzMXPNL
	 nd0l+Hjqn3d0sw/cEHz3M+ra9UAkvZ7663SNeWzhumpFhcM3BL1mbqvDq/0+0Y8YGY
	 p0e3ni1iASlyeKN7dX2FQ6Ddweu1FcM/WTwGphwo03ujq8wd6Eetyh6xauYze3TKM5
	 GQgd0mw43LjDzBAIFHrbIR8d0gQkJK9w2qjcNXQf8oqAjm+e81BA1qUmF+3/Ai4cH+
	 BdyekUhbOZuiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D47760B14;
	Sun,  7 Dec 2025 14:47:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AE752CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CD1940208
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EO2hK6PUWREW for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:47:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 33D8640166
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33D8640166
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33D8640166
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:47:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8687BA4C0EEE;
 Sun,  7 Dec 2025 15:42:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyI-00000000416-2BNa;
 Sun, 07 Dec 2025 14:42:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:35 +0100
Message-ID: <20251207144243.3696572-26-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118579;
 bh=Ash7/hXjBeo4dwXZxyHiAbYLlAizT9yWraH0fgEnzdM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=JlpJL+L/4GxcUUDwHutkK23XAYTW5dygK0sglRGwSRtnOlOLsSIQv3s1TJWOX8R1C
 cBmH9i27lXbBWsPB93HXZA/ChB/1fuJKMBCyLOZg7oE0XoVcaMFEij1UGh470+DD12
 AmUOs+xPwb8P/JX9ZGhWsRVo0l/EpjI5HtkzwL1TaF5TE0/PNnQu/Ls/57T4keeKyw
 QM2x0EnOb+LjpOWaNFGDRU9CkVA8xLkU9yRK8GlBeb7Ii58e/1WCn7qk1yPgzJ20EG
 HLLvd4S3qT5+9CWSC0Fh0iE14SuWJ+jGvFN5apqlGy9LsdYK1GAbVdmiuO2cvDVFKk
 9BN6Vo7+KXnJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=JlpJL+L/
Subject: [Buildroot] [PATCH/next 26/33]
 package/x11r7/xapp_xinput-calibrator: bump version to 0.8.0
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

Switched _SITE to freedesktop.org:
https://github.com/tias/xinput_calibrator/commit/92c40faea5ce899754490738e5cb24469c566d16

Use xz tarball instead of gz.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../xapp_xinput-calibrator/xapp_xinput-calibrator.hash      | 2 +-
 .../x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk  | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash b/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash
index b8fcaed039..a55b9b8c6e 100644
--- a/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash
+++ b/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  baa4ddca49ec94c27ba4c715bfa26692fec1132103e927213c3169e475d3d971  xinput_calibrator-0.7.5.tar.gz
+sha256  0508bf9705c0945f746b8c81bfc8d583a347dd067b58fa76b1aed4225e4b8b40  xinput_calibrator-0.8.0.tar.xz
 sha256  ba6f260bba7d9640cfedfde3a6ae1790583ab8b9ee7c547233ecc0a214d1a6d3  COPYING
diff --git a/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk b/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk
index be86608b85..9c5b8e235b 100644
--- a/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk
+++ b/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XINPUT_CALIBRATOR_VERSION = 0.7.5
-XAPP_XINPUT_CALIBRATOR_SOURCE = xinput_calibrator-$(XAPP_XINPUT_CALIBRATOR_VERSION).tar.gz
-XAPP_XINPUT_CALIBRATOR_SITE = https://github.com/downloads/tias/xinput_calibrator
+XAPP_XINPUT_CALIBRATOR_VERSION = 0.8.0
+XAPP_XINPUT_CALIBRATOR_SOURCE = xinput_calibrator-$(XAPP_XINPUT_CALIBRATOR_VERSION).tar.xz
+XAPP_XINPUT_CALIBRATOR_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XINPUT_CALIBRATOR_LICENSE = MIT
 XAPP_XINPUT_CALIBRATOR_LICENSE_FILES = COPYING
 XAPP_XINPUT_CALIBRATOR_DEPENDENCIES = xlib_libX11 xlib_libXi
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
