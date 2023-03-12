Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F7EC6FD19
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 14:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B45C94060E;
	Sun, 12 Mar 2023 14:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B45C94060E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DLH7vavi9gZ2; Sun, 12 Mar 2023 14:51:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5D3C40283;
	Sun, 12 Mar 2023 14:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5D3C40283
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 891F01BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 14:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 714B8404BA
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 14:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 714B8404BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KSSMfFdJzM3D for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 14:51:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A04B240025
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 14:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A04B240025
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8DBE286F2D; Sun, 12 Mar 2023 14:51:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 15:50:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d82fea26623e3934e1e6f82d9f6fce078914419b
X-Git-Newrev: 3bac7eb69d8a9141e11076628df78ddffae349ba
X-Patchwork-Hint: ignore
Message-Id: <20230312145137.8DBE286F2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/janet: fix build without threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=3bac7eb69d8a9141e11076628df78ddffae349ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without threads raised since bump to
version 1.26.0 in commit 5c6f32bd255fc97823d464beacfa905a141066ec:

ffi.c:(.text+0x9d8): undefined reference to `janet_abstract_threaded'

Fixes:
 - http://autobuild.buildroot.org/results/20108e76990d8af7f47d474eadbbea8562ef6728

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Update-for-more-minimal-builds.patch      | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/janet/0001-Update-for-more-minimal-builds.patch b/package/janet/0001-Update-for-more-minimal-builds.patch
new file mode 100644
index 0000000000..ba36a9beba
--- /dev/null
+++ b/package/janet/0001-Update-for-more-minimal-builds.patch
@@ -0,0 +1,29 @@
+From 746ff5307d309536984b648460e7b5c5dac44453 Mon Sep 17 00:00:00 2001
+From: Calvin Rose <calsrose@gmail.com>
+Date: Sun, 12 Feb 2023 12:14:11 -0600
+Subject: [PATCH] Update for more minimal builds.
+
+[Retrieved (and backported) from:
+https://github.com/janet-lang/janet/commit/746ff5307d309536984b648460e7b5c5dac44453]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/core/ffi.c   | 4 ++++
+ src/core/marsh.c | 2 ++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/src/core/ffi.c b/src/core/ffi.c
+index 45a498c7..b453f1f6 100644
+--- a/src/core/ffi.c
++++ b/src/core/ffi.c
+@@ -1311,7 +1311,11 @@ JANET_CORE_FN(cfun_ffi_jitfn,
+     size_t alloc_size = ((size_t) bytes.len + FFI_PAGE_MASK) & ~FFI_PAGE_MASK;
+ 
+ #ifdef JANET_FFI_JIT
++#ifdef JANET_EV
+     JanetFFIJittedFn *fn = janet_abstract_threaded(&janet_type_ffijit, sizeof(JanetFFIJittedFn));
++#else
++    JanetFFIJittedFn *fn = janet_abstract(&janet_type_ffijit, sizeof(JanetFFIJittedFn));
++#endif
+     fn->function_pointer = NULL;
+     fn->size = 0;
+ #ifdef JANET_WINDOWS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
