Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E300CA0EFA
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E934084672;
	Thu, 21 Aug 2025 19:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AbD2-0TavlJl; Thu, 21 Aug 2025 19:20:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 042AC84683
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 042AC84683;
	Thu, 21 Aug 2025 19:20:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C45A1C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 252CF41957
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qWsh-vLJPi7c for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F5AD41921
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F5AD41921
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7008F8780C; Thu, 21 Aug 2025 19:20:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:51:31 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 0d6e845891e3769803dc2a92263c572df586ddf2
X-Git-Newrev: de41fbf7a0ac83d9c63de9f78386051c4bef4f07
X-Patchwork-Hint: ignore
Message-Id: <20250821192008.7008F8780C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/python-numpy: fix
 build with python-cython >= 3.1
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
Content-Type: multipart/mixed; boundary="===============7337679947528605080=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7337679947528605080==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=de41fbf7a0ac83d9c63de9f78386051c4bef4f07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Since commit b536caaec0d8 ("package/python-cython: bump to version
3.1.2"), python-numpy fails to build:

Error compiling Cython file:
------------------------------------------------------------
...
                np.issubdtype(cov.dtype, np.complexfloating)):
            raise TypeError("mean and cov must not be complex")
        if size is None:
            shape = []
        elif isinstance(size, (int, long, np.integer)):
                                    ^
------------------------------------------------------------
numpy/random/_generator.pyx:3760:36: undeclared name not builtin: long

Backport upstream patch to fix that build failure.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit cfabe800ad458bb67f01b5ebe97950902853e7c2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-MNT-do-not-use-long-type.patch            | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/python-numpy/0001-MNT-do-not-use-long-type.patch b/package/python-numpy/0001-MNT-do-not-use-long-type.patch
new file mode 100644
index 0000000000..d813a4d51b
--- /dev/null
+++ b/package/python-numpy/0001-MNT-do-not-use-long-type.patch
@@ -0,0 +1,34 @@
+From 6dc2fd31f8a5a4ef502cb7734f004f5bce94e671 Mon Sep 17 00:00:00 2001
+From: Thomas A Caswell <tcaswell@gmail.com>
+Date: Sat, 18 Nov 2023 16:46:52 -0500
+Subject: [PATCH] MNT: do not use `long` type
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Removed as type at language level 3 in ed7e95912b6ed7d20e190fbf1aecb9f2a997d479
+in cython
+
+Upstream: https://github.com/numpy/numpy/commit/6dc2fd31f8a5a4ef502cb7734f004f5bce94e671
+
+Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
+---
+ numpy/random/_generator.pyx | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/numpy/random/_generator.pyx b/numpy/random/_generator.pyx
+index d067e795eb5c..ae481d69d696 100644
+--- a/numpy/random/_generator.pyx
++++ b/numpy/random/_generator.pyx
+@@ -3757,7 +3757,7 @@ def multivariate_normal(self, mean, cov, size=None, check_valid='warn',
+ 
+         if size is None:
+             shape = []
+-        elif isinstance(size, (int, long, np.integer)):
++        elif isinstance(size, (int, np.integer)):
+             shape = [size]
+         else:
+             shape = size
+-- 
+2.49.1
+

--===============7337679947528605080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7337679947528605080==--
