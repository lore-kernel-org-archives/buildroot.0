Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D59C52D7C
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 18:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E13980D9C;
	Thu, 22 Aug 2024 18:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kuf9-0jeSGsS; Thu, 22 Aug 2024 18:18:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1334E810D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1334E810D6;
	Thu, 22 Aug 2024 18:18:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BDA8F1BF381
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B84D0810D6
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sC-gYiqTgS3l for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 18:18:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8A41780D9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A41780D9C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A41780D9C
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 18:18:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a54.dip0.t-ipconnect.de [91.58.10.84])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CE4B2A4C2545
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 20:18:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55196)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1shCOE-000000005cF-0trU
 for buildroot@buildroot.org; Thu, 22 Aug 2024 18:18:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 20:18:24 +0200
Message-Id: <20240822181830.65052-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1724350710;
 bh=j0+iO1rpCc3cELIOkkzwWM1SMRbvPKIdiV+GqKibjB0=;
 h=From:To:Subject:Date:From;
 b=UQiw0zQNHD+n31tvRJd26qNPFKUpsK7g/ynaYcRFbxSZ2zLvyurGytaaWJDf3oijk
 IZMijYb3EM6VFD4HpGllCv9BXD1OQRARsh8x2IMiGFIpBKbwWpFTaMHHDA6K5PUKoe
 9gGmzdgeFkaTtzJfnB+BAvvilxQdUzgz8ubBlUZkeHl+oHKcfPpFk5+9zLKeVZRng3
 XSRoN9m3Ggk6y6cgU1sIUgxcR/g5hspNV1UGwi/8VM2Xf0DMcKkRNxKXO7hQTVY5mm
 ZYLaFT9uMAn4q/6z5jeJrdRyZigRL+0BYJ8LzRCe6n5yrBXysZzpqIUxvtp6c8QM6S
 XaT7XcXza4obw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=UQiw0zQN
Subject: [Buildroot] [PATCH/next 1/7] package/kodi-inputstream-adaptive:
 bump version to 21.5.2-Omega
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index 82325ab014..af88728c73 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  caf71b67cf242c600878718dab8227947062a28485078b8bf68ac72aef51e12c  kodi-inputstream-adaptive-21.4.10-Omega.tar.gz
+sha256  b27121f9ec64c43dfb9beca56b045c6ec198b04ae5d006001916b9acbee63c0c  kodi-inputstream-adaptive-21.5.2-Omega.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index b6825c1ff0..66375affc8 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.4.10-Omega
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.2-Omega
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
