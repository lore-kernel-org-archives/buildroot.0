Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B230C4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 11:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB77B431D6;
	Sun, 29 Oct 2023 11:14:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB77B431D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uxkv_4-qshN6; Sun, 29 Oct 2023 11:14:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AADE8431E2;
	Sun, 29 Oct 2023 11:14:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AADE8431E2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0FCDF1BF8C7
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 11:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB57D84D8F
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 11:14:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB57D84D8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 83zhBnB3U7Bq for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 11:14:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E25C84D4A
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 11:14:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E25C84D4A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E461B8610B; Sun, 29 Oct 2023 11:14:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Oct 2023 12:11:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 651b65381494fed9ce6acc23b1805e70b7f93146
X-Git-Newrev: 477b39a1e08452a3210a71c4f83b6f910a062566
X-Patchwork-Hint: ignore
Message-Id: <20231029111406.E461B8610B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pango: fix build with gcc >= 13
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

commit: https://git.buildroot.net/buildroot/commit/?id=477b39a1e08452a3210a71c4f83b6f910a062566
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
