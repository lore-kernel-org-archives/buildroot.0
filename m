Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696DBC5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 10:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37FE96061A;
	Sun, 16 Aug 2026 10:30:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q75Nkn9FnQFE; Sun, 16 Aug 2026 10:30:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AC3E6061F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786876257;
	bh=Z8XrQmmY22x+U11O+RFQaq7VvkPQyraJLcQbkSGZ098=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gW51ZixbeUtX1r3B9ayUWTa1AZ3EDCVEx/alrjmzg3pz6X67bR2WtXp0yvNK0y9E0
	 ugYCKgrNWmgsRZwzkmd2z7X9X+TjzUvCKBH3OyYa1av1XXCHtp/ThSGR2ZsvvBCIHI
	 ytjZuskO2cLivQ2f6Qj/jWr/jVUEF5rPUSD6lEDYq8rVdBuBH5aQJi6Ylx8WS+fTgC
	 4shWNk0/KMNcOZeyz7nyJBsz4BQYIAbjFb0hcskLxFnXvrLuvS9SDT2t0/u5GpLr+a
	 hRydzvGYPay4H1oiuisleIfX7RiXPlH+uc/Qfd9UFz00JscEVlc2fXvqqFKLhLjV+e
	 xX6XZ3yMA1GSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AC3E6061F;
	Sun, 16 Aug 2026 10:30:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F0EA6333
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 10:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5C6D6061F
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 10:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3nYQ9CXFucUm for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 10:30:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9A09960629
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A09960629
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ZlLMpcX3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A09960629
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 10:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1786876238;
 bh=jRnwdl/JAEr5Ko0D9uP2AHaG3gSCdgXS/EShQZ2spV8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ZlLMpcX3oKzcpcBYAW8Wy9ZjRDFz2RsjL4jQDOMgJNnGyqgYGDTNJMxotwn63/6ao
 oudg/V5cnMsZTXHZR8hL0lcnDOVtmaM5NiK2l8wuK4G3gr3WYhXEYH9gqk+0am7oE0
 9yiQ2fSMbq6Ryc4Axp5fm5yEIYlo3uj6W+9S86lHDDaIuYBrwQwptCbQ7YgJDq8hoh
 FGxBowHSDhxhi14g2nfieD7TzJXC0c4xZ+7bL5kInoNb3AQOUfH87wMVXqNarD0kbq
 mzsJjADiqwooEfIBEj2GlY6BGoHSCHXX//nMTph6Wa4Py0VqXTK6ztzU/2aeJt14Qu
 xm99voBTQizXw==
Received: from fli4l.lan.fli4l (p5b3a090d.dip0.t-ipconnect.de [91.58.9.13])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5F413A4C4E0B;
 Sun, 16 Aug 2026 12:30:38 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56640)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wvY8T-000000007MY-2OH5;
 Sun, 16 Aug 2026 10:30:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Sun, 16 Aug 2026 12:30:37 +0200
Message-ID: <20260816103037.1714478-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260816103037.1714478-1-bernd@kuhls.net>
References: <20260816103037.1714478-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 2/2] package/{mesa3d,
 mesa3d-headers}: bump version to 26.2.0
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

https://lists.freedesktop.org/archives/mesa-announce/2026-August/000863.html
"One important note for packagers is that there is now a Mesa community
maintained libclc fork that is verified to pass the OpenCL CTS with
Mesa/Rusticl, and will fix bugs after an upstream libclc major release
branch goes EoL. The Mesa build system will pick it up when available,
and fall back to upstream libclc if not. This libclc fork is not
verified for any other usages or users of libclc outside of Mesa."

This bump includes the switch to the newly introduced mesa-libclc
package.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/4702c71bf0f40007edb57b55ae95bdc64d8d594f

 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/Config.in                 | 4 +---
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 6 +++---
 4 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 0ce4b15dfc..430d78956f 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.1.7
+MESA3D_HEADERS_VERSION = 26.2.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e184039150..311fe3c33d 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -71,11 +71,9 @@ menuconfig BR2_PACKAGE_MESA3D_OPENCL
 		 BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER)
 	select BR2_PACKAGE_LLVM_RTTI
 	select BR2_PACKAGE_CLANG
-	select BR2_PACKAGE_LIBCLC
+	select BR2_PACKAGE_MESA_LIBCLC
 	select BR2_PACKAGE_HAS_LIBOPENCL
 if BR2_PACKAGE_MESA3D_OPENCL
-# libclc dependency is satisfied by
-# BR2_PACKAGE_MESA3D_LLVM
 config BR2_PACKAGE_MESA3D_RUSTICL
 	bool "RustiCL"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 34ffd95e8f..d759c56047 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-August/000864.html
-sha256  25e0a669e6638c3563e7be32a0a09f1888317e6eed0d047dc41d49dc8de26c7d  mesa-26.1.7.tar.xz
-sha512  9acc75c3d6386f90cf761dfa42e72b1c36d399a6905127d18aa3eb84d665502da7c3cebead82fdbca91ad510673ba7e296b5e148602d6db7e79172d6155f3ec5  mesa-26.1.7.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-August/000863.html
+sha256  efd4bb08cdb7c365a812cd4e6c9202ab55b2f22cdcd13c7d6c4f9647b799a4ef  mesa-26.2.0.tar.xz
+sha512  c7c810c6958fa18eb75eea9968d84d0edd29b579d351a7f22d8c2b2b13b6e04e5b0df31dae3aa943672c792d124325bab03ccbd475a16d27267418bddbec4936  mesa-26.2.0.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 99ef0f5edb..a77ac8930e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.1.7
+MESA3D_VERSION = 26.2.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -52,7 +52,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_OPENCL),y)
 MESA3D_PROVIDES += libopencl
-MESA3D_DEPENDENCIES += clang libclc
+MESA3D_DEPENDENCIES += clang mesa-libclc
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_RUSTICL),y)
@@ -350,7 +350,7 @@ HOST_MESA3D_CONF_OPTS = \
 	-Dvulkan-drivers=""
 
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
