Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1323FEEA84C
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 19:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF90740B66;
	Thu, 12 Feb 2026 19:29:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xguQJm84GKqs; Thu, 12 Feb 2026 19:29:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC5C540BEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770924583;
	bh=e2Asfxwb2HzEiQE0rhYwmXoRFkVeLvrFE/cTTujKrJU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qzmf37Dz+rfTFOW5E6iNGRce/JARCTUveeLk9X9BOVNQXBlqb8v8sQijKPfvOUjet
	 oaQilTqqMO6cadjf9/x8BO1AWCPtHOxt0oNvNFcP2/REekVlLfgdqh8sBdqoyfcF0S
	 txyfkrJ/OwvKME//sL+a6Hv70eCqNyFHhJi1x1ZstPX3qw1QCxE9j8aPTHsvhrGImK
	 BkgjbQ8zrck5cS4hxWVRgfmpTnD4aHJMpDUsgY2lTC0+6E1RSXJWftaV9wxkszeXJc
	 7UnEKtrKusqhHBMEfuCiT3btl6b2PQDBUJSuPVhIkMTBdwb9kXv4gFDfSNw/KpEBgD
	 Nr2AifWQCsikQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC5C540BEC;
	Thu, 12 Feb 2026 19:29:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B7D1EC
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 696DF80E37
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:29:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aSBArt_2Yz45 for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 19:29:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 215E980E34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 215E980E34
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 215E980E34
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:29:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c3ec.dip0.t-ipconnect.de [79.214.195.236])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 96F03A4C0D40;
 Thu, 12 Feb 2026 20:29:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vqcNd-000000000WW-3lNa;
 Thu, 12 Feb 2026 19:29:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Thu, 12 Feb 2026 20:29:38 +0100
Message-ID: <20260212192938.1904947-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770924578;
 bh=Ci70RpD6UXJNlUKDFdfkR1wNb8MTOGeLazAA17IzO3A=;
 h=From:To:Cc:Subject:Date:From;
 b=L48+GTd/3BnVpVCIZlnzuJ/4sA+CJE+RqFnSTPrmrSXid2082VDHkNa+bPHGVRdps
 uoOJbXuluDzq1KKkgej7HfHQzmKIRhfbFDBmwkc/rIGGLiHAm5Cm5SzM6EYXvYAFf6
 DriAfCo2f8rEs4hdzmgorBxqZ9yjC3l7u4YNnxVJXOVDRQv4wE0hB4J31uEOHhT6gQ
 RjtJ3SFar3BREKyUwk1u9nY5rHqGANz62IPX/lgLL3tQut3OjiV30jw0aHRJa+rnHe
 JeTkZWP3hfSKIBqxWiqpjiUHl0Qv5LAyE2EkxLqvDe/5kTpiB/jjlv39aLsyLxa3Y1
 n8ls1brP0bqnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=L48+GTd/
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.0.0
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

https://lists.freedesktop.org/archives/mesa-announce/2026-January/000833.html
https://lists.freedesktop.org/archives/mesa-announce/2026-January/000835.html
https://lists.freedesktop.org/archives/mesa-announce/2026-February/000836.html
https://lists.freedesktop.org/archives/mesa-announce/2026-February/000838.html

Removed patch 0004 which is included in this release:
https://gitlab.freedesktop.org/mesa/mesa/-/commit/f83e86c29f844d659316f891e55b864a98dcd615

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
 ...3_neon.c-only-for-little-endian-arch.patch | 47 -------------------
 package/mesa3d/mesa3d.hash                    |  6 +--
 package/mesa3d/mesa3d.mk                      |  2 +-
 4 files changed, 5 insertions(+), 52 deletions(-)
 delete mode 100644 package/mesa3d/0004-blake3-add-blake3_neon.c-only-for-little-endian-arch.patch

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 263c79ec38..10cfd8f719 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 25.3.5
+MESA3D_HEADERS_VERSION = 26.0.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0004-blake3-add-blake3_neon.c-only-for-little-endian-arch.patch b/package/mesa3d/0004-blake3-add-blake3_neon.c-only-for-little-endian-arch.patch
deleted file mode 100644
index 5e4c89b714..0000000000
--- a/package/mesa3d/0004-blake3-add-blake3_neon.c-only-for-little-endian-arch.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From c4292cc5af3278b294c2baa5464c9985228205fe Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Tue, 3 Feb 2026 20:13:49 +0100
-Subject: [PATCH] blake3: add blake3_neon.c only for little endian archs
-
-Fixes build error on big endian archs:
-
-Build machine cpu family: x86_64
-Build machine cpu: x86_64
-Host machine cpu family: aarch64
-Host machine cpu: cortex-a53
-Target machine cpu family: aarch64
-Target machine cpu: cortex-a53
-[...]
-../src/util/blake3/blake3_neon.c:6:2: error: #error "This implementation only supports little-endian ARM."
-    6 | #error "This implementation only supports little-endian ARM."
-
-as detected by buildroot autobuilders:
-https://autobuild.buildroot.net/results/efd/efd07d97df4e0c1ceb07fc26e17898afef5435b9/build-end.log
-
-For reference:
-$ grep -i endian output/build/mesa3d-25.3.4/buildroot-build/cross-compilation.conf
-endian = 'big'
-
-Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39681
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/util/blake3/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/util/blake3/meson.build b/src/util/blake3/meson.build
-index bd51cfb68c3..767da2c6ec3 100644
---- a/src/util/blake3/meson.build
-+++ b/src/util/blake3/meson.build
-@@ -35,7 +35,7 @@ elif cpu_family == 'x86'
-   # There are no assembly versions for 32-bit x86. Compiling the C versions require a different compilation flag per
-   # file, which is not well supported by Meson. Leave SIMD support out for now.
-   blake3_defs += blake3_x86_no_simd_defs
--elif cpu_family == 'aarch64'
-+elif cpu_family == 'aarch64' and target_machine.endian() == 'little'
-   files_blake3 += ['blake3_neon.c']
- endif
- 
--- 
-2.47.3
-
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 346738458a..958a99ec9f 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-February/000837.html
-sha256  be472413475082df945e0f9be34f5af008baa03eb357e067ce5a611a2d44c44b  mesa-25.3.5.tar.xz
-sha512  3db3d3c98bf476a5827705b82733d9964ec511b30882ec7e9edaddc65a5dea5e6bfb33bdcd4f97752d7a3ae9e306e8703982686cbd869567b4194decdb2f5a89  mesa-25.3.5.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-February/000838.html
+sha256  2a44e98e64d5c36cec64633de2d0ec7eff64703ee25b35364ba8fcaa84f33f72  mesa-26.0.0.tar.xz
+sha512  d39d190d0a17306f0aa69033e38dd8cf458dbf8da483b768841e2dc681dd670735999b212fbe0b29be839702a20750c87d6587bd925dca10693950830a17cd55  mesa-26.0.0.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 64b8113e6f..42693ce928 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 25.3.5
+MESA3D_VERSION = 26.0.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
