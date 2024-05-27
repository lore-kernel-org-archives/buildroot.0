Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670EAC25B74
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 06:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34E3D608A6;
	Mon, 27 May 2024 06:03:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05q6SLUFrf5H; Mon, 27 May 2024 06:03:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D331E6089E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D331E6089E;
	Mon, 27 May 2024 06:03:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 147871D1879
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 06:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E042981E47
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 06:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Do-vvmHXPzM1 for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 06:03:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7AC281E3B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7AC281E3B
 for <buildroot@buildroot.org>; Mon, 27 May 2024 06:03:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A61187FB48; Mon, 27 May 2024 06:03:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 May 2024 07:52:31 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 20dc0f23f4df90bacfe0b78092eac833f6499f2d
X-Git-Newrev: 1cfabbf913a02d5b5116e7ca262f11adf02838eb
X-Patchwork-Hint: ignore
Message-Id: <20240527060332.A61187FB48@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/pppd: fix build
 with kernel < 4.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=1cfabbf913a02d5b5116e7ca262f11adf02838eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fix the following build failure with kernel < 4.7 raised since bump to
version 2.5.0 in commit 0c15169f5ae57d88a77df34cc896044a37c9597b and
https://github.com/ppp-project/ppp/commit/81ad945630120cc1c27c8bb00503be42b76ff202:

sys-linux.c: In function 'get_ppp_stats_rtnetlink':
sys-linux.c:1783:29: error: field 'ifsm' has incomplete type
 1783 |         struct if_stats_msg ifsm;
      |                             ^~~~

Fixes:
 - http://autobuild.buildroot.org/results/82392df447f650f241f23e59e65131fb4a930010

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 45c1def9915ead52a5e4b874c33194653b598117)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...x-compile-with-older-Linux-kernel-headers.patch | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/package/pppd/0005-pppd-sys-linux-Fix-compile-with-older-Linux-kernel-headers.patch b/package/pppd/0005-pppd-sys-linux-Fix-compile-with-older-Linux-kernel-headers.patch
new file mode 100644
index 0000000000..46c293103a
--- /dev/null
+++ b/package/pppd/0005-pppd-sys-linux-Fix-compile-with-older-Linux-kernel-headers.patch
@@ -0,0 +1,66 @@
+From 7a3f478a4b7128d4f70ea64d99fedec766b1c009 Mon Sep 17 00:00:00 2001
+From: Jaco Kroon <jaco@uls.co.za>
+Date: Tue, 31 Oct 2023 11:47:21 +0200
+Subject: [PATCH] pppd/sys-linux: Fix compile with older Linux kernel headers
+ (#452)
+
+When compiling pppd against kernel headers which don't provide
+the definitions for the NETLINK mechanisms, leave out the code
+which uses NETLINK, so as to avoid getting compile errors.
+
+Upstream commit in Linux refers.
+
+commit 10c9ead9f3c6bb24bddc9a96681f7d58e6623966
+Author: Roopa Prabhu <roopa@cumulusnetworks.com>
+Date:   Wed Apr 20 08:43:43 2016 -0700
+rtnetlink: add new RTM_GETSTATS message to dump link stats
+
+This commit adds the #defines and structs used, so simply not compiling
+this code if the required #defines isn't there should solve the problem.
+
+Closes: #450
+
+Signed-off-by: Jaco Kroon <jaco@uls.co.za>
+Upstream: https://github.com/ppp-project/ppp/commit/7a3f478a4b7128d4f70ea64d99fedec766b1c009
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ pppd/sys-linux.c | 12 ++----------
+ 1 file changed, 2 insertions(+), 10 deletions(-)
+
+diff --git a/pppd/sys-linux.c b/pppd/sys-linux.c
+index 561b150f2..a8d6cd95b 100644
+--- a/pppd/sys-linux.c
++++ b/pppd/sys-linux.c
+@@ -131,16 +131,6 @@
+ #include <linux/netlink.h>
+ #include <linux/rtnetlink.h>
+ #include <linux/if_link.h>
+-
+-/* Attempt at retaining compile-support with older than 4.7 kernels, or kernels
+- * where RTM_NEWSTATS isn't defined for whatever reason.
+- */
+-#ifndef RTM_NEWSTATS
+-#define RTM_NEWSTATS 92
+-#define RTM_GETSTATS 94
+-#define IFLA_STATS_LINK_64 1
+-#endif
+-
+ #include <linux/if_addr.h>
+ 
+ /* glibc versions prior to 2.24 do not define SOL_NETLINK */
+@@ -1776,6 +1766,7 @@ get_ppp_stats_ioctl(int u, struct pppd_stats *stats)
+ static int
+ get_ppp_stats_rtnetlink(int u, struct pppd_stats *stats)
+ {
++#ifdef RTM_NEWSTATS
+     static int fd = -1;
+ 
+     struct {
+@@ -1825,6 +1816,7 @@ get_ppp_stats_rtnetlink(int u, struct pppd_stats *stats)
+ err:
+     close(fd);
+     fd = -1;
++#endif
+     return 0;
+ }
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
