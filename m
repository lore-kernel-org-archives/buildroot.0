Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFCBC433EF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 22:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C14C84180C;
	Wed, 26 Jan 2022 22:16:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uKCg5UcnKJvy; Wed, 26 Jan 2022 22:16:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCC8141808;
	Wed, 26 Jan 2022 22:16:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 595B71BF475
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AF2B41810
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:16:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h2bc4irI5fQb for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 22:16:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86466417FB
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 22:16:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 081E68123F; Wed, 26 Jan 2022 22:09:41 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 23:16:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7deb5618efefdef4d4a6eac2b4c4dc3c11d484c
X-Git-Newrev: 6dd830766e7b35f53eecbf2a85261b99564cde76
X-Patchwork-Hint: ignore
Message-Id: <20220126220941.081E68123F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: link examples with
 -latomic
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

commit: https://git.buildroot.net/buildroot/commit/?id=6dd830766e7b35f53eecbf2a85261b99564cde76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Link examples with -latomic to avoid the following build failure raised
since commit 3edc1cc44c7bd2deed31d28fa9534e67f32334e8:

FAILED: spa/examples/adapter-control
/home/buildroot/autobuild/instance-0/output-1/host/bin/sparc-linux-gcc  -o spa/examples/adapter-control spa/examples/adapter-control.p/adapter-control.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -Wl,--start-group -lintl -ldl -pthread -lm -Wl,--end-group
/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: spa/examples/adapter-control.p/adapter-control.c.o: in function `spa_graph_node_trigger':
adapter-control.c:(.text+0xdf4): undefined reference to `__atomic_fetch_sub_4'

Fixes:
 - http://autobuild.buildroot.org/results/192f40a5c6e05fc11507494e19db52a47082fc35

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...spa-meson.build-add-atomic_dep-dependency.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/pipewire/0001-spa-meson.build-add-atomic_dep-dependency.patch b/package/pipewire/0001-spa-meson.build-add-atomic_dep-dependency.patch
new file mode 100644
index 0000000000..b91adbe7e4
--- /dev/null
+++ b/package/pipewire/0001-spa-meson.build-add-atomic_dep-dependency.patch
@@ -0,0 +1,40 @@
+From 8d9dc023ac12cf305c28786891d5b15e13f29a3d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 25 Jan 2022 17:22:02 +0100
+Subject: [PATCH] spa/meson.build: add atomic_dep dependency
+
+Commit fa64d93e64592d5edd8767f722cf4ea093641052 moved the atomic_dep
+from pipewire-jack to pipewire_dep however atomic_dep should also be
+added to spa_dev to avoid the following build failure when building
+examples (which don't depend on pipewire_dep):
+
+FAILED: spa/examples/adapter-control
+/home/buildroot/autobuild/instance-0/output-1/host/bin/sparc-linux-gcc  -o spa/examples/adapter-control spa/examples/adapter-control.p/adapter-control.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -Wl,--start-group -lintl -ldl -pthread -lm -Wl,--end-group
+/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: spa/examples/adapter-control.p/adapter-control.c.o: in function `spa_graph_node_trigger':
+adapter-control.c:(.text+0xdf4): undefined reference to `__atomic_fetch_sub_4'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/192f40a5c6e05fc11507494e19db52a47082fc35
+
+[Retrieved from:
+https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/8d9dc023ac12cf305c28786891d5b15e13f29a3d]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ spa/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/spa/meson.build b/spa/meson.build
+index 4ad37cdb4..2404748df 100644
+--- a/spa/meson.build
++++ b/spa/meson.build
+@@ -9,6 +9,7 @@ spa_dep = declare_dependency(
+   include_directories : [
+     include_directories('include'),
+   ],
++  dependencies : [atomic_dep],
+   version : spaversion,
+   variables : {
+     'plugindir' : meson.current_build_dir() / 'plugins',
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
