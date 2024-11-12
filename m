Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA92FD41C27
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 09:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 966B54034D;
	Wed, 13 Nov 2024 09:55:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lxhl5ETt-9Yj; Wed, 13 Nov 2024 09:55:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65A764038F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65A764038F;
	Wed, 13 Nov 2024 09:55:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F66EE11
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D6ED811D7
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:55:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RCY53L32yxQP for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 09:55:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBE0C811A2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBE0C811A2
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:55:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B72E68627A; Wed, 13 Nov 2024 09:55:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Nov 2024 21:43:57 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: bd1d78763755868680d0fcf42c55e357d9e2bbf9
X-Git-Newrev: e81be1b267f2ec8c92b1899aec8d689c9fbd65f7
X-Patchwork-Hint: ignore
Message-Id: <20241113095504.B72E68627A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/file: fix musl
 compile issue
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=e81be1b267f2ec8c92b1899aec8d689c9fbd65f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

It is not totally clear which update is responsible for the
breakage. The breakage has been occurring for as long as Jan 2022.
Therefore it should be backported to older supported buildroot releases.

Add a patch from Gentoo people, also reported Upstream to fix the
issue.

Fixes:

 http://autobuild.buildroot.org/results/abf/abfe66cec3680d396c5774ba492f34599e513edc/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 71f36ef9385f860683b5c39a2c3af9f821833c5a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../file/0001-file-seccomp-fstatat64-musl.patch    | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/file/0001-file-seccomp-fstatat64-musl.patch b/package/file/0001-file-seccomp-fstatat64-musl.patch
new file mode 100644
index 0000000000..ecb12fe44e
--- /dev/null
+++ b/package/file/0001-file-seccomp-fstatat64-musl.patch
@@ -0,0 +1,32 @@
+From 8c13923a8e17a02be0989649b2edc20124816729 Mon Sep 17 00:00:00 2001
+From: Mike Gilbert <floppym@gentoo.org>
+Date: Tue, 15 Jun 2021 16:08:22 -0400
+Subject: [PATCH] seccomp: undef fstatat64 to avoid build failure on musl
+
+sys/stat.h in musl does this:
+
+  #define fstatat64 fstatat
+
+Counteract this with an #undef.
+
+Bug: https://bugs.gentoo.org/789336
+Bug: https://bugs.astron.com/view.php?id=473
+Signed-off-by: Mike Gilbert <floppym@gentoo.org>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: N/A under discussion
+---
+ src/seccomp.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/seccomp.c b/src/seccomp.c
+index 5a39ee45..d2a1139a 100644
+--- a/src/seccomp.c
++++ b/src/seccomp.c
+@@ -205,6 +205,7 @@ enable_sandbox_full(void)
+ #endif
+  	ALLOW_RULE(fstat64);
+ #ifdef __NR_fstatat64
++#undef fstatat64
+ 	ALLOW_RULE(fstatat64);
+ #endif
+ 	ALLOW_RULE(futex);
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
