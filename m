Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686A2D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F5D460B62;
	Sun,  7 Dec 2025 14:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ddkuaguFZTHE; Sun,  7 Dec 2025 14:44:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65B8E60B00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118653;
	bh=luUTzjbMpn+ze2l2fFxxjE8LG2AcUY1PJiZUn4jIb/I=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iVcwaIz2BZGLCXYxyE31aTlPX3t76eM22+0B0zQiIhV/uXuF0T9u549V/RoU2bKBv
	 Leni8I3JhNAAfrXAvVK3WtICFfUbilVSD+Rl9Eq9PUc2Xjax2v+6GpPmDMUCVbyHzz
	 C6uZHsqxmqIcvQhROgC3AybbFy5MdXqnQRMca5bVm9EsXubEgERnLzTwaFU67rgXG5
	 a8QwhsVrFUdDh7vyTXTWW7jMSeY342Tc5x1kC6TQuP9kiwFsbbEZmhpKRNSp0/jWA8
	 Tdv03cBB1q2EOPo6dBN2bxvVwxX573p4Wz+YI87URg127l5SHj4027yW5wn20Rvzap
	 pyFg5T9Mp7Qog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65B8E60B00;
	Sun,  7 Dec 2025 14:44:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 74C852CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7171940208
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r9wRm0GbqjOj for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:44:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DD6AA40166
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD6AA40166
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD6AA40166
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:44:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2F0EBA4C0982;
 Sun,  7 Dec 2025 15:42:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyF-00000000416-3LB0;
 Sun, 07 Dec 2025 14:42:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:13 +0100
Message-ID: <20251207144243.3696572-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118574;
 bh=EOwsVtpa55WqyVkfUyOcnHXyTnPz6qlW6zLeEktqoII=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pev7jdjWrijQQBBm8IOyhtN2mYz4WOjGE4QBvNSSwrRBiQdtlAYMEqmZ/L+CvH8VO
 o6mXFTyxk0m4vH36JqqAiigiqZwZsE1xS5sRG8LmAkvBFIllrPMnOtT3y95DskQTVK
 SUsBIAxEUlIOe7925BmxGtefgp10LBfJrJFUEm8fK1YWJKNPGZfZGuayHOgl7Fbu8O
 LJZ6Kc7dw18CbJF2VYNbtQfYixRYJxAhCwEE6fCPrJE0srguTUwbmq+u+Dcyk7wXCH
 mKFq5Zd2i3G7jDn1cuAyXfawD0fXH4QVKgRDDU5ORa8zEREokoDpPyTxbBoZHxWwHt
 GyIHHkXD1K+gg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=pev7jdjW
Subject: [Buildroot] [PATCH/next 04/33] package/msgpack: bump version to
 7.0.0
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

Changelog:
https://github.com/msgpack/msgpack-c/blob/cpp-7.0.0/CHANGELOG.md

Added optional dependency to boost.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/msgpack/msgpack.hash |  2 +-
 package/msgpack/msgpack.mk   | 10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/msgpack/msgpack.hash b/package/msgpack/msgpack.hash
index 5d432ba0ec..5d12914e61 100644
--- a/package/msgpack/msgpack.hash
+++ b/package/msgpack/msgpack.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  6e114d12a5ddb8cb11f669f83f32246e484a8addd0ce93f274996f1941c1f07b  msgpack-3.3.0.tar.gz
+sha256  7504b7af7e7b9002ce529d4f941e1b7fb1fb435768780ce7da4abaac79bb156f  msgpack-cxx-7.0.0.tar.gz
 sha256  664550b43996452a5a2c7471bb0ff77185a58c69ccafa60f983dc4c162e1ee22  COPYING
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/msgpack/msgpack.mk b/package/msgpack/msgpack.mk
index 996b5a2f7c..11b17ee87c 100644
--- a/package/msgpack/msgpack.mk
+++ b/package/msgpack/msgpack.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-MSGPACK_VERSION = 3.3.0
+MSGPACK_VERSION = 7.0.0
 MSGPACK_SITE = https://github.com/msgpack/msgpack-c/releases/download/cpp-$(MSGPACK_VERSION)
+MSGPACK_SOURCE = msgpack-cxx-$(MSGPACK_VERSION).tar.gz
 MSGPACK_LICENSE = BSL-1.0
 MSGPACK_LICENSE_FILES = COPYING LICENSE_1_0.txt
 MSGPACK_INSTALL_STAGING = YES
@@ -15,4 +16,11 @@ ifeq ($(BR2_STATIC_LIBS),y)
 MSGPACK_CONF_OPTS += -DMSGPACK_ENABLE_SHARED=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_BOOST),y)
+MSGPACK_CONF_OPTS += -DMSGPACK_USE_BOOST=ON
+MSGPACK_DEPENDENCIES += boost
+else
+MSGPACK_CONF_OPTS += -DMSGPACK_USE_BOOST=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
