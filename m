Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52179C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E2878374F;
	Fri,  2 May 2025 11:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_TZ_6fptjjZ; Fri,  2 May 2025 11:11:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A2A482B24
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A2A482B24;
	Fri,  2 May 2025 11:11:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D2B9229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54CC5415E3
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vepMR1j-8rrR for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66B5841718
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66B5841718
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 634AE864AF; Fri,  2 May 2025 11:11:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 12:09:47 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c043e0d5f89f23fecb4a7d22e9b5879d2adb220d
X-Git-Newrev: 48eae4808e28cfe8b75076431d9ffb7ce2375913
X-Patchwork-Hint: ignore
Message-Id: <20250502111135.634AE864AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/pahole: fix build
 with host-cmake 4.0
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
Content-Type: multipart/mixed; boundary="===============3098451413226918716=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3098451413226918716==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=48eae4808e28cfe8b75076431d9ffb7ce2375913
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

host-pahole build fails with recent host-cmake versions, producing the
following error:

CMake Deprecation Warning at CMakeLists.txt:1 (cmake_minimum_required):
  Compatibility with CMake < 3.5 will be removed from a future version
of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to
tell
  CMake that the project does not need compatibility with older
versions.

The issue can be reproduced with a minimal defconfig:
  BR2_arm=y
  BR2_cortex_a7=y
  BR2_TOOLCHAIN_EXTERNAL=y
  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
  BR2_LINUX_KERNEL=y
  BR2_LINUX_KERNEL_DEFCONFIG="versatile"
  BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE=y
And host-cmake >= 4.0.0

The issue has already been fixed in the upstream pahole project and is
included in versions >= 1.28.

Fix the issue on the current LTS branch by bringing the fixing commit
from upstream.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 ...MakeLists.txt-Require-cmake-3.5-or-higher.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/pahole/0001-CMakeLists.txt-Require-cmake-3.5-or-higher.patch b/package/pahole/0001-CMakeLists.txt-Require-cmake-3.5-or-higher.patch
new file mode 100644
index 0000000000..01f98fcb88
--- /dev/null
+++ b/package/pahole/0001-CMakeLists.txt-Require-cmake-3.5-or-higher.patch
@@ -0,0 +1,45 @@
+From 12ca11281912c272f931e836b9160ee827250716 Mon Sep 17 00:00:00 2001
+From: Arnaldo Carvalho de Melo <acme@redhat.com>
+Date: Tue, 26 Nov 2024 14:19:16 -0300
+Subject: [PATCH] CMakeLists.txt: Require cmake 3.5 or higher
+
+To address this warning from cmake:
+
+CMake Deprecation Warning at CMakeLists.txt:1 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 will be removed from a future version of
+  CMake.
+
+  Update the VERSION argument <min> value or use a ...<max> suffix to tell
+  CMake that the project does not need compatibility with older versions.
+
+Cc: Alan Maguire <alan.maguire@oracle.com>
+Cc: Andrii Nakryiko <andrii.nakryiko@gmail.com>
+Cc: Domenico Andreoli <cavok@debian.org>
+Cc: Dominique Leuenberger <dimstar@opensuse.org>
+Cc: Dominique Martinet <asmadeus@codewreck.org>
+Cc: Eduard Zingerman <eddyz87@gmail.com>
+Cc: Guilherme Amadio <amadio@gentoo.org>
+Cc: Jan Alexander Steffens <heftig@archlinux.org>
+Cc: Jiri Olsa <jolsa@kernel.org>
+Cc: Matthias Schwarzott <zzam@gentoo.org>
+Link: https://lore.kernel.org/all/Z0YEFABQejfGTyrj@x1
+Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
+Upstream: https://git.kernel.org/pub/scm/devel/pahole/pahole.git/commit/?id=12ca11281912c272f931e836b9160ee827250716
+Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 1d0dadf6eea7..90fa65c391b6 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8.12)
++cmake_minimum_required(VERSION 3.5)
+ project(pahole C)
+ cmake_policy(SET CMP0005 NEW)
+ 
+-- 
+2.49.0
+

--===============3098451413226918716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3098451413226918716==--
