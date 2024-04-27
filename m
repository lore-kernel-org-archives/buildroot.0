Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F37C4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 08:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7204660611;
	Sat, 27 Apr 2024 08:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cS3G2uDC2OYh; Sat, 27 Apr 2024 08:39:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73E1B60625
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73E1B60625;
	Sat, 27 Apr 2024 08:39:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A14471BF29C
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 08:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BB7C60625
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 08:39:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id obNGw0S8lr1n for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 08:39:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A0C3160611
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0C3160611
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0C3160611
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 08:39:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0289.dip0.t-ipconnect.de [91.58.2.137])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BFECDA4C256E;
 Sat, 27 Apr 2024 10:39:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41598)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1s0dat-000000007fH-2OKf;
 Sat, 27 Apr 2024 08:39:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 10:39:39 +0200
Message-Id: <20240427083939.13278-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1714207179;
 bh=vX3/wc8bSfmFuTCL+qkix9AxE2s6BF83rAWo/KZXhWs=;
 h=From:To:Cc:Subject:Date:From;
 b=uN7HYQb3V41oNzP2kNpMWmmIGaxfP/2OBvvSNUbtc+6lln6vQA20Gqk+0WIhFWZvi
 vlwlISNs2CB784kvT+MGkgr2j3cfYB2NZq1oeCTRtYAArj1i8Hqm6gRQ1cihQeN1hB
 MXXIFZyDydlqoa+vag50KjgJp8c/BGXuY9ud6fbcGVt/4Ik6olasD8dRbHu2TEahOL
 cgTdnK7tnmb5o9rDARwW4dS2hph0faZMC08P7tRMkH5rNbeNKh8FtfgdrvSkWy4vDj
 /OkGFtPSM9EhVESG7Jc1shrXXy2xundmQ+B3Xdoj1lyqDwzZu1oPP8djUtyKhzJdQd
 A63IBYJDHNq5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=uN7HYQb3
Subject: [Buildroot] [PATCH v2 1/1] package/{mesa3d,
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
https://lists.freedesktop.org/archives/mesa-announce/2024-April/000754.html
https://lists.freedesktop.org/archives/mesa-announce/2024-April/000755.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: squashed bump to 24.0.5

 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 0756296a01..e1f6211e17 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 24.0.4
+MESA3D_HEADERS_VERSION = 24.0.6
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index e2e0be2641..fb3df96555 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-dev/2024-March/226176.html
-sha256  90febd30a098cbcd97ff62ecc3dcf5c93d76f7fa314de944cfce81951ba745f0  mesa-24.0.4.tar.xz
-sha512  1d05b07026417fbe9cf18f7b18f2db9fe5fe327555c590283d87f69bbdd51f64135928a1dbe155d750187fc268bbdbb070bc1ae9ffc3e013b8707b391969d515  mesa-24.0.4.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2024-April/000755.html
+sha256  8b7a92dbe6468c18f2383700135b5fe9de836cdf0cc8fd7dbae3c7110237d604  mesa-24.0.6.tar.xz
+sha512  60fcc77132c3cb0c98e650d97d3324bfd18abe7f8f8a3aa5209f71b2fddd94510f939bbf5272b2241749307184d5badde9da4842be57ce13f5760875885ea6fc  mesa-24.0.6.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index c2343488ed..39cbb4c23b 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 24.0.4
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
