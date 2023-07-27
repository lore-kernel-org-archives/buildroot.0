Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5FCC0015E
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 21:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED06284072;
	Thu, 27 Jul 2023 21:20:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED06284072
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0_L9elNqdAZE; Thu, 27 Jul 2023 21:20:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 374DC84055;
	Thu, 27 Jul 2023 21:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 374DC84055
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7BD601BF414
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6273E613D3
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:20:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6273E613D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Esoo6Plzif1e for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 21:20:30 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92F8F60B2A
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 21:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92F8F60B2A
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A0009A4C1061;
 Thu, 27 Jul 2023 23:20:27 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41524)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qP8PK-00030l-1S;
 Thu, 27 Jul 2023 23:20:26 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 23:20:26 +0200
Message-Id: <20230727212026.2269634-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690492827;
 bh=6kpyQzlbEsT3PWpEtcIzAAlGCXw+pIX53FdVr7jmifY=;
 h=From:To:Cc:Subject:Date:From;
 b=re/+Etcn3v76tRkRnlAfCF3l+gAdK4Hfp8mcDEm7Wq8nuifpNQTum5VNvU6XkFQkM
 isfEQz5WmTX34SdvUBxx4Wm/L8LD9MmXXIRnOjUr9lUVoBG01p6GlvZf4CRNloIhVG
 ErXogCvqXq43h3BCZooW5XB6gItFpnlRgtz86tGTxuPgiNjUpMf0G5GTiTIJDVCC6z
 38JBgW6Qeti/a6tC8zXebD2gh3deFfwdNfTFsRXTN6WGpX0KRzPnF5rT5wqDhjemls
 yVWmMO2eXqEy7YvaW5KLScBYA4xTJXIADlcD+ixG+G3XgW6r8jI1iyfWS/5m1PBj96
 NoKjtKR8uTSVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=re/+Etcn
Subject: [Buildroot] [PATCH 1/1] package/fluent-bit: fix build without c++
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The kafka plugin needs c++.

Fixes:
http://autobuild.buildroot.net/results/709/70960056479eab860e94eed993566fcb78c4dbbe/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/fluent-bit/fluent-bit.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 1185860661..245f6ecf44 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -22,6 +22,16 @@ FLUENT_BIT_CONF_OPTS += \
 	-DFLB_PREFER_SYSTEM_LIBS=Yes \
 	-DFLB_BACKTRACE=No
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+FLUENT_BIT_CONF_OPTS += \
+	-DFLB_IN_KAFKA=Yes \
+	-DFLB_OUT_KAFKA=Yes
+else
+FLUENT_BIT_CONF_OPTS += \
+	-DFLB_IN_KAFKA=No \
+	-DFLB_OUT_KAFKA=No
+endif
+
 ifeq ($(BR2_PACKAGE_FLUENT_BIT_WASM),y)
 FLUENT_BIT_WAMR_ARCH = $(call qstrip,$(BR2_PACKAGE_FLUENT_BIT_WASM_ARCH))
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
