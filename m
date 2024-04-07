Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A22BCD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 11:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 234CB81FFB;
	Sun,  7 Apr 2024 11:48:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fD0ALgo0SNA0; Sun,  7 Apr 2024 11:48:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30D3F821BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30D3F821BC;
	Sun,  7 Apr 2024 11:48:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3CA501BF947
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF3C860769
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VfgIQD3Ymi9x for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 11:48:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6F1C660705
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F1C660705
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F1C660705
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 11:48:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a070b.dip0.t-ipconnect.de [91.58.7.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B1B5CA4C2E7B;
 Sun,  7 Apr 2024 13:44:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53892)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rtQx7-000000005Wv-1Zq1;
 Sun, 07 Apr 2024 11:44:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 13:44:41 +0200
Message-Id: <20240407114445.683504-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240407114445.683504-1-bernd@kuhls.net>
References: <20240407114445.683504-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712490289;
 bh=L3LmKqT8dQ9WnO6pQlmdF5/TaoX1G2yRL3UJwWY6hBs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vkjh5mLnE87HZG4/TBtHL3xxtAg6oPgNBzcNN6hegrPr6cKvrtonr8z0yYf8wdctN
 MnH6kHrxM3RpZ/Wqo8TjlGXikmzgXlnh1YCMbfs6oxkxkNo4cDbON5tFMSndekgEQe
 ule+9a4EhEnOCFjR6U8fwZgRymvPtB7FuDaM/OaC46lIIxOmiUHU5kI7x/6xMG3yqT
 ay7Bup3CTuwm0YnJ5R1MHLmaYElr9Udd8OX1Rzft4LDLLtyvSpbiP6z0nQfJDu5bNm
 LMhC3005kRf+kRsHExkef1w9HgbnPyummZELQEwe2oWZsGkw6w9tSlin/OWjwT2mBx
 uPDRJsvvLiIXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=vkjh5mLn
Subject: [Buildroot] [PATCH v2 16/20] package/kodi-screensaver-*: mass
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash  | 2 +-
 .../kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk    | 2 +-
 .../kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash  | 2 +-
 .../kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk    | 2 +-
 .../kodi-screensaver-biogenesis.hash                            | 2 +-
 .../kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk  | 2 +-
 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash  | 2 +-
 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk    | 2 +-
 .../kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash  | 2 +-
 .../kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk    | 2 +-
 .../kodi-screensaver-matrixtrails.hash                          | 2 +-
 .../kodi-screensaver-matrixtrails.mk                            | 2 +-
 .../kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash    | 2 +-
 package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk  | 2 +-
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash        | 2 +-
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk          | 2 +-
 package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash        | 2 +-
 package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk          | 2 +-
 package/kodi-screensaver-stars/kodi-screensaver-stars.hash      | 2 +-
 package/kodi-screensaver-stars/kodi-screensaver-stars.mk        | 2 +-
 20 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
index 3f1163fe1b..a65f11402a 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  492d826efa7a252ce62a1bebf075fe9b0c0cf452929f4cd6f228003f6e445b82  kodi-screensaver-asteroids-20.2.0-Nexus.tar.gz
+sha256  7644f9ad16e0f2ae9b4796cdc5cdd92761e835b5edb4f114311d2578c0aeffe6  kodi-screensaver-asteroids-9f761cb7d5842e61da9c608c9f58067bcb986d89.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
index d91779610b..f96eb4e830 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTEROIDS_VERSION = 20.2.0-Nexus
+KODI_SCREENSAVER_ASTEROIDS_VERSION = 9f761cb7d5842e61da9c608c9f58067bcb986d89
 KODI_SCREENSAVER_ASTEROIDS_SITE = $(call github,xbmc,screensaver.asteroids,$(KODI_SCREENSAVER_ASTEROIDS_VERSION))
 KODI_SCREENSAVER_ASTEROIDS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_ASTEROIDS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
index 79815b3cba..2825a7be83 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2c07219218fad17ef285577ff8309f7b6503302e52048d12ee20459dbcedf89c  kodi-screensaver-asterwave-20.2.0-Nexus.tar.gz
+sha256  4cb21eed4a679bbebcc0ed4c4ec3f510f4a9319327eba8d896dd8944bb5ff0f8  kodi-screensaver-asterwave-701111a81875688f016ce62b25670608a7fcd2d2.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
index c721f21cc0..d2fffab74d 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTERWAVE_VERSION = 20.2.0-Nexus
+KODI_SCREENSAVER_ASTERWAVE_VERSION = 701111a81875688f016ce62b25670608a7fcd2d2
 KODI_SCREENSAVER_ASTERWAVE_SITE = $(call github,xbmc,screensaver.asterwave,$(KODI_SCREENSAVER_ASTERWAVE_VERSION))
 KODI_SCREENSAVER_ASTERWAVE_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_ASTERWAVE_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
index 5426cb3f6c..a62070430d 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dfc291fbafe16444f3a5a5f886ba562b5d7b16ed77f4302017fbbe5f5ef9a82d  kodi-screensaver-biogenesis-20.1.0-Nexus.tar.gz
+sha256  92491cbcb1abaa8ab2cf113a0eb4d0ad588f59c062c91e8e06b035c6eb0ea84f  kodi-screensaver-biogenesis-953947d07fdf69967e2dc64b289631c57c79e800.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
index f25ad9c666..bb40c7eb65 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_BIOGENESIS_VERSION = 20.1.0-Nexus
+KODI_SCREENSAVER_BIOGENESIS_VERSION = 953947d07fdf69967e2dc64b289631c57c79e800
 KODI_SCREENSAVER_BIOGENESIS_SITE = $(call github,xbmc,screensaver.biogenesis,$(KODI_SCREENSAVER_BIOGENESIS_VERSION))
 KODI_SCREENSAVER_BIOGENESIS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_BIOGENESIS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
index 6ca36c0d32..0d653a272c 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0e398a30aac0e6316778d7bb93256b9a3758ac11bc42388ac4367417bf82ea55  kodi-screensaver-cpblobs-20.1.0-Nexus.tar.gz
+sha256  84213263bad9d5dbaadc704b28d79f4bd2603287f05f0264563cf560f23f5309  kodi-screensaver-cpblobs-cd96c71c22940014d5c79c58af99b60e0b418f71.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
index 49b510f229..9e010ec774 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_CPBLOBS_VERSION = 20.1.0-Nexus
+KODI_SCREENSAVER_CPBLOBS_VERSION = cd96c71c22940014d5c79c58af99b60e0b418f71
 KODI_SCREENSAVER_CPBLOBS_SITE = $(call github,xbmc,screensaver.cpblobs,$(KODI_SCREENSAVER_CPBLOBS_VERSION))
 KODI_SCREENSAVER_CPBLOBS_LICENSE = GPL-2.0
 KODI_SCREENSAVER_CPBLOBS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
index 27b5a0f712..a1678be4c9 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e060f69a7c403a5d7bb59058dc38e8c6a6ea1aa7bc9b82f8ffa7c5e94ede0866  kodi-screensaver-greynetic-20.2.0-Nexus.tar.gz
+sha256  0974661ce4725e685222cce04b9f43d24b4161f8af9400b6e739549368a0e1eb  kodi-screensaver-greynetic-2955c4105ea1223e9901dbc804812bdb3c0412a7.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
index 4c3f358894..4789cdfcd7 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_GREYNETIC_VERSION = 20.2.0-Nexus
+KODI_SCREENSAVER_GREYNETIC_VERSION = 2955c4105ea1223e9901dbc804812bdb3c0412a7
 KODI_SCREENSAVER_GREYNETIC_SITE = $(call github,xbmc,screensaver.greynetic,$(KODI_SCREENSAVER_GREYNETIC_VERSION))
 KODI_SCREENSAVER_GREYNETIC_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_GREYNETIC_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
index 4f0c3f4746..8bc932579f 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  929af1a5a08399449497a13c2eb9761b4770b41445a13ee61d78b82677978ea5  kodi-screensaver-matrixtrails-20.1.0-Nexus.tar.gz
+sha256  6016fc31cdb489417cf3c39d13403d5d8ff332e5b3aef5bf8916e70c61d479c4  kodi-screensaver-matrixtrails-364b7275fb02edf9a5c03bd56c8010431711b249.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
index b9a3e8d681..a00bcf85df 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 20.1.0-Nexus
+KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 364b7275fb02edf9a5c03bd56c8010431711b249
 KODI_SCREENSAVER_MATRIXTRAILS_SITE = $(call github,xbmc,screensaver.matrixtrails,$(KODI_SCREENSAVER_MATRIXTRAILS_VERSION))
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
index 39853836fb..cd3a0315dd 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  72b3c9be5b65afe7fbc6d496eb7700786d88811bfafcd131a3219a646d30805d  kodi-screensaver-pingpong-20.2.0-Nexus.tar.gz
+sha256  861a752aa5090817670c378cc4be05e06f27b60f3c9e30503facc28cea45312d  kodi-screensaver-pingpong-a0b8b956002ddc64eb6d433e3230fa09619f2aef.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
index 3801515329..9b90da2912 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PINGPONG_VERSION = 20.2.0-Nexus
+KODI_SCREENSAVER_PINGPONG_VERSION = a0b8b956002ddc64eb6d433e3230fa09619f2aef
 KODI_SCREENSAVER_PINGPONG_SITE = $(call github,xbmc,screensaver.pingpong,$(KODI_SCREENSAVER_PINGPONG_VERSION))
 KODI_SCREENSAVER_PINGPONG_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_PINGPONG_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
index aa48d490e5..4a8d00de28 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ec981d070cccdfaa9116244e80a63d86c37f67dccd11aacfcc66dcfcbb608ce1  kodi-screensaver-pyro-20.1.0-Nexus.tar.gz
+sha256  bea100644c2e29f645f379cc51f58b5b87b745cf51d2863649a16869d514e60d  kodi-screensaver-pyro-b0d14d3f8cfe7d0c71ce8df8a6b8d6f121b42908.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
index e33c09ab97..b82d2e0f32 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PYRO_VERSION = 20.1.0-Nexus
+KODI_SCREENSAVER_PYRO_VERSION = b0d14d3f8cfe7d0c71ce8df8a6b8d6f121b42908
 KODI_SCREENSAVER_PYRO_SITE = $(call github,xbmc,screensaver.pyro,$(KODI_SCREENSAVER_PYRO_VERSION))
 KODI_SCREENSAVER_PYRO_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_PYRO_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
index c66d3b2cd3..021b92c143 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e135408812b8c267554e3881a05396d4286c1f47b20416b4e5d88b632367ace7  kodi-screensaver-rsxs-20.1.0-Nexus.tar.gz
+sha256  7f3de3b68c4852290ad3aa2f3b77a356dbc3f26a78bec8356f04723f6d86be42  kodi-screensaver-rsxs-56bc68ef28a8d2a8cf345472df6105bc4c111a04.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
index adf7451723..caadbdb159 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_RSXS_VERSION = 20.1.0-Nexus
+KODI_SCREENSAVER_RSXS_VERSION = 56bc68ef28a8d2a8cf345472df6105bc4c111a04
 KODI_SCREENSAVER_RSXS_SITE = $(call github,xbmc,screensavers.rsxs,$(KODI_SCREENSAVER_RSXS_VERSION))
 KODI_SCREENSAVER_RSXS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_RSXS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
index 4641296596..e4bedbfc3f 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5ea0d19c3ef94e9603a0e06c78ae01cd6f9227da7b505eaa7d4527ca6018ea03  kodi-screensaver-stars-20.1.0-Nexus.tar.gz
+sha256  84d63373984f83e04bb8990a00a5b57a95ddd595f6a2b5fdf56bbd424cd546c8  kodi-screensaver-stars-e31111555b41692fd373719a9ba74aba3e7f4790.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
index a38ad5c7db..c9aef4dc79 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_STARS_VERSION = 20.1.0-Nexus
+KODI_SCREENSAVER_STARS_VERSION = e31111555b41692fd373719a9ba74aba3e7f4790
 KODI_SCREENSAVER_STARS_SITE = $(call github,xbmc,screensaver.stars,$(KODI_SCREENSAVER_STARS_VERSION))
 KODI_SCREENSAVER_STARS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_STARS_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
