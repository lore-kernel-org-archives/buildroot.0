Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502A7C79F8C
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 23:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14E7E40575;
	Sun,  6 Sep 2026 23:31:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pYmF9mKM0eRw; Sun,  6 Sep 2026 23:31:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 387D740534
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788737513;
	b=MdOoC/CK4eICwW46lxdar9zY95g7lFkq1BNccWPg5nQedmP2hyctRsXJuwfhiVSKtDcU
	 vSUqC94ioNwCJP0habiolFLKMAxujEHUDmzfYyzHLkW8ujz7z2hkyAP8JnB9kWAI090Ck
	 r58Z40a9gcTE4UQc7Nh9InsrSMtWWnQfOQ7/zHdgscyLmJZor7sQm18svMyw0KC+8qvA0
	 8y0MqE3oisMN/bd+uAmaT9wvscDeEy56YC2CFIQfmmRlz6hoeMIWBNbu74ayQGZYD5UPV
	 jAh9IaG07fnilZLEto1RE87LLxdgjAo0XXDFCSIdjG9gYDOWFi2h7aA2egOTo+bqewQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788737513;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fGW8Rn/mNm532NN5pfMPZ428AA3WnmZqw2DkOGw5aN0=;
	b=PfOCPvsWowmGg8HXv9x93oD0VR8nXiHGkKtPmCmy+qFZbZaM0vY4vrNnYvksZRmg7WN0
	 FDzQkBkuPCP+dLiLK5atNtyy92xRmXaIb968xcb/wM7d8wYWNbkK/lfoAeGOf9w290kbu
	 PcDL1Gho60jbwuJkG2SFQWiUNBIYx3VQQrIrpotQ12VZWx+7SXnPIa0XwLoPWbaQBiidR
	 HIrjDhc/0yqTMqW0niI7yT8nbWqBp7ptSTFukstQ7jpxZ6daxjXEWBiVwmlXvQzMPoRUP
	 OxNxfqy8q8oiOBTPvnxf4j1nZSc8erL+9voXJklqPA2E1EyuC9Xg2aq8wvYWPS+ps0g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788737513;
	bh=fGW8Rn/mNm532NN5pfMPZ428AA3WnmZqw2DkOGw5aN0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TdMIeqEfYwwxN+LvdLcmH1TCE0aH4DRnm/HqYtdg1fFFPa0drtYn2/o9yNWhEPlfM
	 Pf8kLeJPzVoNgAj7wPIn6H+MrL7+FlK2VOp9R0A1ulYYQV3+H6bcI4rYHn1qwcm8Sa
	 ioXtOrbHhFvB8C4vVpRkwVh8aFE9yzNUhHJXLKfW1ufuAG9uDuxoF0gAHrxYkHifLj
	 Gbrc1zUbVVD8i/fDO0H3+U/Ti6KRcaZ66OIOWPp33/+ZOJELs0XmD/iU+SG8mbk7p/
	 gyuZZ31qEBKrjnSb2SMw1Rs1fr2yfkmf4fkyxEuNXF0UERyGUeKioJ8yS4Ni8+GJ07
	 i1ZYQHmZdkyCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 387D740534;
	Sun,  6 Sep 2026 23:31:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C082D970
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 23:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE08360643
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 23:31:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ut5MsLYpKyow for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 23:31:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 882A060640
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788737508;
 b=DBK7G1ynLzpOWOOEVPI1Hxk5neM+QOEfikfXr33ac2gOS2iWkNrND0HQ+4SvP43Ty3ot
 GxbrLv78JikZ/ZYxYLCoq4OVr++Bv8060S1uzTtoClag+WtfQtwajrMMmKij2GNClkCrk
 8YTGTTJ+KKOnuey6C1k8Lz3hvfdJvEogGBZGnhG8aHdo3fw++lm/4zTWUu18JLqgP9tJd
 5faTNWMoPv5452uEsCiB3pnHkyyNyM3b3xeACFcH1TPA1ILxMn2Zts2rfAnvRjWD4OsP/
 zrP3xRyQlSVPodVy4Wez5iP4IwotFLZKAXWCVlCOcYGrchjF1aZV+mAt3JXuPQMwpvA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788737508;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=rkl+Nuirnb6gSqTWQij5nBsocEMIaKMS0tK/eDe0Mjk=;
 b=j3gzi83ktF3eGy7OXPlabBf5dfsy9QTGaMs5w+ItFn+p4AugRQIDmPieIp+zN95EPCC0
 R+Vrp9CM4wdC2O+tvamv4btVr2/nNAT2TF12vr5NwjgaLUkoTtRM48fSOGGycu3bVVApl
 iRzW2X8iuU6UnmY0e0dDtMR2SsZHVzFHrD00M/+yltGU35tP4oitBR8GpUN8Vu7JV4UNI
 JArXaS1ChxIfHyimUJwYV42wk2OprUAQyQoCm6zdKHYSghL8eLATjdjpBbGvl6Pb5Sg+r
 D7CKEh9O/Ds0LqPBYogcWTT5dAKoD4a8G+hctMaVfm3BhZifZ6BUnN+bBXSi5IQmcYA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Sx1J+etj; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Sx1J+etj
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 882A060640
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 23:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788737461;
 bh=rkl+Nuirnb6gSqTWQij5nBsocEMIaKMS0tK/eDe0Mjk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Sx1J+etjvPSPLZtNAhk/luv/AdE2Sy7fhsxH9tFfAG5lUmaye/M2fRxQtQSzZo3Nr
 inIsMSlvejgBp9lyE1lKtpx2/qTNM9S0DJ+AvOp/d9zy2zIt6gXOA5kQNkiBIuj3pe
 fJxHA/62Mo8nwg5PS0F3/IXda0Z3hSTR5iGsClMx0NKQJjJcDWyFDv4ohOf5R1hq6p
 KFQ4qr6yZwEqmO48xpnJyEOJEDhmwT/spAefvUJjMbyL3h0aY6tbo6k6BO4NA4T31q
 56fpMaQCQk8o3eA9aGxDXHi0q5iOMlfMPVmZfpqQu7Dc7ECXa7W8PIkeQUwdOscXPi
 0jYy3wylxVmug==
Received: from fli4l.lan.fli4l (p5b3a02ab.dip0.t-ipconnect.de [91.58.2.171])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BB2CAA4C37F8;
 Mon,  7 Sep 2026 01:31:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44132)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x3MK1-000000007cf-1H5i;
 Sun, 06 Sep 2026 23:30:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Mon,  7 Sep 2026 01:30:48 +0200
Message-ID: <20260906233048.692559-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260906233048.692559-1-bernd@kuhls.net>
References: <20260906233048.692559-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 6/6] package/{mesa3d,
 mesa3d-headers}: bump version to 26.2.2
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

https://lists.freedesktop.org/archives/mesa-announce/2026-September/000868.html
https://lists.freedesktop.org/archives/mesa-announce/2026-August/000867.html

https://lists.freedesktop.org/archives/mesa-announce/2026-August/000863.html
"One important note for packagers is that there is now a Mesa community
maintained libclc fork that is verified to pass the OpenCL CTS with
Mesa/Rusticl, and will fix bugs after an upstream libclc major release
branch goes EoL. The Mesa build system will pick it up when available,
and fall back to upstream libclc if not. This libclc fork is not
verified for any other usages or users of libclc outside of Mesa."

This bump includes the switch to the newly introduced mesa-libclc
package.

Removed patch which was applied to fix a build error with gcc < 13 seen
with mesa 26.1.x.

Upstream commit
https://gitlab.freedesktop.org/mesa/mesa/-/commit/3f9451b54c42a37b41246de3ceea991111389c37
added rusticl to the variable with_driver_using_cl which creates a new
dependency to the precomp-compiler:
https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.2.2/meson.build?ref_type=tags#L973

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
 ...er-jay-jay_ir.h-do-not-used-typed-en.patch | 41 -------------------
 package/mesa3d/Config.in                      |  3 +-
 package/mesa3d/mesa3d.hash                    |  6 +--
 package/mesa3d/mesa3d.mk                      |  6 +--
 5 files changed, 9 insertions(+), 49 deletions(-)
 delete mode 100644 package/mesa3d/0005-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index fd715b5f84..15382d9ae9 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.1.8
+MESA3D_HEADERS_VERSION = 26.2.2
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0005-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch b/package/mesa3d/0005-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
deleted file mode 100644
index af066287e2..0000000000
--- a/package/mesa3d/0005-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 345ccf93e9d00dfd0f71085832a7df0170b74f74 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Sun, 14 Jun 2026 17:42:19 +0200
-Subject: [PATCH] src/intel/compiler/jay/jay_ir.h: do not used typed enum
-
-This is a C23 feature and not supported by gcc < 13, which
-many host distros still have (e.g. Debian 12).
-
-Upstream-Status: Inappropriate [yocto host distro requirements]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-Upstream: N/A, code completely changed upstream
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/intel/compiler/jay/jay_ir.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/intel/compiler/jay/jay_ir.h b/src/intel/compiler/jay/jay_ir.h
-index 8307044ef8a..abf175a71bf 100644
---- a/src/intel/compiler/jay/jay_ir.h
-+++ b/src/intel/compiler/jay/jay_ir.h
-@@ -579,7 +579,7 @@ jay_type_is_any_float(enum jay_type t)
-    return jay_base_type(t) == JAY_TYPE_F || jay_base_type(t) == JAY_TYPE_BF;
- }
- 
--enum jay_predication : uint8_t {
-+enum jay_predication {
-    /** No predication. */
-    JAY_NOT_PREDICATED = 0,
- 
-@@ -634,7 +634,7 @@ typedef struct jay_inst {
-    bool decrement_dep:1;
-    unsigned padding  :12;
- 
--   enum jay_predication predication;
-+   uint8_t predication;
-    enum jay_conditional_mod conditional_mod;
- 
-    jay_def cond_flag; /**< conditional flag */
--- 
-2.55.0
-
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index f45a675445..d17d432287 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -63,7 +63,8 @@ config BR2_PACKAGE_MESA3D_RUSTICL
 	select BR2_PACKAGE_LLVM_DUMP
 	select BR2_PACKAGE_LLVM_RTTI
 	select BR2_PACKAGE_CLANG
-	select BR2_PACKAGE_LIBCLC
+	select BR2_PACKAGE_MESA_LIBCLC
+	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	select BR2_PACKAGE_SPIRV_TOOLS
 	select BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
 	select BR2_PACKAGE_OPENCL_ICD_LOADER
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index dc7776488a..a6d11aa8ef 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-August/000865.html
-sha256  b320f65874fd9653ac6c0bd1616605387344e1247411a50c797b5f3fb9dc0b55  mesa-26.1.8.tar.xz
-sha512  eb3d46ae9aaba70fdd908486cef24041fec9264ddf586eaebbba65ce55e716d306ef9e91be83e742dfaec4dfc94105a5cd3a36b29bf56614febcbcf6c1f8b516  mesa-26.1.8.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-September/000868.html
+sha256  eeb29ca7e56cfaa8e8a79538dcf834e3b18e501c31bef5145e959ea437cc4216  mesa-26.2.2.tar.xz
+sha512  55b1234c8653dad9b85ba3de7b777a0d957909baf4628f0c00e21d4ba89c004cb687a1dcf8da46ed0a092231dd4f859027509f83ad8c558750845ba470902615  mesa-26.2.2.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 779ea9f111..c6707b53be 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.1.8
+MESA3D_VERSION = 26.2.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -57,7 +57,7 @@ ifeq ($(BR2_PACKAGE_MESA3D_RUSTICL),y)
 MESA3D_PROVIDES += libopencl
 MESA3D_DEPENDENCIES += \
 	clang \
-	libclc \
+	mesa-libclc \
 	host-rustc \
 	host-rust-bindgen \
 	spirv-tools \
@@ -357,7 +357,7 @@ HOST_MESA3D_CONF_OPTS += -Dcpp_rtti=false
 endif
 
 HOST_MESA3D_DEPENDENCIES = \
-	host-libclc \
+	host-mesa-libclc \
 	host-libdrm \
 	host-llvm \
 	host-python-mako \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
