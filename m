Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9ABBD1BDE7
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEA2360A80;
	Wed,  3 Dec 2025 22:03:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YOOMQFaymVCR; Wed,  3 Dec 2025 22:03:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D354E60AD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799390;
	bh=PwcOplQg7XDDKEzkPfqSf+6mebxUFUBKfifW0mc5j14=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RqAjQYBZYjf8cSetGCdJQR2PToNItK0QiLnOEQTBUqjmYeXKWTxSrhpRKJJsZhN9t
	 D4USKZTDfT4TWzG1umEN8hb/73xemj3mKYqQeY9UDwoH6avRCoH6WXHw0MbXwu5na+
	 iQ6JXTZsqDjl8C+L2m9f1Oaio4j8gMrcoEDH8LOKd2wOpxBR6pDfg0XZIRE46UEILd
	 4EfwWNIZyZDjEhp3c8J0fjfF0MEAfVMCdhCFBthBu6mSHaTZNe821KXRmiuyWsyqQT
	 3CuTKybCDg5C3eww96Zs3V9IQi9Pm0OLqs8rByW5CKyvsJ5fQ7tyy9eM0IXg93xh1t
	 mSlWS+xB6Kk1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D354E60AD9;
	Wed,  3 Dec 2025 22:03:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C1C7ED3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8D2C401D4
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ull41doYOt93 for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:03:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9682B4004E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9682B4004E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9682B4004E
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:03:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 23CA5A4C79CD;
 Wed,  3 Dec 2025 22:59:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56204)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQuqh-000000002OS-0Mwc;
 Wed, 03 Dec 2025 21:57:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Dec 2025 22:57:10 +0100
Message-ID: <20251203215723.2323032-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203215723.2323032-1-bernd@kuhls.net>
References: <20251203215723.2323032-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799145;
 bh=FJPAHWXu5rZn/xY6TNARIOoeuJyp0YfkIgSlerQiuo8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=KOEFOfJxi9CB1hSaNOm7Zp15xdN07aN0gMVRltgv0e/L6kwjvLsFc9+3JsOEpdU8z
 X0wa4x05qT7tJ+VAMQKR/yv05BpxyYpRDKl7F2cSt2DnI33Jof/CiVKhSOGwm8pp+h
 1fWn5k17IoTIFPuJSZcFvgxEu+fZcpzPYj/OirDu3TudOp6WVZ98CmHrwlWdbTCkBV
 UkdwIs3xMQCX4h5cjK/L8TCFhMZKT45I6qxNB8dnPcTkku/c9T7fdcpDusHO0A9r7X
 wCDdWRHTwMkHtlcVlrSD3dccMQgII/mMeHxr1iUWqh+mkfc5TJzvI+WaYudPPSwsy4
 JRlAYoaNxAnLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=KOEFOfJx
Subject: [Buildroot] [PATCH/next 03/16] package/doxygen: bump version to
 1.15.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, RJ Ascani <rj.ascani@gmail.com>,
 Daniel Nicoletti <dantti12@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog of this host-only package:
https://www.doxygen.nl/manual/changelog.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/doxygen/doxygen.hash | 2 +-
 package/doxygen/doxygen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/doxygen/doxygen.hash b/package/doxygen/doxygen.hash
index ff2fac7b9c..ec46705d29 100644
--- a/package/doxygen/doxygen.hash
+++ b/package/doxygen/doxygen.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  18173d9edc46d2d116c1f92a95d683ec76b6b4b45b817ac4f245bb1073d00656  doxygen-1.8.18.src.tar.gz
+sha256  a8cafe605867ad475aaf288a3852783076e1df83aabf16488bbfa958062e7440  doxygen-1.15.0.src.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/doxygen/doxygen.mk b/package/doxygen/doxygen.mk
index b3bcb34097..c31271197d 100644
--- a/package/doxygen/doxygen.mk
+++ b/package/doxygen/doxygen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOXYGEN_VERSION = 1.8.18
+DOXYGEN_VERSION = 1.15.0
 DOXYGEN_SOURCE = doxygen-$(DOXYGEN_VERSION).src.tar.gz
 DOXYGEN_SITE = https://sourceforge.net/projects/doxygen/files/rel-$(DOXYGEN_VERSION)
 DOXYGEN_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
