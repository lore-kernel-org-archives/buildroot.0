Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87532CD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 18:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6110260ECB;
	Wed,  6 May 2026 18:42:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hGIy-qRcvvzE; Wed,  6 May 2026 18:42:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF6FF60EDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778092938;
	bh=OFNcmgJmgOFcZqLWgUkW040sBrmC1cZExiAYg7s5DQQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p1nua3mWGi1SunD2iYYW8SivhWW5NwZobqAaJzlz9+itJ7IygAwrbDiTz4CdGx55C
	 MK9NCeOoVDry9WOrA9oVrNg/bfgB+jKWVjVPQGtRBv1HEHq7FPi0UXaI/g6z+88aiX
	 SNF1q2Zq1Uo1Xsk6cN4aVKaWklL5fbPBJ6A0yz3zYStfnsEx7dPSPNXYGBo9916RaQ
	 BAus2mqWgz1V8s5Cs9rK4+dqwOsi3CTGRltiYCEJXYZG/dyKCvkApWfBzSdcKKkEYx
	 M2W6FYoHoHV2YxjxNDFMHpMyLFq+4H3Av7XMv6pFtyAy+CDfWax2Ln5ndtnvt1jMEj
	 h8jhwjxjaQBfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF6FF60EDA;
	Wed,  6 May 2026 18:42:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DCCB280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13A3740664
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:42:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iCqZuFidG7u2 for <buildroot@buildroot.org>;
 Wed,  6 May 2026 18:42:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0D08C40663
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D08C40663
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D08C40663
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:42:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bec8.dip0.t-ipconnect.de [84.161.190.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C1FCDA4C20DF;
 Wed,  6 May 2026 20:41:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38038)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKhB4-0000000040X-1OPy;
 Wed, 06 May 2026 18:40:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  6 May 2026 20:40:52 +0200
Message-ID: <20260506184057.665854-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506184057.665854-1-bernd@kuhls.net>
References: <20260506184057.665854-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778092861;
 bh=kPhu1kRprTxK2GNqk2mDMkNqlgUcXSUua1SD70Dn/SU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=cskLE8J5APK7RRCxY9S3FeQYzATTnIAhjvPLBiM0SoW89iHgJhNKnJ9yiQSvTsmKI
 eBFvnxn3KUnypBdY+b6p1uTuzYvQGBUZOociNT9F4s5+Z3WN3wibfrLwqCF5utpPen
 ffFnIITq3d3xfkDCFD5juwT1spz0HtloNBYfw+d0ChM8jpqqLWFMhzLkWmqRUg5n3z
 l/lNaRnvPP/1pE0r0UWFxF/KdkvcoMuK147DscIB/Z7dMhTwz86wx+RCArxMDEm4Nm
 u3aPqKpZ7IFAr2/oIBSUG7R2GdDcLQt8mnRYDaaI7NoFTRdKwq7tJpaZksfl47/rY3
 B/rYogH/nqNpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=cskLE8J5
Subject: [Buildroot] [PATCH 08/12] package/libv4l: optionally use libudev
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

From: Bernd Kuhls <bernd.kuhls@t-online.de>

libv4l only requires libudev, not a full udev daemon.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libv4l/libv4l.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index a535b8e8a6..ce0b356edd 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -42,9 +42,9 @@ ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
 LIBV4L_DEPENDENCIES += libgl
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
 LIBV4L_CONF_OPTS += -Dlibdvbv5=enabled -Dudevdir=/usr/lib/udev
-LIBV4L_DEPENDENCIES += udev
+LIBV4L_DEPENDENCIES += libudev
 else
 LIBV4L_CONF_OPTS += -Dlibdvbv5=disabled
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
