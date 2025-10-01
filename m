Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBD4CCA470
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 19:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9AAD61458;
	Wed,  1 Oct 2025 19:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q0_mIPffC1uQ; Wed,  1 Oct 2025 19:44:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D32AE61459
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D32AE61459;
	Wed,  1 Oct 2025 19:44:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E8F51CE
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E92EA6145A
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0iQElbAUWHzO for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 19:44:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7AA5961457
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AA5961457
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7AA5961457
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:44:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0767.dip0.t-ipconnect.de [91.58.7.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 55A33A4C5926;
 Wed,  1 Oct 2025 21:44:48 +0200 (CEST)
Received: from [192.168.1.144] (port=52316 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v42kq-000000004Tw-0QL4;
 Wed, 01 Oct 2025 19:44:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Wed,  1 Oct 2025 21:44:47 +0200
Message-ID: <20251001194447.3261850-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759347888;
 bh=3BIozkUdmZvkdta6DW+uE3s9Xgr1J3RVoxZcCWadZ4c=;
 h=From:To:Cc:Subject:Date:From;
 b=lpsUObowKJSBWYyYa+30J+BIqia2F6n/xoNtxK4EXqaRtrY0dFTW1Y94WusFmbROQ
 02RpontQoAbRadex1hthNtGqrRxHeje8foYag0NYIWa+8f33X1LpZOk59WZjhkzgo/
 Ycho/Du0iUfqRA3c2S7Xtl5ev0eaeLPNIwtG/HZmW7rDSR9t1OIk9diy1JlkK+TMTD
 ppiDwVitQeria/2tGJvdrAmZKwPvuW7i8UrHkCXFfzdYjO5pAww4wXQ+0TqfktrCpB
 /Vke2muYWF9AM00bxzVLypWGU+tPtSjVeSQK00Hl9RTxTVYCAWKrTRZZNT008ttLyU
 egfYqLSWROg8w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=lpsUObow
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.2.4
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
https://lists.freedesktop.org/archives/mesa-announce/2025-October/000822.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index ed089298a8..fe5a10d9f5 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 25.2.3
+MESA3D_HEADERS_VERSION = 25.2.4
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index c4320461ba..0586b0f00a 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2025-September/000821.html
-sha256  f2d6b28562f1d6cb9c17ee8e58eeade7aa5faf927ae71065eadb41e17f92b4f8  mesa-25.2.3.tar.xz
-sha512  e03c09de2a6482a87362c0bf4fab4f9b32ffa48935a8724eb83e75b246f1bfc59524d04ea7e8cbea34e5c6ad2a0793195a076fe2d27da8fb7e05f56c7662eac5  mesa-25.2.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2025-October/000822.html
+sha256  a370b4c549cbfbe646b319e34d73edb50ed883978f5e95133f282f0eae39ab52  mesa-25.2.4.tar.xz
+sha512  ec74e1cc101b68ad2462399554273a9debb3d93a05c0a315cde3259b250d5828cbcef7771049b52beb01d07c34122fa5257451409b1d2b7fdcbf055c0f2c863d  mesa-25.2.4.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 27ce4f9163..c77d420b40 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 25.2.3
+MESA3D_VERSION = 25.2.4
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
