Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25E1E7718F
	for <buildroot@archiver.kernel.org>; Wed,  1 Jan 2025 22:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D1F6606AE;
	Wed,  1 Jan 2025 22:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8y8Mwwmt8j1i; Wed,  1 Jan 2025 22:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E5266065C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E5266065C;
	Wed,  1 Jan 2025 22:37:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C565E0F
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 22:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AB1260867
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 22:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z8SLT5NNF4Bq for <buildroot@buildroot.org>;
 Wed,  1 Jan 2025 22:37:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 285E860858
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 285E860858
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 285E860858
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 22:37:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id F31061BF204;
 Wed,  1 Jan 2025 22:37:28 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  1 Jan 2025 23:37:24 +0100
Message-ID: <20250101223727.2348482-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735771049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=kl3tDahqqSxCPF1ww/HMPtMafUpHrLi4Zkc88scxTTw=;
 b=WwRJkIgvO8Vm0ZafPdSsJk2RtRUsfZ90JIn4y1Xpm3CLRCWCXtuiOMAfkIWOMscPGfuvKs
 gaEA4OTid2GjPxgyHsYo1rz+kO8JO/9uS6WSH58LGFXAyYLLWMUm2ia9HFj8I7qPPQ098g
 2/rmxMAQZb4JXiXcqWMLLdT4rtA+W8ulCfKbjcj918yp8b7RmkoiaU8htEtI9QQ6Yd4s9p
 7QPTHgWpBk9w7Vqcd0KDtuuw/6KshbaxQnuRoBgE+A0O6GaUhsL7NyolPnLMeCwZtjsgo/
 /jxEX34E9s+MC0FVdn/OGrpzeC4/r9UDfwl9G2YwYB5sxA4276RL1sBmHJhrJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WwRJkIgv
Subject: [Buildroot] [PATCH 1/2] package/c-icap: memcached code needs
 <crypt.h>
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The memcached code of c-icap needs <crypt.h>, which is no longer
provided by glibc since glibc 2.39. So add some logic to add a
dependency on libxcrypt when needed.

Fixes:

  http://autobuild.buildroot.net/results/63b04f86bb8794b79d206659a883acef96dfebf0/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/c-icap/Config.in | 3 +++
 package/c-icap/c-icap.mk | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/c-icap/Config.in b/package/c-icap/Config.in
index 8f7963c26a..3c1325ee39 100644
--- a/package/c-icap/Config.in
+++ b/package/c-icap/Config.in
@@ -3,6 +3,9 @@ config BR2_PACKAGE_C_ICAP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	# the libmemcached code uses <crypt.h>
+	select BR2_PACKAGE_LIBXCRYPT if \
+	       BR2_PACKAGE_LIBMEMCACHED && BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  c-icap is an implementation of an ICAP server. It can be
 	  used with HTTP proxies that support the ICAP protocol to
diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index 36ef1c8b12..4ece4c4b26 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -43,7 +43,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBMEMCACHED),y)
 C_ICAP_CONF_OPTS += --with-memcached
-C_ICAP_DEPENDENCIES += libmemcached
+C_ICAP_DEPENDENCIES += libmemcached $(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt)
 else
 C_ICAP_CONF_OPTS += --without-memcached
 endif
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
