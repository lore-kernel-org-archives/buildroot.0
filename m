Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237F4C4332F
	for <buildroot@archiver.kernel.org>; Mon, 13 Nov 2023 21:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4EC242108;
	Mon, 13 Nov 2023 21:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4EC242108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZknnVS6WqQJU; Mon, 13 Nov 2023 21:53:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E35AB41FEE;
	Mon, 13 Nov 2023 21:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E35AB41FEE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 663521BF389
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 21:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E96E40199
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 21:53:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E96E40199
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JfnaxPXcxwAD for <buildroot@lists.busybox.net>;
 Mon, 13 Nov 2023 21:53:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 112CD4018F
 for <buildroot@buildroot.org>; Mon, 13 Nov 2023 21:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 112CD4018F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F24C88710C; Mon, 13 Nov 2023 21:53:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Nov 2023 22:51:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2b23a63208bb026b5a5729c6a4c33e48aad934c
X-Git-Newrev: ad0bb50dc717a2d9568b73e0f4a509cf6044ffb1
X-Patchwork-Hint: ignore
Message-Id: <20231113215303.F24C88710C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tar: add upstream security patch
 for CVE-2022-48303
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

commit: https://git.buildroot.net/buildroot/commit/?id=ad0bb50dc717a2d9568b73e0f4a509cf6044ffb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2022-48303: GNU Tar through 1.34 has a one-byte out-of-bounds read
that results in use of uninitialized memory for a conditional jump.
Exploitation to change the flow of control has not been demonstrated.  The
issue occurs in from_header in list.c via a V7 archive in which mtime has
approximately 11 whitespace characters.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Peter: add _IGNORE_CVES entry]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Fix-boundary-checking-in-base-256-decoder.patch | 33 ++++++++++++++++++++++
 package/tar/tar.mk                                 |  3 ++
 2 files changed, 36 insertions(+)

diff --git a/package/tar/0002-Fix-boundary-checking-in-base-256-decoder.patch b/package/tar/0002-Fix-boundary-checking-in-base-256-decoder.patch
new file mode 100644
index 0000000000..7bad339fe0
--- /dev/null
+++ b/package/tar/0002-Fix-boundary-checking-in-base-256-decoder.patch
@@ -0,0 +1,33 @@
+From 3da78400eafcccb97e2f2fd4b227ea40d794ede8 Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Sat, 11 Feb 2023 11:57:39 +0200
+Subject: [PATCH] Fix boundary checking in base-256 decoder
+
+* src/list.c (from_header): Base-256 encoding is at least 2 bytes
+long.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+Upstream: https://git.savannah.gnu.org/cgit/tar.git/commit/?id=3da78400eafcccb97e2f2fd4b227ea40d794ede8
+---
+ src/list.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/list.c b/src/list.c
+index 9fafc425..86bcfdd1 100644
+--- a/src/list.c
++++ b/src/list.c
+@@ -881,8 +881,9 @@ from_header (char const *where0, size_t digs, char const *type,
+ 	  where++;
+ 	}
+     }
+-  else if (*where == '\200' /* positive base-256 */
+-	   || *where == '\377' /* negative base-256 */)
++  else if (where <= lim - 2
++	   && (*where == '\200' /* positive base-256 */
++	       || *where == '\377' /* negative base-256 */))
+     {
+       /* Parse base-256 output.  A nonnegative number N is
+ 	 represented as (256**DIGS)/2 + N; a negative number -N is
+-- 
+2.39.2
+
diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 690a5952ba..dc17647b2c 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -14,6 +14,9 @@ TAR_LICENSE = GPL-3.0+
 TAR_LICENSE_FILES = COPYING
 TAR_CPE_ID_VENDOR = gnu
 
+# 0002-Fix-boundary-checking-in-base-256-decoder.patch
+TAR_IGNORE_CVES += CVE-2022-48303
+
 ifeq ($(BR2_PACKAGE_ACL),y)
 TAR_DEPENDENCIES += acl
 TAR_CONF_OPTS += --with-posix-acls
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
