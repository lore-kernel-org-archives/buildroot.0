Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087C0C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 17:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 841DB81B70;
	Sun, 25 Sep 2022 17:20:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 841DB81B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4wodzfWD1DRi; Sun, 25 Sep 2022 17:20:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B91A681759;
	Sun, 25 Sep 2022 17:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B91A681759
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0EEF61BF48B
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 17:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEA7B60C08
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 17:19:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEA7B60C08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zqHOV0PSwNmn for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 17:19:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A975660BD2
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A975660BD2
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 17:19:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id C2F82200003;
 Sun, 25 Sep 2022 17:19:43 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>
Date: Sun, 25 Sep 2022 19:19:31 +0200
Message-Id: <20220925171932.1630739-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220925171932.1630739-1-thomas.petazzoni@bootlin.com>
References: <20220925171932.1630739-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664126384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c7X6cUrqmnG+EFZdTCsVLojvlF9qrG/KXvTgyAMI8q8=;
 b=T7noybtr6HvhS4YAzrmY05N8xxHGCYor0oDu1p9Hhi6hAjTWjg/kenqIIb3tMJurifTqEK
 //eojKBlQU3Wy9P9U/FTMR6hLGF2/wRAqSN+1Ou2B+HWcGIEY+8DPvgJ14ruz9Idka3CMp
 uaGSsMP65XMyag1usOqrs+sXt6TdPPp/iy01T7zivS+PiRReTBwDHBxK1t/UejIbrg4ogq
 c6eA77y2TVMH26Mow70NVEJlSFsooX8qEDIxJsuV3ks/3QEGJWmqcllWi8PA4Tsk5wVr0I
 EvsY5pBJq/YTPjo12lDXJq4OoYYTU3uyS2UwXL+M8jZoYTb867AgfKWJ6q4+Cg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T7noybtr
Subject: [Buildroot] [PATCH 3/4] package/nodejs: add patch to adjust default
 NodeJS search path
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
Cc: Alexandru Ardelean <ardeleanalex@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Daniel Price <daniel.price@gmail.com>,
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
I am not 100% sure this is the correct approach, and I would
definitely like to get the feedback from some NodeJS people.
---
 ...ules-cjs-loader.js-adjust-default-pa.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/nodejs/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch

diff --git a/package/nodejs/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch b/package/nodejs/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch
new file mode 100644
index 0000000000..b4692a4e5f
--- /dev/null
+++ b/package/nodejs/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch
@@ -0,0 +1,35 @@
+From 4ed7de24fe18bb75b6e38922eb33141e2cec43dd Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 25 Sep 2022 11:10:06 +0200
+Subject: [PATCH] lib/internal/modules/cjs/loader.js: adjust default path to
+ search modules
+
+NPM installs modules in /usr/lib/node_modules/, but by default NodeJS
+searches for them in /usr/lib/node/. We could also set the NODE_PATH
+environment variable, but it is more convienient to have NodeJS
+configured by default to find modules where they are installed.
+
+This issue is discussed at
+https://stackoverflow.com/questions/15636367/nodejs-require-a-global-module-package.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ lib/internal/modules/cjs/loader.js | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/internal/modules/cjs/loader.js b/lib/internal/modules/cjs/loader.js
+index f1971c40a4..52fcd56125 100644
+--- a/lib/internal/modules/cjs/loader.js
++++ b/lib/internal/modules/cjs/loader.js
+@@ -1261,7 +1261,7 @@ Module._initPaths = function() {
+     path.resolve(process.execPath, '..') :
+     path.resolve(process.execPath, '..', '..');
+ 
+-  const paths = [path.resolve(prefixDir, 'lib', 'node')];
++  const paths = [path.resolve(prefixDir, 'lib', 'node_modules')];
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
