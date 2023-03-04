Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1DFC678D5
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 19:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1618441625;
	Sat,  4 Mar 2023 19:31:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1618441625
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id geWMXLVf2guy; Sat,  4 Mar 2023 19:31:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D4FE4163E;
	Sat,  4 Mar 2023 19:31:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D4FE4163E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 456601BF337
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 19:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 201F9405F7
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 19:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 201F9405F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MvgQNmCTpX52 for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 19:31:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D44140386
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 19:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D44140386
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C82A86145; Sat,  4 Mar 2023 19:31:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Mar 2023 20:11:10 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 0e60a48520631d2e2fd5b0dd11936a5d87e3c876
X-Git-Newrev: 7a6a4c8f17af92d76de9f3070598ea6953ef8055
X-Patchwork-Hint: ignore
Message-Id: <20230304193150.2C82A86145@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/git: security
 bump to version 2.31.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=7a6a4c8f17af92d76de9f3070598ea6953ef8055
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Fixes the following security issues:

 * CVE-2023-22490:

   Using a specially-crafted repository, Git can be tricked into using
   its local clone optimization even when using a non-local transport.
   Though Git will abort local clones whose source $GIT_DIR/objects
   directory contains symbolic links (c.f., CVE-2022-39253), the objects
   directory itself may still be a symbolic link.

   These two may be combined to include arbitrary files based on known
   paths on the victim's filesystem within the malicious repository's
   working copy, allowing for data exfiltration in a similar manner as
   CVE-2022-39253.

 * CVE-2023-23946:

   By feeding a crafted input to "git apply", a path outside the
   working tree can be overwritten as the user who is running "git
   apply".

For more details, see the announcement:
https://lore.kernel.org/git/xmqqr0us5dio.fsf@gitster.g/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 9a472b49ec..90e43aed80 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  e0fa851e4ccb990c57793a3cfcbf7c8981fbacab175025ea15db9ecd57434cee  git-2.31.6.tar.xz
+sha256  30674629605a12d3ef4f9c752d5561862f04a48952b1799b9815f9884e4e0f6d  git-2.31.7.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 0b4e93a8b6..581f194807 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.31.6
+GIT_VERSION = 2.31.7
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
