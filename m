Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4E7C4167D
	for <buildroot@archiver.kernel.org>; Tue, 14 Nov 2023 07:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0888E41BD7;
	Tue, 14 Nov 2023 07:59:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0888E41BD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qinS8qEHhbF7; Tue, 14 Nov 2023 07:59:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23D32418FB;
	Tue, 14 Nov 2023 07:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23D32418FB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F37991BF228
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 07:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8E40418FB
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 07:59:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8E40418FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iyQBV-EsSeeo for <buildroot@lists.busybox.net>;
 Tue, 14 Nov 2023 07:59:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FE23415D7
 for <buildroot@buildroot.org>; Tue, 14 Nov 2023 07:59:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FE23415D7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3858587142; Tue, 14 Nov 2023 07:59:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Nov 2023 08:54:54 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: aaee2d9943fa2dcde59d1932a544fc8011952d86
X-Git-Newrev: 22a1300c61b9cddf736dd70f47b00d050df61157
X-Patchwork-Hint: ignore
Message-Id: <20231114075900.3858587142@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] Revert "package/tar:
 security bump to version 1.35"
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

commit: https://git.buildroot.net/buildroot/commit/?id=22a1300c61b9cddf736dd70f47b00d050df61157
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

This reverts commit d4d483451f0a305781b94b96c15a6cf4b489cd84.

Tar 1.35 unfortunately changes the behaviour for the devmajor/devminor
fields, breaking the download hash validation.  From the release notes:

* Leave the devmajor and devminor fields empty (rather than zero) for
  non-special files, as this is more compatible with traditional tar.

https://lists.gnu.org/archive/html/info-gnu/2023-07/msg00005.html

So revert the bump for now.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f2b23a63208bb026b5a5729c6a4c33e48aad934c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tar/tar.hash | 6 +++---
 package/tar/tar.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tar/tar.hash b/package/tar/tar.hash
index 108a95ee62..1914a9f3b4 100644
--- a/package/tar/tar.hash
+++ b/package/tar/tar.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking signature
-sha256  4d62ff37342ec7aed748535323930c7cf94acf71c3591882b26a7ea50f3edc16  tar-1.35.tar.xz
-sha256  c77a38fcf25b21fd8209d20d35638744344ded239cfc7df80138bf46d3c6b16d  tar-1.35.cpio.gz
-sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
+sha256  63bebd26879c5e1eea4352f0d03c991f966aeb3ddeb3c7445c902568d5411d28  tar-1.34.tar.xz
+sha256  51337b19c71df92cd4f51c50efe4dc6ddc267d31fd54679be9e9bc2e6ce8132b  tar-1.34.cpio.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index eea112ebc7..690a5952ba 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAR_VERSION = 1.35
+TAR_VERSION = 1.34
 TAR_SOURCE = tar-$(TAR_VERSION).tar.xz
 TAR_SITE = $(BR2_GNU_MIRROR)/tar
 # busybox installs in /bin, so we need tar to install as well in /bin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
