Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4205CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Jul 2022 11:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B827F6135D;
	Wed, 13 Jul 2022 11:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B827F6135D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4blANXMq6vbJ; Wed, 13 Jul 2022 11:59:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8232607C7;
	Wed, 13 Jul 2022 11:59:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8232607C7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C84CF1BF20F
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 11:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A28B740C5E
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 11:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A28B740C5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OLeEWj3beoVq for <buildroot@lists.busybox.net>;
 Wed, 13 Jul 2022 11:59:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55F824041C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55F824041C
 for <buildroot@buildroot.org>; Wed, 13 Jul 2022 11:59:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 9D63240005;
 Wed, 13 Jul 2022 11:58:57 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Wed, 13 Jul 2022 13:58:51 +0200
Message-Id: <20220713115851.620731-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1657713538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=6kewBAsM/FEOzfM3qCywaZYoBA2xMkTpu9aFI3KGjSE=;
 b=INRu7qr2On4WA2nrcyV0nm7B0Hqs0k/i+eqBQgcabMU7yCVmNJBfZ+Tq5Ueow68f0Vroy1
 L726AwxEtO0CxMiE1m+Z4LlY6klDteZ5hyvhHIfUyE89P+KMB42anE46z1dFskf23zGFj6
 IbF9rSUJypbRGufJNZ0n1asgELnmhLnP8u8f86dw2ViIu5MBm7fNF7BWmVQ+SmUvWBoFg0
 H6XDWUBLYPzFy4yV/WQBQe2IdESN47p6Ephd1cqrs3howDzzlG217R5k0VFN3pjuTwHD/A
 GnRLQalIwMSODKQmA0F0FNI8WQmpAvXiqRygbPXH7ISQKc0cDWJvJ6wlLz761w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=INRu7qr2
Subject: [Buildroot] [PATCH] package/python-pillow: fix host package build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: kory.maincent@bootlin.com,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In commit
d8c5d9b53437741c79cd3d759de1fe81af9055fd ("package/python-pillow:
enable host variant"), when support for the host variant of
python-pillow was added, the fact that python-pillow has optional
dependencies was not handled, and left python-pillow to autodetect its
optional dependencies.

Unfortunately, without some config options, some of its dependencies
are made mandatory, such as the JPEG library. Since for now such
support is not needed in the host variant of python-pillow, we simply
disable all optional dependencies.

To be consistent with the target variant, we also ensure to have
host-pkgconf as a dependency of the host variant.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pillow/python-pillow.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 8c9cb86863..0d189ac0ca 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -71,5 +71,18 @@ else
 PYTHON_PILLOW_BUILD_OPTS += --disable-webp --disable-webpmux
 endif
 
+HOST_PYTHON_PILLOW_DEPENDENCIES = host-pkgconf
+HOST_PYTHON_PILLOW_BUILD_OPTS = \
+	build_ext \
+	--disable-freetype \
+	--disable-jpeg \
+	--disable-lcms \
+	--disable-xcb \
+	--disable-jpeg2000 \
+	--disable-tiff \
+	--disable-webp \
+	--disable-webpmux
+HOST_PYTHON_PILLOW_INSTALL_OPTS = $(HOST_PYTHON_PILLOW_BUILD_OPTS)
+
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
