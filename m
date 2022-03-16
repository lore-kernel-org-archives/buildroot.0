Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99E9C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B55061228;
	Wed, 16 Mar 2022 21:39:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7seq4B3fZmT2; Wed, 16 Mar 2022 21:39:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3663661245;
	Wed, 16 Mar 2022 21:39:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5911D1BF2C2
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BC1440AEF
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:38:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F6K3v3RivVrf for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:38:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C54B40179
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:38:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E3AE3841F8; Wed, 16 Mar 2022 21:29:44 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 22:37:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66868e9fab2806686fd08850a3e56185ef00b127
X-Git-Newrev: 3b6b4729522090b5f20560e249b5898950d7c298
X-Patchwork-Hint: ignore
Message-Id: <20220316212944.E3AE3841F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgcrypt: fix musl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b6b4729522090b5f20560e249b5898950d7c298
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following musl build failure raised since bump to version 1.10.0
in commit d96b9ed0738bae270c479bdaf21eebd4c1f9930d:

In file included from ./jitterentropy.h:98,
                 from ./jitterentropy-base.c:32,
                 from ./rndjent.c:88:
./jitterentropy-base-user.h: In function 'jent_get_cachesize':
./jitterentropy-base-user.h:191:8: warning: implicit declaration of function 'open'; did you mean 'popen'? [-Wimplicit-function-declaration]
  191 |   fd = open(file, O_RDONLY);
      |        ^~~~
      |        popen
./jitterentropy-base-user.h:191:19: error: 'O_RDONLY' undeclared (first use in this function)
  191 |   fd = open(file, O_RDONLY);
      |                   ^~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/f6182fca6a4e2ba29a89f770f17df691d7861f8d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...itterentropy-Include-fcntl-h-and-limits-h.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/libgcrypt/0002-jitterentropy-Include-fcntl-h-and-limits-h.patch b/package/libgcrypt/0002-jitterentropy-Include-fcntl-h-and-limits-h.patch
new file mode 100644
index 0000000000..8f76f24c64
--- /dev/null
+++ b/package/libgcrypt/0002-jitterentropy-Include-fcntl-h-and-limits-h.patch
@@ -0,0 +1,38 @@
+From ffaef0be613121d3ee37867d82932a7a30c2bc6d Mon Sep 17 00:00:00 2001
+From: Heiko Becker <heirecka@exherbo.org>
+Date: Thu, 3 Feb 2022 22:46:41 +0000
+Subject: [PATCH] jitterentropy: Include <fcntl.h> and <limits.h>
+
+* random/jitterentropy-base-user.h: Include <fcntl.h> for O_RDONLY
+* random/jitterentropy-base-user.h: Include <limits.h> for LONG_MAX
+
+--
+
+Fixes the build with musl libc.
+
+Signed-off-by: Heiko Becker <heirecka@exherbo.org>
+
+[Retrieved from:
+https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commit;h=ffaef0be613121d3ee37867d82932a7a30c2bc6d]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ random/jitterentropy-base-user.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/random/jitterentropy-base-user.h b/random/jitterentropy-base-user.h
+index 326dfbed..389106ff 100644
+--- a/random/jitterentropy-base-user.h
++++ b/random/jitterentropy-base-user.h
+@@ -39,6 +39,9 @@
+  * DAMAGE.
+  */
+ 
++#include <fcntl.h>
++#include <limits.h>
++
+ #ifndef GCRYPT_JITTERENTROPY_BASE_USER_H
+ #define GCRYPT_JITTERENTROPY_BASE_USER_H
+ 
+-- 
+2.11.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
