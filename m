Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99EDC433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 14:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4167841705;
	Thu, 17 Feb 2022 14:21:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bghYkpSkZ_fM; Thu, 17 Feb 2022 14:21:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 930B14163E;
	Thu, 17 Feb 2022 14:21:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F09FB1BF313
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 14:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF2C183F28
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 14:21:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=othermo.de
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KhOsB5-ADKN4 for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 14:21:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org
 [IPv6:2001:67c:2050:101:465::110])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3D7383F27
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 14:21:31 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:3:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4JzxpJ5cT5z9slp;
 Thu, 17 Feb 2022 15:21:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=othermo.de; s=MBO0001; 
 t=1645107686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=l5Jteko0Y4oMsjVUJxFaBcEX7UjHEv4bi/z8W/KTHcY=;
 b=mS+ZrFYQ4mhZT/z6cQjeEXDcwX3HpBgCufheGW8OvUJPZeU9N+jFacSKaYwfTYbGZ4EChp
 SlpaodR4ftkBHHsgsFYHbPWLhu+fo67TCqBh7Ts4prDpHSozepLscrcBZ0RsAs/daQgqAm
 9L/2Dtz27ai5XkcxO47+mbpsJZznCjqagPpjZrIb4ExzhuIuBMmiEPZ8WHx9GHyF7jOYqO
 fJd8WD++///2Z67oU5cMqYwQS6kVMsd0eWYAx3nyb+qlD5J6KfpfiKPj21iAQAAvZIv3Yn
 dW1BS9Y07Tbs7dkNHCPbs7nNQRC+vpfmWmmhtYgc1qimAbC7CNto5pfJnqFcNg==
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 15:21:19 +0100
Message-Id: <20220217142120.576220-1-marcus.hoffmann@othermo.de>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/rauc: add option to enable gpt support
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
Cc: Andrey Yurovsky <yurovsky@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

GPT support was disabled by default before.

Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
---
 package/rauc/Config.in | 6 ++++++
 package/rauc/rauc.mk   | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/rauc/Config.in b/package/rauc/Config.in
index b4f7b81948..2ea51f5bad 100644
--- a/package/rauc/Config.in
+++ b/package/rauc/Config.in
@@ -25,6 +25,12 @@ config BR2_PACKAGE_RAUC_DBUS
 	  This option enables support for controlling rauc through
 	  D-Bus.
 
+config BR2_PACKAGE_RAUC_GPT
+	bool "GPT support"
+	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
+	help
+	    This option enables support for GPT partition tables.
+
 config BR2_PACKAGE_RAUC_NETWORK
 	bool "network support"
 	select BR2_PACKAGE_LIBCURL
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 39f5255812..0a631c4092 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -19,6 +19,13 @@ else
 RAUC_CONF_OPTS += --disable-service
 endif
 
+ifeq ($(BR2_PACKAGE_RAUC_GPT),y)
+RAUC_CONF_OPTS += --enable-gpt
+RAUC_DEPENDENCIES += util-linux-libs
+else
+RAUC_CONF_OPTS += --disable-gpt
+endif
+
 ifeq ($(BR2_PACKAGE_RAUC_NETWORK),y)
 RAUC_CONF_OPTS += --enable-network
 RAUC_DEPENDENCIES += libcurl
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
