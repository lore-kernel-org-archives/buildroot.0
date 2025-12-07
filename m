Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3E5D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 12:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 451DC4082F;
	Sun,  7 Dec 2025 12:14:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kilNiYPi3ooE; Sun,  7 Dec 2025 12:14:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD4E0403A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765109651;
	bh=mN3/Shn82BSm2xcKOtzKHQWH4mVIHhV05Np/x7yRp2I=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=csGxLG7JmLEogIjyBUnkadZi6TRM6Mb2kTE0mtnvnRng46N2vhW7eqFUQbCJoajS8
	 JTByjde6oAtLCNDXlAHgRpE+eJjimFIO+AA+a9aPkO6roNmHvl7oOSFsQi3H/s9fYe
	 F1YysUfpwdY5102KjJpPwbFqXIYWbaTNEmRIp8gxC9fQNAMieFu7Y6fXZuRiXSD7Hc
	 q6eNmAz5PRlWu2Fig8iQ1BJ0p00wwa2ZqwjdgzcFZSbpirW3Hf0+tcvC5FD2zpGhuu
	 YEETGEzhexhz5Vqg88FX8h9qlihA4aOsjHzct3gxqCaQGXqcYRqMR0G6RzrNYJRdYU
	 KVlnPMqkwsIMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD4E0403A8;
	Sun,  7 Dec 2025 12:14:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 102452CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 12:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E482403A8
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 12:14:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iEUpfCycdY6l for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 12:14:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 15C734025C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15C734025C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15C734025C
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 12:14:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 32551A4C0629
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 13:14:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40598)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSDeQ-000000003KK-2ArZ
 for buildroot@buildroot.org; Sun, 07 Dec 2025 12:14:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 13:14:06 +0100
Message-ID: <20251207121406.3506520-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765109647;
 bh=oZPaqswNY1eI3rvxWIF+dXlnpVlLjcgjd2I7/EBeU74=;
 h=From:To:Subject:Date:From;
 b=vlOh5qb6wh8g81dQB2FUus/VQX8ZO29m/mO4Jo8Ik4Xsl/bVnhUU5Ea/0xVxnyTQd
 1GXgEwsPh3Bbs/W1dO1jxeSN/+47WhkuAm6lAzEGGl+AWsX5i+V0HUxX6l5yt0fK2A
 fHsHNWD9vAViSowATSAJHZwfsFArJjYX6jef/Sengp/rKqO3TlBMboEQAr4QkpmhNr
 QT8pokY/6opo93vFksxVgV9PrA5GSxd7WTBQ8W5LQvKzr5Ze4dzns/y9SXKcN9SRIL
 afV1/phL0yx4p3AOOxJo8N++mpwFV5lnXPkTxCdlJw9YRRleISR5Yx9GA+sgJELTRm
 c/F9Gz89OPG5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=vlOh5qb6
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_xkbutils: bump version
 to 1.0.6
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

Release notes:
https://lists.x.org/archives/xorg-announce/2024-February/003448.html

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/app/xkbutils/-/commit/6dbcbb55951efb25af2e38034bdd86fa095aa9e5

Fixes:
https://autobuild.buildroot.net/results/eb7/eb7d32e65eece403538032a9006ea2f573ea10f8/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xkbutils/xapp_xkbutils.hash | 8 ++++----
 package/x11r7/xapp_xkbutils/xapp_xkbutils.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xkbutils/xapp_xkbutils.hash b/package/x11r7/xapp_xkbutils/xapp_xkbutils.hash
index 95287956a8..8174781e01 100644
--- a/package/x11r7/xapp_xkbutils/xapp_xkbutils.hash
+++ b/package/x11r7/xapp_xkbutils/xapp_xkbutils.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003186.html
-sha256  f6a4a8e9c54582beb3787b1faa8168caab125c1fee0ca9cfa5b6c9c1df25eea4  xkbutils-1.0.5.tar.xz
-sha512  0d8d460f5e015e9034292688437511068dab61216c2493f2981cfb63aaa012976ac9435c1586a22c0940fbfcb779b48dce9b85832303fe2b854aa945b814ac77  xkbutils-1.0.5.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-February/003448.html
+sha256  31a2bbee1e09ccba01de92897b8f540b545de812f318d31de07bd3a5a75ee25e  xkbutils-1.0.6.tar.xz
+sha512  78fb7ab4ef6642040992529444944080aca7a2ec4118f9a64c45dacc37e4041181df7bcd1f4270e11b9fbc8bd60a131b4702d2aa95741d89c54582ff8a8f896e  xkbutils-1.0.6.tar.xz
 # Locally computed
-sha256  3d67b53c085de6d475705b60855b9277afac5d4c4ec531d0ffd1ef0d00571594  COPYING
+sha256  4e86cc10a286bd6ce91c37143c399b1426058f5a13252a3d4677d58c990cd6df  COPYING
diff --git a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
index 90501908e6..cf63d4bb71 100644
--- a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
+++ b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XKBUTILS_VERSION = 1.0.5
+XAPP_XKBUTILS_VERSION = 1.0.6
 XAPP_XKBUTILS_SOURCE = xkbutils-$(XAPP_XKBUTILS_VERSION).tar.xz
 XAPP_XKBUTILS_SITE = https://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBUTILS_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
