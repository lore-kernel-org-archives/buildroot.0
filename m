Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E4DC282EC
	for <buildroot@archiver.kernel.org>; Fri, 14 Mar 2025 21:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB4D361B20;
	Fri, 14 Mar 2025 21:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UOYpxE25IL4x; Fri, 14 Mar 2025 21:03:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E847761B22
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E847761B22;
	Fri, 14 Mar 2025 21:03:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CD7C0C8
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 21:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C878142410
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 21:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJc0OlYxcEPJ for <buildroot@buildroot.org>;
 Fri, 14 Mar 2025 21:03:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 87CB240799
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87CB240799
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87CB240799
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 21:03:28 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 90033B00573;
 Fri, 14 Mar 2025 22:03:22 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>,
	Julien Olivain <ju.o@free.fr>
Date: Fri, 14 Mar 2025 22:03:12 +0100
Message-ID: <20250314210313.775885-1-ju.o@free.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741986205;
 bh=+fwUDRNACnjZKQdMR5j30w19gmMPa4VqY0awA5MQAhc=;
 h=From:To:Cc:Subject:Date:From;
 b=Cjo5BjwW/QCrTqoilQaaAoaoR1SKVTEEplrYlCYxgR7nH/3po9yudqum7sY/bt8IH
 /qYg7LrLa1fSEFL/p3n3+X6DqWC2uWYPmOqq1p3Lui8XfyJmc61UZb97icN0Wp77fh
 fvQAy2vGjbuiwUdVXRkTyaCYJjSpObqLMo1Rzl0z66C4yNiYrxRn5TqwkOHFwZfZU4
 JMLAk3Qgiorheop10JpCFxq1isGgp36+IabREwHuMvlPQSUpS/QtiLFsUmA9H9oJko
 vuQXN2mkgcox5cARPEgTsZ8w1HzA4qCVk4cGlVzZh86ZAwIh55TmMebNXpFnQVEDhH
 pXmfsVGVcLAFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Cjo5BjwW
Subject: [Buildroot] [PATCH 1/2] package/tesseract-ocr: needs gcc >= 8
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

Since Buildroot commit [1] tesseract-ocr fails to build with gcc 7,
with error:

    src/api/baseapi.cpp:67:10: fatal error: filesystem: No such file or directory
     #include <filesystem> // for std::filesystem
              ^~~~~~~~~~~~

In Buildroot, tesseract-ocr has a C++17 requirement captured as
gcc >= 7. Gcc 7 has only a partial and experimental C++17 support,
which was sufficient, prior [1].

The tesseract-ocr upstream commit [2] introduced a usage of
std::filesystem. This commit is included in version 5.5.0,
bumped in [1].

The C++17 with std::filesystem support was introduced in gcc 8.1.
See [3].

This commit fixes the issue by raising the gcc version requirement to
8.x.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/f32da8b9844ae5f1b9dc6b7a89d7d9bd9d194f55
[2] https://github.com/tesseract-ocr/tesseract/commit/4e42f9de541f21acb010886925afe42094a15dfe
[3] https://gcc.gnu.org/gcc-8/changes.html#libstdcxx

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tesseract-ocr/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tesseract-ocr/Config.in b/package/tesseract-ocr/Config.in
index 4d9b78733e..79a27780b2 100644
--- a/package/tesseract-ocr/Config.in
+++ b/package/tesseract-ocr/Config.in
@@ -1,13 +1,13 @@
-comment "tesseract-ocr needs a toolchain w/ threads, C++, gcc >= 7, dynamic library, wchar"
+comment "tesseract-ocr needs a toolchain w/ threads, C++, gcc >= 8, dynamic library, wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 menuconfig BR2_PACKAGE_TESSERACT_OCR
 	bool "tesseract-ocr"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17 filesystem
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
