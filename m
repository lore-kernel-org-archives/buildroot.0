Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2AAC52D7C
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 11:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA140412C4;
	Fri,  9 Aug 2024 11:24:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QpXroBD9mpWf; Fri,  9 Aug 2024 11:24:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 722D0412D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 722D0412D8;
	Fri,  9 Aug 2024 11:24:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 36BD81BF336
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 11:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32145612EE
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 11:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RCiyygC-SgRX for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 11:24:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.103.80.155;
 helo=mx.kolabnow.com; envelope-from=zgyarmati@zgyarmati.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6655B60F3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6655B60F3E
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.155])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6655B60F3E
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 11:24:32 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id 71597353B798
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 13:24:30 +0200 (CEST)
X-Virus-Scanned: amavis at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out013.mykolab.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id P2jDQ0TEoeLH for <buildroot@buildroot.org>;
 Fri,  9 Aug 2024 13:24:25 +0200 (CEST)
Received: from int-mx009.mykolab.com (unknown [10.9.13.9])
 by mx.kolabnow.com (Postfix) with ESMTPS id 8064C353B797
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 13:24:24 +0200 (CEST)
Received: from ext-subm010.mykolab.com (unknown [10.9.6.10])
 by int-mx009.mykolab.com (Postfix) with ESMTPS id 39A4920C35D9
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 13:24:24 +0200 (CEST)
From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
To: buildroot@buildroot.org
Date: Fri,  9 Aug 2024 13:24:02 +0200
Message-Id: <20240809112402.737525-2-zgyarmati@zgyarmati.de>
In-Reply-To: <20240809112402.737525-1-zgyarmati@zgyarmati.de>
References: <20240809112402.737525-1-zgyarmati@zgyarmati.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kolabnow.com; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:date:subject:subject:from:from:received
 :received:received; s=dkim20240523; t=1723202665; x=1725017066;
 bh=+uhsu5K89qDFZhYmI58MKbdBXg3yG2s+pX7kRrZhg1g=; b=Ghi/shFLVZi9
 QdQrrjkuyM/Z0j+ORLrs7H8fT64z3rZPTIlI9Cgwtl9AzHXfdLw6otj2zMF+HwEx
 3oh1/J7FuwKi9v9fhwv+jP+o5Pph7CBLaoMX27JFch/+fSM0CSxPvUVaUyRCN+SX
 c06y5dGzVif1tBDIoOi0k3WfAmxTlroRQEezhVoMQYPjfE08BvwH56ZhO5Jlumid
 8J3ZL4D/mU38cIOW5ZidTfhT5QP8lou4DKVLGU9HyPa2V4fecANDyV7SmblBNHnx
 zuJxuTBmM+oYcUXVEbSU2XzWnOm6uxY1EtRFcegUEc2v1/O/2HZvNctMKA32P5t6
 08Tef/tjdg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zgyarmati.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kolabnow.com header.i=@kolabnow.com header.a=rsa-sha256
 header.s=dkim20240523 header.b=Ghi/shFL
X-Mailman-Original-Authentication-Results: ext-mx-out013.mykolab.com (amavis); 
 dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
Subject: [Buildroot] [PATCH v2 2/2] package/simple-mail: enable for qt6
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
---
 package/simple-mail/Config.in      | 5 +++--
 package/simple-mail/simple-mail.mk | 7 ++++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/simple-mail/Config.in b/package/simple-mail/Config.in
index 681a8410db..fd82a224d3 100644
--- a/package/simple-mail/Config.in
+++ b/package/simple-mail/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_SIMPLE_MAIL
 	bool "simple-mail"
-	depends on BR2_PACKAGE_QT5
-	select BR2_PACKAGE_QT5BASE_NETWORK
+	depends on BR2_PACKAGE_QT5 || BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT5BASE_NETWORK if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6BASE_NETWORK if BR2_PACKAGE_QT6
 	select BR2_PACKAGE_OPENSSL
 	help
 	  An SMTP library written in C++ for Qt.
diff --git a/package/simple-mail/simple-mail.mk b/package/simple-mail/simple-mail.mk
index 94f2369816..82bea45f21 100644
--- a/package/simple-mail/simple-mail.mk
+++ b/package/simple-mail/simple-mail.mk
@@ -9,7 +9,12 @@ SIMPLE_MAIL_SITE = $(call github,cutelyst,simple-mail,v$(SIMPLE_MAIL_VERSION))
 SIMPLE_MAIL_INSTALL_STAGING = YES
 SIMPLE_MAIL_LICENSE = LGPL-2.1+
 SIMPLE_MAIL_LICENSE_FILES = LICENSE
-SIMPLE_MAIL_DEPENDENCIES = qt5base
 SIMPLE_MAIL_CONF_OPTS = -DBUILD_DEMOS=OFF
+ifeq ($(BR2_PACKAGE_QT5BASE),y)
+SIMPLE_MAIL_DEPENDENCIES += qt5base
+else ifeq ($(BR2_PACKAGE_QT6BASE),y)
+SIMPLE_MAIL_DEPENDENCIES += qt6base
+SIMPLE_MAIL_CONF_OPTS += -DQT_VERSION_MAJOR=6
+endif
 
 $(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
