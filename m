Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44C8C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 19:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 329CA60E0B;
	Sun, 25 Sep 2022 19:20:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 329CA60E0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ooAhE4ccB_Gm; Sun, 25 Sep 2022 19:20:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9711D60E03;
	Sun, 25 Sep 2022 19:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9711D60E03
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C35AD1BF577
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 19:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA55341720
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 19:20:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA55341720
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ecKMegTYZgfP for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 19:20:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 198CC4172A
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 198CC4172A
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 19:20:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id EF08EE0006;
 Sun, 25 Sep 2022 19:20:33 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Sep 2022 21:20:27 +0200
Message-Id: <20220925192030.1648496-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664133634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LWWI6PvAwcp1I2SHOq023aW2YHPdkb1ofdbgmAEo2Lo=;
 b=RGsW5fS6MrwoqgRGPaaAlRIC6PEsUUJBuB+sjpxI3uMfUHwX2Hrum89iD8bsBfqEGVUEeQ
 eEdTHG8oq8yl4UKN+NiBch0y/o/s1dAEK5HHUeCswKM06tn/r1vsl4oqJU6zxWheAHPoIK
 OBULMV4wVmxys86V0rV8ZL5IXuiCYxrgoHkSRs6UyGbVBQw51kA50LrLSkgrU2lSwJ2A9l
 qMgH0sl3qY1P57ktRnOIorYujTnle/BBeqH+4MIS39cYeio/51TThuJ2DRYB3FxZOuaNRg
 PqBHJkwvGM8/h0CsxuEb8iXyA3ZWBPrc5H8U+hVkX5xVmNsH+b31rTiXXUVO3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RGsW5fS6
Subject: [Buildroot] [PATCH v2 1/2] package/nodejs: add patch to adjust
 default NodeJS search path
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
Cc: Daniel Price <daniel.price@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

By default, NodeJS searches global modules in /usr/lib/node, but NPM
installs them in /usr/lib/node_modules/. Therefore by default, if one
installs modules with BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL, they are
not accessible by NodeJS, unless by passing a
NODE_PATH=/usr/lib/node_modules/ variable. Since this is not obvious,
and it's nicer when things work out of the box, we simply patch NodeJS
to look for modules at the right place.

See
https://stackoverflow.com/questions/15636367/nodejs-require-a-global-module-package
for some discussions on this topic.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes since v1:
- Search for both /usr/lib/node and /usr/lib/node_modules as suggested
  by Yann
---
 ...ules-cjs-loader.js-adjust-default-pa.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/nodejs/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch

diff --git a/package/nodejs/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch b/package/nodejs/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch
new file mode 100644
index 0000000000..5b93998e5e
--- /dev/null
+++ b/package/nodejs/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch
@@ -0,0 +1,36 @@
+From a31425bdfcb5d695ab25c3d295898326784cffec Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 25 Sep 2022 11:10:06 +0200
+Subject: [PATCH] lib/internal/modules/cjs/loader.js: adjust default path to
+ search modules
+
+NPM installs modules in /usr/lib/node_modules/, but by default NodeJS
+searches for them only in /usr/lib/node/. We could also set the
+NODE_PATH environment variable, but it is more convienient to have
+NodeJS configured by default to find modules where they are installed.
+
+This issue is discussed at
+https://stackoverflow.com/questions/15636367/nodejs-require-a-global-module-package.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ lib/internal/modules/cjs/loader.js | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/internal/modules/cjs/loader.js b/lib/internal/modules/cjs/loader.js
+index f1971c40a4..5fe3884156 100644
+--- a/lib/internal/modules/cjs/loader.js
++++ b/lib/internal/modules/cjs/loader.js
+@@ -1261,7 +1261,8 @@ Module._initPaths = function() {
+     path.resolve(process.execPath, '..') :
+     path.resolve(process.execPath, '..', '..');
+ 
+-  const paths = [path.resolve(prefixDir, 'lib', 'node')];
++  const paths = [path.resolve(prefixDir, 'lib', 'node'),
++                 path.resolve(prefixDir, 'lib', 'node_modules')];
+ 
+   if (homeDir) {
+     ArrayPrototypeUnshift(paths, path.resolve(homeDir, '.node_libraries'));
+-- 
+2.37.3
+
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
