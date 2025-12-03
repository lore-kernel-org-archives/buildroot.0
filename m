Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13322D1BDE7
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC47C406B1;
	Wed,  3 Dec 2025 22:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id drUdYjCDOtzX; Wed,  3 Dec 2025 22:05:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F38840884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799523;
	bh=ZzWTxp6AMS0PL6PffeWfvz9hwkn1hfraAC7daiVn5Zo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TpfCpMRF4uqEF3KK79tdoqid1HCLZjS1ihaQUv0QOOFjpV92+8cxcQywD6jUmDh4h
	 3DN0fA8WqViB7hxdnxyV5dPYw7T1+tXIYPrYnEOw+vshIyUMnVoPQJsWTUbCiScdI0
	 NULSlb++wAO9mymmV7ci5SOXeeEzi4jV1bW9WMpi2GL+iE1rXMXSbimUbRC3WsAxPH
	 R6s6isrpRzKLNC8uP7wPf4ALei8HkWyyF8isS9bd+D5xWaB4RFqoc7JipqfEI/HNCH
	 XzMm8FiPGttol8mc2YL5OW2nomHXSDxe+bYXD24oIrDo7q3eaK8aXVvxv2lZpt4C66
	 aRa0HYsFPWFpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F38840884;
	Wed,  3 Dec 2025 22:05:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AEDDDD3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A126E82D96
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:05:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RU7Ub6iJS880 for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:05:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 919AC8291C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 919AC8291C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 919AC8291C
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:05:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BA750A4C79D7;
 Wed,  3 Dec 2025 22:59:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56204)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQuqi-000000002OS-1Vrk;
 Wed, 03 Dec 2025 21:57:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Dec 2025 22:57:21 +0100
Message-ID: <20251203215723.2323032-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203215723.2323032-1-bernd@kuhls.net>
References: <20251203215723.2323032-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799147;
 bh=fpNNhJW56Qa0UzZFbwfWoz+M5dTuOU+z8sRwuuQpgpQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=UAKFQmrE0p3VxtFDV1X2LzEIufMoP6aAUrzSuKI077tbcSNw+NHOT/6GNiH2HYcZe
 C0BaT+ajA3vlWS4CkHWc+LEraV4CslS0ZqOLsGe33Kor4xAyd6d8p1tRaEP1dooPC/
 Ioe/fwIPMmBBZaglKoNN3G1slRl1lS7o5F2itpsiAYsHdI+Xwt6pf/f+vpBghRUX7T
 2VWr4wYPdQMg/OxCsMtRuZwx4KkotHGgLjoT73G85ps6g8/axF+5rn+EeFFPysXJxF
 lfE3QrLvj7mFVIq4Ha9ssqvxMZWF4mhndkSQrqOyWIuZZEasNV+iSxe+7ZLkqudpN8
 D37aojIYRQzvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=UAKFQmrE
Subject: [Buildroot] [PATCH/next 14/16] package/ubus: bump version
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

This bump includes a patch which adds cmake4 compatibility.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ubus/ubus.hash | 2 +-
 package/ubus/ubus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ubus/ubus.hash b/package/ubus/ubus.hash
index e35f37b03d..3d8206b974 100644
--- a/package/ubus/ubus.hash
+++ b/package/ubus/ubus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ba7602c660cb2c15c0e04942414e4cf3d96622622406c5fc3b88895694aebb9f  ubus-afa57cce0aff82f4a7a0e509d4387ebc23dd3be7-git4.tar.gz
+sha256  f625bda868133e28749b9eed64f9c3a838c75594e46a6a536e7e3582fe4da8e3  ubus-3cc98db1a422dcf560f2d6347fd410f17565a89d-git4.tar.gz
 sha256  a3caa6c0e90c87b7c97c2ac3d0c0d416082ef777215faec2e9b24ea6e68f6988  ubusd_acl.h
diff --git a/package/ubus/ubus.mk b/package/ubus/ubus.mk
index 913c0e3e39..c0f0264065 100644
--- a/package/ubus/ubus.mk
+++ b/package/ubus/ubus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBUS_VERSION = afa57cce0aff82f4a7a0e509d4387ebc23dd3be7
+UBUS_VERSION = 3cc98db1a422dcf560f2d6347fd410f17565a89d
 UBUS_SITE = https://git.openwrt.org/project/ubus.git
 UBUS_SITE_METHOD = git
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
