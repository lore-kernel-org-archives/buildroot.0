Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BFCD1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 815B660750;
	Sun,  7 Dec 2025 14:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3uaMGiJ5eAaS; Sun,  7 Dec 2025 14:47:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A416A60B93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118822;
	bh=lUzBF9pTM0cn0TOfu/Hf9EYRGF12b133Tpu0OrKFOQE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=aFzbAzHFOmXugUyLIidHwPlVO0m4m8vaAlF30EQbXm9L00RAV5px2q7RvKqDRPd11
	 cnXeRTHlRTSvKJDXOT67sZZ2tDNRs2kmO42YhQlpGm2bCdnvlPo67hDRtByN1MiDzs
	 EaJxN+gqag1k3yYEYAjU6G5j2a019u2yd4ky7qTUnfcGCO5kDlNMwjhZcOanv3D+cb
	 /h/jOxUcth0z0pQvBI0nisx+EnGsgZw5MIm4dMwbffba2MyQ3gz9HYd6Mu6+TLoMMa
	 c26QLo47SS/Sn2kkcldAMyUXIrAxHonZpR3e2MsGDSRjc6ZrlnrugwqYKSosCvDPCt
	 LAQkUByMW5tww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A416A60B93;
	Sun,  7 Dec 2025 14:47:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E35AA151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9E57821FB
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rhzuyDKjSYe7 for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:47:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BC0C380D5F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC0C380D5F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC0C380D5F
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:46:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4AB61A4C0C28;
 Sun,  7 Dec 2025 15:42:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyH-00000000416-3DxY;
 Sun, 07 Dec 2025 14:42:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:31 +0100
Message-ID: <20251207144243.3696572-22-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118578;
 bh=0H0MDmmzdIto2HPm7LWS/S6nsEwr1Lw1Zf7kdvQfG88=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=IcjkZg8I6S5Zr74HX2cYa5huS262OahXcVdpbzyzF2+GF9u41FAA4kItAmacxUwMh
 3YfT4RjVrju8mVkg2Zd0yLRN6sP7ySy/EnKoVeerCBkl0n91eCqmWHmRuung9ZGlga
 WOtao4E6N69WiRoFX1w3x7beNUWuWcxvEdyCEe5Tl0VVEyDRLl8BRV2NpkNb/lIOxT
 BNeXM6WSZCjjfj5AQwddTUoUR1oic7mNSGfLPgl2gC/voM2hMOxkA2v3k4NnBGMhdA
 ylO/KRh8u3uKrZmldNKwXaHtk5kiWmmYoCB4gmcl0qTfy8E031MQueyGyiAIYvaJoC
 5cbaJ3IL1Ag3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=IcjkZg8I
Subject: [Buildroot] [PATCH/next 22/33] package/rtptools: bump version
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
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Jean Burgat <jeanburgat33@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Alessandro Partesotti <a.partesotti@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Prabhu Sannachi <prabhu.sannachi@collins.com>,
 Denis Bodor <lefinnois@lefinnois.net>,
 James Hilliard <james.hilliard1@gmail.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 James Knight <james.knight@collins.com>, Simon Dawson <spdawson@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switched _SITE to github, previous site is offline.

https://github.com/irtlab/rtptools/commit/26f6daeeaa3217a98cb63e9463d60286f7fb90d8
replaced the autotools-based build system with a hand-written script.

Added TARGET_DIR as PREFIX to configure.local which is read by the
configure script:
https://github.com/irtlab/rtptools/blob/master/configure#L68

to overwrite the default value "/usr/local":
https://github.com/irtlab/rtptools/blob/master/configure#L64

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/rtptools/Config.in     |  2 +-
 package/rtptools/rtptools.hash |  2 +-
 package/rtptools/rtptools.mk   | 10 +++++++---
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/rtptools/Config.in b/package/rtptools/Config.in
index 80bbb7a7a0..1aa803e60e 100644
--- a/package/rtptools/Config.in
+++ b/package/rtptools/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_RTPTOOLS
 	  The rtptools distribution consists of a number of small
 	  applications that can be used for processing RTP data.
 
-	  http://www.cs.columbia.edu/irt/software/rtptools/
+	  https://github.com/irtlab/rtptools
diff --git a/package/rtptools/rtptools.hash b/package/rtptools/rtptools.hash
index 6988483b81..a2e7e627e6 100644
--- a/package/rtptools/rtptools.hash
+++ b/package/rtptools/rtptools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2c76b2a423fb943820c91194372133a44cbdc456ebf69c51616ec50eeb068c28  rtptools-1.22.tar.gz
+sha256  c78c5b60bfddfc3505670230ff2b92514f62766c5bdf53e78c3ad88a12bbc27a  rtptools-520c0a3722f37cd243d6908063d86a0306ace088.tar.gz
 sha256  f864592065e232c0b444ae9682a7a1a2c6aafe96712999f794bec24d4441a6a9  LICENSE
diff --git a/package/rtptools/rtptools.mk b/package/rtptools/rtptools.mk
index 2148b759ac..61de2b9f47 100644
--- a/package/rtptools/rtptools.mk
+++ b/package/rtptools/rtptools.mk
@@ -4,10 +4,14 @@
 #
 ################################################################################
 
-RTPTOOLS_VERSION = 1.22
-RTPTOOLS_SITE = http://www.cs.columbia.edu/irt/software/rtptools/download
+RTPTOOLS_VERSION = 520c0a3722f37cd243d6908063d86a0306ace088
+RTPTOOLS_SITE = $(call github,irtlab,rtptools,$(RTPTOOLS_VERSION))
 RTPTOOLS_LICENSE = BSD-3-Clause
 RTPTOOLS_LICENSE_FILES = LICENSE
-RTPTOOLS_CONF_ENV = ac_cv_prog_FOUND_CLANG=no
+
+define RTPTOOLS_CONFIGURE_LOCAL
+	echo 'PREFIX="$(TARGET_DIR)"' > $(@D)/configure.local
+endef
+RTPTOOLS_PRE_CONFIGURE_HOOKS += RTPTOOLS_CONFIGURE_LOCAL
 
 $(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
