Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0EBC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A40F613BA;
	Thu,  9 May 2024 20:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 29iKdisvhqQD; Thu,  9 May 2024 20:47:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A009613BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A009613BB;
	Thu,  9 May 2024 20:47:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 134501BF98E
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B36F6612E2
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I5YqxkBm2qFk for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:46:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1688612F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1688612F3
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:46:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD84886ADA; Thu,  9 May 2024 20:46:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 22:45:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c316a83a8e8272cb3e039eb6902042b9468cddf2
X-Git-Newrev: c68d67bfad9223bba5eb1da2a50c80f775c71c39
X-Patchwork-Hint: ignore
Message-Id: <20240509204628.CD84886ADA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tar: security bump to version 1.35
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c68d67bfad9223bba5eb1da2a50c80f775c71c39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2022-48303: GNU Tar through 1.34 has a one-byte out-of-bounds
read that results in use of uninitialized memory for a conditional
jump. Exploitation to change the flow of control has not been
demonstrated. The issue occurs in from_header in list.c via a V7
archive in which mtime has approximately 11 whitespace characters.

With the bump to 1.35, the build will fail on systems that are not
Y2038, such as some uClibc configurations.

In order to preserve the previous behavior, pass --disable-year2038.
See the gnulib documentation for details [1]. Contrary to what the
option name might suggest, it doesn't really disable Y2038 support,
but only the check that the system is Y2038 compliant. So even with
--disable-year2038, if the system is Y2038 compliant (uses a 64-bit
arch, uses the musl C library, or uses the glibc C library with
BR2_TIME_BITS_64=y), tar will be Y2038 compliant.

Update hash of COPYING (http replaced by https)

[0] https://lists.gnu.org/archive/html/info-gnu/2023-07/msg00005.html
[1] https://www.gnu.org/software/gnulib/manual/html_node/Avoiding-the-year-2038-problem.html

For the version bump:

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d4d483451f0a305781b94b96c15a6cf4b489cd84)
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

For the Y2038 fix:

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7f1088f9cae9f191740423a0084bb31f94af2e75)
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...Fix-boundary-checking-in-base-256-decoder.patch | 33 ----------------------
 package/tar/tar.hash                               |  6 ++--
 package/tar/tar.mk                                 | 16 +++++++----
 3 files changed, 13 insertions(+), 42 deletions(-)

diff --git a/package/tar/0002-Fix-boundary-checking-in-base-256-decoder.patch b/package/tar/0002-Fix-boundary-checking-in-base-256-decoder.patch
deleted file mode 100644
index 7bad339fe0..0000000000
--- a/package/tar/0002-Fix-boundary-checking-in-base-256-decoder.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 3da78400eafcccb97e2f2fd4b227ea40d794ede8 Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Sat, 11 Feb 2023 11:57:39 +0200
-Subject: [PATCH] Fix boundary checking in base-256 decoder
-
-* src/list.c (from_header): Base-256 encoding is at least 2 bytes
-long.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-Upstream: https://git.savannah.gnu.org/cgit/tar.git/commit/?id=3da78400eafcccb97e2f2fd4b227ea40d794ede8
----
- src/list.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/list.c b/src/list.c
-index 9fafc425..86bcfdd1 100644
---- a/src/list.c
-+++ b/src/list.c
-@@ -881,8 +881,9 @@ from_header (char const *where0, size_t digs, char const *type,
- 	  where++;
- 	}
-     }
--  else if (*where == '\200' /* positive base-256 */
--	   || *where == '\377' /* negative base-256 */)
-+  else if (where <= lim - 2
-+	   && (*where == '\200' /* positive base-256 */
-+	       || *where == '\377' /* negative base-256 */))
-     {
-       /* Parse base-256 output.  A nonnegative number N is
- 	 represented as (256**DIGS)/2 + N; a negative number -N is
--- 
-2.39.2
-
diff --git a/package/tar/tar.hash b/package/tar/tar.hash
index 1914a9f3b4..108a95ee62 100644
--- a/package/tar/tar.hash
+++ b/package/tar/tar.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking signature
-sha256  63bebd26879c5e1eea4352f0d03c991f966aeb3ddeb3c7445c902568d5411d28  tar-1.34.tar.xz
-sha256  51337b19c71df92cd4f51c50efe4dc6ddc267d31fd54679be9e9bc2e6ce8132b  tar-1.34.cpio.gz
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  4d62ff37342ec7aed748535323930c7cf94acf71c3591882b26a7ea50f3edc16  tar-1.35.tar.xz
+sha256  c77a38fcf25b21fd8209d20d35638744344ded239cfc7df80138bf46d3c6b16d  tar-1.35.cpio.gz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index d57d63970d..a7e85afb72 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -4,20 +4,24 @@
 #
 ################################################################################
 
-TAR_VERSION = 1.34
+TAR_VERSION = 1.35
 TAR_SOURCE = tar-$(TAR_VERSION).tar.xz
 TAR_SITE = $(BR2_GNU_MIRROR)/tar
-# busybox installs in /bin, so we need tar to install as well in /bin
-# so that we don't end up with two different tar
-TAR_CONF_OPTS = --exec-prefix=/
 TAR_LICENSE = GPL-3.0+
 TAR_LICENSE_FILES = COPYING
 TAR_CPE_ID_VENDOR = gnu
 TAR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 TAR_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
-# 0002-Fix-boundary-checking-in-base-256-decoder.patch
-TAR_IGNORE_CVES += CVE-2022-48303
+# busybox installs in /bin, so we need tar to install as well in /bin
+# so that we don't end up with two different tar
+#
+# --disable-year2038: tells the configure script to not abort if the
+# system is not Y2038 compliant. tar will support year2038 if the
+# system is compliant even with this option passed
+TAR_CONF_OPTS = \
+	--exec-prefix=/ \
+	--disable-year2038
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 TAR_DEPENDENCIES += acl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
