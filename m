Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9237CC433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 17:49:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B24960EB4
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 17:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B24960EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 350A940209;
	Mon, 13 Sep 2021 17:49:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TgEatM9Q9V5s; Mon, 13 Sep 2021 17:49:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D3944013F;
	Mon, 13 Sep 2021 17:49:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7283B1BF342
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 17:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DB6E400F2
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 17:47:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fro1FTGFX9Hc for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 17:47:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EB5540004
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 17:47:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 69B178A599; Mon, 13 Sep 2021 17:45:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 19:28:23 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 79b4de9f271d43ed57125033cf8e43b4d2d22bbd
X-Git-Newrev: 153343b97ca97e7fa4f1b04fdb115d440c0fd35e
X-Patchwork-Hint: ignore
Message-Id: <20210913174532.69B178A599@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/zip: fix musl
 static build
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=153343b97ca97e7fa4f1b04fdb115d440c0fd35e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Fix the following static build failure on musl which is raised because
the "Check for directory libraries" in configure wrongly adds -DNO_DIR
when no directory library is needed:

/tmp/instance-0/output-1/host/bin/arm-buildroot-linux-musleabihf-gcc -c -D_FILE_OFFSET_BITS=64 -O2 -g0 -static -I. -DUNIX -DUIDGID_NOT_16BIT -DBZIP2_SUPPORT -DLARGE_FILE_SUPPORT -DUNICODE_SUPPORT -DNO_MKTIME -DNO_DIR -DHAVE_DIRENT_H -DHAVE_TERMIOS_H unix/unix.c
unix/unix.c:70:14: error: conflicting types for 'DIR'
   70 | typedef FILE DIR;
      |              ^~~

Fixes:
 - http://autobuild.buildroot.org/results/83a6e0c8c4ad026cb0261246e3b1a80d754454bd

Patch not sent upstream since upstream is dead.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit ea0a4c610d8fa6dac3b4a6eadbc0ce5c18223845)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zip/0008-fix-musl-static-build.patch | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/package/zip/0008-fix-musl-static-build.patch b/package/zip/0008-fix-musl-static-build.patch
new file mode 100644
index 0000000000..a7a31eba9e
--- /dev/null
+++ b/package/zip/0008-fix-musl-static-build.patch
@@ -0,0 +1,20 @@
+fix musl static build
+
+Don't define NO_DIR if no directory library is needed
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff -Nura zip30.orig/unix/configure zip30/unix/configure
+--- zip30.orig/unix/configure	2021-08-31 21:29:55.219967136 +0200
++++ zip30/unix/configure	2021-08-31 21:50:48.239280513 +0200
+@@ -569,8 +569,8 @@
+   done
+   if [ ${OPT} ]; then
+     LFLAGS2="${LFLAGS2} ${OPT}"
+-  else
+-    CFLAGS="${CFLAGS} -DNO_DIR"
++  #else
++  #  CFLAGS="${CFLAGS} -DNO_DIR"
+   fi
+ fi
+ 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
