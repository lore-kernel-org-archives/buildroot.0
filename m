Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50DCCD3445
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 20:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BC4461BDD;
	Fri,  8 May 2026 20:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QUepg8f53cIW; Fri,  8 May 2026 20:53:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E8E661BDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778273596;
	bh=EFdsm34e+AFt/+FiuU08aGrzGCNVooe0CBTokkMvdbI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=cSqvgp7oQduZD1dFT96AfQsJQo7a+FJN0L74AHlOR/yQ2FvyIjNb3fo8MYM4F/1/m
	 6qa0xt3p4r8HnnDwPrEi3PyrS/SQs8zpfB4Jaaw2imdLsu3Xh6aS6Oi0xpz+0ORl4G
	 oPgnYulFtEIpYtYx12+K47Ik0lNHsNvXc4ASGrUeaGYi8WZN0kfArEqHWSW2Rbmb/R
	 aRxx8qHHMFUYhq73jCFoypAFk068XlxDWREeDJsgDJUXkYk3uvkzoTk8L871110eiA
	 JoGxhu75engY8+NaP2w9HWEwov6cYm8GdBB/wpJ7XG57HXJaNCHRWNhowyEyMK3Ngu
	 aFeJdyBBl3jyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E8E661BDA;
	Fri,  8 May 2026 20:53:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4512022F
 for <buildroot@buildroot.org>; Fri,  8 May 2026 20:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 364DE848BC
 for <buildroot@buildroot.org>; Fri,  8 May 2026 20:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ErUSojnbfud9 for <buildroot@buildroot.org>;
 Fri,  8 May 2026 20:53:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D0FA8848B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0FA8848B5
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0FA8848B5
 for <buildroot@buildroot.org>; Fri,  8 May 2026 20:53:13 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 32F055FFB1;
 Fri,  8 May 2026 22:53:08 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Fri,  8 May 2026 22:53:02 +0200
Message-ID: <20260508205303.1367063-1-ju.o@free.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778273591;
 bh=sQa498Gp0UhnCdh175qWk80J4e/CcOGLxx4gH2hE+c8=;
 h=From:To:Cc:Subject:Date:From;
 b=CHsj4ADbrWFOOj6KBhCfOXgjSerFURfz+JK6ncqaj9QqnhT9f2Sr60FxJh17BPuu1
 iXkRwSjPLsIf3pU6TGWvjyDnU4kxcAXKLJvuf+aGAF7UlBV0aXMpXe2qGodhQ/w0m0
 RwqtzmxSvmu4+v/bEo10eB21oh6VoBNAjadx0jzJ39K2fI4onb3yKdKItxFNAAeN3D
 wah0FauPrLM199on5TQRhTpvYGpdxBedKUau4a0GsLAtPSXZVHGMwNFY2v5iJwISOv
 DzbIAK6G3g7xuzG25wHmhdIqhMMJxKBxafIbU/pmyZVx0H0mo7zKZhpjhG+S8d/p9P
 FCupv2tc3Zmiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=CHsj4ADb
Subject: [Buildroot] [PATCH 1/2] package/libcamera: bump to v0.7.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://git.linuxtv.org/libcamera.git/tag/?h=v0.7.1

libcamera is now using C++20. This minimal gcc version is increased
to gcc-10. This commit also removes the gcc >= 5 requirement for
the lc-compliance sub-option and the CXXFLAGS condition in the .mk
file. Those are no longer needed. The Config.in comments about the
required gcc version are also updated.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/14285249668
---
 package/libcamera/Config.in      | 11 +++++------
 package/libcamera/libcamera.hash |  2 +-
 package/libcamera/libcamera.mk   |  6 ++----
 3 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index 15812a0e2f..74b861b4c1 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -9,7 +9,7 @@ menuconfig BR2_PACKAGE_LIBCAMERA
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
 	depends on !BR2_STATIC_LIBS # gnutls
 	depends on BR2_USE_WCHAR # gnutls
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3 # clone3()
@@ -97,22 +97,21 @@ config BR2_PACKAGE_LIBCAMERA_COMPLIANCE
 	depends on BR2_USE_WCHAR # gtest
 	depends on BR2_TOOLCHAIN_HAS_THREADS # gtest
 	depends on BR2_INSTALL_LIBSTDCPP # gtest
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # gtest
 	depends on BR2_USE_MMU # gtest
 	select BR2_PACKAGE_GTEST
 	select BR2_PACKAGE_LIBEVENT
 	help
 	  lc-compliance test application
 
-comment "lc-compliance test application needs a toolchain w/ C++, wchar, threads, gcc >= 5"
+comment "lc-compliance test application needs a toolchain w/ C++, wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
+		!BR2_INSTALL_LIBSTDCPP
 
 endif # BR2_PACKAGE_LIBCAMERA
 
-comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8, headers >= 5.3"
+comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 10, headers >= 5.3"
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index e00e1257ad..d1d7576533 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  9e684bfcb8679e5e7ec7fb0da9dec68e71f0b75a6b0c8edcd892b26a92726a92  libcamera-v0.7.0-git4.tar.gz
+sha256  7c5728f6a51d717542cfdd2ff368ac78fa2e50e8a7360a38bb37952e9293e008  libcamera-v0.7.1-git4.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index e8f502b253..945207888b 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = v0.7.0
+LIBCAMERA_VERSION = v0.7.1
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
@@ -41,9 +41,7 @@ LIBCAMERA_LICENSE_FILES = \
 	LICENSES/Linux-syscall-note.txt \
 	LICENSES/MIT.txt
 
-ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_7),y)
-LIBCAMERA_CXXFLAGS = -faligned-new
-endif
+LIBCAMERA_CXXFLAGS = $(TARGET_CXXFLAGS) -faligned-new
 
 ifeq ($(BR2_PACKAGE_LIBCAMERA_PYTHON),y)
 LIBCAMERA_DEPENDENCIES += python3 python-pybind
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
