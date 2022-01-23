Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFE6C433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 19:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAFF783F6C;
	Sun, 23 Jan 2022 19:11:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LNRcaTZ-oZph; Sun, 23 Jan 2022 19:11:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDF7181987;
	Sun, 23 Jan 2022 19:11:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE4FA1BF97C
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD4BB60C2A
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:10:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BzSPqPiB45kc for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 19:10:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E80DB605BE
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 19:10:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5AD81828C8; Sun, 23 Jan 2022 19:04:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 19:35:15 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 986fd8838f5c8348db889b9e6418ded3a2306243
X-Git-Newrev: a5ae65a5e13b121ec726997084e7d6842832d5aa
X-Patchwork-Hint: ignore
Message-Id: <20220123190401.5AD81828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/lapack: fix
 CVE-2021-4048
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

commit: https://git.buildroot.net/buildroot/commit/?id=a5ae65a5e13b121ec726997084e7d6842832d5aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix CVE-2021-4048: An out-of-bounds read flaw was found in the CLARRV,
DLARRV, SLARRV, and ZLARRV functions in lapack through version 3.10.0,
as also used in OpenBLAS before version 0.3.18. Specially crafted inputs
passed to these functions could cause an application using lapack to
crash or possibly disclose portions of its memory.

It should be noted that commit 59a1fcc69620da8eab1c048977fa22d297b18284
wrongly assumed that this CVE was fixed in version 3.10.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 83134027a02a6bea7320323562af9f75429c582f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Fix-out-of-bounds-read-in-slarrv.patch    | 82 ++++++++++++++++++++++
 package/lapack/lapack.mk                           |  3 +
 2 files changed, 85 insertions(+)

diff --git a/package/lapack/0001-Fix-out-of-bounds-read-in-slarrv.patch b/package/lapack/0001-Fix-out-of-bounds-read-in-slarrv.patch
new file mode 100644
index 0000000000..43c6444b02
--- /dev/null
+++ b/package/lapack/0001-Fix-out-of-bounds-read-in-slarrv.patch
@@ -0,0 +1,82 @@
+From 0631b6beaed60ba118b0b027c0f8d35397bf5df0 Mon Sep 17 00:00:00 2001
+From: Keno Fischer <keno@juliacomputing.com>
+Date: Thu, 30 Sep 2021 03:51:23 -0400
+Subject: [PATCH] Fix out of bounds read in slarrv
+
+This was originally reported as https://github.com/JuliaLang/julia/issues/42415.
+I've tracked this down to an our of bounds read on the following line:
+
+https://github.com/Reference-LAPACK/lapack/blob/44ecb6a5ff821b1cbb39f8cc2166cb098e060b4d/SRC/slarrv.f#L423
+
+In the crashing example, `M` is `0`, causing `slarrv` to read uninitialized
+memory from the work array. I believe the `0` for `M` is correct and indeed,
+the documentation above supports that `M` may be zero:
+
+https://github.com/Reference-LAPACK/lapack/blob/44ecb6a5ff821b1cbb39f8cc2166cb098e060b4d/SRC/slarrv.f#L113-L116
+
+I believe it may be sufficient to early-out this function as suggested
+in this PR. However, I have limited context for the full routine here,
+so I would appreciate a sanity check.
+
+[Retrieved from:
+https://github.com/Reference-LAPACK/lapack/commit/38f3eeee3108b18158409ca2a100e6fe03754781]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ SRC/clarrv.f | 2 +-
+ SRC/dlarrv.f | 2 +-
+ SRC/slarrv.f | 2 +-
+ SRC/zlarrv.f | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/SRC/clarrv.f b/SRC/clarrv.f
+index 1f09e4da6..42f710757 100644
+--- a/SRC/clarrv.f
++++ b/SRC/clarrv.f
+@@ -348,7 +348,7 @@ SUBROUTINE CLARRV( N, VL, VU, D, L, PIVMIN,
+ *
+ *     Quick return if possible
+ *
+-      IF( N.LE.0 ) THEN
++      IF( (N.LE.0).OR.(M.LE.0) ) THEN
+          RETURN
+       END IF
+ *
+diff --git a/SRC/dlarrv.f b/SRC/dlarrv.f
+index b036c1e66..299430361 100644
+--- a/SRC/dlarrv.f
++++ b/SRC/dlarrv.f
+@@ -350,7 +350,7 @@ SUBROUTINE DLARRV( N, VL, VU, D, L, PIVMIN,
+ *
+ *     Quick return if possible
+ *
+-      IF( N.LE.0 ) THEN
++      IF( (N.LE.0).OR.(M.LE.0) ) THEN
+          RETURN
+       END IF
+ *
+diff --git a/SRC/slarrv.f b/SRC/slarrv.f
+index 9d72b339a..95f94fd1b 100644
+--- a/SRC/slarrv.f
++++ b/SRC/slarrv.f
+@@ -350,7 +350,7 @@ SUBROUTINE SLARRV( N, VL, VU, D, L, PIVMIN,
+ *
+ *     Quick return if possible
+ *
+-      IF( N.LE.0 ) THEN
++      IF( (N.LE.0).OR.(M.LE.0) ) THEN
+          RETURN
+       END IF
+ *
+diff --git a/SRC/zlarrv.f b/SRC/zlarrv.f
+index 51ec558f5..e4be63e0d 100644
+--- a/SRC/zlarrv.f
++++ b/SRC/zlarrv.f
+@@ -348,7 +348,7 @@ SUBROUTINE ZLARRV( N, VL, VU, D, L, PIVMIN,
+ *
+ *     Quick return if possible
+ *
+-      IF( N.LE.0 ) THEN
++      IF( (N.LE.0).OR.(M.LE.0) ) THEN
+          RETURN
+       END IF
+ *
diff --git a/package/lapack/lapack.mk b/package/lapack/lapack.mk
index f34f685ae2..a80131c9ad 100644
--- a/package/lapack/lapack.mk
+++ b/package/lapack/lapack.mk
@@ -12,6 +12,9 @@ LAPACK_INSTALL_STAGING = YES
 LAPACK_SUPPORTS_IN_SOURCE_BUILD = NO
 LAPACK_CONF_OPTS = -DLAPACKE=ON -DCBLAS=ON
 
+# 0001-Fix-out-of-bounds-read-in-slarrv.patch
+LAPACK_IGNORE_CVES += CVE-2021-4048
+
 ifeq ($(BR2_PACKAGE_LAPACK_COMPLEX),y)
 LAPACK_CONF_OPTS += -DBUILD_COMPLEX=ON -DBUILD_COMPLEX16=ON
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
