Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05928D743E3
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 21:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBF1F60B71;
	Wed, 20 Nov 2024 21:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 841PB2pepJdr; Wed, 20 Nov 2024 21:43:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA84260B91
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA84260B91;
	Wed, 20 Nov 2024 21:43:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B56FD970
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A21BB403AA
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:43:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kr4hghDkLjJt for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 21:43:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87453405A6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87453405A6
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:43:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FA088652C; Wed, 20 Nov 2024 21:43:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 20 Nov 2024 22:39:15 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: d04f68826f842671d2c7433086057c5d6c447964
X-Git-Newrev: ae27b61496cd86423a625d0977f67a5e01255099
X-Patchwork-Hint: ignore
Message-Id: <20241120214345.7FA088652C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/gnuplot: fix
 build failures on undefined FE_UNDERFLOW
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae27b61496cd86423a625d0977f67a5e01255099
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Gnuplot carries the implicit assumption that, if the header fenv.h is
available, then it must define FE_UNDERFLOW. This assumption fails on
microblaze{,el}, mips{,64}{,el}, nios2 and or1k.

Fixes:
  - https://autobuild.buildroot.org/results/aa177c4f4f7c7429f052cebbf54f7027e4b2cabd/
  - https://autobuild.buildroot.org/results/868ca441daa2485b997f307edeede31dd229bfc2/
  - https://autobuild.buildroot.org/results/0a152cbfe23703bc5012098864d7fd5608775882/
  - https://autobuild.buildroot.org/results/d43be86091c9bd9163c145264151532f0f485528/

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5ab8eb3cac0c87c850c800d639004205807faf27)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-check-for-defined-FE_UNDERFLOW.patch      | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/gnuplot/0002-check-for-defined-FE_UNDERFLOW.patch b/package/gnuplot/0002-check-for-defined-FE_UNDERFLOW.patch
new file mode 100644
index 0000000000..e84c72aaed
--- /dev/null
+++ b/package/gnuplot/0002-check-for-defined-FE_UNDERFLOW.patch
@@ -0,0 +1,32 @@
+From 806641b5ef504488f871b5cbd9e5c356d67d0bd1 Mon Sep 17 00:00:00 2001
+From: Edgar Bonet <bonet@grenoble.cnrs.fr>
+Date: Tue, 24 Sep 2024 20:03:18 -0700
+Subject: [PATCH] check for defined(FE_UNDERFLOW)
+
+According to fenv(3), the macro FE_UNDERFLOW is defined by fenv.h only
+if the implementation supports handling of the underflow exception. Do
+not assume the presence of fenv.h implies FE_UNDERFLOW is defined.
+
+Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
+Upstream: https://sourceforge.net/p/gnuplot/gnuplot-main/ci/926d2c26d31f4b69feda372c76a28643ef45359d/
+Upstream: https://sourceforge.net/p/gnuplot/gnuplot-main/ci/806641b5ef504488f871b5cbd9e5c356d67d0bd1/
+---
+ src/complexfun.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/complexfun.c b/src/complexfun.c
+index 7a5d9a13f..7ddb4ed60 100644
+--- a/src/complexfun.c
++++ b/src/complexfun.c
+@@ -86,7 +86,7 @@
+ 	int_error(NO_CARET, "%s: error present on entry (errno %d %s)", who, errno, strerror(errno));
+ #endif
+ 
+-#ifdef HAVE_FENV_H
++#if defined (HAVE_FENV_H) && defined (FE_UNDERFLOW)
+ #define handle_underflow( who, var ) \
+     if (errno) { \
+ 	if (fetestexcept(FE_UNDERFLOW)) { \
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
