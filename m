Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B9ECD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 11:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88A3E81FBB;
	Sun,  7 Apr 2024 11:47:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u85qr1PxKyGs; Sun,  7 Apr 2024 11:47:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B718820F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B718820F8;
	Sun,  7 Apr 2024 11:47:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 07A461BF947
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E922B60733
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:47:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UXN1if1JjViO for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 11:47:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C562560705
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C562560705
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C562560705
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 11:47:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a070b.dip0.t-ipconnect.de [91.58.7.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8A550A4C2E06;
 Sun,  7 Apr 2024 13:44:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53892)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rtQx6-000000005Wv-1aQP;
 Sun, 07 Apr 2024 11:44:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 13:44:36 +0200
Message-Id: <20240407114445.683504-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240407114445.683504-1-bernd@kuhls.net>
References: <20240407114445.683504-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712490288;
 bh=Cle9UynmYt2PmbWeHnfPr99wtwjxDltdjjC72h2++5o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KkdbzubHpoQraEm3eD/u0cEcD1q48fdrZTGZsmv59uyHErHU9Zr2xbBhDO86leo4T
 zsYXczCUI5jitRGWF0xKybYLd3oSj4c7TF8HewvdN4JIOkg8U2CvIM9OGxlv9n6dEy
 t7mWG68JWw2x8MWyTzXyqGdpT+IMoCtJyJtEX1dtWJ9a3rsMhor1aF45/IoaeuhsJn
 JTcIjRkqt+wv8/l4/zlH/NhtbWWw5uurGb26vaU8UIdXx6RACtdb96cqR9K7oHf7KI
 SXDR5PGAEq3xsb3PUzqvXZ+MlNFc7u1ec+vwFPcyNkWxS+MMeqiMXpR6xKmsQTZUH7
 LAyJ0krN3Eqbg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=KkdbzubH
Subject: [Buildroot] [PATCH v2 11/20] package/kodi-inputstream-adaptive:
 bump version to 21.4.4-Omega
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

Added dependency to pugixml:
https://github.com/xbmc/inputstream.adaptive/commit/31a51a8b0f265ffc5ac62e70c2447334d148c819

Removed dependency to expat:
https://github.com/xbmc/inputstream.adaptive/commit/8816b9089bb4cefc0bf2996db49c3bd1b81b42fe

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-inputstream-adaptive/Config.in                   | 2 +-
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash  | 2 +-
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk    | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/Config.in b/package/kodi-inputstream-adaptive/Config.in
index 3efe3aa114..f1f98b8304 100644
--- a/package/kodi-inputstream-adaptive/Config.in
+++ b/package/kodi-inputstream-adaptive/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_KODI_INPUTSTREAM_ADAPTIVE
 	depends on BR2_aarch64 || BR2_arm || BR2_i386 || BR2_mipsel \
 		|| BR2_mips64el || BR2_x86_64
 	select BR2_PACKAGE_BENTO4
-	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_PUGIXML
 	help
 	  Kodi inputstream addon for several manifest types
 
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index e38191c0c4..b7a89a8a02 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  f67cfef057f8842716db4521a8cd3966c37a1da8fc3fb297527f6f25be20688a  kodi-inputstream-adaptive-20.3.17-Nexus.tar.gz
+sha256  0a1074fe04fb7e9500d578490b4cda12ecfcf433495e15e7bf65861527586167  kodi-inputstream-adaptive-21.4.4-Omega.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index ba4f6de61a..e1fe3f37ed 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 20.3.17-Nexus
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.4.4-Omega
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
@@ -22,6 +22,6 @@ KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = \
 	LICENSES/GPL-2.0-or-later \
 	LICENSES/RSA-MD
 
-KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = bento4 expat kodi
+KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = bento4 kodi pugixml
 
 $(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
