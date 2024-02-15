Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C006FC48BC4
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 14:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 589F9606B1;
	Thu, 15 Feb 2024 14:42:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZVA9-O7YQqqH; Thu, 15 Feb 2024 14:42:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B968460FA4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B968460FA4;
	Thu, 15 Feb 2024 14:42:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 48ED61BF982
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 14:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34D9F83C2E
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 14:42:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8cb0oXLokwDH for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 14:42:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2BA4883C2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BA4883C2C
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BA4883C2C
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 14:42:47 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id B7AD42C8394A;
 Thu, 15 Feb 2024 15:42:45 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu, 15 Feb 2024 15:42:42 +0100
Message-Id: <20240215144243.3538255-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215144243.3538255-1-buildroot@bubu1.eu>
References: <20240215144243.3538255-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1708008165; bh=nxzhDls5bG2H39V7UAUaITbuGvSgNppPh4Uxs4LejvM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=swHd9FrZsAhNajokL9mXNo8lpIztopaT3x7Gt8HCkgGi6OsquMIrrZRFPMi63YKyM
 8JZ7USZuWMWiQ/zbEOg16KG404s0ktvGtc74SysaS2ea7evTz1HspQwNvUoHJjuNzU
 2TkjBMzsnW2w+QgacRfBDK7qndG10wrybskX3gWgEVDaUKN0vkNHGi0RPWCryzjFUA
 UvdT/XBTrdCGj15zPCvJCX3CxRiXWSma/RXVynO7yRFoIG6ncR63NTupO4Hdxnj8v2
 Cogaz6cMP5j1Bd6qXKGi+5XDkjuIKlnUrhLe85R3Mmnf77PJmHTPV+c1k4z/oNBTtH
 YpidMDJGHv5tg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=swHd9FrZ
Subject: [Buildroot] [PATCH 2/3] package/libqmi: bump to version 1.34.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Explicitly disable new fuzzer build option.

Changelog:
https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/blob/qmi-1-34/NEWS

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/libqmi/libqmi.hash | 2 +-
 package/libqmi/libqmi.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index 5036c1d3c0..7937f989a0 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,4 +1,4 @@
 # Locally computed:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  aec96bf2733a7b5ba27bb52346ce3a1ab54440800843f78001cc2a51213ce1b9  libqmi-1.32.2.tar.gz
+sha256  8690d25b4d110b6df28b31da0a8bf16c7e966d31abcfeeb854f2753451e7a400  libqmi-1.34.0.tar.gz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index eae41446e2..524333feba 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.32.2
+LIBQMI_VERSION = 1.34.0
 LIBQMI_SITE = https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/archive/$(LIBQMI_VERSION)
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
@@ -12,7 +12,7 @@ LIBQMI_CPE_ID_VALID = YES
 LIBQMI_INSTALL_STAGING = YES
 
 LIBQMI_DEPENDENCIES = libglib2
-LIBQMI_CONF_OPTS = -Dman=false
+LIBQMI_CONF_OPTS = -Dman=false -Dfuzzer=false
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 LIBQMI_DEPENDENCIES += gobject-introspection
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
