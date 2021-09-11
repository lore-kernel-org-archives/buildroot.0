Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14092C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:30:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAA8C61212
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CAA8C61212
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A397061BD8;
	Sat, 11 Sep 2021 16:30:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9zgtIgMmP4ze; Sat, 11 Sep 2021 16:30:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05D97607E3;
	Sat, 11 Sep 2021 16:30:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B27801BF304
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A201B415BF
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:29:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IRMiam7BvlL0 for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 16:29:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0163D415BC
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 16:29:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A334C890DA; Sat, 11 Sep 2021 16:28:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 18:29:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1cc2a31a0ce6edfe5582bfd7d29fc088368e5066
X-Git-Newrev: ea0a4c610d8fa6dac3b4a6eadbc0ce5c18223845
X-Patchwork-Hint: ignore
Message-Id: <20210911162817.A334C890DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zip: fix musl static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea0a4c610d8fa6dac3b4a6eadbc0ce5c18223845
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
