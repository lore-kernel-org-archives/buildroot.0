Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D4CCD4F5B
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 21:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F01240ECA;
	Tue, 19 May 2026 21:28:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2-gH3W8c1tD; Tue, 19 May 2026 21:28:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0F0040ECE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779226130;
	bh=MG0HSOoaWZCpE/Ch3rMINguy77obiNmuf0rR42lQAaU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XNaSwFD3ILVSa3K2Bi/kW2BNXClzgkMpEgin/a2JwJjBx+SHTnqvUzHJ/H74osUWY
	 cUQ2UL+be6R6y6CQBohEH6cSEUJSVu2RIcCGfsQIlCsC4j07+Dwf4sUWgyCzlbHcxP
	 TU/8MNW9DnP3bzbMsbqmvDB6yHiAhtWIS+LGHpf8vQd2pL9mh3bJ87VT0m7DuQ/AjW
	 mtkP2avtze4ogbolt4ZcJVMKihG8IV2ydFhDNKq9CEI3nw3t9eFF+78lnHHZFBUfrM
	 txm2ENK6kE9xZZehn58xPJFAwTTqHUhOZezMufeydNeG/ew4Ia8LI5Q1twICaD0Rka
	 +D1MdJhGpm3kA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0F0040ECE;
	Tue, 19 May 2026 21:28:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 214391B2
 for <buildroot@buildroot.org>; Tue, 19 May 2026 21:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0710281E77
 for <buildroot@buildroot.org>; Tue, 19 May 2026 21:28:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8XJGBE35l4g for <buildroot@buildroot.org>;
 Tue, 19 May 2026 21:28:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 21FDA81E74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21FDA81E74
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21FDA81E74
 for <buildroot@buildroot.org>; Tue, 19 May 2026 21:28:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0431.dip0.t-ipconnect.de [91.58.4.49])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 220F2A4C2D1E;
 Tue, 19 May 2026 23:28:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33292)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wPRzZ-000000004Xc-3qQ2;
 Tue, 19 May 2026 21:28:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Tue, 19 May 2026 23:28:45 +0200
Message-ID: <20260519212845.1235400-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779226126;
 bh=/YeE5ZRG7rGtbic926c4QKf1YHJ3VQdBH6mYlQH/xq0=;
 h=From:To:Cc:Subject:Date:From;
 b=ZhxDOUiKQvvm0/1CTVSRfP6b6pIsStG0o9qkZmZxHa6RvHXupGADSwVzx6aibbp5S
 g2ThZD2XFjVEO3Stzilhorjx/hZmomE9SE9VuZ4lRaxKB1y8aLd/BCLXcKxEbPcz+u
 9ig8i2QSERQKcSbmCFh+cftscqPtNukNTDGrgENycPwxHx40JK829c21yavAhxnVYQ
 3itKgrGyWByrSnlYgUD5vhgA+3C1u97xA3dNpSHZLtCmteg6uXgV1xse8SYeDA4vo5
 P3y09ugM/RkhwwK1V3Y6zauepHEL49MSt/KapVnwKyxOb3O3RDHznyGo7Zm6+wn/Yb
 eoVORserNbqIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ZhxDOUiK
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.1.1
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

https://lists.freedesktop.org/archives/mesa-announce/2026-May/000851.html
"The bugfix release 26.1.1 is now available."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index ea6c328134..83e0d6a5c7 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.1.0
+MESA3D_HEADERS_VERSION = 26.1.1
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index ae95f9cd3a..93a9680a1b 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-May/000849.html
-sha256  a5095e6dc2986c78f0cef4c5555dc803e93b6bfe5670e991f9e8bd49395bae19  mesa-26.1.0.tar.xz
-sha512  02972b1a2e6a2d10fa9c970ab579ddd6f0d3acfb782d82616b91cca7a28dd494b15fb14748fff333b1078898cf990a25666e9122d7fd41cb212a151caf933786  mesa-26.1.0.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-May/000851.html
+sha256  8bd36c031cc6d0edfec04617527609454ee3a09ad53bdf983b45fc2c1e129b2e  mesa-26.1.1.tar.xz
+sha512  384a7db33d2f06e287337329f2f17503082ba6b1cd876a1884e940fdb6193ffae6d6b14344625256f3b3b39972ad697130a4d2ea25c40979f7aa76c2176f7988  mesa-26.1.1.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index b4e1dbb689..ce5336f898 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.1.0
+MESA3D_VERSION = 26.1.1
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
