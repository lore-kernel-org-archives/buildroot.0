Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC49C636D4
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 23:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BE0760F7E;
	Fri, 10 Feb 2023 23:14:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BE0760F7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5PpMQ8qJdzkr; Fri, 10 Feb 2023 23:14:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D877160E72;
	Fri, 10 Feb 2023 23:14:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D877160E72
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C03E01BF473
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 23:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7BC182341
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 23:14:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7BC182341
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TNFOLmoY0uJe for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 23:14:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D228F8232E
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 23:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D228F8232E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA856852D1; Fri, 10 Feb 2023 23:14:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 00:11:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6e3d36a85f19acedd2ed58f5b8616dbf24f57a4
X-Git-Newrev: 0de216f95fc28c57cc430f39f011d5f88ead083b
X-Patchwork-Hint: ignore
Message-Id: <20230210231402.BA856852D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: add patch to adjust
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0de216f95fc28c57cc430f39f011d5f88ead083b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...l-modules-cjs-loader.js-adjust-default-pa.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
