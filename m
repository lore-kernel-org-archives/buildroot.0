Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FDBC021B4
	for <buildroot@archiver.kernel.org>; Thu, 20 Feb 2025 21:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAB7060B56;
	Thu, 20 Feb 2025 21:48:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YLtELzLCegJf; Thu, 20 Feb 2025 21:48:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C77E36116C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C77E36116C;
	Thu, 20 Feb 2025 21:48:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B2749194
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 21:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD58940D45
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 21:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p11LKkT4Smss for <buildroot@buildroot.org>;
 Thu, 20 Feb 2025 21:48:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EB71412C5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EB71412C5
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 21:48:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CF7D8798E; Thu, 20 Feb 2025 21:48:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 20 Feb 2025 21:41:13 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: d1ec60b8a102eafb970300ecb3b50481ff48f770
X-Git-Newrev: 5d65f5cd1cc1a9344e7300e2000629d3104a14be
X-Patchwork-Hint: ignore
Message-Id: <20250220214824.8CF7D8798E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/openssh: fix musl
 compile issue
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d65f5cd1cc1a9344e7300e2000629d3104a14be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Building package/openssh 9.9p1 with musl failed during linking because
construct_utmp() was referenced due to "use construct_utmp to
construct btmp records" [1], but not built as utmp is disabled in the
Buildroot package. The fix comes from upstream and ensures the
construct_utmp function actually gets built when USE_BTMP is set [2].

[1] https://anongit.mindrot.org/openssh.git/commit/?id=671c440786a5a66216922f15d0007b60f1e6733f
[2] https://anongit.mindrot.org/openssh.git/commit/?id=76a618d2842c34c16cd21a4efc7230e2f459008d

Fixes:

  http://autobuild.buildroot.net/results/1e651724373f32e45d122d05fa3a10ac88fe29dc/

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2065fecbf30b0b91263fa7f30e5b1786055b968a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...build-construct_utmp-when-USE_BTMP-is-set.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/openssh/0001-build-construct_utmp-when-USE_BTMP-is-set.patch b/package/openssh/0001-build-construct_utmp-when-USE_BTMP-is-set.patch
new file mode 100644
index 0000000000..85ad5a538c
--- /dev/null
+++ b/package/openssh/0001-build-construct_utmp-when-USE_BTMP-is-set.patch
@@ -0,0 +1,35 @@
+From 76a618d2842c34c16cd21a4efc7230e2f459008d Mon Sep 17 00:00:00 2001
+From: Damien Miller <djm@mindrot.org>
+Date: Wed, 25 Sep 2024 11:13:05 +1000
+Subject: [PATCH] build construct_utmp() when USE_BTMP is set
+
+Fixes compile error on Void Linux/Musl
+
+Upstream: https://anongit.mindrot.org/openssh.git/commit/?id=76a618d2842c34c16cd21a4efc7230e2f459008d
+Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
+---
+ loginrec.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/loginrec.c b/loginrec.c
+index 45f13dee8b1f..7b1818b86753 100644
+--- a/loginrec.c
++++ b/loginrec.c
+@@ -614,7 +614,7 @@ line_abbrevname(char *dst, const char *src, int dstsize)
+  ** into account.
+  **/
+
+-#if defined(USE_UTMP) || defined (USE_WTMP) || defined (USE_LOGIN)
++#if defined(USE_BTMP) || defined(USE_UTMP) || defined (USE_WTMP) || defined (USE_LOGIN)
+
+ /* build the utmp structure */
+ void
+@@ -698,7 +698,7 @@ construct_utmp(struct logininfo *li,
+ 	}
+ # endif
+ }
+-#endif /* USE_UTMP || USE_WTMP || USE_LOGIN */
++#endif /* USE_BTMP || USE_UTMP || USE_WTMP || USE_LOGIN */
+
+ /**
+  ** utmpx utility functions
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
