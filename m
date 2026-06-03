Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE4ECD6E69
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 17:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE03E845C3;
	Wed,  3 Jun 2026 17:47:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 67KG3pi6-fcP; Wed,  3 Jun 2026 17:47:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1D6E845BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780508826;
	bh=wUEbbMX70wf3LjtUkWQKUWWXgHHCmRoD0zWqXEt0Bvk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HEPqsDuZ9Lq+AgJo8GmD5nFVCsva3qkgGjh6BidoB8bTccqBOvYwDFFbGvkcT0Yl2
	 97yTqcgHILUh9ywmaw50uYiSIfo3XtJr5ClXlIy3bUKKCx4H5Fm3VZu/7VHBpLtjvj
	 WGi7ctsjRA7upIOXOyCV/ZFrRP3aQVneljq04FdB8HDOvu1ckSjk5kXMymy4ur93bg
	 Pq3xxaF4b5+QB4QbRSvWG+oerfom8XbxCwbaeCO/ce8/2TzTZXpTWoHBd+eojVvNcJ
	 KAeqjE7t5y5TbLwbNSHNzKCeCvCt8JHf7wQGQT79NtA8D4YWSJAgqsE/hHXm1YvqZF
	 Deis83GAmQOSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1D6E845BC;
	Wed,  3 Jun 2026 17:47:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AF16C192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 17:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A060342495
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 17:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ALbl0mbJQExw for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 17:47:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 590A5424A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 590A5424A3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 590A5424A3
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 17:47:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d62.dip0.t-ipconnect.de [91.58.13.98])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 17F52A4C26EB;
 Wed,  3 Jun 2026 19:47:00 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44914)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wUpgB-000000006BU-34XM;
 Wed, 03 Jun 2026 17:46:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Wed,  3 Jun 2026 19:46:59 +0200
Message-ID: <20260603174659.3517903-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780508820;
 bh=0ayURaPMWEjl+d1iPxVm+vSGKtpykhB+qnxF0CiMKhk=;
 h=From:To:Cc:Subject:Date:From;
 b=e4Pgii5eRurUTUuvEV1Ct0ovmUcM5Kxt2hROJ7KG8pHZI96XnXoOi129MIiEZ5N1G
 Go8mZXd4f/635dfQY7irrITR8GkyC70TTll3swICG0rj2AqUQ1dEsfUOIu0rSpWbuD
 hrTFbjqn6c+eUdiO8wlU2eU19KbpxKjMameut5gsGxaLCTN8Wt1OinCAr5NXCtDXW5
 cysT72tyBodZiKHoZ6W//FEN54bMCBbWC0RVxKgJ62y34VnX1T38tTpqlvUdMZXOl4
 8CpJgz6k3KjFyvTVZk/Axbfn8sGqAAvKh6U16JmzLOs9hC8VPBdRh/ImtLskQS8DEW
 Dx2lS7AxCh09w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=e4Pgii5e
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.1.2
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

Release notes of this bugfix release:
https://lists.freedesktop.org/archives/mesa-announce/2026-June/000853.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/0bf4938946641faea4a0c654fe7ce5527eb25911

I also tried to start a runtime test but failed:
https://gitlab.com/bkuhls/buildroot/-/pipelines/2574086081
"No matching runner available"

 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 83e0d6a5c7..3c6f2ee1f2 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.1.1
+MESA3D_HEADERS_VERSION = 26.1.2
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 93a9680a1b..deb7ea7f7b 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-May/000851.html
-sha256  8bd36c031cc6d0edfec04617527609454ee3a09ad53bdf983b45fc2c1e129b2e  mesa-26.1.1.tar.xz
-sha512  384a7db33d2f06e287337329f2f17503082ba6b1cd876a1884e940fdb6193ffae6d6b14344625256f3b3b39972ad697130a4d2ea25c40979f7aa76c2176f7988  mesa-26.1.1.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-June/000853.html
+sha256  bac2bca9121897a2b8162e79636b50ac998fca799c8e6cf914edd85962babdf0  mesa-26.1.2.tar.xz
+sha512  08e7b6357c27bf6e13f59e6fb0f84b73ec25c2d1a01cd09ffcc35ab263f278f10f3bd36fde419f60e78e781abcb315a432d0d5ceb3bab0bca26b8a2a39758e03  mesa-26.1.2.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index b229b02378..905afece1b 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.1.1
+MESA3D_VERSION = 26.1.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
