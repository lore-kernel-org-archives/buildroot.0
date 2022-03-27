Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CF9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 20:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AD9383E7C;
	Sun, 27 Mar 2022 20:29:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wh5WU2HPEjT8; Sun, 27 Mar 2022 20:29:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E44C83FB6;
	Sun, 27 Mar 2022 20:29:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A6B51BF3EF
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 20:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 288FE4167C
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 20:29:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZRvAmMNaRiLF for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 20:29:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6050941626
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 20:29:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9134985E9C; Sun, 27 Mar 2022 20:20:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 22:28:26 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 6a78c830a49b19425de5d1df407c2ba8c302cb7a
X-Git-Newrev: 7c5423f166ced3cd2399c5d98bf7e377c1739fe1
X-Patchwork-Hint: ignore
Message-Id: <20220327202006.9134985E9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/nbd: security
 bump to version 3.24
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c5423f166ced3cd2399c5d98bf7e377c1739fe1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix CVE-2022-26495: In nbd-server in nbd before 3.24, there is an
integer overflow with a resultant heap-based buffer overflow. A value of
0xffffffff in the name length field will cause a zero-sized buffer to be
allocated for the name, resulting in a write to a dangling pointer. This
issue exists for the NBD_OPT_INFO, NBD_OPT_GO, and NBD_OPT_EXPORT_NAME
messages.

Fix CVE-2022-26496: In nbd-server in nbd before 3.24, there is a
stack-based buffer overflow. An attacker can cause a buffer overflow in
the parsing of the name field by sending a crafted NBD_OPT_INFO or
NBD_OPT_GO message with an large value as the length of the name.

https://github.com/NetworkBlockDevice/nbd/compare/nbd-3.21...nbd-3.24

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit bf2e459bb9fc9fe57147313cda35f7022172e6e8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nbd/nbd.hash | 8 ++++----
 package/nbd/nbd.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/nbd/nbd.hash b/package/nbd/nbd.hash
index f0df35bc27..f58a89bf9a 100644
--- a/package/nbd/nbd.hash
+++ b/package/nbd/nbd.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/nbd/files/nbd/3.21/
-md5  c51c4c500fe1ed84c3d5d5dd2ca71d23  nbd-3.21.tar.xz
-sha1  88c3296d43d20d7bda97e0f1bab0243a4f6fa880  nbd-3.21.tar.xz
+# From http://sourceforge.net/projects/nbd/files/nbd/3.24/
+md5  a6d9e7bbc311a2ed07ef84a58b82b5dd  nbd-3.24.tar.xz
+sha1  72c59ef5186ae355de6f539a1b348e18cbb8314e  nbd-3.24.tar.xz
 
 # Locally calculated
-sha256  e7688af39d91733bbcd2db08062c44fe503d004e51528740139c44aff6a6bef9  nbd-3.21.tar.xz
+sha256  6877156d23a7b33f75eee89d2f5c2c91c542afc3cdcb636dea5a88539a58d10c  nbd-3.24.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index 0a7f08b2cf..f0fb23910e 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NBD_VERSION = 3.21
+NBD_VERSION = 3.24
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.xz
 NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
 NBD_CONF_OPTS = --enable-lfs
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
