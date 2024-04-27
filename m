Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D50EC4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 08:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11265606CC;
	Sat, 27 Apr 2024 08:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WRXwpNL7_ZsB; Sat, 27 Apr 2024 08:30:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08CA9606E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08CA9606E3;
	Sat, 27 Apr 2024 08:30:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8813D1BF29C
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 08:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 750C9606E3
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 08:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zRESZy0vC9qL for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 08:29:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DEC5D606CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEC5D606CC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DEC5D606CC
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 08:29:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0289.dip0.t-ipconnect.de [91.58.2.137])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9CDE1A4C3DD7;
 Sat, 27 Apr 2024 10:29:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56482)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1s0dRO-000000006Bc-0avQ;
 Sat, 27 Apr 2024 08:29:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 10:29:49 +0200
Message-Id: <20240427082949.8719-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1714206590;
 bh=NQaGhjhKnqoCL04i9L4giw87nMxjJSDBPpHmjhqdWqo=;
 h=From:To:Cc:Subject:Date:From;
 b=usPzlNBbQ5khHT8rQcpDpz+d0ElMsUQvbGmVjVG1j6yA1Pbjl1JVVNiWM1Qzq8mZJ
 i9J/bsCFEtGujq7PK8d78nMNHBfANohUoF1yxHOU7PLLaCK9cpLLZMAMDS6AOD1931
 NrP8RMrNpFdRSusbCl743JBqG0Y3BxCqb3hCCwq7noIzVOyqcCJN8TUrLw6ry8b2IF
 otnC6wZsfHoYszI8es4ORbV3qTmt/gK/+kToQUpnEBRVAsrxHOYmgb6duiUzVAY5b7
 mWrHKe+dH0AT/xAs2PXWtiQilyiJ2uv3JiKJ2Dl9cRZDEsWU7AZtgDzxldwIjFyZNv
 dJl7qpO43/k+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=usPzlNBb
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 24.0.6
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2024-April/000755.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index de5ecafe6b..e1f6211e17 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 24.0.5
+MESA3D_HEADERS_VERSION = 24.0.6
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 8774b57bfe..fb3df96555 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2024-April/000754.html
-sha256  38cc245ca8faa3c69da6d2687f8906377001f63365348a62cc6f7fafb1e8c018  mesa-24.0.5.tar.xz
-sha512  9476af4b9ac8db5dce397084ef169927d10b28adea7e74aa5b3136810b499ac98ddf7ab564e7d1ff81c887208c8ebab3ad2d4e27e7f46136609b5c67527018eb  mesa-24.0.5.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2024-April/000755.html
+sha256  8b7a92dbe6468c18f2383700135b5fe9de836cdf0cc8fd7dbae3c7110237d604  mesa-24.0.6.tar.xz
+sha512  60fcc77132c3cb0c98e650d97d3324bfd18abe7f8f8a3aa5209f71b2fddd94510f939bbf5272b2241749307184d5badde9da4842be57ce13f5760875885ea6fc  mesa-24.0.6.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 26df2e7e7d..39cbb4c23b 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 24.0.5
+MESA3D_VERSION = 24.0.6
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
