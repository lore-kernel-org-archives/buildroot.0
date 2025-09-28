Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D09CAC5B5
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 20:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 588B160803;
	Sun, 28 Sep 2025 20:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sFwLbq2sUe0G; Sun, 28 Sep 2025 20:06:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 810DB607D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 810DB607D9;
	Sun, 28 Sep 2025 20:06:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 43C7B12D
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 20:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FFAE40054
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 20:06:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RuUP2ztGpKVl for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 20:06:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F07F34025F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F07F34025F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F07F34025F
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 20:06:46 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:7427:ac55:2702:f075])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 11B795FFC0;
 Sun, 28 Sep 2025 22:06:43 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun, 28 Sep 2025 22:06:36 +0200
Message-ID: <20250928200636.277674-1-ju.o@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759090004;
 bh=t4mSCBA6vukH71qC0TaI7I72ZYyy2+u/bOlU/didHCE=;
 h=From:To:Cc:Subject:Date:From;
 b=Wpqap2MvILlA9+fV8wAUSR294reasUEfgnaCH2U3+b1/oDkNiyi8xzTWePR9gnXYn
 Ju11c9MzQKDZMG6lVe5XVc/mjfWOP6He9JR4EQcitca2LwqEBXg6xDDVklG+qufJVw
 8qzvqatxlomAoGzAeN1KZdSGEB7JrbQkObJudXtmDFlxa9rZEtuXV8qFo7xO5hdH3J
 c9SwjNIbtwlYakBz7yy+KX7nRvxCoSrWr9fR7HMMHJ2iFapcc+DCP273Wpwr4qc5/o
 OYt4Tb33THcCRhqKDJN93BG7KslircpQxIkVYopkeksirwxzkjvduwwvPeHtxHaS3G
 OOaVN9tDZJeZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Wpqap2Mv
Subject: [Buildroot] [PATCH 1/1] package/vulkan-headers: needs C++
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

Since Buildroot commit [1] "package/vulkan-{headers,loader,tools}:
bump to 1.4.317 release", the vulkan-headers package is failing at
configuration time with toolchains without C++ support, with error:

    The C++ compiler
      "/bin/false"
    is not able to compile a simple test program.

This is due to upstream commit [2], which added CXX to the CMake
project file.

This commit fixes the issue by adding the C++ dependency.

Fixes:
https://autobuild.buildroot.org/results/10f63398940d52be9a8ee306daf4203ceca25eb8

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/52664093dee0f280db191c391167848dc5b09745
[2] https://github.com/KhronosGroup/Vulkan-Headers/commit/85256c712ce9ee9755ae74faacc3e6a1d2c5eddf

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/pipelines/2068398504
---
 package/vulkan-headers/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/vulkan-headers/Config.in b/package/vulkan-headers/Config.in
index c0fc8f20b0..fdab31893f 100644
--- a/package/vulkan-headers/Config.in
+++ b/package/vulkan-headers/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_VULKAN_HEADERS
 	bool "vulkan-headers"
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  The Khronos official Vulkan header files and API
 	  registry.
 
 	  https://github.com/KhronosGroup/Vulkan-Headers
+
+comment "vulkan-headers needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
