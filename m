Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242DDC3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 17 Dec 2023 21:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F91D81E17;
	Sun, 17 Dec 2023 21:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F91D81E17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id piivKqLAzf03; Sun, 17 Dec 2023 21:39:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E901F81DF8;
	Sun, 17 Dec 2023 21:39:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E901F81DF8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D26ED1BF37F
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 21:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B874C410B2
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 21:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B874C410B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jg9Oip3WeCA1 for <buildroot@lists.busybox.net>;
 Sun, 17 Dec 2023 21:39:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB906410A0
 for <buildroot@buildroot.org>; Sun, 17 Dec 2023 21:39:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB906410A0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AAB4A87B37; Sun, 17 Dec 2023 21:39:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 17 Dec 2023 22:39:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16fc7372512dd9bd199c394bfa54d74e852cc1b4
X-Git-Newrev: 7b71ce5018adb99c93e9b7d1fae4c2926c0fe130
X-Patchwork-Hint: ignore
Message-Id: <20231217213929.AAB4A87B37@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: add compile patch for
 linux < 3.5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1878038550135718806=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1878038550135718806==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7b71ce5018adb99c93e9b7d1fae4c2926c0fe130
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The kcmp() system call first appeared in linux 3.5,
and was also not there before linux 5.12 if
CONFIG_CHECKPOINT_RESTORE was not set.

See: https://man7.org/linux/man-pages/man2/kcmp.2.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...e_file_description-fix-unknown-linux-3.5-.patch | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/package/mesa3d/0005-util-os_same_file_description-fix-unknown-linux-3.5-.patch b/package/mesa3d/0005-util-os_same_file_description-fix-unknown-linux-3.5-.patch
new file mode 100644
index 0000000000..c011580f6b
--- /dev/null
+++ b/package/mesa3d/0005-util-os_same_file_description-fix-unknown-linux-3.5-.patch
@@ -0,0 +1,68 @@
+From b60974fac8a2f4c85cbb2ca788fc4ec3e81998f9 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas.devoogdt@barco.com>
+Date: Tue, 17 Aug 2021 11:54:49 +0200
+Subject: [PATCH] util: os_same_file_description: fix unknown linux < 3.5
+ syscall SYS_kcmp
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+https://man7.org/linux/man-pages/man2/kcmp.2.html
+
+The kcmp() system call first appeared in Linux 3.5.
+
+But was probably also not supported by all major platforms
+at that time. So fallback to the check that is done for windows.
+
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+Acked-by: Yonggang Luo <luoyonggang@gmail.com>
+Acked-by: Michel Dänzer <mdaenzer@redhat.com>
+Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/commit/3ef514982441ce496aa127611edd26b9867f4b95
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ src/util/os_file.c | 18 ++++++------------
+ 1 file changed, 6 insertions(+), 12 deletions(-)
+
+diff --git a/src/util/os_file.c b/src/util/os_file.c
+index 5fb30f2d908..464425a9b87 100644
+--- a/src/util/os_file.c
++++ b/src/util/os_file.c
+@@ -202,29 +202,23 @@ os_read_file(const char *filename, size_t *size)
+ /* copied from <linux/kcmp.h> */
+ #define KCMP_FILE 0
+ 
++#endif
++
+ int
+ os_same_file_description(int fd1, int fd2)
+ {
++#ifdef SYS_kcmp
+    pid_t pid = getpid();
++#endif
+ 
+    /* Same file descriptor trivially implies same file description */
+    if (fd1 == fd2)
+       return 0;
+ 
++#ifdef SYS_kcmp
+    return syscall(SYS_kcmp, pid, pid, KCMP_FILE, fd1, fd2);
+-}
+-
+ #else
+-
+-int
+-os_same_file_description(int fd1, int fd2)
+-{
+-   /* Same file descriptor trivially implies same file description */
+-   if (fd1 == fd2)
+-      return 0;
+-
+    /* Otherwise we can't tell */
+    return -1;
+-}
+-
+ #endif
++}
+-- 
+2.34.1
+

--===============1878038550135718806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1878038550135718806==--
