Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D49DF55102
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 18:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA70D83D49;
	Sat,  7 Mar 2026 18:54:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dlz0sY4VOufH; Sat,  7 Mar 2026 18:54:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B930583D38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772909672;
	bh=u6dybRqxQlhEmoil4sZTA6ZWHmq5yAhBOQv78NCEK7k=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FhSneV0gVyYR0zZj6wclWmBA57qvYfLlIr9BNX3Bii4/E0r1fDm2q/jqB7sfo9r8q
	 I0nrY+wsw+FvqXuX6rPzS8OYBBLfGaHu9apXiKluer8aRH7OcG7lZ/jyADOd5Xg6BO
	 x/0RSjxcKVFbG88rR7AmXV9i1U+OZWz2pI72OAPMTgZZO3cAtvWlo4sOBkCULDDU6m
	 puWVHle34n3jDr8RKrVYqkoKBkF9AxSMzWHDce3BXdPe+Bm69W+MVPo17CHpHDVeRG
	 g8kT/LQuwU3HMRX4PvEmWosLUtulNxbhDa9MUKrJpM5HgTIqECM0+dZxYSYF4i6Zoj
	 drrqMghIouQCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B930583D38;
	Sat,  7 Mar 2026 18:54:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BD9F223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 18:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D45541C2A
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 18:54:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iztVkMByTGt6 for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 18:54:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8931541C21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8931541C21
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8931541C21
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 18:54:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 71310A4C37F6
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 19:54:26 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34750)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vywnC-000000000TC-0NUN
 for buildroot@buildroot.org; Sat, 07 Mar 2026 18:54:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  7 Mar 2026 19:54:25 +0100
Message-ID: <20260307185425.729667-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772909666;
 bh=o0L+nWVWb1HsvU0llSVZAcHOjx3rXCp/Fde4NsgRdM8=;
 h=From:To:Subject:Date:From;
 b=UU8ImRtGipIbL4iTYsk0NUwwj9bYkRGNF8sbPdwQIrHzLdIAp0KhCFXeChZ+aKeKh
 qdvwsE00zCjhTc91XSuU8+YUxKoT2S/ENtrfUaPpt3ZMR4gRsau+140DIDLyuMC6ih
 5Itk2XrwYindD1SHc9J5LOJdKzmjWTXcqQ/jRtagZzl6fhXzZEd/9FUSGi94vLG/U4
 PVWIYv36nOqN2M+TiOaRUL9cKOrZzqSftLHuwU3Wu67OAjeJOu1OaGAR/pMp5JAUBD
 R6LzpMrTu4lLetHQ62knbr8T7hR114tJ/Nk9G7UApsZqaZ0OmnUlnMNvnUhIFX+YFT
 haoOv9g/KxkLw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=UU8ImRtG
Subject: [Buildroot] [PATCH 1/1] package/libheif: needs gcc >= 10
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

Fixes build error with gcc 9.x:

output/build/libheif-1.21.1/libheif/nclx.h:128:50: error:
 'bool nclx_profile::operator==(const nclx_profile&)
 const' cannot be defaulted

 using this defconfig:

  BR2_arm=y
  BR2_TOOLCHAIN_EXTERNAL=y
  BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
  BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
  BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2020.11.2.tar.bz2"
  BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
  BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
  BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
  # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
  BR2_TOOLCHAIN_EXTERNAL_CXX=y
  BR2_STATIC_LIBS=y
  BR2_PACKAGE_LIBHEIF=y

According to https://github.com/strukturag/libheif/issues/1615#issuecomment-3457979167
gcc >= 10 with support for C++20 is needed for the package.

The failing code was introduced upstream in version 0.21.0 with commit
https://github.com/strukturag/libheif/commit/a62f933e380e165dc2c12a879d0ceed1529b3efa
which was added to buildroot with commit
a8aed698c706ec534ddc41cdce651c18016c28ca.

Also removed -std=c++11 from CXXFLAGS.

The build error was not yet recorded by the autobuilders.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-imagedecoder-heif/Config.in | 6 +++---
 package/libheif/Config.in                | 6 +++---
 package/libheif/libheif.mk               | 1 -
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/kodi-imagedecoder-heif/Config.in b/package/kodi-imagedecoder-heif/Config.in
index f41b164ff4..d77f10ee98 100644
--- a/package/kodi-imagedecoder-heif/Config.in
+++ b/package/kodi-imagedecoder-heif/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_KODI_IMAGEDECODER_HEIF
 	depends on BR2_INSTALL_LIBSTDCPP # libde265, libheif, tinyxml2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libde265, libheif
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730 # libheif
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libheif
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # libheif
 	select BR2_PACKAGE_LIBDE265
 	select BR2_PACKAGE_LIBHEIF
 	select BR2_PACKAGE_TINYXML2
@@ -12,7 +12,7 @@ config BR2_PACKAGE_KODI_IMAGEDECODER_HEIF
 
 	  https://github.com/xbmc/imagedecoder.heif
 
-comment "kodi-imagedecoder-heif needs a toolchain w/ C++, threads, gcc >= 4.8"
+comment "kodi-imagedecoder-heif needs a toolchain w/ C++, threads, gcc >= 10"
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730 # libheif
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10
diff --git a/package/libheif/Config.in b/package/libheif/Config.in
index 0ae86a07f4..9e88fb826d 100644
--- a/package/libheif/Config.in
+++ b/package/libheif/Config.in
@@ -2,14 +2,14 @@ config BR2_PACKAGE_LIBHEIF
 	bool "libheif"
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  libheif is an HEIF and AVIF file format decoder and encoder.
 
 	  https://github.com/strukturag/libheif
 
-comment "libheif needs a toolchain w/ C++, threads, gcc >= 4.8"
+comment "libheif needs a toolchain w/ C++, threads, gcc >= 10"
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index acd302d847..c4196f9353 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -11,7 +11,6 @@ LIBHEIF_LICENSE_FILES = COPYING
 LIBHEIF_CPE_ID_VENDOR = struktur
 LIBHEIF_INSTALL_STAGING = YES
 LIBHEIF_CONF_OPTS = \
-	-DCMAKE_CXX_FLAGS="-std=c++11" \
 	-DENABLE_PLUGIN_LOADING=OFF \
 	-DWITH_AOM_DECODER=OFF \
 	-DWITH_AOM_ENCODER=OFF \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
