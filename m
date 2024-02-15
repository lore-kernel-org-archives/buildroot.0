Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF879C48BEB
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 14:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A85A660FA5;
	Thu, 15 Feb 2024 14:42:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g-z6gOjyquzX; Thu, 15 Feb 2024 14:42:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A302660F9B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A302660F9B;
	Thu, 15 Feb 2024 14:42:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6FBC1BF844
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 14:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D21B783C2C
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 14:42:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BAQFF6fzHUFo for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 14:42:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B478183C2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B478183C2D
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B478183C2D
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 14:42:48 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 872672C8394B;
 Thu, 15 Feb 2024 15:42:46 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu, 15 Feb 2024 15:42:43 +0100
Message-Id: <20240215144243.3538255-3-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215144243.3538255-1-buildroot@bubu1.eu>
References: <20240215144243.3538255-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1708008166; bh=5004eFGiimuLJRXNJlfuvYqwGy+Dli81gEOTDxxAW8k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=SXvSMaK9TuXdwK0twqJj0LK8VVBPM87ortgNEiqOy0+1Ve9np4SS1g8ERFUjhJAv0
 xyxl1b8I2cQRayHkWLHCkAprjwi5Y8lUVxnSzU/uZDJyCJbEb1JtDvIbE7Alh8Mhpx
 /TEcp0U2zuoeq8XMtS+KeTW/b86nutA9KUHftVNgWyGstZGC2rSxfOY9eLLm1R7Nkn
 aWFqyLnKZnq96raTGQ7c6oAdPj5gmeenOk0IlfouYsSqw5rLTOs19fLNWtN5LNPlCu
 C8HECq0TNUtljpHpBUfvk2nc68fNQHsNrnNeg/cqMjeXrQwThFroLPid8iwNcsP/hb
 RsQXZiIfYrEzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=SXvSMaK9
Subject: [Buildroot] [PATCH 3/3] package/modem-manager: bump to 1.22.0
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

Explicitly disable newly introduced build options.

Changelog:
https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/blob/mm-1-22/NEWS

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/modem-manager/modem-manager.hash | 4 ++--
 package/modem-manager/modem-manager.mk   | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index 4b8b795af7..fa81acd9dc 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,4 +1,4 @@
-#Locally calculated after checking https://www.freedesktop.org/software/ModemManager/ModemManager-1.18.12.tar.xz.asc
-sha256  9c16b47547faac9515f2d03d1e8175de9c5e6769b1ee16b608ba6cfe6f04b03e  ModemManager-1.20.4.tar.gz
+#Locally calculated
+sha256  6c8f8720737a3788e394c700f36236278c9de09d76069a079e6f1daaf08b2768  ModemManager-1.22.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 979a80a8e9..495dbcd258 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.20.4
+MODEM_MANAGER_VERSION = 1.22.0
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.gz
 MODEM_MANAGER_SITE = https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/archive/$(MODEM_MANAGER_VERSION)
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
@@ -13,6 +13,8 @@ MODEM_MANAGER_SELINUX_MODULES = modemmanager
 MODEM_MANAGER_DEPENDENCIES = host-pkgconf dbus libglib2 $(TARGET_NLS_DEPENDENCIES) host-libxslt
 MODEM_MANAGER_INSTALL_STAGING = YES
 MODEM_MANAGER_CONF_OPTS = \
+	-Dbuiltin_plugins=false \
+	-Dfuzzer=false \
 	-Dman=false \
 	-Dpowerd_suspend_resume=false \
 	-Dtests=false \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
