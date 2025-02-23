Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18890C021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 08:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B4F760BB7;
	Sun, 23 Feb 2025 08:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HmH7h3neGIRO; Sun, 23 Feb 2025 08:36:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9860960BBB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9860960BBB;
	Sun, 23 Feb 2025 08:36:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BD57943
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 08:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0791140B40
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 08:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bL853mSQ0Axy for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 08:36:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 99BED40B3B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99BED40B3B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99BED40B3B
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 08:36:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b302.dip0.t-ipconnect.de [84.161.179.2])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B83D2A4C5034;
 Sun, 23 Feb 2025 09:36:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38796)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tm7T8-000000006sO-0k7G;
 Sun, 23 Feb 2025 08:36:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Feb 2025 09:36:10 +0100
Message-Id: <20250223083610.14229-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1740299771;
 bh=v7u1Uf2SmkM8nlazVrfjgxS8zrZFb/uq3/MFPNbodxc=;
 h=From:To:Cc:Subject:Date:From;
 b=lozT2pPg+QmBxsnq+6PsuUdAxA06wz/RZUHVNrWbJA+go2SXR3eqEPXN8YAYI70DV
 ilhZE+6jo/6zn6nqD5HNaslo7aUYK0aC+OUvESSikO4BFCQXgWqnKfOAuMkYRjDy12
 QW2FmrSfqpD+wgZPlj/Vs80VIiLNk584qtJqbUrl8lbqbp8f8S0LtbuDIVUCt6KA5m
 hx7L8XFL54N2G5HK0HWEv15FacUNMpTFz8W599TllyPOvYAJRj8M9TYw4A7XhD0PQ8
 LSJirXqfiqpYyvj3SJ9dHEPvTsF60fS4wi/7Mv1zjJoKeXtrrhlLHO2y70BAggifbm
 +P15F3ScvRemg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=lozT2pPg
Subject: [Buildroot] [PATCH 1/1] package/qt6/qt6multimedia: fix ffmpeg
 configure option typo
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

Buildroot commit 553c55e9bd3cfa05cb84fa4cdfc5d25d51c3486b added this
package with a typo in the configure option to disable ffmpeg support.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/qt6/qt6multimedia/qt6multimedia.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index 517b1fccb4..98ab2ec4be 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -67,7 +67,7 @@ ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=ON
 QT6MULTIMEDIA_DEPENDENCIES += ffmpeg
 else
-QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=ON
+QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER),y)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
