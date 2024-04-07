Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612DCCD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 11:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7DAA820AE;
	Sun,  7 Apr 2024 11:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hENi6k-22VB7; Sun,  7 Apr 2024 11:48:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36CFD82169
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36CFD82169;
	Sun,  7 Apr 2024 11:48:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B0F91BF947
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC92A405C8
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:47:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ghucdz5AlFN for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 11:47:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9A946405C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A946405C3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A946405C3
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 11:47:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a070b.dip0.t-ipconnect.de [91.58.7.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 651C4A4C2E70;
 Sun,  7 Apr 2024 13:44:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53892)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rtQx6-000000005Wv-3jTO;
 Sun, 07 Apr 2024 11:44:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 13:44:40 +0200
Message-Id: <20240407114445.683504-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240407114445.683504-1-bernd@kuhls.net>
References: <20240407114445.683504-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712490289;
 bh=+9nFBahhQAc0pphCmJfwcUkcLpA6oBCZUBFXogzx2aE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zfra5F9tj55Ncn/pxo8Tfca7EnzmKF/pdIpJlYtA9b0ntHQ05bSSads+bZHmvli6f
 5rwuumOJqzXuJOWpS+jjW0sa21L6wSuabRuTR4mXkgnMxQCcwtzfHlcmtR9XY/M/lV
 A5mGt5gaIZMTNDkxHfsu7VkJH+A/kXVND7wYat3Pg6uR2I6B5/90hS1fgoIwiONmTa
 buzf5z7cnpg4s8vcJ+6EpaeWiFc8eSv1qMQwS0CP6rwRckPGvZANxNRnvtjHp57BD0
 uVLfw4/bPbGBV+fiJro1RLo23sg4r0BEVIDHVG6pTSte80e8T7bCge3mHMiE3jZNh7
 lNRaOsbPexI0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=Zfra5F9t
Subject: [Buildroot] [PATCH v2 15/20] package/kodi-pvr-*: mass version bump
 to Omega
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
 package/kodi-pvr-argustv/kodi-pvr-argustv.hash                  | 2 +-
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk                    | 2 +-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash                  | 2 +-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk                    | 2 +-
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash              | 2 +-
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk                | 2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.hash                    | 2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk                      | 2 +-
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash              | 2 +-
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk                | 2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.hash                          | 2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk                            | 2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash            | 2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk              | 2 +-
 .../kodi-pvr-mediaportal-tvserver.hash                          | 2 +-
 .../kodi-pvr-mediaportal-tvserver.mk                            | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash                    | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk                      | 2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash                  | 2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk                    | 2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.hash                        | 2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.mk                          | 2 +-
 package/kodi-pvr-octonet/kodi-pvr-octonet.hash                  | 2 +-
 package/kodi-pvr-octonet/kodi-pvr-octonet.mk                    | 2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.hash                        | 2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk                          | 2 +-
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash                  | 2 +-
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk                    | 2 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.hash                  | 2 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk                    | 2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.hash                        | 2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk                          | 2 +-
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash                | 2 +-
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk                  | 2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash                    | 2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk                      | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash                      | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk                        | 2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.hash                          | 2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk                            | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash                    | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk                      | 2 +-
 42 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
index e2f73c70c4..604b77c5e3 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c4b18a0abf4ba0a797509d79c4291c4e69589a6482c6ec85f5d9bdae63ea3f35  kodi-pvr-argustv-20.5.0-Nexus.tar.gz
+sha256  61aef981183c1e834b5a3d69fc02b7db5081b6996d7c0a1667d18eb02f655fd0  kodi-pvr-argustv-21.0.0-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
index fac90dfeb6..582300afb9 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ARGUSTV_VERSION = 20.5.0-Nexus
+KODI_PVR_ARGUSTV_VERSION = 21.0.0-Omega
 KODI_PVR_ARGUSTV_SITE = $(call github,kodi-pvr,pvr.argustv,$(KODI_PVR_ARGUSTV_VERSION))
 KODI_PVR_ARGUSTV_LICENSE = GPL-2.0+
 KODI_PVR_ARGUSTV_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
index 9d914fdbf2..b5ffa066d1 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  71a9fa64bdf7d784afc28f8b686fcdc00d9fea536c2aad1464e76e3b7648ed41  kodi-pvr-dvblink-20.3.0-Nexus.tar.gz
+sha256  30d2c7087931bfe040a0f859a0c8b2bd20a71a1e5496a95eab055b7b3167df64  kodi-pvr-dvblink-21.1.0-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
index 8c0b178f75..d5146dbbaa 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_DVBLINK_VERSION = 20.3.0-Nexus
+KODI_PVR_DVBLINK_VERSION = 21.1.0-Omega
 KODI_PVR_DVBLINK_SITE = $(call github,kodi-pvr,pvr.dvblink,$(KODI_PVR_DVBLINK_VERSION))
 KODI_PVR_DVBLINK_LICENSE = GPL-2.0+
 KODI_PVR_DVBLINK_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
index 516366d7b2..775942a5c8 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dc79db0486c7ef75b4b23c4dfe94115cb12e1903c3700ef4eef04fc517fcd039  kodi-pvr-dvbviewer-20.4.0-Nexus.tar.gz
+sha256  92ac2f2c28f109320c152173b1d814af93d7da8e1c3df19f57f56dce1706818c  kodi-pvr-dvbviewer-21.1.0-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
index 914de3c72d..119e3fe0a2 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_DVBVIEWER_VERSION = 20.4.0-Nexus
+KODI_PVR_DVBVIEWER_VERSION = 21.1.0-Omega
 KODI_PVR_DVBVIEWER_SITE = $(call github,kodi-pvr,pvr.dvbviewer,$(KODI_PVR_DVBVIEWER_VERSION))
 KODI_PVR_DVBVIEWER_LICENSE = GPL-2.0+
 KODI_PVR_DVBVIEWER_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
index 7a4d5d3364..d606962ff3 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dfd2a7b64d2b647ba3f7bfba05676a593c3284e2298becfed68b82e441a69b33  kodi-pvr-filmon-20.3.0-Nexus.tar.gz
+sha256  ba3f0c6f2b46c6b45750e2148a932279c76bb7a1b49eb3299a19817fef3f6b2d  kodi-pvr-filmon-21.0.0-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
index 50dad3c47f..268e9fad4b 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_FILMON_VERSION = 20.3.0-Nexus
+KODI_PVR_FILMON_VERSION = 21.0.0-Omega
 KODI_PVR_FILMON_SITE = $(call github,kodi-pvr,pvr.filmon,$(KODI_PVR_FILMON_VERSION))
 KODI_PVR_FILMON_LICENSE = GPL-2.0+
 KODI_PVR_FILMON_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
index 3bcfa23593..8f24eb7158 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3872265e00fc748ba327aaa91beece747936f55d16356051cdd04b0b70a353c0  kodi-pvr-hdhomerun-20.4.0-Nexus.tar.gz
+sha256  3adbb5da035d714ccdfe9fa08185487fc218dd14464dc3b8242254a852ac1f8a  kodi-pvr-hdhomerun-21.0.0-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
index cc6e097efa..e384480f80 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HDHOMERUN_VERSION = 20.4.0-Nexus
+KODI_PVR_HDHOMERUN_VERSION = 21.0.0-Omega
 KODI_PVR_HDHOMERUN_SITE = $(call github,kodi-pvr,pvr.hdhomerun,$(KODI_PVR_HDHOMERUN_VERSION))
 KODI_PVR_HDHOMERUN_LICENSE = GPL-2.0+
 KODI_PVR_HDHOMERUN_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index 2a59b7bbe5..91b7b00f1a 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  244cfc1488aa0c51465af411f3df8884b4a571a08acfa20ac9defdb8ef49022e  kodi-pvr-hts-20.7.2-Nexus.tar.gz
+sha256  b2694803be78ee65d1ac8c02ae6631ec9798e5a70906b29c610018f9f33bf7fa  kodi-pvr-hts-21.2.1-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index ebc31ddbdf..c67118b428 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HTS_VERSION = 20.7.2-Nexus
+KODI_PVR_HTS_VERSION = 21.2.1-Omega
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
index fa316b084a..784775388d 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9edf800d7d5e755c92e9e8f6d3771a74cf3fec23b3aaec5b8535f1a579941a5b  kodi-pvr-iptvsimple-20.13.0-Nexus.tar.gz
+sha256  52108d15f8eaa58d7cd6d87947615758ffebcbf87a00090e71384cff4e59d25d  kodi-pvr-iptvsimple-21.8.3-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index eada2c63a5..5726ba66ed 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_IPTVSIMPLE_VERSION = 20.13.0-Nexus
+KODI_PVR_IPTVSIMPLE_VERSION = 21.8.3-Omega
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
index 37489de7dc..5ede84083d 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a61efdadb56c65e081f8b2e99f2d5b32b3c932ca1954243548710be57c8b70b8  kodi-pvr-mediaportal-tvserver-20.3.0-Nexus.tar.gz
+sha256  a0034ffcfb42ce4bc8dbd49c5ef354caa7f41e6e061d1a7f3c42618053ebb469  kodi-pvr-mediaportal-tvserver-21.0.0-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
index dfc7c2873b..01c1e38607 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 20.3.0-Nexus
+KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 21.0.0-Omega
 KODI_PVR_MEDIAPORTAL_TVSERVER_SITE = $(call github,kodi-pvr,pvr.mediaportal.tvserver,$(KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION))
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE = GPL-2.0+
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index ff3d0f05b7..7095eaf81c 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  32196265ee5b78bb97e0bd8e633778f4566e95d54df96e4577764e5d3681fcf1  kodi-pvr-mythtv-20.6.9-Nexus.tar.gz
+sha256  3f1d826e11da10a600dd4de0bfd279a0c583aeae387832c6f9f06bb8befbb811  kodi-pvr-mythtv-21.1.8-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index a3a5678651..597e8018f6 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 20.6.9-Nexus
+KODI_PVR_MYTHTV_VERSION = 21.1.8-Omega
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
index dcbc504a23..0c4ca8fcd0 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  752dff532a277797f3fefc1ced7fea6efb8d92982d9040c4080c1e6dbab203a0  kodi-pvr-nextpvr-20.4.3-Nexus.tar.gz
+sha256  394ccca4c428e71e18cda4debc14d7eba2b4cc098a290a593ffa76a76c55fc90  kodi-pvr-nextpvr-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
index e89aed7d0a..f3d615f39b 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_NEXTPVR_VERSION = 20.4.3-Nexus
+KODI_PVR_NEXTPVR_VERSION = 21.0.2-Omega
 KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
 KODI_PVR_NEXTPVR_LICENSE = GPL-2.0+
 KODI_PVR_NEXTPVR_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
index bb7f4218cf..b0fc808aee 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0e8dc8ddce7830878c816da0836bdf5558c0dd388c48019012735a518eeefb04  kodi-pvr-njoy-20.3.0-Nexus.tar.gz
+sha256  0c570cebbb117bb0ef93692d653782608b332fc2b4b6d1728b5421ccd1457f72  kodi-pvr-njoy-21.0.0-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
index d0cfc006d7..47aa357b11 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_NJOY_VERSION = 20.3.0-Nexus
+KODI_PVR_NJOY_VERSION = 21.0.0-Omega
 KODI_PVR_NJOY_SITE = $(call github,kodi-pvr,pvr.njoy,$(KODI_PVR_NJOY_VERSION))
 KODI_PVR_NJOY_LICENSE = GPL-2.0+
 KODI_PVR_NJOY_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-octonet/kodi-pvr-octonet.hash b/package/kodi-pvr-octonet/kodi-pvr-octonet.hash
index 2342f0c836..8262476abd 100644
--- a/package/kodi-pvr-octonet/kodi-pvr-octonet.hash
+++ b/package/kodi-pvr-octonet/kodi-pvr-octonet.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cc83ada3b3d1dbf3d42fa41f2b221c640cdc9fd505a1c76e7b479f99fe1ec8c5  kodi-pvr-octonet-20.3.0-Nexus.tar.gz
+sha256  88d1df996154b1ae08e7c45c78ede3985aef2e3df2c7c3b2958fa3f3c5e241c9  kodi-pvr-octonet-21.0.0-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-octonet/kodi-pvr-octonet.mk b/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
index 84950d2514..938f0721e6 100644
--- a/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
+++ b/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_OCTONET_VERSION = 20.3.0-Nexus
+KODI_PVR_OCTONET_VERSION = 21.0.0-Omega
 KODI_PVR_OCTONET_SITE = $(call github,DigitalDevices,pvr.octonet,$(KODI_PVR_OCTONET_VERSION))
 KODI_PVR_OCTONET_LICENSE = GPL-2.0+
 KODI_PVR_OCTONET_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
index d0c340fe78..a0c6a49e73 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c99d3ef085c4900e0c03e5e37047dc136efced78ed245d07bc286468a31e8a65  kodi-pvr-pctv-20.4.0-Nexus.tar.gz
+sha256  671dc89b33d4be8b895d44f74856f8ec49cf8cd174f9f7e502b5a5a6951658d6  kodi-pvr-pctv-21.0.0-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
index 4ae7bd0bc6..82da3a70f8 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_PCTV_VERSION = 20.4.0-Nexus
+KODI_PVR_PCTV_VERSION = 21.0.0-Omega
 KODI_PVR_PCTV_SITE = $(call github,kodi-pvr,pvr.pctv,$(KODI_PVR_PCTV_VERSION))
 KODI_PVR_PCTV_LICENSE = GPL-2.0+
 KODI_PVR_PCTV_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
index 162905218c..199777c255 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7bccc0001acb796aa706f8a1bcce2661fcb67a7f346420c691ee0461ab5aace8  kodi-pvr-plutotv-20.3.2-Nexus.tar.gz
+sha256  4503cbed48aefa06470a970d7030d67cbdc7236cabd8de15df4a3681827b32e7  kodi-pvr-plutotv-21.1.0-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
index 8a47d8c265..e2a3a01116 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_PLUTOTV_VERSION = 20.3.2-Nexus
+KODI_PVR_PLUTOTV_VERSION = 21.1.0-Omega
 KODI_PVR_PLUTOTV_SITE = $(call github,kodi-pvr,pvr.plutotv,$(KODI_PVR_PLUTOTV_VERSION))
 KODI_PVR_PLUTOTV_LICENSE = GPL-2.0+
 KODI_PVR_PLUTOTV_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
index ed8668b2c9..5944a9d06b 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8fdd4ab4cf28d7255550b4c351a397b7ce8eb1aa1f12e93bce7d61a951fbd6f3  kodi-pvr-stalker-20.3.1-Nexus.tar.gz
+sha256  a2cfe5e5acf186e368cd42bf811b217940685695be0e2689a299c80da7d217f4  kodi-pvr-stalker-21.0.0-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
index 763f7054ad..14d9058e2a 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_STALKER_VERSION = 20.3.1-Nexus
+KODI_PVR_STALKER_VERSION = 21.0.0-Omega
 KODI_PVR_STALKER_SITE = $(call github,kodi-pvr,pvr.stalker,$(KODI_PVR_STALKER_VERSION))
 KODI_PVR_STALKER_LICENSE = GPL-2.0+
 KODI_PVR_STALKER_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
index 1aff2dd985..a4fc6f48d2 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  04c50eba71426f062339491e7567545ec8c910b17c7055b28285eab14f26ca6f  kodi-pvr-vbox-20.4.2-Nexus.tar.gz
+sha256  6909016c3d89b5eddae5098b033e0cce1ea3140e05b4175e1c50611add7ab408  kodi-pvr-vbox-21.1.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
index e5e86274fc..5da40d13f1 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_VBOX_VERSION = 20.4.2-Nexus
+KODI_PVR_VBOX_VERSION = 21.1.2-Omega
 KODI_PVR_VBOX_SITE = $(call github,kodi-pvr,pvr.vbox,$(KODI_PVR_VBOX_VERSION))
 KODI_PVR_VBOX_LICENSE = GPL-2.0+
 KODI_PVR_VBOX_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
index 64ecb17b14..5742851593 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f26e2a9f1e9d83c5b44a8875b1f9cd37a0dbe59faf08002f083a4db95c9f84e0  kodi-pvr-vdr-vnsi-20.4.1-Nexus.tar.gz
+sha256  5c7317814d18439a36b6dc45e964aa13724ac19b46344d0d9196356f7c42921c  kodi-pvr-vdr-vnsi-21.1.0-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
index 02a2e2e456..b90c128404 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_VDR_VNSI_VERSION = 20.4.1-Nexus
+KODI_PVR_VDR_VNSI_VERSION = 21.1.0-Omega
 KODI_PVR_VDR_VNSI_SITE = $(call github,kodi-pvr,pvr.vdr.vnsi,$(KODI_PVR_VDR_VNSI_VERSION))
 KODI_PVR_VDR_VNSI_LICENSE = GPL-2.0+
 KODI_PVR_VDR_VNSI_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
index 7f051071f1..46a0e6c471 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  467363d7015d426f05fac3f514222d7ec03aa4b61a0935fd7f00e95e9c443514  kodi-pvr-vuplus-20.5.1-Nexus.tar.gz
+sha256  f9bd295fda0c21f60989440dfa74ebaf386f5264bf7a045f6c7cc9fd012e7907  kodi-pvr-vuplus-21.1.1-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
index 80b57f2510..b6d2c6b5d5 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_VUPLUS_VERSION = 20.5.1-Nexus
+KODI_PVR_VUPLUS_VERSION = 21.1.1-Omega
 KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
 KODI_PVR_VUPLUS_LICENSE = GPL-2.0+
 KODI_PVR_VUPLUS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
index e0b4dc482c..6f9d521601 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f43a7ac762b2c8bb7c2a66dc7d2a577fad92119bb4418867ce22369b96b18f8c  kodi-pvr-waipu-20.11.0-Nexus.tar.gz
+sha256  c595fa830f56b265a94de5a33dd50bdd8ae068ebe0797dd15220ba52adf04fda  kodi-pvr-waipu-21.5.0-Omega.tar.gz
 sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
index 02614552f0..d82f8f7a2f 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WAIPU_VERSION = 20.11.0-Nexus
+KODI_PVR_WAIPU_VERSION = 21.5.0-Omega
 KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
 KODI_PVR_WAIPU_LICENSE = GPL-2.0+
 KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
index 232750db33..a6bd5d5dcc 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f045d871789ef3d36e1a7c7361ea35be4e14a395e75446519e937be70d2433b4  kodi-pvr-wmc-20.3.0-Nexus.tar.gz
+sha256  40f86146d98b770d4f76b6ea9ce3c9a2942d99b81d49e06ef2ccfef5b1e4c160  kodi-pvr-wmc-21.0.0-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
index fd96731764..9e601ecd16 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WMC_VERSION = 20.3.0-Nexus
+KODI_PVR_WMC_VERSION = 21.0.0-Omega
 KODI_PVR_WMC_SITE = $(call github,kodi-pvr,pvr.wmc,$(KODI_PVR_WMC_VERSION))
 KODI_PVR_WMC_LICENSE = GPL-2.0+
 KODI_PVR_WMC_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
index 86410df72a..acffc6a7ee 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b6f5205caede6aaf57c1eab8206c5a5b3aaa6b5d8bda862d983ca53150cdf14a  kodi-pvr-zattoo-20.3.14-Nexus.tar.gz
+sha256  5908de86c038b3565d8b3a8d4578d4cac0d37287fc039808542b874d9fb2bffa  kodi-pvr-zattoo-21.0.1-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
index d97d940bdc..d764524fbb 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ZATTOO_VERSION = 20.3.14-Nexus
+KODI_PVR_ZATTOO_VERSION = 21.0.1-Omega
 KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
 KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
 KODI_PVR_ZATTOO_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
