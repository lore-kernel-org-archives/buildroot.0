Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BED1C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 07:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B70F16F661;
	Thu, 17 Feb 2022 07:55:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qybJuMp4a64r; Thu, 17 Feb 2022 07:55:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 142276EE12;
	Thu, 17 Feb 2022 07:55:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBB551BF5AD
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 07:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A96106EE12
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 07:55:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QiJyao0Z6JjM for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 07:55:12 +0000 (UTC)
X-Greylist: delayed 00:11:06 by SQLgrey-1.8.0
Received: from mail.h6t.eu (mail.h6t.eu [159.69.47.87])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB81260B4B
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 07:55:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DD184E9CAB; Thu, 17 Feb 2022 08:43:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=h6t.eu; s=dkim;
 t=1645083841; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=2QKcibFvhzAwy/QJvmZm/OFiiERtFyhxGkNCLPBAOlA=;
 b=iY1K0tHWbQxYyyPd/LX3zqNCMBnaMaaRfORCrQfsA3DOkOt6T2naM82jnQHtWiizo5MggJ
 tYCD7c2djaC0KFHZ9ZK9TKEBJgzZZwLfuTIPVz/D/Egkg98cW2sRkT4fqLAeAgSqkVa1vS
 +V9tnIqzdKgu6UkaZbzHTqHs4GrnAgjkAcREBeP1wt77F7trKYWs6przMzl3f354S9jXKD
 Hm7J61alcE+aWtKZpus5ShmDfHcM8INX2jiSt5kCFNLXajlIXzGozs25XsnOf8e4FW2M+I
 qeuk939wStHueHAwlRsoQ5dv2CapxtT7DhcpLpXSNsOG/CEXrIq+FnI0158Unw==
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 08:43:38 +0100
Message-Id: <20220217074338.147889-1-moritz@h6t.eu>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/1] package/cryptsetup: fix build failure with
 libgcrypt
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
From: Moritz Bitsch via buildroot <buildroot@buildroot.org>
Reply-To: moritz@h6t.eu
Cc: Moritz Bitsch <moritz@h6t.eu>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Moritz Bitsch <moritz@h6t.eu>

The patch 0001-Add-check-program-for-symver-attribute.patch touches
a autoconf relevant file which causes a configure --recheck in the
make step without proper CONF_ENV. Running autoreconf prevents this.

Signed-off-by: Moritz Bitsch <moritz@h6t.eu>
---
 package/cryptsetup/cryptsetup.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 2e06047c56..8373f0ab74 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -19,6 +19,7 @@ CRYPTSETUP_CPE_ID_VENDOR = cryptsetup_project
 CRYPTSETUP_INSTALL_STAGING = YES
 CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
 CRYPTSETUP_CONF_OPTS += --enable-blkid --enable-libargon2
+CRYPTSETUP_AUTORECONF = YES
 
 # cryptsetup uses libgcrypt by default, but can be configured to use OpenSSL
 # or kernel crypto modules instead
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
