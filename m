Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C372FA3726
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 09:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 786DF80EE5;
	Fri,  2 Jan 2026 09:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sFQQ-6YjhhRW; Fri,  2 Jan 2026 09:47:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7347A80EEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767347235;
	bh=Rr4qvR+Qh+v6qBL9AIfojviTZaCKspiDL03LLphgzBc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=D3RTuBJvoWPL6PFEywMk1ezreWDALvkooZ79eBK5Oc7fqGJlD2qwqx22W+vXDwQG+
	 lKUipLj+MwYMkWR8JAA8N9hKFxWvIAcRa8GOwEM8+FJ4Ed2IobFYvoT32kD8gabCri
	 Pdl2sPZ3PDbk/4aphLg4jP98J4jlI+or8ckea0UgWR5VB8vR7akNObWK9ms21i7cPi
	 1aI1Ks0HyvHxLXWzEa4RwB0frRsPPSn1a7H2xddzuc+2XvDVfbDLuXyYJtIpELx92u
	 e24hfZtXbxs6FURTuKHmmx9nV2cCpZMRsVmWC5+KGSyNMIShanK0MhBrRlMd5a58LA
	 YWba6m/8LVYvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7347A80EEC;
	Fri,  2 Jan 2026 09:47:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 948D6351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 09:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 870EA405A9
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 09:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7AXAN61j7mVs for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 09:47:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C0C9B404CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0C9B404CE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0C9B404CE
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 09:47:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2503AA4C130A;
 Fri,  2 Jan 2026 10:47:09 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47794)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbbkS-0000000071E-2RNG;
 Fri, 02 Jan 2026 09:47:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Fri,  2 Jan 2026 10:47:08 +0100
Message-ID: <20260102094708.365613-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767347229;
 bh=qP36Atbgp2+Hw+swGCh9ShSrn4qYwoaBrf06W+JeJjU=;
 h=From:To:Cc:Subject:Date:From;
 b=qwFt1JkNMbs6qUYIjwIxYL82/ZpSxuNR8EAMRcPFXxI2OzpWpHg1mWbyDBHo0oJy6
 Dy5EKISL5vfx20qSElFCQNjYyjGBxa24U5gUvimM/NzljICqY5L2R+heoNo07ZUzdy
 4gZViOt4eRIIBf8Ucz2mhldyXCJmNXvz/Y3Kh3QoW+lioYel0KW7jQfEuLuJyoZbIJ
 g3TXlwzEYcsjyzhjWNSuGCj4Dmdn8IVzG9v2TzwsnH1zr588XMbG598W+tAgXM4TV6
 EIVjgeaPtCPvK69Ms92w+0I7pnWtE89W54ITk29VDU7xHK1n9XYqT1bXVp09Pw8Sa8
 hsUGD2IgUjNGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=qwFt1JkN
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.3.3
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

https://lists.freedesktop.org/archives/mesa-announce/2026-January/000832.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 88fd71f987..fe00d10c31 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 25.3.2
+MESA3D_HEADERS_VERSION = 25.3.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index f045d37f91..9ff2a9d82d 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2025-December/000831.html
-sha256  e69dab0d0ea03e3e8cb141b032f58ea9fcf3b9c1f61b31f6592cb4bbd8d0185d  mesa-25.3.2.tar.xz
-sha512  499cb0aa254b5a706fb6c2414c23b9d5d03d9397475f7ad16744b982303a2a2bf643ef7adc64870645ee4355b5f95695becd6caff7d7f7caf698e6269589aa13  mesa-25.3.2.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-January/000832.html
+sha256  05328b3891c000e6a110a3e7321d8bfbb21631d132bf86bd3d4a8f45c535ef6b  mesa-25.3.3.tar.xz
+sha512  232b39f5035f8a65c8f815c8b524e3570f229673a85cd3591fbab9136c80b4ab922dc959f51a9d0a11e91cc66f8cf7f30cd9b846bb9e1607e3a6c820d5c8045a  mesa-25.3.3.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 3e48c795c4..e41bf68d8e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 25.3.2
+MESA3D_VERSION = 25.3.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
