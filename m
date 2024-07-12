Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04B2C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 22:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65D3E84664;
	Fri, 12 Jul 2024 22:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GYiTQK34C2iJ; Fri, 12 Jul 2024 22:22:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E7578466E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E7578466E;
	Fri, 12 Jul 2024 22:22:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A60E51BF995
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0AF660699
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:22:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KzHIDuR2nil3 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 22:22:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A877B6067C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A877B6067C
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 22:22:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9152F86346; Fri, 12 Jul 2024 22:22:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 00:19:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e167800979b48a449c168c229448e7069d2045e7
X-Git-Newrev: a320986c44774f3729454249a94904365f020a58
X-Patchwork-Hint: ignore
Message-Id: <20240712222228.9152F86346@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/Makefile.in: add PARALLEL_JOBS to
 post-build/post-image scripts
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a320986c44774f3729454249a94904365f020a58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Post-build, post-image, and other build scripts may run some commands in
parallel, for example to parallelize xargs, Makefiles, etc. Export
PARALLEL_JOBS to these scripts so they can enforce the same job limits
that other Buildroot packages use.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 docs/manual/customize-post-image.adoc | 4 ++--
 docs/manual/customize-rootfs.adoc     | 1 +
 docs/manual/debugging-buildroot.adoc  | 1 +
 package/Makefile.in                   | 3 ++-
 4 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/docs/manual/customize-post-image.adoc b/docs/manual/customize-post-image.adoc
index 1f11cf915f..849e941de3 100644
--- a/docs/manual/customize-post-image.adoc
+++ b/docs/manual/customize-post-image.adoc
@@ -33,8 +33,8 @@ arguments that are only used for the post-image scripts you can use
 
 Again just like for the post-build scripts, the scripts have access to
 the environment variables +BR2_CONFIG+, +HOST_DIR+, +STAGING_DIR+,
-+TARGET_DIR+, +BUILD_DIR+, +BINARIES_DIR+, +CONFIG_DIR+ and
-+BASE_DIR+.
++TARGET_DIR+, +BUILD_DIR+, +BINARIES_DIR+, +CONFIG_DIR+, +BASE_DIR+,
+and +PARALLEL_JOBS+.
 
 The post-image scripts will be executed as the user that executes
 Buildroot, which should normally _not_ be the root user. Therefore, any
diff --git a/docs/manual/customize-rootfs.adoc b/docs/manual/customize-rootfs.adoc
index 1384c1d2d3..d334093748 100644
--- a/docs/manual/customize-rootfs.adoc
+++ b/docs/manual/customize-rootfs.adoc
@@ -75,6 +75,7 @@ In addition, you may also use these environment variables:
   - +BINARIES_DIR+: the place where all binary files (aka images) are
     stored
   - +BASE_DIR+: the base output directory
+  - +PARALLEL_JOBS+: the number of jobs to use when running parallel processes.
 
 Below three more methods of customizing the target filesystem are
 described, but they are not recommended.
diff --git a/docs/manual/debugging-buildroot.adoc b/docs/manual/debugging-buildroot.adoc
index f575fc48ee..b9068ead52 100644
--- a/docs/manual/debugging-buildroot.adoc
+++ b/docs/manual/debugging-buildroot.adoc
@@ -41,3 +41,4 @@ The script has access to the following variables:
   - +BINARIES_DIR+: the place where all binary files (aka images) are
     stored
   - +BASE_DIR+: the base output directory
+  - +PARALLEL_JOBS+: the number of jobs to use when running parallel processes.
diff --git a/package/Makefile.in b/package/Makefile.in
index 5476234c7e..47a89f1ae1 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -331,7 +331,8 @@ EXTRA_ENV = \
 	BR2_DL_DIR=$(BR2_DL_DIR) \
 	BUILD_DIR=$(BUILD_DIR) \
 	CONFIG_DIR=$(CONFIG_DIR) \
-	O=$(CANONICAL_O)
+	O=$(CANONICAL_O) \
+	PARALLEL_JOBS=$(PARALLEL_JOBS)
 
 ################################################################################
 # settings we need to pass to configure
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
