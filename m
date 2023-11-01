Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBF9C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 09:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0615E6FBE0;
	Wed,  1 Nov 2023 09:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0615E6FBE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x6zSLuMPdRp3; Wed,  1 Nov 2023 09:21:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1600B6FC7D;
	Wed,  1 Nov 2023 09:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1600B6FC7D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 47B551BF44A
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 09:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D47443034
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 09:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D47443034
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NMywr64K9KKL for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 09:21:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67A0141972
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 09:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67A0141972
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46ECF862C1; Wed,  1 Nov 2023 09:21:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 10:13:12 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 71766b4fcd3602c6a02ead31fa99a07cbe74e92d
X-Git-Newrev: e67ef0d8fa3b422972998c66c0eedbd4b49a95d7
X-Patchwork-Hint: ignore
Message-Id: <20231101092109.46ECF862C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/pango: fix build
 with gcc >= 13
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

commit: https://git.buildroot.net/buildroot/commit/?id=e67ef0d8fa3b422972998c66c0eedbd4b49a95d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fix the following build failure with gcc >= 13:

In function 'find_best_lang_match_cached',
    inlined from 'find_best_lang_match_cached' at ../pango/pango-language.c:501:1,
    inlined from 'pango_language_get_scripts' at ../pango/pango-language.c:661:21:
../pango/pango-language.c:518:12: error: array subscript 0 is outside array bounds of 'const void *[0]' {aka 'const void *[]'} [-Werror=array-bounds=]
  518 |     *cache = result;
      |     ~~~~~~~^~~~~~~~
In function 'pango_language_get_scripts':
cc1: note: source object is likely at address zero
cc1: some warnings being treated as errors

Fixes:
 - http://autobuild.buildroot.org/results/e8b5a752a62621099942b29c1642747eef2930cb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 477b39a1e08452a3210a71c4f83b6f910a062566)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pango/0001-Drop-Werror-array-bounds.patch | 40 +++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/pango/0001-Drop-Werror-array-bounds.patch b/package/pango/0001-Drop-Werror-array-bounds.patch
new file mode 100644
index 0000000000..45821e8533
--- /dev/null
+++ b/package/pango/0001-Drop-Werror-array-bounds.patch
@@ -0,0 +1,40 @@
+From e93dbd66973040f1e0afcba0dc7c712c27d75d59 Mon Sep 17 00:00:00 2001
+From: Matthias Clasen <mclasen@redhat.com>
+Date: Mon, 1 May 2023 23:27:52 -0400
+Subject: [PATCH] Drop -Werror=array-bounds
+
+gcc has strange issues with this and produces false
+positives that recently started breaking the build of
+pango as a subproject in gtk.
+
+See e.g. https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105523
+
+Upstream: https://gitlab.gnome.org/GNOME/pango/-/commit/e93dbd66973040f1e0afcba0dc7c712c27d75d59
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ meson.build | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 930f41082..2d30c0141 100644
+--- a/meson.build
++++ b/meson.build
+@@ -89,7 +89,6 @@ elif cc.get_id() == 'gcc' or cc.get_id() == 'clang'
+     '-Wuninitialized',
+     '-Wunused',
+     '-Werror=address',
+-    '-Werror=array-bounds',
+     '-Werror=empty-body',
+     '-Werror=implicit',
+     '-Werror=implicit-fallthrough',
+@@ -132,7 +131,6 @@ elif cc.get_id() == 'gcc' or cc.get_id() == 'clang'
+     '-Werror=sequence-point',
+     '-Werror=return-type',
+     '-Werror=trigraphs',
+-    '-Werror=array-bounds',
+     '-Werror=write-strings',
+     '-Werror=address',
+     '-Werror=int-to-pointer-cast',
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
