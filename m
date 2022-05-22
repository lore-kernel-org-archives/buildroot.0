Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBC9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 20:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11D1C83E8A;
	Sun, 22 May 2022 20:19:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sisChdY9L-ci; Sun, 22 May 2022 20:19:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28A7383E86;
	Sun, 22 May 2022 20:19:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D2FB01BF392
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 20:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C192B40A06
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 20:19:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dxf7iQQIv8Ev for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 20:19:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 246EC400DD
 for <buildroot@buildroot.org>; Sun, 22 May 2022 20:19:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8FA3186330; Sun, 22 May 2022 20:08:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 22 May 2022 22:18:23 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 28065bdcbb99edf9e79c6ddd0fd7672444725285
X-Git-Newrev: 17b2be9ba5b2f408c387f8f84370a0f7423b8c01
X-Patchwork-Hint: ignore
Message-Id: <20220522200827.8FA3186330@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/php-apcu: needs
 threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=17b2be9ba5b2f408c387f8f84370a0f7423b8c01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

php-apcu needs threads since its addition in commit
8ddeeffa186d8bce875ac713c1e71483c618842a:

In file included from /home/buildroot/autobuild/instance-3/output-1/build/php-apcu-5.1.20/apc_lock.c:20:
/home/buildroot/autobuild/instance-3/output-1/build/php-apcu-5.1.20/apc_lock.h:41:11: fatal error: pthread.h: No such file or directory
   41 | # include "pthread.h"
      |           ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/314405423aeece5ee55d76ec5c4fa1919e7ee853

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 4bd5fc000bec111820f6caea0c9dc02a3f068c94)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php-apcu/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/php-apcu/Config.in b/package/php-apcu/Config.in
index 6338980222..f8e1eb17bb 100644
--- a/package/php-apcu/Config.in
+++ b/package/php-apcu/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_PHP_APCU
 	bool "php-apcu"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  APCu is an in-memory key-value store for PHP.
 
 	  https://pecl.php.net/package/APCu
+
+comment "php-apcu needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
