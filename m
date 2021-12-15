Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C535C433F5
	for <buildroot@archiver.kernel.org>; Wed, 15 Dec 2021 18:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE749828F2;
	Wed, 15 Dec 2021 18:00:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zVO36syw4LP4; Wed, 15 Dec 2021 18:00:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16B98828C5;
	Wed, 15 Dec 2021 18:00:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF6C51BF2CF
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 18:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB89360EE5
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 18:00:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linatsea.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CeDuOXmNxvDo for <buildroot@lists.busybox.net>;
 Wed, 15 Dec 2021 18:00:28 +0000 (UTC)
X-Greylist: delayed 00:26:06 by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A119360ED0
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 18:00:28 +0000 (UTC)
Received: (Authenticated sender: thierry.bultel@linatsea.fr)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 9DDF7FF802;
 Wed, 15 Dec 2021 18:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linatsea.fr; s=gm1;
 t=1639591226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zAR2FWrgK0HdW/UFZyTXGmhnnPOQmELDWznkDM7uqNY=;
 b=iWQZifpM4dYKBAKoAlGJ7zkJe12UNCHKC8zLbx5U37N7bPJMMdG20+V2PKroJepBmB/3Xf
 K3TyuW//FD6hOdCEgaSSVmor2lYwaAfMgoKA7XMhYYq0cVw6cz3+CEFQQaK5wmu2rpekQn
 mlqoMUi5fXTkJZni2wkmMi1+gz4yZrn5lS6OKB0WI9zHqGkcO4McCFuIshal9eesDSwvuf
 Qxl9Zq0GYlFmGmiBCCv9fCZcWqFdY6WPEVUchlF04Hk6oAMHitJOEmnqDnKndOwJR2jQRK
 GzohS0BKVHngWkDAeVSOYbS4X7/RJLJAXsiDB8yh5ZE9CkBbDt7bUOHDRYqT+Q==
From: Thierry Bultel <thierry.bultel@linatsea.fr>
To: buildroot@buildroot.org
Date: Wed, 15 Dec 2021 19:00:19 +0100
Message-Id: <20211215180021.274991-1-thierry.bultel@linatsea.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/cross-ldd: new package
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
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cross-ldd works just as ldd, but supports
other architectures. It is needed by dracut, for instance.

Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
---
 package/Config.in.host           |  1 +
 package/cross-ldd/Config.in.host |  5 +++++
 package/cross-ldd/cross-ldd.mk   | 20 ++++++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/cross-ldd/Config.in.host
 create mode 100644 package/cross-ldd/cross-ldd.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 6e5a5c5fc5..0e8b071a2b 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -12,6 +12,7 @@ menu "Host utilities"
 	source "package/checksec/Config.in.host"
 	source "package/cmake/Config.in.host"
 	source "package/cramfs/Config.in.host"
+	source "package/cross-ldd/Config.in.host"
 	source "package/cryptsetup/Config.in.host"
 	source "package/dbus-python/Config.in.host"
 	source "package/dfu-util/Config.in.host"
diff --git a/package/cross-ldd/Config.in.host b/package/cross-ldd/Config.in.host
new file mode 100644
index 0000000000..237af701d2
--- /dev/null
+++ b/package/cross-ldd/Config.in.host
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_HOST_CROSS_LDD
+	bool "cross ldd"
+	help
+	ldd drop-in replacement for cross-compilation toolchains.
+	This is the officially supported version mentioned in the dracut documentation
diff --git a/package/cross-ldd/cross-ldd.mk b/package/cross-ldd/cross-ldd.mk
new file mode 100644
index 0000000000..9326a508bb
--- /dev/null
+++ b/package/cross-ldd/cross-ldd.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# cross-ldd
+#
+################################################################################
+
+CROSS_LDD_VERSION = 6c9c724ebd6a29c279c6e5734e44c07f067808ec
+CROSS_LDD_SOURCE = $(CROSS_LDD_VERSION).zip
+CROSS_LDD_SITE = https://gist.github.com/jerome-pouiller/c403786c1394f53f44a3b61214489e6f/archive
+
+define HOST_CROSS_LDD_EXTRACT_CMDS
+	unzip $(HOST_CROSS_LDD_DL_DIR)/$(CROSS_LDD_SOURCE) -d $(@D)
+	find $(@D) -name cross-compile-ldd -exec mv {} $(@D) \;
+endef
+
+define HOST_CROSS_LDD_INSTALL_CMDS
+	install -m 755 $(@D)/cross-compile-ldd $(TARGET_CROSS)ldd
+endef
+
+$(eval $(host-generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
