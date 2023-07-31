Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3457C001DE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 17:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4595840BBF;
	Mon, 31 Jul 2023 17:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4595840BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 61K7x3WjTs-L; Mon, 31 Jul 2023 17:05:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32A5A40577;
	Mon, 31 Jul 2023 17:05:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32A5A40577
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD0ED1BF3B8
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 17:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9295B60B32
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 17:05:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9295B60B32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h4hpVO2nWXnj for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 17:05:12 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68D1660ADA
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 17:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68D1660ADA
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-99bdd262bb0so691496766b.3
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 10:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690823110; x=1691427910;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9Ls6wMKDeXWmYnnzi3f+MdxGGdOCLqGZtZeT5sPyB0Q=;
 b=l70uUmRHEtVAjwK+H0JnYg8+ukCsuPVmohrNKA31JJkZxdAyzEjxsJe1EAWZzaLrv+
 fjkCRHot5WM6jo4xDoFEthyXIAKRx1MZ6wn2k7NFURpgLxKVeZqvg9ol2i+DTXUiqKUM
 kKbUcEOY077InDq9v4lE+UgZW2uzOERRMGq93PboOYsM+QLUjXY52RXf4T4fbHC1UU9t
 VkNCfbytt/Z2ZAaQEtd1bniv55uEIGOt18fYfvzt5JcKULFfbkOKuNtL3TsnZVC6nNJo
 8e9mKuJPL2XU35zGq4Mh9AXpXXFMzYHSBSbxBKfrBzFtD+rAj07il00xclK7HMnTq7LO
 GgnA==
X-Gm-Message-State: ABy/qLZD+eaoeOIKPGwVg+wB2zYwJ2Eisqq5n9qPSREazJs9fO/UFHyf
 cH0rJf4pUv4mp8xeYLdCPqXVTODze0k=
X-Google-Smtp-Source: APBJJlFNXRE234WXS7Pqa4zJCsSfooGVJdFbJQ0C7LaLH8iGRrOhcr2LK8os/Wr3q3MzFkJHARKMoA==
X-Received: by 2002:a17:907:7633:b0:99b:c86b:1d25 with SMTP id
 jy19-20020a170907763300b0099bc86b1d25mr311787ejc.26.1690823109691; 
 Mon, 31 Jul 2023 10:05:09 -0700 (PDT)
Received: from fedora.. ([213.149.38.169])
 by smtp.googlemail.com with ESMTPSA id
 l19-20020a170906079300b0098e0a937a6asm6396755ejc.69.2023.07.31.10.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 10:05:09 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 31 Jul 2023 19:05:04 +0200
Message-ID: <20230731170504.2769638-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690823110; x=1691427910;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9Ls6wMKDeXWmYnnzi3f+MdxGGdOCLqGZtZeT5sPyB0Q=;
 b=W8oKLphHyVi62qfRP/Or8E2LR/B66ckOegaBRWwVNPP6tk6Jxqg15Wf0HKsX04TNR+
 ZUGIS9vbs2lq0+8BT4D2DiKJxZqKWw7g+y1fjl7kGs4Y0L8PhwLbf4hnIEAmDyVYf5XS
 GN6lbcvBWlxMI7dCMRTEWB6wJmj42zx2auXh0zSolzoqNtdTxDRnF+ePonbhIVo8cbej
 ZYOCOQJgJAyqG0VHm81wBdoCgX4MYqbzQxz/km9x5XUXHSCwI3WzMp9k/ZimvInY6oTJ
 sQ+ENOCStehllGSDGE+OB19UWHnrZPnZJ6WumTQBDPc25rqJ7ZQN/qtI6lpZvWcUf9ml
 fkgA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=W8oKLphH
Subject: [Buildroot] [PATCH v3] package/mhz: add new package
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
Cc: Robert Marko <robimarko@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mhz is a tool to mathematically calculate the real running CPU frequency
and as such has proved as invaluable tool for developing CPUFreq and
similar features in the kernel.

Its source finally got a license recently so it can be packaged.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
Changes in v3:
* Add LICENSE file hash
* Simplify build command

Changes in v2:
* Use the Makefile from source and override CC and CFLAGS
---
 package/Config.in     |  1 +
 package/mhz/Config.in |  6 ++++++
 package/mhz/mhz.hash  |  3 +++
 package/mhz/mhz.mk    | 21 +++++++++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/mhz/Config.in
 create mode 100644 package/mhz/mhz.hash
 create mode 100644 package/mhz/mhz.mk

diff --git a/package/Config.in b/package/Config.in
index a60a1a8858..b9b6dd2580 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -549,6 +549,7 @@ endmenu
 	source "package/memtest86/Config.in"
 	source "package/memtester/Config.in"
 	source "package/memtool/Config.in"
+	source "package/mhz/Config.in"
 	source "package/minicom/Config.in"
 	source "package/msr-tools/Config.in"
 	source "package/nanocom/Config.in"
diff --git a/package/mhz/Config.in b/package/mhz/Config.in
new file mode 100644
index 0000000000..2f4af5026e
--- /dev/null
+++ b/package/mhz/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_MHZ
+	bool "mhz"
+	help
+	  CPU frequency measurement utility.
+
+	  https://github.com/wtarreau/mhz.git
diff --git a/package/mhz/mhz.hash b/package/mhz/mhz.hash
new file mode 100644
index 0000000000..eb66c10d63
--- /dev/null
+++ b/package/mhz/mhz.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  1e07bb0d455d63fd33fb87a24f65a803c7c2d920fde4e5b5378b8c1b07de3b47  mhz-11aac2399780a1f7ea9f007b14af0464797d5cf1-br1.tar.gz
+sha256  9449d373cad921620bb8f1e4f7b39f957e263163ded159c1efc8de27f8997099  LICENSE
\ No newline at end of file
diff --git a/package/mhz/mhz.mk b/package/mhz/mhz.mk
new file mode 100644
index 0000000000..36b3754968
--- /dev/null
+++ b/package/mhz/mhz.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# mhz
+#
+################################################################################
+
+MHZ_VERSION = 11aac2399780a1f7ea9f007b14af0464797d5cf1
+MHZ_SITE = https://github.com/wtarreau/mhz.git
+MHZ_SITE_METHOD = git
+MHZ_LICENSE = MIT/X11
+MHZ_LICENSE_FILES = LICENSE
+
+define MHZ_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define MHZ_INSTALL_TARGET_CMDS
+	$(INSTALL) $(@D)/mhz $(TARGET_DIR)/usr/bin/mhz
+endef
+
+$(eval $(generic-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
