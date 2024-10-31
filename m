Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF5FD767FB
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 19:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E99A3405C5;
	Thu, 31 Oct 2024 19:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BIpvQCQ4CLJd; Thu, 31 Oct 2024 19:54:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7B1F40678
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7B1F40678;
	Thu, 31 Oct 2024 19:54:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AA6D5E4F
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 19:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B76460AD5
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 19:54:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wR5KGUkB-Ax5 for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 19:54:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3252D6073E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3252D6073E
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 19:54:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B68C85518; Thu, 31 Oct 2024 19:54:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 31 Oct 2024 20:54:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8756b76a0f8d4844c7389c7fc45dbbfc880ebae1
X-Git-Newrev: 5ab8eb3cac0c87c850c800d639004205807faf27
X-Patchwork-Hint: ignore
Message-Id: <20241031195427.2B68C85518@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnuplot: fix build failures on
 undefined FE_UNDERFLOW
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5ab8eb3cac0c87c850c800d639004205807faf27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
