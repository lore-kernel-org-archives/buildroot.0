Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C506BC43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 18:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 481C882A7F;
	Sun, 17 Jul 2022 18:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 481C882A7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H624pXARyjwK; Sun, 17 Jul 2022 18:05:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42A7A8193E;
	Sun, 17 Jul 2022 18:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42A7A8193E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 63F1B1BF3BB
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 18:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DE8841575
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 18:05:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DE8841575
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ov9Qy-XYY8ao for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 18:05:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C5E441572
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 18:05:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C5E441572
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5A0EE83C25; Sun, 17 Jul 2022 17:51:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 20:04:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a51381cedc16e6d70cb85e1144f6e0fa89af69a
X-Git-Newrev: 92a2308eb287b775c8e7b8818f0c99c66cae1cae
X-Patchwork-Hint: ignore
Message-Id: <20220717175139.5A0EE83C25@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pillow: fix host package
 build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=92a2308eb287b775c8e7b8818f0c99c66cae1cae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
