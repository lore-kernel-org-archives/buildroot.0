Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22B3C433FE
	for <buildroot@archiver.kernel.org>; Tue, 11 Oct 2022 18:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C3E781383;
	Tue, 11 Oct 2022 18:54:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C3E781383
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XHnLT0db09eL; Tue, 11 Oct 2022 18:54:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66F91832EA;
	Tue, 11 Oct 2022 18:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66F91832EA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 555571BF9CB
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 18:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31AFE40524
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 18:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31AFE40524
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3LtPSgwdIURS for <buildroot@lists.busybox.net>;
 Tue, 11 Oct 2022 18:53:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 550D340514
 for <buildroot@buildroot.org>; Tue, 11 Oct 2022 18:53:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 550D340514
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4320D86BD1; Tue, 11 Oct 2022 18:53:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 11 Oct 2022 20:15:36 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: b0700755ae1d564581f6e224dca6f9dc1c0a496c
X-Git-Newrev: a712b5f61b54a72d5bdc4076a85f76011fd8a50f
X-Patchwork-Hint: ignore
Message-Id: <20221011185356.4320D86BD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/nodejs: fix
 'Duplicate v8 target errors when cross-compiling' error
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

commit: https://git.buildroot.net/buildroot/commit/?id=a712b5f61b54a72d5bdc4076a85f76011fd8a50f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Reported also via:
  https://github.com/nodejs/node/issues/37441

Patched in:
  https://github.com/minrk/node/commit/5e533cb943eef68b270f55f0cba02c0ec67c699d

The error is:
```
ninja: Entering directory `out/Release'
ninja: error: obj.host/tools/v8_gypfiles/run_torque.ninja:1356: multiple rules generate gen/torque-generated/bit-fields.h [-w dupbuild=err]

make[2]: *** [Makefile:127: node] Error 1
make[1]: *** [package/pkg-generic.mk:293: <buildroot>/output/build/nodejs-16.15.0/.stamp_built] Error 2
make: *** [Makefile:84: _all] Error 2

```

Fixes:

  http://autobuild.buildroot.net/results/7fe9132236ee8e3a86dd97fe96ffee42990c2d19/

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
[Thomas:
 - regenerate patch as a git formatted patch, add a link to the
   original location, add my own SoB to it
 - improve commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5708c5b04f09f49a99c2c9d7a1894d24bce6a3e7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...3-include-obj-name-in-shared-intermediate.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/nodejs/0003-include-obj-name-in-shared-intermediate.patch b/package/nodejs/0003-include-obj-name-in-shared-intermediate.patch
new file mode 100644
index 0000000000..b439c66a0c
--- /dev/null
+++ b/package/nodejs/0003-include-obj-name-in-shared-intermediate.patch
@@ -0,0 +1,42 @@
+From e6e691d093de440e0f408d48971e2b7332a07d58 Mon Sep 17 00:00:00 2001
+From: Min RK <benjaminrk@gmail.com>
+Date: Fri, 19 Feb 2021 11:57:04 +0100
+Subject: [PATCH] include obj name in shared intermediate
+
+avoids duplicate ninja rules for v8 used in host and target
+
+From: https://github.com/minrk/node/commit/5e533cb943eef68b270f55f0cba02c0ec67c699d
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ tools/gyp/pylib/gyp/generator/ninja.py | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/tools/gyp/pylib/gyp/generator/ninja.py b/tools/gyp/pylib/gyp/generator/ninja.py
+index d173bf2299..efaeee53ef 100644
+--- a/tools/gyp/pylib/gyp/generator/ninja.py
++++ b/tools/gyp/pylib/gyp/generator/ninja.py
+@@ -42,7 +42,7 @@ generator_default_variables = {
+     # the start of a string, while $| is used for variables that can appear
+     # anywhere in a string.
+     "INTERMEDIATE_DIR": "$!INTERMEDIATE_DIR",
+-    "SHARED_INTERMEDIATE_DIR": "$!PRODUCT_DIR/gen",
++    "SHARED_INTERMEDIATE_DIR": "$!PRODUCT_DIR/$|OBJ/gen",
+     "PRODUCT_DIR": "$!PRODUCT_DIR",
+     "CONFIGURATION_NAME": "$|CONFIGURATION_NAME",
+     # Special variables that may be used by gyp 'rule' targets.
+@@ -285,6 +285,12 @@ class NinjaWriter:
+         CONFIGURATION_NAME = "$|CONFIGURATION_NAME"
+         path = path.replace(CONFIGURATION_NAME, self.config_name)
+ 
++        obj = "obj"
++        if self.toolset != "target":
++            obj += "." + self.toolset
++
++        path = path.replace("$|OBJ", obj)
++
+         return path
+ 
+     def ExpandRuleVariables(self, path, root, dirname, source, ext, name):
+-- 
+2.37.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
