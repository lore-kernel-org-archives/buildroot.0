Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00E6C25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 04:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACE4D40106;
	Tue, 21 May 2024 04:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hYBITS7dX0Mz; Tue, 21 May 2024 04:59:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BDA340473
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BDA340473;
	Tue, 21 May 2024 04:59:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3A5E31BF364
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 04:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27E3E605D0
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 04:59:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r7np4_4RxIui for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 04:59:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63459605B7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63459605B7
 for <buildroot@buildroot.org>; Tue, 21 May 2024 04:59:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2649887499; Tue, 21 May 2024 04:59:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 21 May 2024 06:58:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 898cf04e47b5d292afc1ab1e67f59b10b8637b12
X-Git-Newrev: 47078cc11862c564ece3242fa7c8d23fcb914a8b
X-Patchwork-Hint: ignore
Message-Id: <20240521045926.2649887499@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zxing-cpp: add options for
 enabling readers and/or writers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=47078cc11862c564ece3242fa7c8d23fcb914a8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch allows you to choose whether to build encoding (BUILD_WRITERS),
decoding (BUILD_READERS) or both. At least one of the two options must
be enabled. This way, it's possible to keep the library size at minimum.
By default, to ensure backward compatibility, both are compiled.

Co-Developed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Co-Developed-by: Francesco Nicoletta Puzzillo <francesco.nicolettap@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/zxing-cpp/Config.in    | 17 +++++++++++++++++
 package/zxing-cpp/zxing-cpp.mk | 14 ++++++++++++--
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/package/zxing-cpp/Config.in b/package/zxing-cpp/Config.in
index b72a00ec35..e5b8cfcdd8 100644
--- a/package/zxing-cpp/Config.in
+++ b/package/zxing-cpp/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_ZXING_CPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_STB
 	select BR2_PACKAGE_PYTHON_PYBIND if BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_ZXING_CPP_READERS if !BR2_PACKAGE_ZXING_CPP_WRITERS
 	help
 	  ZXing-cpp (pronounced "zebra crossing") is an open-source,
 	  multi-format 1D/2D barcode image processing library
@@ -17,3 +18,19 @@ config BR2_PACKAGE_ZXING_CPP
 	  compiles the C++ port.
 
 	  https://github.com/zxing-cpp/zxing-cpp
+
+if BR2_PACKAGE_ZXING_CPP
+
+config BR2_PACKAGE_ZXING_CPP_READERS
+	bool "readers support"
+	default y
+	help
+	  Build with readers (decoders) support
+
+config BR2_PACKAGE_ZXING_CPP_WRITERS
+	bool "writers support"
+	default y
+	help
+	  Build with writers (encoders) support
+
+endif # BR2_PACKAGE_ZXING_CPP
diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
index 86a1ef9680..077d7e75d3 100644
--- a/package/zxing-cpp/zxing-cpp.mk
+++ b/package/zxing-cpp/zxing-cpp.mk
@@ -12,8 +12,6 @@ ZXING_CPP_INSTALL_STAGING = YES
 ZXING_CPP_SUPPORTS_IN_SOURCE_BUILD = NO
 ZXING_CPP_DEPENDENCIES = host-pkgconf stb
 ZXING_CPP_CONF_OPTS = \
-	-DBUILD_READERS=ON \
-	-DBUILD_WRITERS=ON \
 	-DBUILD_BLACKBOX_TESTS=OFF \
 	-DBUILD_UNIT_TESTS=OFF \
 	-DBUILD_DEPENDENCIES=LOCAL
@@ -28,4 +26,16 @@ else
 ZXING_CPP_CONF_OPTS += -DBUILD_PYTHON_MODULE=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_ZXING_CPP_READERS),y)
+ZXING_CPP_CONF_OPTS += -DBUILD_READERS=ON
+else
+ZXING_CPP_CONF_OPTS += -DBUILD_READERS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_ZXING_CPP_WRITERS),y)
+ZXING_CPP_CONF_OPTS += -DBUILD_WRITERS=ON
+else
+ZXING_CPP_CONF_OPTS += -DBUILD_WRITERS=OFF
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
