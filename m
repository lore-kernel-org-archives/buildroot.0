Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB8ECD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 11:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80EA9820E7;
	Sun,  7 Apr 2024 11:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yviCmx2tlWTX; Sun,  7 Apr 2024 11:46:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F52482104
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F52482104;
	Sun,  7 Apr 2024 11:46:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B2D91BF947
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2BA760733
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:46:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5O1vY1PnDmGJ for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 11:46:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C0CF660769
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0CF660769
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0CF660769
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 11:46:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a070b.dip0.t-ipconnect.de [91.58.7.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 67F18A4C2E00;
 Sun,  7 Apr 2024 13:44:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53892)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rtQx6-000000005Wv-0r5V;
 Sun, 07 Apr 2024 11:44:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 13:44:35 +0200
Message-Id: <20240407114445.683504-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240407114445.683504-1-bernd@kuhls.net>
References: <20240407114445.683504-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712490288;
 bh=2N55gw/ut+UiS9e8LPCD821iDsR3bBOSOAAVyZSR0KQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ActLUOqSvMsQBMPdpaij59uBhi574qTvN0tQSC6KuPsMTQpO8XcqyPTTsWNTf5j0X
 7IDv8B5F6/eB7/gNNVpJ98mArvCqqDoHpfEMJrV6h2BWj1/UL3iNwYheQ8ChCoKKSn
 dh6qvmZ/FNf/UDBBJ7UuNF7rk7L49mwkxw9fIs8zL5wYyUNLOXkh1vSW7DTrMrLsJ0
 APQtYfKdCaxmfszWStlZkLClDbpf/9GHwpbR0KFFhzNSQrmprlhJHCJ90P2agy4gk8
 SiNCrZodg82GSoUiEu6BRIe3WJ2D6dRnEj/TOeoLNFBc+WuQ2KeOAr33Grt6rNEEUq
 nqh/TeduaT71w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=ActLUOqS
Subject: [Buildroot] [PATCH v2 10/20] package/kodi-imagedecoder-*: mass
 version bump to Omega
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
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
