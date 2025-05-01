Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFF2C3ABAC
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF250417CA;
	Fri,  2 May 2025 11:11:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id faSrMN-jBbDY; Fri,  2 May 2025 11:11:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 070CD41A5A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 070CD41A5A;
	Fri,  2 May 2025 11:11:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 35E78229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B235419DB
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1LzJIbh52rvw for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50FEF4161A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50FEF4161A
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 43592863AE; Fri,  2 May 2025 11:11:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 May 2025 18:58:25 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f7e2b2c9daa0b1321bebfed33a0bd61d9df00034
X-Git-Newrev: ca5f3492fc3f034c1ce7dd9e5c24bdc13966b41f
X-Patchwork-Hint: ignore
Message-Id: <20250502111135.43592863AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/sqlite: revert
 upstream change causing build issue
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ca5f3492fc3f034c1ce7dd9e5c24bdc13966b41f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Upstream did a change in sqlite3.pc.in that does work with their
default build system, but not with the autoconf-based amalgamation
that we use. This issue has been reported and fixed upstream, but the
fix is not yet in any new release.

For the time being, we just revert the upstream change. We don't do a
direct revert ("git revert") as multiple upstream commits touched this
very line, so we simply revert to what it was prior to the different
changes, and to what the upstream fix ends up doing.

This issue is causing build issue for all packages that use sqlite's
pkg-config file, in a static-linking configuration.

Fixes:

  https://autobuild.buildroot.org/results/1824a76eee4a877a2f19c1fd19a710ef9f059168/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit db481210e99321f4f0ab6599aab28f39b5b7fd50)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...in-revert-upstream-commits-causing-build-.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/sqlite/0001-sqlite3.pc.in-revert-upstream-commits-causing-build-.patch b/package/sqlite/0001-sqlite3.pc.in-revert-upstream-commits-causing-build-.patch
new file mode 100644
index 0000000000..f35c8b8ddd
--- /dev/null
+++ b/package/sqlite/0001-sqlite3.pc.in-revert-upstream-commits-causing-build-.patch
@@ -0,0 +1,48 @@
+From f70123a40193c2056755117aa291582f42db5f35 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 13 Apr 2025 17:47:53 +0200
+Subject: [PATCH] sqlite3.pc.in: revert upstream commits causing build issues
+
+This reverts upstream commit a2d88f6a03c9ebde3d037b0e297f47216c685381
+and a number of following commits related to the same commit. The
+sqlite build system is indeed upstream not based on autoconf, but the
+project "generates" an "autoconf-based amalgamation":
+
+  https://www3.sqlite.org/src/dir?ci=tip&name=autoconf
+
+Unfortunately commit a2d88f6a03c9ebde3d037b0e297f47216c685381 broke
+the build with the autoconf amalgamation because while @LIBS@ gets
+replaced by the autoconf machinery, @LDFLAGS_*@ do not, causing build
+failures such as:
+
+output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/13.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: cannot find @LDFLAGS_MATH@: No such file or directory
+output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/13.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: cannot find @LDFLAGS_ZLIB@: No such file or directory
+output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/13.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: cannot find @LDFLAGS_ICU@: No such file or directory
+
+This issue has been reported at
+https://sqlite.org/forum/info/e40b9b424a, and upstream says that the
+issue has been fixed in the amalgamation script by basically doing the
+same as what this commit does:
+
+  https://sqlite.org/src/info/fe47154799bfe
+
+Upstream: https://sqlite.org/forum/info/e40b9b424a
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ sqlite3.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sqlite3.pc.in b/sqlite3.pc.in
+index a9f941b1e4..3799671e61 100644
+--- a/sqlite3.pc.in
++++ b/sqlite3.pc.in
+@@ -9,5 +9,5 @@ Name: SQLite
+ Description: SQL database engine
+ Version: @PACKAGE_VERSION@
+ Libs: -L${libdir} -lsqlite3
+-Libs.private: @LDFLAGS_MATH@ @LDFLAGS_ZLIB@ @LDFLAGS_ICU@
++Libs.private: @LIBS@
+ Cflags: -I${includedir}
+-- 
+2.49.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
