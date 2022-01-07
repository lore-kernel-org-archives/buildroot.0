Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FD6C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 17:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83918429BA;
	Fri,  7 Jan 2022 17:15:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FULEmFIHF-Gd; Fri,  7 Jan 2022 17:15:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3F5B4299C;
	Fri,  7 Jan 2022 17:15:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E09F1BF35F
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 795C040192
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:15:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ySPdcYMbf0hx for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 17:15:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B882403E7
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 17:15:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 250D9832B4; Fri,  7 Jan 2022 17:09:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 18:14:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 211063b9534b498d581c0a1d6a0d4c2bb1bb0679
X-Git-Newrev: c28b93248a2e4ee79dc42e20d904505e7310a15f
X-Patchwork-Hint: ignore
Message-Id: <20220107170908.250D9832B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jitterentropy-library: needs
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

commit: https://git.buildroot.net/buildroot/commit/?id=c28b93248a2e4ee79dc42e20d904505e7310a15f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 3.3.1 in
commit 3965f09cb427af411055a783cd14b501b2b28285 and
https://github.com/smuellerDD/jitterentropy-library/commit/1e94512db65450ffd950e04fac61408b5efb7e2d

In file included from ./jitterentropy.h:98,
                 from src/jitterentropy-gcd.c:22:
./jitterentropy-base-user.h:74:10: fatal error: pthread.h: No such file or directory
   74 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/7b01eca8f1442318dd35282605fc8815e6afb0d0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jitterentropy-library/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/jitterentropy-library/Config.in b/package/jitterentropy-library/Config.in
index 02f8ff6164..f9ae1bac5a 100644
--- a/package/jitterentropy-library/Config.in
+++ b/package/jitterentropy-library/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_JITTERENTROPY_LIBRARY
 	bool "libjitterentropy"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Hardware RNG based on CPU timing jitter.
 
 	  https://github.com/smuellerDD/jitterentropy-library
+
+comment "libjitterentropy needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
