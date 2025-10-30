Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6743CCCF9F8
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C06884037;
	Thu, 30 Oct 2025 08:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C49Rn4VpVP-F; Thu, 30 Oct 2025 08:11:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35D7D84067
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35D7D84067;
	Thu, 30 Oct 2025 08:11:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 138DA2A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DEDA41159
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id my0wxQxyo8Ef for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:10:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C31D4115B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C31D4115B
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A40D8140F; Thu, 30 Oct 2025 08:10:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 08:56:16 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b48933eb673122aa7cbd8b5f10f9374f8bd6b3f7
X-Git-Newrev: 0e7daa2717f9d2ad902697102128d02b7df97ffd
X-Patchwork-Hint: ignore
Message-Id: <20251030081040.1A40D8140F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libglib2: add
 patch for CVE-2025-7039
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e7daa2717f9d2ad902697102128d02b7df97ffd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Backport upstream patch, that was released in GLib 2.84.4 [1],
such that we can apply it onto GLib 2.82 in Buildroot LTS

This fixes the following vulnerability:
- CVE-2025-7039:
    A flaw was found in glib. An integer overflow during temporary file
    creation leads to an out-of-bounds memory access, allowing an attacker
    to potentially perform path traversal or access private temporary file
    content by creating symbolic links. This vulnerability allows a local
    attacker to manipulate file paths and access unauthorized data. The
    core issue stems from insufficient validation of file path lengths
    during temporary file operations.
    https://www.cve.org/CVERecord?id=CVE-2025-7039

[1] https://gitlab.gnome.org/GNOME/glib/-/releases/2.84.4

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
(cherry picked from commit 3252f45279b0104785c45e121a432a3335779a08)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ls-fix-computation-of-temporary-file-name.patch | 46 ++++++++++++++++++++++
 package/libglib2/libglib2.mk                       |  3 ++
 2 files changed, 49 insertions(+)

diff --git a/package/libglib2/0002-gfileutils-fix-computation-of-temporary-file-name.patch b/package/libglib2/0002-gfileutils-fix-computation-of-temporary-file-name.patch
new file mode 100644
index 0000000000..a297361ceb
--- /dev/null
+++ b/package/libglib2/0002-gfileutils-fix-computation-of-temporary-file-name.patch
@@ -0,0 +1,46 @@
+From 61e963284889ddb4544e6f1d5261c16120f6fcc3 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Tue, 1 Jul 2025 10:58:07 -0500
+Subject: [PATCH] gfileutils: fix computation of temporary file name
+
+We need to ensure that the value we use to index into the letters array
+is always positive.
+
+Fixes #3716
+
+CVE: CVE-2025-7039
+Upstream: https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4674
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ glib/gfileutils.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/glib/gfileutils.c b/glib/gfileutils.c
+index c7d3339d1c..286b1b154f 100644
+--- a/glib/gfileutils.c
++++ b/glib/gfileutils.c
+@@ -1538,9 +1538,9 @@ get_tmp_file (gchar            *tmpl,
+   static const char letters[] =
+     "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
+   static const int NLETTERS = sizeof (letters) - 1;
+-  gint64 value;
+-  gint64 now_us;
+-  static int counter = 0;
++  guint64 value;
++  guint64 now_us;
++  static guint counter = 0;
+ 
+   g_return_val_if_fail (tmpl != NULL, -1);
+ 
+@@ -1559,7 +1559,7 @@ get_tmp_file (gchar            *tmpl,
+ 
+   for (count = 0; count < 100; value += 7777, ++count)
+     {
+-      gint64 v = value;
++      guint64 v = value;
+ 
+       /* Fill in the random bits.  */
+       XXXXXX[0] = letters[v % NLETTERS];
+-- 
+GitLab
+
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index b8c853b752..e0ef652593 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -25,6 +25,9 @@ endif
 # 0001-gstring-Fix-overflow-check-when-expanding-the-string.patch
 LIBGLIB2_IGNORE_CVES += CVE-2025-6052
 
+# 0002-gfileutils-fix-computation-of-temporary-file-name.patch
+LIBGLIB2_IGNORE_CVES += CVE-2025-7039
+
 HOST_LIBGLIB2_CONF_OPTS = \
 	-Ddtrace=false \
 	-Dglib_debug=disabled \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
