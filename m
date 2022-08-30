Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D325EECAAD4
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 21:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 676DD828B5;
	Tue, 30 Aug 2022 21:31:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 676DD828B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jtIX3MLxhhda; Tue, 30 Aug 2022 21:31:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79DCB81A73;
	Tue, 30 Aug 2022 21:31:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79DCB81A73
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 857BC1BF388
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 21:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 602CA417EF
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 21:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 602CA417EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AcozCsfUAVMD for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 21:31:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62102417C6
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 21:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62102417C6
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2324D881D8; Tue, 30 Aug 2022 21:16:05 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 30 Aug 2022 23:27:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a94fa901293bda6e0e87eff5dcb677b856c70b4
X-Git-Newrev: 50d5e224a6fb0d8d78727f169d20625285da8f7b
X-Patchwork-Hint: ignore
Message-Id: <20220830211605.2324D881D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libzlib: backport security fix for
 CVE-2022-37434
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

commit: https://git.buildroot.net/buildroot/commit/?id=50d5e224a6fb0d8d78727f169d20625285da8f7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See: https://security-tracker.debian.org/tracker/CVE-2022-37434

Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/libzlib/0002-fix-CVE-2022-37434.patch      | 35 ++++++++++++++++++++++
 .../0003-fix-CVE-2022-37434-regression.patch       | 32 ++++++++++++++++++++
 package/libzlib/libzlib.mk                         |  3 ++
 3 files changed, 70 insertions(+)

diff --git a/package/libzlib/0002-fix-CVE-2022-37434.patch b/package/libzlib/0002-fix-CVE-2022-37434.patch
new file mode 100644
index 0000000000..a61be48536
--- /dev/null
+++ b/package/libzlib/0002-fix-CVE-2022-37434.patch
@@ -0,0 +1,35 @@
+From eff308af425b67093bab25f80f1ae950166bece1 Mon Sep 17 00:00:00 2001
+From: Mark Adler <fork@madler.net>
+Date: Sat, 30 Jul 2022 15:51:11 -0700
+Subject: [PATCH] Fix a bug when getting a gzip header extra field with
+ inflate().
+
+If the extra field was larger than the space the user provided with
+inflateGetHeader(), and if multiple calls of inflate() delivered
+the extra header data, then there could be a buffer overflow of the
+provided space. This commit assures that provided space is not
+exceeded.
+
+Backported from: eff308af425b67093bab25f80f1ae950166bece1
+Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
+---
+ inflate.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/inflate.c b/inflate.c
+index 7be8c6366..7a7289749 100644
+--- a/inflate.c
++++ b/inflate.c
+@@ -763,9 +763,10 @@ int flush;
+                 copy = state->length;
+                 if (copy > have) copy = have;
+                 if (copy) {
++                    len = state->head->extra_len - state->length;
+                     if (state->head != Z_NULL &&
+-                        state->head->extra != Z_NULL) {
+-                        len = state->head->extra_len - state->length;
++                        state->head->extra != Z_NULL &&
++                        len < state->head->extra_max) {
+                         zmemcpy(state->head->extra + len, next,
+                                 len + copy > state->head->extra_max ?
+                                 state->head->extra_max - len : copy);
diff --git a/package/libzlib/0003-fix-CVE-2022-37434-regression.patch b/package/libzlib/0003-fix-CVE-2022-37434-regression.patch
new file mode 100644
index 0000000000..46a58710d2
--- /dev/null
+++ b/package/libzlib/0003-fix-CVE-2022-37434-regression.patch
@@ -0,0 +1,32 @@
+From 1eb7682f845ac9e9bf9ae35bbfb3bad5dacbd91d Mon Sep 17 00:00:00 2001
+From: Mark Adler <fork@madler.net>
+Date: Mon, 8 Aug 2022 10:50:09 -0700
+Subject: [PATCH] Fix extra field processing bug that dereferences NULL
+ state->head.
+
+The recent commit to fix a gzip header extra field processing bug
+introduced the new bug fixed here.
+
+Backported from: 1eb7682f845ac9e9bf9ae35bbfb3bad5dacbd91d
+Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
+---
+ inflate.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/inflate.c b/inflate.c
+index 7a7289749..2a3c4fe98 100644
+--- a/inflate.c
++++ b/inflate.c
+@@ -763,10 +763,10 @@ int flush;
+                 copy = state->length;
+                 if (copy > have) copy = have;
+                 if (copy) {
+-                    len = state->head->extra_len - state->length;
+                     if (state->head != Z_NULL &&
+                         state->head->extra != Z_NULL &&
+-                        len < state->head->extra_max) {
++                        (len = state->head->extra_len - state->length) <
++                            state->head->extra_max) {
+                         zmemcpy(state->head->extra + len, next,
+                                 len + copy > state->head->extra_max ?
+                                 state->head->extra_max - len : copy);
diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
index 431c48739a..f75502326b 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -14,6 +14,9 @@ LIBZLIB_PROVIDES = zlib
 LIBZLIB_CPE_ID_VENDOR = zlib
 LIBZLIB_CPE_ID_PRODUCT = zlib
 
+# 0002-fix-CVE-2022-37434.patch
+LIBZLIB_IGNORE_CVES = CVE-2022-37434
+
 # It is not possible to build only a shared version of zlib, so we build both
 # shared and static, unless we only want the static libs, and we eventually
 # selectively remove what we do not want
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
