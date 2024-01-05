Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818BDC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 13:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 374E14378B;
	Fri,  5 Jan 2024 13:04:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 374E14378B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vffCsBofSlHX; Fri,  5 Jan 2024 13:04:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29BFA43783;
	Fri,  5 Jan 2024 13:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29BFA43783
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D19D1BF990
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAE6961499
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAE6961499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3FgNVxrdsyIk for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 13:02:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A63C3614DC
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 13:02:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A63C3614DC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9702484559; Fri,  5 Jan 2024 13:02:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Jan 2024 13:28:38 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: db5219995f80121ed3c76aeade795e428e10bcac
X-Git-Newrev: c44d5768dc7db04417dd6c99953362965a011f83
X-Patchwork-Hint: ignore
Message-Id: <20240105130240.9702484559@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/mesa3d: add
 compile patch for linux < 3.5
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
Content-Type: multipart/mixed; boundary="===============4401011131299909463=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4401011131299909463==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c44d5768dc7db04417dd6c99953362965a011f83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The kcmp() system call first appeared in linux 3.5,
and was also not there before linux 5.12 if
CONFIG_CHECKPOINT_RESTORE was not set.

See: https://man7.org/linux/man-pages/man2/kcmp.2.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7b71ce5018adb99c93e9b7d1fae4c2926c0fe130)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

--===============4401011131299909463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4401011131299909463==--
