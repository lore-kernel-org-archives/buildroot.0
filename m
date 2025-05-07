Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43780C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 497AC70B3F;
	Mon, 19 May 2025 10:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1WPS6XBKjH0J; Mon, 19 May 2025 10:57:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37C5770B36
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37C5770B36;
	Mon, 19 May 2025 10:57:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 689EED4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1DC540E62
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sd4BXz5tFw6c for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0634410C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0634410C3
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCD178348A; Mon, 19 May 2025 10:39:59 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 7 May 2025 22:03:18 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e3cae9e1ca4765da825c9ee94760e12f5c6c142a
X-Git-Newrev: 835b5659ea576290458aa17d2119b2ec13ebf0a0
X-Patchwork-Hint: ignore
Message-Id: <20250519103959.BCD178348A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sqlite: add patch to
 fix CVE-2025-29087
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

commit: https://git.buildroot.net/buildroot/commit/?id=835b5659ea576290458aa17d2119b2ec13ebf0a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch was commited upstream, and released as part of sqlite 3.49.1

However, the configuration system changed between sqlite 3.48 and 3.49
from autotools to autosetup, and this has proven challenging to support
in Buildroot (see `git log package/sqlite`), hence why we are still on
sqlite 3.48.

Therefore, until the package build infrastructure correctly supports
building sqlite 3.49, let's simply import the upstream patch to address
the CVE.

Note: the upstream patch is on the orignal sqlite sources. Buildroot is
using the sqlite "amalgamation" source archive, which basically
concatenate all the source files in a single "sqlite3.c" file. So the
patch was reformated to apply correctly on the sqlite release archive.

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-29087

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
[Julien:
 - reformat patch to be applicable on amalgamated sqlite sources
 - add comment in commit log about patch format
 - add "Fixes:" in commit log
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ast-to-avoid-32-bit-integer-overflow-in-t.patch | 36 ++++++++++++++++++++++
 package/sqlite/sqlite.mk                           |  3 ++
 2 files changed, 39 insertions(+)

diff --git a/package/sqlite/0002-Add-a-typecast-to-avoid-32-bit-integer-overflow-in-t.patch b/package/sqlite/0002-Add-a-typecast-to-avoid-32-bit-integer-overflow-in-t.patch
new file mode 100644
index 0000000000..cb8b39b1be
--- /dev/null
+++ b/package/sqlite/0002-Add-a-typecast-to-avoid-32-bit-integer-overflow-in-t.patch
@@ -0,0 +1,36 @@
+From 1cbb088f4be95e7a02627f64de60653ef2b13ab5 Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Sun, 16 Feb 2025 10:57:25 +0000
+Subject: [PATCH] Add a typecast to avoid 32-bit integer overflow in the
+ concat_ws() function with an enormous separator values and many arguments.
+
+Fixes the following CVE:
+  - CVE-2025-29087: In SQLite 3.44.0 through 3.49.0 before 3.49.1,
+                    the concat_ws() SQL function can cause memory to be
+                    written beyond the end of a malloc-allocated buffer.
+
+For more info see https://nvd.nist.gov/vuln/detail/CVE-2025-29087
+
+Upstream: https://sqlite.org/src/info/498e3f1cf57f164f
+
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ sqlite3.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 80433f6..8a43734 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -130954,7 +130954,7 @@ static void concatFuncCore(
+   for(i=0; i<argc; i++){
+     n += sqlite3_value_bytes(argv[i]);
+   }
+-  n += (argc-1)*nSep;
++  n += (argc-1)*(i64)nSep;
+   z = sqlite3_malloc64(n+1);
+   if( z==0 ){
+     sqlite3_result_error_nomem(context);
+-- 
+2.49.0
+
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 218b3f0a1d..037b89918a 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -13,6 +13,9 @@ SQLITE_LICENSE_FILES = tea/license.terms
 SQLITE_CPE_ID_VENDOR = sqlite
 SQLITE_INSTALL_STAGING = YES
 
+# 0002-Add-a-typecast-to-avoid-32-bit-integer-overflow-in-t.patch
+SQLITE_IGNORE_CVES = CVE-2025-29087
+
 ifeq ($(BR2_PACKAGE_SQLITE_STAT4),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_STAT4
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
