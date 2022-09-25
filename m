Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD92C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 20:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA77A60E08;
	Sun, 25 Sep 2022 20:40:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA77A60E08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FogJqu-HH4jI; Sun, 25 Sep 2022 20:40:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C565060D72;
	Sun, 25 Sep 2022 20:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C565060D72
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A825F1BF321
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 20:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75E7C60D72
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 20:40:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75E7C60D72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KD92GqQq68Lw for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 20:40:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D070D605DB
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D070D605DB
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 20:40:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 7147720002;
 Sun, 25 Sep 2022 20:40:37 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Sun, 25 Sep 2022 22:40:27 +0200
Message-Id: <20220925204030.1661583-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220925204030.1661583-1-thomas.petazzoni@bootlin.com>
References: <20220925204030.1661583-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664138438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fTzQ15t7Bf+UOE8Q7IqTdu7rNUIJ7b3xNT+MXFzIpm4=;
 b=QZk8MFCVn+Pzd1X3vtbIAin4LsseTl0dlnFlAEgjIVN4f2slKCEu3kC/jp7kWPWZeWOvPB
 /AJM6KQlwAN+W2RG3Wuws5HrdwsnhLCYMFh+LEW1r3u+BVAsAPInV3AVw82v3Vde58guj2
 liVUkVxxdRHv9ty0EYjaxR35+eabnirW3pAMc9lpe9MZIvRKNDdkkd0/cpB+M8XwAY0KAB
 e3COy4nlCJ4xeVvzG9aYxy+l+eAFfZFT5QliSyiNA7iIbnFTm+GA+TjReyZ91OXouUDImq
 1HpLYKSHW7rmun3erbiImO76UiGlcCt36ainV7TSx6TXPx6PBdBRKXJret/r6w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QZk8MFCV
Subject: [Buildroot] [PATCH RFC 2/4] package/nodejs-bin: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For now, it is not exposed in any way, but in the next commit, it will
be offered as an alternative to build host-nodejs from source.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  1 +
 package/nodejs-bin/nodejs-bin.hash |  7 ++++++
 package/nodejs-bin/nodejs-bin.mk   | 34 ++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+)
 create mode 100644 package/nodejs-bin/nodejs-bin.hash
 create mode 100644 package/nodejs-bin/nodejs-bin.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f82472bbb5..564ab2ae72 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2903,6 +2903,7 @@ F:	package/musl/
 F:	package/musl-fts/
 F:	package/ne10/
 F:	package/nodejs/
+F:	package/nodejs-bin/
 F:	package/pkg-python.mk
 F:	package/pkg-autotools.mk
 F:	package/pkg-generic.mk
diff --git a/package/nodejs-bin/nodejs-bin.hash b/package/nodejs-bin/nodejs-bin.hash
new file mode 100644
index 0000000000..51dd082710
--- /dev/null
+++ b/package/nodejs-bin/nodejs-bin.hash
@@ -0,0 +1,7 @@
+# From https://nodejs.org/dist/v16.17.1/SHASUMS256.txt.asc
+sha256  3dfb8fd8f6b97df69cdc56524abc906c50ef1d0bf091188616802e6c7c731389  node-v16.17.1-linux-arm64.tar.xz
+sha256  a035ceefb5e16f5fce98c8ddfdf721b96eec20542c72fb8781bcbb6ef20c5550  node-v16.17.1-linux-armv7l.tar.xz
+sha256  70305934661f89fca64053b85317a75f233d5e3fdb2caa6546a19262a519cf20  node-v16.17.1-linux-ppc64le.tar.xz
+sha256  06ba2eb34aa385967f5f58c87a44753f83212f6cccea892b33f80a2e7fda8384  node-v16.17.1-linux-x64.tar.xz
+# Locally calculated
+sha256  69090e865afa7c62715b97f0712632d2923bd7a5faba91f94e4e75a2f9219d5e  LICENSE
diff --git a/package/nodejs-bin/nodejs-bin.mk b/package/nodejs-bin/nodejs-bin.mk
new file mode 100644
index 0000000000..5ebd8760c0
--- /dev/null
+++ b/package/nodejs-bin/nodejs-bin.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# nodejs-bin
+#
+################################################################################
+
+# keep in sync with package/nodejs/nodejs.mk
+NODEJS_BIN_VERSION = 16.17.1
+NODEJS_BIN_SITE = https://nodejs.org/dist/v$(NODEJS_BIN_VERSION)
+
+ifeq ($(HOSTARCH),aarch64)
+NODEJS_BIN_ARCH = arm64
+else ifeq ($(HOSTARCH),arm)
+# We assume that if someone does a build on ARM, it will be on an
+# ARMv7 machine
+NODEJS_BIN_ARCH = armv7l
+else ifeq ($(HOSTARCH),ppc64le)
+NODEJS_BIN_ARCH = ppc64le
+else ifeq ($(HOSTARCH),x86_64)
+NODEJS_BIN_ARCH = x64
+endif
+
+NODEJS_BIN_SOURCE = node-v$(NODEJS_BIN_VERSION)-linux-$(NODEJS_BIN_ARCH).tar.xz
+NODEJS_BIN_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
+NODEJS_BIN_LICENSE_FILES = LICENSE
+NODEJS_BIN_CPE_ID_VENDOR = nodejs
+NODEJS_BIN_CPE_ID_PRODUCT = node.js
+
+define HOST_NODEJS_BIN_INSTALL_CMDS
+	rsync -a --exclude=CHANGELOG.md --exclude=LICENSE --exclude=README.md \
+		$(@D)/* $(HOST_DIR)/
+endef
+
+$(eval $(host-generic-package))
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
