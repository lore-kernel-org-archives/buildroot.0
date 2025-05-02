Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B409C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E55A283868;
	Fri,  2 May 2025 11:12:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p7uhkCxl8Srb; Fri,  2 May 2025 11:12:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F7DF839BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F7DF839BF;
	Fri,  2 May 2025 11:12:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 01F2B229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 943F640AAB
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3s5A1j3vMY66 for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B97EF4210A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B97EF4210A
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B797F864AF; Fri,  2 May 2025 11:11:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 12:12:45 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 73d998ec58584478aeaf46e9172abbced1caa5b0
X-Git-Newrev: b25e172dae2e44e924c6786c22a1daac42c8b6bb
X-Patchwork-Hint: ignore
Message-Id: <20250502111136.B797F864AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libcamera: fix
 documentation being built even if disabled
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b25e172dae2e44e924c6786c22a1daac42c8b6bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

We currently disable building the documentation via the "documentation"
feature, but it is enabled nonetheless by meson if sphinx-build-3 is
found on the host.

This makes sure it doesn't happen by making the sphinx-build-3 check
only happen when the "documentation" feature is "auto" or "enabled",
which isn't the case for Buildroot.

The bug seems to have been introduced in v0.0.1 release.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 569272be91ec02b35a94c545188a879dc78a7851)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...t-automatically-build-documentation-if-sp.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/libcamera/0001-meson-do-not-automatically-build-documentation-if-sp.patch b/package/libcamera/0001-meson-do-not-automatically-build-documentation-if-sp.patch
new file mode 100644
index 0000000000..d8975a86cb
--- /dev/null
+++ b/package/libcamera/0001-meson-do-not-automatically-build-documentation-if-sp.patch
@@ -0,0 +1,42 @@
+From 1e4db1f9792e4343231a1cf36aa553404a534828 Mon Sep 17 00:00:00 2001
+From: Quentin Schulz <quentin.schulz@cherry.de>
+Date: Fri, 4 Apr 2025 18:01:33 +0200
+Subject: [PATCH] meson: do not automatically build documentation if
+ sphinx-build-3 is found
+
+Commit aba567338b25 ("Documentation: Move all dependencies into
+features") did an incomplete migration of the documentation boolean
+option into a documentation feature.
+
+If sphinx-build-3 binary is found on the host system, the documentation
+is built, regardless of the value of the feature option.
+
+This makes sure that sphinx-build-3 presence is only checked if the
+documentation feature is not disabled (which is the default, as it's
+"auto" by default).
+
+This is essential for reproducibility for build systems where
+sphinx-build-3 may or may not be present when libcamera is built, and
+also to declutter the generated package if documentation isn't desired.
+
+Fixes: aba567338b25 ("Documentation: Move all dependencies into features")
+Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
+Upstream: https://lists.libcamera.org/pipermail/libcamera-devel/2025-April/049705.html
+Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
+---
+ Documentation/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Documentation/meson.build b/Documentation/meson.build
+index 6158320e..c59849f6 100644
+--- a/Documentation/meson.build
++++ b/Documentation/meson.build
+@@ -116,7 +116,7 @@ endif
+ # Sphinx
+ #
+ 
+-sphinx = find_program('sphinx-build-3', required : false)
++sphinx = find_program('sphinx-build-3', required : get_option('documentation'))
+ if not sphinx.found()
+     sphinx = find_program('sphinx-build', required : get_option('documentation'))
+ endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
