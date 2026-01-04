Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA80C2A062
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 12:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10B0960729;
	Sun,  4 Jan 2026 12:04:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2V5cFrH-5k_E; Sun,  4 Jan 2026 12:04:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EB8F6072D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767528276;
	bh=wzoJYbbCUZ4EZPIr5iDpwNqGoFktYNM0SkeUIbA9Sn0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=npIY0vZSdE48+ALWSpdWA5AtHTX/O0fAjkVNEeDct7fQTobq/oCm3g1cyrQBqGrae
	 Giowx5ASqTRfHgaCIn8GRKQm0bLSyAFIqTWd8L5gngcLeeIakv2UoIrd99W37etN+I
	 ZUfnN6tavYNqVBVF5AvxJK/8/hRfn6+RFNU3VVgakXsqIp0FrQGf8F5Go1JTMIBVLm
	 aslQfV1uqudZQ1fxgxXuc2mzXmwn1Wh3c0C7X2Gz89EPWCxkSbVSPSlfL5Zmvql7xb
	 g6jDiv7x38VO2muux94RauY3jyswjONVPn/EgzN13Z961I2w9UZkEl8IAZXcHhIXru
	 KjlnB3ksLDQOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EB8F6072D;
	Sun,  4 Jan 2026 12:04:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EF21229
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 12:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D4056072D
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 12:04:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dFWPFLpRkH36 for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 12:04:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7153E60729
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7153E60729
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7153E60729
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 12:04:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0051EA4C2E3D
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:04:26 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41716)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vcMqQ-00000000364-2UkW
 for buildroot@buildroot.org; Sun, 04 Jan 2026 12:04:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  4 Jan 2026 13:04:26 +0100
Message-ID: <20260104120426.1233789-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767528267;
 bh=P4orgktSim8EV0AobO4f/3WV7i0kHs8gaqNrHZVVosY=;
 h=From:To:Subject:Date:From;
 b=ad6s2J13GMqbNlC8d6Nns1gL83DErNODPmP3VuoswTzpWGZuHBTQ2T6FBf/CLaO0a
 th8yDPOCU9/Ffb43fGY6Uh9Dk/gh12VpCya1u+oDDQOC/edUQxIW+xEKIphzmK/gbq
 336FtTwXcqJAy59uidl8eLljsrqB39RBBIK1jdGPW/t/j+uNPUc+JqxAdtC6xMS9mV
 iQmvJPEb3remOY8A48H5Yin5JnQ+YwVf2WR3DVooviE0pRWTTJZwm3H59t+bJugYVg
 ZUnxlC/A/Fsi9Pejidxia9JLVEf50sfKxGgarpizn62rG6DB+z19cpotH63/iRdAxs
 RaHJAmSKYiFgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ad6s2J13
Subject: [Buildroot] [PATCH 1/1] package/e2tools: bump version to 0.1.2
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

Upstream project was moved to https://github.com/e2tools/e2tools
https://github.com/ndim/e2tools/commit/8829023675b316cd3e32559000101403cd63c8f3

Switched to tarball provided by upstream, dropped autoreconf.

Updated lisense hash due to upstream commit
https://github.com/e2tools/e2tools/commit/5201a6882b4bec33256f0dad89d52a7f1d0ca893

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/e2tools/Config.in      | 2 +-
 package/e2tools/Config.in.host | 2 +-
 package/e2tools/e2tools.hash   | 4 ++--
 package/e2tools/e2tools.mk     | 6 ++----
 4 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/e2tools/Config.in b/package/e2tools/Config.in
index e4a35e27f4..c2c1f6f59a 100644
--- a/package/e2tools/Config.in
+++ b/package/e2tools/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_E2TOOLS
 	  utilities access a filesystem directly using the ext2fs
 	  library.
 
-	  https://github.com/ndim/e2tools
+	  https://e2tools.github.io
 
 comment "e2tools needs a toolchain w/ threads, wchar"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/e2tools/Config.in.host b/package/e2tools/Config.in.host
index 859c47bdc5..2f0ada9922 100644
--- a/package/e2tools/Config.in.host
+++ b/package/e2tools/Config.in.host
@@ -7,4 +7,4 @@ config BR2_PACKAGE_HOST_E2TOOLS
 	  utilities access a filesystem directly using the ext2fs
 	  library.
 
-	  https://github.com/ndim/e2tools
+	  https://e2tools.github.io
diff --git a/package/e2tools/e2tools.hash b/package/e2tools/e2tools.hash
index 14be7dbd96..dc716fa92a 100644
--- a/package/e2tools/e2tools.hash
+++ b/package/e2tools/e2tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1d06ca71f01483ad6d9a514e31466e7d2357b3465de2813d667a8b2f9638544e  e2tools-0.0.16.4.tar.gz
-sha256  0e79fd282723e1eb3f7381d41233a83ed20cf3e8c83aa53e6847bf7ffe781583  COPYING
+sha256  b19593bbfc85e9c14c0d2bc8525887901c8fe02588c76df60ab843bf0573c4a2  e2tools-0.1.2.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/e2tools/e2tools.mk b/package/e2tools/e2tools.mk
index 7c9ef0ffc7..5eee699310 100644
--- a/package/e2tools/e2tools.mk
+++ b/package/e2tools/e2tools.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-E2TOOLS_VERSION = 0.0.16.4
-E2TOOLS_SITE = $(call github,ndim,e2tools,v$(E2TOOLS_VERSION))
+E2TOOLS_VERSION = 0.1.2
+E2TOOLS_SITE = https://github.com/e2tools/e2tools/releases/download/v$(E2TOOLS_VERSION)
 
-# Source coming from GitHub, no configure included.
-E2TOOLS_AUTORECONF = YES
 E2TOOLS_LICENSE = GPL-2.0
 E2TOOLS_LICENSE_FILES = COPYING
 E2TOOLS_DEPENDENCIES = e2fsprogs
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
