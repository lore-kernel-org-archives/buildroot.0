Return-Path: <SRS0=m+kO=QD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A7FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 20:33:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0003F61AFB
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 20:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0003F61AFB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE9A380F43;
	Tue, 16 Nov 2021 20:33:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RYY5qDXFIrWF; Tue, 16 Nov 2021 20:33:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CE2D80F47;
	Tue, 16 Nov 2021 20:33:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E779F1BF3D1
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 20:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E44D36070B
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 20:33:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id exZdr3u1ZRGv for <buildroot@lists.busybox.net>;
 Tue, 16 Nov 2021 20:33:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D383607FD
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 20:33:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 833388D43D; Tue, 16 Nov 2021 20:28:59 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 16 Nov 2021 20:56:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0d5766452c9162cb81f975295d25bf98c8f537e2
X-Git-Newrev: b7eff63bc802e5c9c7cfa1cc2a0711241585f76f
X-Patchwork-Hint: ignore
Message-Id: <20211116202859.833388D43D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: fix gdb-11.1 compile for
 uclibc < v1.0.35 (getrandom related)
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
Content-Type: multipart/mixed; boundary="===============6375093685777801671=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6375093685777801671==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b7eff63bc802e5c9c7cfa1cc2a0711241585f76f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- fix getrandom compile for uclibc < v1.0.35, add missing stddef.h
  include (fixed in uclibc since v1.0.35, see [1])

Fixes:

  .../host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35: error: unknown type name ‘size_t’
     27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
        |                                   ^~~~~~

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...-Fix-getrandom-compile-for-uclibc-v1.0.35.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/gdb/11.1/0007-Fix-getrandom-compile-for-uclibc-v1.0.35.patch b/package/gdb/11.1/0007-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
new file mode 100644
index 0000000000..b02d63fc0c
--- /dev/null
+++ b/package/gdb/11.1/0007-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
@@ -0,0 +1,39 @@
+From 879008ef9a48aa1363671f5c1736b49f30c5a379 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sat, 6 Nov 2021 10:06:25 +0100
+Subject: [PATCH] Fix getrandom compile for uclibc < v1.0.35
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+- fix getrandom compile for uclibc < v1.0.35, add missing stddef.h
+  include (fixed in uclibc since v1.0.35, see [1])
+
+Fixes:
+
+  .../host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35: error: unknown type name ‘size_t’
+     27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
+        |                                   ^~~~~~
+
+[1] https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=00972c02c2b6e0a95d5def4a71bdfb188e091782t
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ gnulib/import/getrandom.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gnulib/import/getrandom.c b/gnulib/import/getrandom.c
+index 41212fb..0ad3f96 100644
+--- a/gnulib/import/getrandom.c
++++ b/gnulib/import/getrandom.c
+@@ -19,6 +19,7 @@
+ 
+ #include <config.h>
+ 
++#include <stddef.h>
+ #include <sys/random.h>
+ 
+ #include <errno.h>
+-- 
+2.33.1
+

--===============6375093685777801671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6375093685777801671==--
