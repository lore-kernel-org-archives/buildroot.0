Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DB5C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C13B6FC62;
	Fri, 28 Feb 2025 16:34:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vegF_ZCtU_CY; Fri, 28 Feb 2025 16:34:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D88096FBF7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D88096FBF7;
	Fri, 28 Feb 2025 16:34:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1890A711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC8FB419C9
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xqbFa7FcHZYZ for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24C5F419C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24C5F419C6
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DF3986307; Fri, 28 Feb 2025 16:29:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Dec 2024 10:50:45 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 38c368e6f03f87314e5aba1a6b429670974b5309
X-Git-Newrev: 28c982b5f4ea6f4e619ab02ab62407d764f7d9f3
X-Patchwork-Hint: ignore
Message-Id: <20250228162933.1DF3986307@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/foot: change to git
 download to work around codeberg archive issue
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

commit: https://git.buildroot.net/buildroot/commit/?id=28c982b5f4ea6f4e619ab02ab62407d764f7d9f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
http://autobuild.buildroot.net/results/1959614f6ad63878c390a23770a6778830d6c698/

The tarball downloaded from codeberg has changed.  Interesting enough, it is
only the compression that has changed, the uncompressed data is still
identical:

mkdir s.b.o codeberg
wget -P codeberg https://codeberg.org/dnkl/foot/archive/1.16.2.tar.gz
wget -P s.b.o http://sources.buildroot.org/foot/1.16.2.tar.gz

sha256sum */*
0e02af376e5f4a96eeb90470b7ad2e79a1d660db2a7d1aa772be43c7db00e475  codeberg/1.16.2.tar.gz
8060ec28cbf6e2e3d408665330da4bc48fd094d4f1265d7c58dc75c767463c29  s.b.o/1.16.2.tar.gz

gunzip */*
sha256sum */*
7b9fad0611c75d6ba8f53d12ad1366d53c8697240031a5b27334d173b76560fe  codeberg/1.16.2.tar
7b9fad0611c75d6ba8f53d12ad1366d53c8697240031a5b27334d173b76560fe  s.b.o/1.16.2.tar

Looking at the autobuilder history, this seems to have changed in
January/February, E.G. on January 20th the file hash was correct:

http://autobuild.buildroot.net/results/d4b90a505a035d9bab400ed65f94571854f74f24/

But on February 14th it wasn't:

http://autobuild.buildroot.net/results/2ff85fe3fba2d36c7f0358f2ce43e703aef5f4f0/

This was unfortunately only noticed once we started doing builds without the
s.b.o fallback. To fix it, change to a git clone instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/foot/foot.hash | 2 +-
 package/foot/foot.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/foot/foot.hash b/package/foot/foot.hash
index f3bf0f6058..9a4335f2c6 100644
--- a/package/foot/foot.hash
+++ b/package/foot/foot.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8060ec28cbf6e2e3d408665330da4bc48fd094d4f1265d7c58dc75c767463c29  1.16.2.tar.gz
+sha256  ff81bca86178ef326588176f8bdf817bb3e0fbc891d026960144f69c8a74eb4d  foot-1.16.2-git4.tar.gz
 sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/foot/foot.mk b/package/foot/foot.mk
index 1595e2a718..e300d04d0a 100644
--- a/package/foot/foot.mk
+++ b/package/foot/foot.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 FOOT_VERSION = 1.16.2
-FOOT_SOURCE = $(FOOT_VERSION).tar.gz
-FOOT_SITE = https://codeberg.org/dnkl/foot/archive
+FOOT_SITE = https://codeberg.org/dnkl/foot.git
+FOOT_SITE_METHOD = git
 FOOT_LICENSE = MIT
 FOOT_LICENSE_FILES = LICENSE
 FOOT_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
