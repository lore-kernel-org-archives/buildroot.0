Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A64CAC5AA
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CCFF610D2;
	Fri, 19 Sep 2025 12:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3OwF8nCj_bE7; Fri, 19 Sep 2025 12:54:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F843610BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F843610BB;
	Fri, 19 Sep 2025 12:54:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A6BEE7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1637840A7A
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Khloem639WUO for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:54:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEABE40A6F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEABE40A6F
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DCE5185FD9; Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Sep 2025 11:41:09 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 71b95f9be6df74ea1f294819b6c47b4ce369eb69
X-Git-Newrev: efdc54b8343223cfe02145e1bc8e1fa6a67dc827
X-Patchwork-Hint: ignore
Message-Id: <20250919125411.DCE5185FD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/policycoreutils:
 fix build with musl due to getpass()
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=efdc54b8343223cfe02145e1bc8e1fa6a67dc827
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

policycoreutils uses getpass(), which with musl is only defined with
some feature macro defined, such as _GNU_SOURCE. So let's pick-up an
upstream fix to address this issue.

There are no autobuilder failures, the issue was most likely hidden by
other failures with musl affecting the SELinux stack.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit fc472cc8c75406ae10d2cbb3d0a8e10889f692a6)
[thomas: fix patch]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...licycoreutils-run_init-define-_GNU_SOURCE.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/policycoreutils/0003-policycoreutils-run_init-define-_GNU_SOURCE.patch b/package/policycoreutils/0003-policycoreutils-run_init-define-_GNU_SOURCE.patch
new file mode 100644
index 0000000000..ca26506b74
--- /dev/null
+++ b/package/policycoreutils/0003-policycoreutils-run_init-define-_GNU_SOURCE.patch
@@ -0,0 +1,39 @@
+From f338b2e7d2bbf70cb811eb1331162e33deb4ce6c Mon Sep 17 00:00:00 2001
+From: Robert Marko <robimarko@gmail.com>
+Date: Thu, 1 May 2025 21:59:13 +0200
+Subject: [PATCH] policycoreutils: run_init: define _GNU_SOURCE
+
+Trying to compile run_init with musl will fail with:
+run_init.c: In function 'authenticate_via_shadow_passwd':
+run_init.c:206:40: error: implicit declaration of function 'getpass' [-Wimplicit-function-declaration]
+  206 |         if (!(unencrypted_password_s = getpass(PASSWORD_PROMPT))) {
+
+This is because getpass in musl is guarded only for _GNU_SOURCE, so
+define _GNU_SOURCE for run_init.
+
+Signed-off-by: Robert Marko <robimarko@gmail.com>
+Acked-by: James Carter <jwcart2@gmail.com>
+Upstream: 50bafc3d9c08cf26c3b0f61e29157a0ea8efbf4a
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[thomas: fix filename]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ run_init/run_init.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/run_init/run_init.c b/run_init/run_init.c
+index ce499781..4531a8ba 100644
+--- a/run_init/run_init.c
++++ b/run_init/run_init.c
+@@ -37,6 +37,8 @@
+  *
+  *************************************************************************/
+ 
++#define _GNU_SOURCE
++
+ #include <stdio.h>
+ #include <stdlib.h>		/* for malloc(), realloc(), free() */
+ #include <pwd.h>		/* for getpwuid() */
+-- 
+2.51.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
