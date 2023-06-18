Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26DCEB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 12:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 209DB410BC;
	Sun, 18 Jun 2023 12:32:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 209DB410BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TNxnFnLPnp_z; Sun, 18 Jun 2023 12:32:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B090414CA;
	Sun, 18 Jun 2023 12:32:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B090414CA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 151931BF5A8
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 12:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D969B414CA
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 12:32:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D969B414CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bum_KK9y6m67 for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 12:32:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EEA9414CD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3EEA9414CD
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 12:32:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0f96.dip0.t-ipconnect.de [91.58.15.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DB10EA4C00DD
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 14:32:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33602)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qArZm-0005oP-2C
 for buildroot@buildroot.org; Sun, 18 Jun 2023 14:32:14 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 18 Jun 2023 14:32:14 +0200
Message-Id: <20230618123214.163979-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687091534;
 bh=z4Y3iyN7hcSPotMM344Tf0vZyLAoHbtSgpQiG6ZvZQQ=;
 h=From:To:Subject:Date:From;
 b=MNpTIuszuItSF6peLcT6sqePeJkdSr/I+muXfsKdL/L0hW+ml1t8pCZrFQaawa44g
 0YX9aZzkOVismX/H651fW66Nop6BU0MtuzPEwPaoVCfRmEPLlJJxcFjP3R6dwsil9G
 1TMYH7PI/XEBrz5agxfVTX3AFBm4sRQ6O3UMXwFhA5/sJmo5VKzQ4NisXF9cCiHw18
 78TB1HUhfL70NVXgQmWL1zmbvmR5C86OpHr4Fjx4e8tvbRJUnS4J5qyLKBsMz330Sw
 B0ehJ0ElL1s8b8Y+EHC8pgHTpVlK4JUoyVOAxUyVjAyHe2ivmCXmVYshbn5RdJltgt
 fXwbV0D5vcIew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=MNpTIusz
Subject: [Buildroot] [PATCH 1/1] package/gkrellm: link with -latomic if
 needed
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/5df/5dffba341cfe5e4d41b3c88e58d92b0747318c07/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gkrellm/gkrellm.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gkrellm/gkrellm.mk b/package/gkrellm/gkrellm.mk
index 2a68722663..c9748eb084 100644
--- a/package/gkrellm/gkrellm.mk
+++ b/package/gkrellm/gkrellm.mk
@@ -12,7 +12,13 @@ GKRELLM_LICENSE_FILES = COPYING COPYRIGHT
 GKRELLM_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
 GKRELLM_BUILD_OPTS = \
 	STRIP="" \
-	SYS_LIBS=$(TARGET_NLS_LIBS)
+	SYS_LIBS="$(GKRELLM_SYS_LIBS)"
+
+GKRELLM_SYS_LIBS=$(TARGET_NLS_LIBS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+GKRELLM_SYS_LIBS += -latomic
+endif
 
 ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
 GKRELLM_DEPENDENCIES += lm-sensors
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
