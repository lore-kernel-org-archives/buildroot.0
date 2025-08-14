Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E09CA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 22:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0727F4079B;
	Thu, 14 Aug 2025 22:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZdTbXWzxDZ0X; Thu, 14 Aug 2025 22:42:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0999440798
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0999440798;
	Thu, 14 Aug 2025 22:42:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 79170271
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 22:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FD0A40793
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 22:42:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 71YrQ1Cki3on for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 22:42:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BABDC40650
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BABDC40650
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 22:42:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6FB98763A; Thu, 14 Aug 2025 22:42:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 Aug 2025 00:22:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e91d1068de81357d86d462fc07c4f97e142c74bc
X-Git-Newrev: cfabe800ad458bb67f01b5ebe97950902853e7c2
X-Patchwork-Hint: ignore
Message-Id: <20250814224254.A6FB98763A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-numpy: fix build with
 python-cython >= 3.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4498429184323133210=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4498429184323133210==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cfabe800ad458bb67f01b5ebe97950902853e7c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

--===============4498429184323133210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4498429184323133210==--
