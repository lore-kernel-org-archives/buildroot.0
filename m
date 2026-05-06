Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F638CD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 18:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36CDF60EE9;
	Wed,  6 May 2026 18:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z0IvRrGqC9Py; Wed,  6 May 2026 18:42:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2B0C60ED3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778092974;
	bh=ZRyp+NKTjPM1noWWJspojN/2WkKRrTM6qGdQKZbfOhg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ozv8efoLoD/DarQedq8bBmvo+01fDe1I+gc3GZjewVtat6Gv5oSN76B61PE1S9M6y
	 aiyvAZ7Qbs4wzcl8cnCE9QpUKRhEH+U//YSOI0TG6IRZgPnNZeEv/EwaCYwTcdPKef
	 e1npP8uam5hzN8Kxfo87FVyH5AtGNG2771N28pH4u6+hJpqdgIOeD3TW8wdSyOy94p
	 Uv0zZ4gjIiDGzjkbsdA6a04f9RDHD6sozUssYM9ftM4I7AXM+Ar1zSqA1JrtxkLHh7
	 h4sdI3dncYHZEdtrnHHg8a1ZOZEt6QqyXRz2Fajmzm/WkvkR1qW6JmRkzAXOKaQrSM
	 OXSEpVD25lzMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2B0C60ED3;
	Wed,  6 May 2026 18:42:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 34938280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AD0A40F44
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6FrdwN78zY4 for <buildroot@buildroot.org>;
 Wed,  6 May 2026 18:42:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 170C540F3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 170C540F3E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 170C540F3E
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:42:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bec8.dip0.t-ipconnect.de [84.161.190.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4E0ECA4C20E6;
 Wed,  6 May 2026 20:41:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38038)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKhB4-0000000040X-0rrk;
 Wed, 06 May 2026 18:40:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed,  6 May 2026 20:40:50 +0200
Message-ID: <20260506184057.665854-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506184057.665854-1-bernd@kuhls.net>
References: <20260506184057.665854-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778092862;
 bh=787pmr2kJB58Y6e+BF01EWInNcLoCAhH/s3HY4gsrwI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=PIOrbRmjKiDoGVtt448Um7u7eobxuDKpn74eHluDLR97HQHrnYVfRhELHzGmOLrNG
 l3WrLmYsVkGyYLP5F31KSR4z1Ya80mtJ861Jv2iVdNQaYDNiAb3ppXaXkfW9X9qQLG
 XdsUSEZIV7uIS9+Vb5c7MQ2fTqalUnaquCJmjgwJS/PqeCExO/ActikpFm1OUkLYj7
 GvH7CBFXxrXqNBt5rEY2kfd0Rl7ZLD6N0+OnLRDD6YdQzzKBynTOtQouD6ubHD6D4p
 4le1QIP6p2jMe4QlE40CdYh23FTmup/XGZta3jrvNRxsPPduq9CTubjKtv93Ra/yaQ
 44hu8hN9JAOSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=PIOrbRmj
Subject: [Buildroot] [PATCH 06/12] package/qt5base: optionally use libudev
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

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

qt5base only requires libudev, not a full udev daemon.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/qt5/qt5base/qt5base.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 3ad2bdfc04..e465969f64 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -101,8 +101,8 @@ ifneq ($(QT5BASE_CONFIG_FILE),)
 QT5BASE_CONFIGURE_OPTS += -qconfig buildroot
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-QT5BASE_DEPENDENCIES += udev
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
+QT5BASE_DEPENDENCIES += libudev
 endif
 
 ifeq ($(BR2_PACKAGE_CUPS), y)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
