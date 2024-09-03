Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6F1CD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 948EA607F8;
	Tue,  3 Sep 2024 19:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Akcww8xLJIM; Tue,  3 Sep 2024 19:35:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7156560817
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7156560817;
	Tue,  3 Sep 2024 19:35:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 800DB1BF95C
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 672C480BBF
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ic_t7QNko9k3 for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:35:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7200780B69
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7200780B69
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:35:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6DD9E86BB3; Tue,  3 Sep 2024 19:35:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 20:55:53 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: cdadf61305b8564b77446a255abce9d9d62ce1ac
X-Git-Newrev: a5b0519fc772fa9b29690b8ea207aa01a3f8cf51
X-Patchwork-Hint: ignore
Message-Id: <20240903193519.6DD9E86BB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/nginx: fix
 compile error in configure script
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

commit: https://git.buildroot.net/buildroot/commit/?id=a5b0519fc772fa9b29690b8ea207aa01a3f8cf51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Building with GCC 14 fails at the configure step with:

    ./configure: error: libatomic_ops library was not found.

The error is not caused by a missing library, but by an unrelated
"incompatible pointer type" error in the test program:

    ...
    checking for atomic_ops library
    objs/autotest.c: In function 'main':
    objs/autotest.c:9:48: error: passing argument 1 of 'AO_compare_and_swap' from incompatible pointer type [-Wincompatible-pointer-types]

This used to be a warning, but it is an error since GCC 14.[1]

Fix this by patching the test program in order to use the correct
pointer types.

Fixes: http://autobuild.buildroot.net/results/a3d/a3d8c6fd631b31e272e4d8cc6c3318f2e4151882

[1] https://gcc.gnu.org/gcc-14/porting_to.html#incompatible-pointer-types

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 7d249dab514e6fc003cb92962890d2ce36b87931)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...011-Fix-compile-error-in-configure-script.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/nginx/0011-Fix-compile-error-in-configure-script.patch b/package/nginx/0011-Fix-compile-error-in-configure-script.patch
new file mode 100644
index 0000000000..672162759e
--- /dev/null
+++ b/package/nginx/0011-Fix-compile-error-in-configure-script.patch
@@ -0,0 +1,33 @@
+From e1bcac837f6aeabc4ddece06ecbcf2bcca8dd651 Mon Sep 17 00:00:00 2001
+From: Edgar Bonet <bonet@grenoble.cnrs.fr>
+Date: Thu, 16 May 2024 11:15:10 +0200
+Subject: [PATCH] Configure: fixed building libatomic test.
+
+Using "long *" instead of "AO_t *" leads either to -Wincompatible-pointer-types
+or -Wpointer-sign warnings, depending on whether long and size_t are compatible
+types (e.g., ILP32 versus LP64 data models).  Notably, -Wpointer-sign warnings
+are enabled by default in Clang only, and -Wincompatible-pointer-types is an
+error starting from GCC 14.
+
+Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
+Upstream: https://hg.nginx.org/nginx/rev/f58b6f636238
+---
+ auto/lib/libatomic/conf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/auto/lib/libatomic/conf b/auto/lib/libatomic/conf
+index d1e484a..0f12b9c 100644
+--- a/auto/lib/libatomic/conf
++++ b/auto/lib/libatomic/conf
+@@ -20,7 +20,7 @@ else
+                       #include <atomic_ops.h>"
+     ngx_feature_path=
+     ngx_feature_libs="-latomic_ops"
+-    ngx_feature_test="long  n = 0;
++    ngx_feature_test="AO_t  n = 0;
+                       if (!AO_compare_and_swap(&n, 0, 1))
+                           return 1;
+                       if (AO_fetch_and_add(&n, 1) != 1)
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
