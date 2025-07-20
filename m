Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D471C83F22
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 09:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99B4B40D41;
	Sun, 20 Jul 2025 09:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J7wUGmAmuDze; Sun, 20 Jul 2025 09:57:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF6C341035
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF6C341035;
	Sun, 20 Jul 2025 09:57:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 53A09117
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 09:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5112761063
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 09:57:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LKx-hVcXWdTq for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 09:57:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4519C61044
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4519C61044
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 09:57:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40E8D867BE; Sun, 20 Jul 2025 09:57:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Jul 2025 11:54:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a20660c5aefc804be21b1eeefacac8fbe973fe4
X-Git-Newrev: 526ab2f6c048b06faf1ae5045058a8b26728fcd7
X-Patchwork-Hint: ignore
Message-Id: <20250720095706.40E8D867BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ntp: fix build with gcc-14
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=526ab2f6c048b06faf1ae5045058a8b26728fcd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://autobuild.buildroot.org/results/114/114a81f216b44a00c5de830e21315df68a62987d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ntp/0006-stime.patch | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/ntp/0006-stime.patch b/package/ntp/0006-stime.patch
new file mode 100644
index 0000000000..7707231cf8
--- /dev/null
+++ b/package/ntp/0006-stime.patch
@@ -0,0 +1,21 @@
+Fix stime build error with gcc-14:
+
+machines.c: In function 'ntp_set_tod':
+machines.c:484:28: error: passing argument 1 of 'stime' from incompatible pointer type [-Wincompatible-pointer-types]
+  484 |                 rc = stime(&tp); /* lie as bad as SysVR4 */
+
+Upstream: https://bugs.ntp.org/show_bug.cgi?id=3981#c2
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- a/libntp/machines.c	2025-05-26 18:21:43 +0000
++++ a/libntp/machines.c	2025-05-26 18:21:43 +0000
+@@ -478,7 +478,7 @@ 
+ #endif /* HAVE_SETTIMEOFDAY */
+ #ifdef HAVE_STIME
+ 	if (rc && (SET_TOD_STIME == tod || !tod)) {
+-		long tp = tvp->tv_sec;
++		time_t tp = tvp->tv_sec;
+ 
+ 		errno = 0;
+ 		rc = stime(&tp); /* lie as bad as SysVR4 */
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
