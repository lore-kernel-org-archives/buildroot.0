Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389B3C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 21:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 007024087C;
	Thu,  6 Jan 2022 21:02:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3e8_4Q7TGpSD; Thu,  6 Jan 2022 21:02:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3759D403C7;
	Thu,  6 Jan 2022 21:02:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A68F1BF340
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 368D04018D
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:00:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id stGWdDpwa0lX for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 21:00:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04780400E5
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 21:00:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id F0F5960002;
 Thu,  6 Jan 2022 21:00:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@paral.in>,
 Buildroot List <buildroot@buildroot.org>,
 Matt Weber <Matthew.Weber@rockwellcollins.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Thu,  6 Jan 2022 21:59:57 +0100
Message-Id: <20220106210000.397694-10-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 09/11] package/tinifier: new package
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
Cc: Patrick Havelange <patrick.havelange@essensium.com>,
 Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a Go package that needs vendor modules to be downloaded at
build time.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/tinifier/Config.in     | 10 ++++++++++
 package/tinifier/tinifier.hash |  3 +++
 package/tinifier/tinifier.mk   | 13 +++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/tinifier/Config.in
 create mode 100644 package/tinifier/tinifier.hash
 create mode 100644 package/tinifier/tinifier.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 55ea7805f7..774deb012f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2765,6 +2765,7 @@ F:	package/rtc-tools/
 F:	package/sam-ba/
 F:	package/scons/
 F:	package/squashfs/
+F:	package/tinifier/
 F:	package/wayland/
 F:	package/weston/
 F:	support/testing/tests/boot/test_syslinux.py
diff --git a/package/Config.in b/package/Config.in
index cb15574746..e47c49ade5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -314,6 +314,7 @@ comment "Graphic applications"
 	source "package/rrdtool/Config.in"
 	source "package/stellarium/Config.in"
 	source "package/tesseract-ocr/Config.in"
+	source "package/tinifier/Config.in"
 
 comment "Graphic libraries"
 	source "package/cegui/Config.in"
diff --git a/package/tinifier/Config.in b/package/tinifier/Config.in
new file mode 100644
index 0000000000..fbadfe6bd9
--- /dev/null
+++ b/package/tinifier/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_TINIFIER
+	bool "tinifier"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	help
+	  CLI tool for images compressing
+
+	  This tool uses tinypng.com API endpoint for compressing your
+	  local jpg/png images (it supports parallel jobs).
+
+	  https://github.com/tarampampam/tinifier
diff --git a/package/tinifier/tinifier.hash b/package/tinifier/tinifier.hash
new file mode 100644
index 0000000000..5681ed6a55
--- /dev/null
+++ b/package/tinifier/tinifier.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  927e966f9d23ea7cc1942967a8fc16ef4c55c51bd096d44f54b418844a51aa12  tinifier-3.4.0.tar.gz
+sha256  791d8fd993ace44d4d83e2f4820a64d5ad3e37412f029afad46d17a9259de2b6  LICENSE
diff --git a/package/tinifier/tinifier.mk b/package/tinifier/tinifier.mk
new file mode 100644
index 0000000000..d7ed6f7c93
--- /dev/null
+++ b/package/tinifier/tinifier.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# tinifier
+#
+################################################################################
+
+TINIFIER_VERSION = 3.4.0
+TINIFIER_SITE = $(call github,tarampampam,tinifier,v$(TINIFIER_VERSION))
+TINIFIER_LICENSE = MIT
+TINIFIER_LICENSE_FILES = LICENSE
+TINIFIER_GOMOD = ./cmd/tinifier
+
+$(eval $(golang-package))
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
