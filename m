Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E704C67861
	for <buildroot@archiver.kernel.org>; Sat,  6 Apr 2024 07:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6986341030;
	Sat,  6 Apr 2024 07:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id my-rFjpofIXo; Sat,  6 Apr 2024 07:33:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C4C74047D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C4C74047D;
	Sat,  6 Apr 2024 07:33:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D9F071BF390
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 07:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2B6B81E12
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 07:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qv56kKIZ372Q for <buildroot@lists.busybox.net>;
 Sat,  6 Apr 2024 07:33:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A2F1B81E35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2F1B81E35
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2F1B81E35
 for <buildroot@buildroot.org>; Sat,  6 Apr 2024 07:33:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cabe.dip0.t-ipconnect.de [79.214.202.190])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 143C3A4C2D89;
 Sat,  6 Apr 2024 09:32:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60956)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rt0XB-000000000gm-0o6r;
 Sat, 06 Apr 2024 07:32:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  6 Apr 2024 09:32:06 +0200
Message-Id: <20240406073216.1054073-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240406073216.1054073-1-bernd@kuhls.net>
References: <20240406073216.1054073-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712388738;
 bh=2N55gw/ut+UiS9e8LPCD821iDsR3bBOSOAAVyZSR0KQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FXiCP1deoMYtbJsQ4u9QFrgOQ1f2zTwGbMcLhrxXyfTAPFcDfgAa93smHHNbYtN9I
 jt20R/WGHW0J6wib1NjzPf2Mo+lsCUeq2zM8tW9M8sM+vtJYyZ1z059vWOr/+NZqT+
 yOu5DnSqNavRVabOrAr7dQhu5kCLBbu7qE/QTSnrBs6JRt2XHKGTZk0LdTPwscS1bw
 T7Is7gzp1eR9xP1OihNXEDIOtRd722kr8i4j/BKEBkhDga+Mk4o6OFBGRi13WgA7oG
 LtmenRmCwIz2avAi5R0GqFcRq1Ioxdji6D4sT2IYrssLpBklUQRLYi+xp7aVUlj7Ir
 03OCgyXuMBBcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=FXiCP1de
Subject: [Buildroot] [PATCH 08/18] package/kodi-imagedecoder-*: mass version
 bump to Omega
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch from kodi-imagedecoder-heif which is included in upstream
release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...de-missing-cstdint-to-support-gcc-13.patch | 31 -------------------
 .../kodi-imagedecoder-heif.hash               |  2 +-
 .../kodi-imagedecoder-heif.mk                 |  2 +-
 .../kodi-imagedecoder-raw.hash                |  2 +-
 .../kodi-imagedecoder-raw.mk                  |  2 +-
 5 files changed, 4 insertions(+), 35 deletions(-)
 delete mode 100644 package/kodi-imagedecoder-heif/0001-include-missing-cstdint-to-support-gcc-13.patch

diff --git a/package/kodi-imagedecoder-heif/0001-include-missing-cstdint-to-support-gcc-13.patch b/package/kodi-imagedecoder-heif/0001-include-missing-cstdint-to-support-gcc-13.patch
deleted file mode 100644
index bd431545e1..0000000000
--- a/package/kodi-imagedecoder-heif/0001-include-missing-cstdint-to-support-gcc-13.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 47dcb3843e02abb69c52d6f0021bd2816b8317a5 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Thu, 27 Apr 2023 02:46:59 +1000
-Subject: [PATCH] include missing <cstdint> to support gcc-13
-
-gcc 13 moved some includes around and as a result <cstdint> is no longer transitively
-included [1]. Explicitly include it for uint{32,64}_t.
-
-[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
-
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-
-Upstream: https://github.com/xbmc/imagedecoder.heif/commit/47dcb3843e02abb69c52d6f0021bd2816b8317a5
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- lib/TinyEXIF/TinyEXIF.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/TinyEXIF/TinyEXIF.h b/lib/TinyEXIF/TinyEXIF.h
-index 56354aa..b03d36b 100644
---- a/lib/TinyEXIF/TinyEXIF.h
-+++ b/lib/TinyEXIF/TinyEXIF.h
-@@ -34,6 +34,7 @@
- #ifndef __TINYEXIF_H__
- #define __TINYEXIF_H__
- 
-+#include <cstdint>
- #include <string>
- #include <vector>
- 
diff --git a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
index 4c7dec7df1..c68a26808e 100644
--- a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
+++ b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  17f50aada11528c02db2ff3871a355c89709ab7e2a5e6b5e33957b790cf207ff  kodi-imagedecoder-heif-20.1.0-Nexus.tar.gz
+sha256  12578bc027871dce331ea82070dd8f3e59bf89e72ae43b9178b8083a36be9c23  kodi-imagedecoder-heif-bf9771060dddc753ac7cf1dbf561059cad54dfb0.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk
index 40b091d8b4..600f3fa7d2 100644
--- a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk
+++ b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_IMAGEDECODER_HEIF_VERSION = 20.1.0-Nexus
+KODI_IMAGEDECODER_HEIF_VERSION = bf9771060dddc753ac7cf1dbf561059cad54dfb0
 KODI_IMAGEDECODER_HEIF_SITE = $(call github,xbmc,imagedecoder.heif,$(KODI_IMAGEDECODER_HEIF_VERSION))
 KODI_IMAGEDECODER_HEIF_LICENSE = GPL-2.0+
 KODI_IMAGEDECODER_HEIF_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
index 8be6ed98da..8f9451048c 100644
--- a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
+++ b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6235c0be431bbb814b3e464753af9ad17febf6001f77cbf030e6c6e1cdc41a04  kodi-imagedecoder-raw-20.1.0-Nexus.tar.gz
+sha256  451ce58acf377dd4758d78baf46f3e8c35d1e76b1a073744963f7a837f336707  kodi-imagedecoder-raw-7be9cf4d985c277f3a059f64873d81b24e6edd70.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk
index 171956df41..87699ffaca 100644
--- a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk
+++ b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_IMAGEDECODER_RAW_VERSION = 20.1.0-Nexus
+KODI_IMAGEDECODER_RAW_VERSION = 7be9cf4d985c277f3a059f64873d81b24e6edd70
 KODI_IMAGEDECODER_RAW_SITE = $(call github,xbmc,imagedecoder.raw,$(KODI_IMAGEDECODER_RAW_VERSION))
 KODI_IMAGEDECODER_RAW_LICENSE = GPL-2.0+
 KODI_IMAGEDECODER_RAW_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
