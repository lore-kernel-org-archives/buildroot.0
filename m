Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D6AEB64DD
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 07:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62A6160AB0;
	Sun, 30 Jul 2023 07:14:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62A6160AB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dJhNxfgt0JL8; Sun, 30 Jul 2023 07:14:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B401660A97;
	Sun, 30 Jul 2023 07:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B401660A97
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5BF841BF3F0
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 07:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 320AE60A97
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 07:14:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 320AE60A97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4eFgq6em8vxU for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 07:14:25 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F448607B0
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 07:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F448607B0
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4D974A4C036A
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 09:14:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44756)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qQ0dD-0004ae-04
 for buildroot@buildroot.org; Sun, 30 Jul 2023 09:14:23 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 09:14:22 +0200
Message-Id: <20230730071422.1091893-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690701263;
 bh=HuHwGR1C+InmF/rk58+0x4PyDJLIx7H8/j8qx88zY4k=;
 h=From:To:Subject:Date:From;
 b=pNP4evfL0HiAXvUl1OPjmygYTvCUg64KDVSZvaSHyN957/DB7SgcIRmmWGlxzvUeS
 2397AIbebiXZ0PSQl2lt4OvRLhpskq1fcZLX9M5LfhNlHaLF+/Sx0SwNcxLDP2+whv
 /SjRhwQAn0GQGAuz8cWxI+tn+wxo9i0zJh3RdrfjM6+THTJG3UJrGTudWxwv258/3G
 3lUj3sxNARpqoiGO33MrerxCNv9UpM4DZ968Po9p9aE9nDF1MW4VPzQ8St706MGL2G
 HYxSy/AHaXcJK9T2+IV3sg3RNgDVUXOJO6GBXL5OM8tOIVbEzS2jX/ydbnj991Rgcd
 nGEz1cxtUJ6FA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=pNP4evfL
Subject: [Buildroot] [PATCH 1/1] package/linux-pam: fix musl build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The bump to version 1.5.3 with buildroot commit
f8147e27cdac8f998ec6644a09ce4e8d62b6433c added the file patched.

Please note that the next version will include
https://github.com/linux-pam/linux-pam/commit/5fa961fd3b5b8cf5ba1a0cf49b10ebf79e273e96
which adds --enable-examples as configure option to disable examples.
This patch, although it would also fix the problem, is not added instead
to avoid autoreconf.

Fixes:
http://autobuild.buildroot.net/results/1d9/1d96d4c57969536c14340ae5542e62a9459246f9/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-examples-tty_conv-fix-build-on-musl.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/linux-pam/0001-examples-tty_conv-fix-build-on-musl.patch

diff --git a/package/linux-pam/0001-examples-tty_conv-fix-build-on-musl.patch b/package/linux-pam/0001-examples-tty_conv-fix-build-on-musl.patch
new file mode 100644
index 0000000000..c1257d64da
--- /dev/null
+++ b/package/linux-pam/0001-examples-tty_conv-fix-build-on-musl.patch
@@ -0,0 +1,40 @@
+From 5374f677e4cae669eb9accf2449178b602e8a40a Mon Sep 17 00:00:00 2001
+From: Violet Purcell <vimproved@inventati.org>
+Date: Thu, 11 May 2023 12:50:34 -0400
+Subject: [PATCH] examples/tty_conv: fix build on musl
+
+termio.h is the old System V version of the interface header, and is
+only provided in glibc and dietlibc as far as I can tell.
+This fixes it to use the POSIX termios.h instead.
+
+Upstream: https://github.com/linux-pam/linux-pam/commit/5374f677e4cae669eb9accf2449178b602e8a40a
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ examples/tty_conv.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/examples/tty_conv.c b/examples/tty_conv.c
+index 23f0684cc..9a0e1ad99 100644
+--- a/examples/tty_conv.c
++++ b/examples/tty_conv.c
+@@ -6,8 +6,9 @@
+ #include <string.h>
+ #include <errno.h>
+ #include <unistd.h>
+-#include <termio.h>
++#include <termios.h>
+ #include <security/pam_appl.h>
++#include <sys/ioctl.h>
+ 
+ /***************************************
+  * @brief echo off/on
+@@ -16,7 +17,7 @@
+  ***************************************/
+ static void echoOff(int fd, int off)
+ {
+-    struct termio tty;
++    struct termios tty;
+     if (ioctl(fd, TCGETA, &tty) < 0)
+     {
+         fprintf(stderr, "TCGETA failed: %s\n", strerror(errno));
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
