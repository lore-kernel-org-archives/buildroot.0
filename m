Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A0FC433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 21:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 833C584E06;
	Fri, 17 Dec 2021 21:54:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mL0p8tj-LZmf; Fri, 17 Dec 2021 21:54:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C61AE84E15;
	Fri, 17 Dec 2021 21:54:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B35361BF358
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF16E611AB
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:54:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PNNMXeeOa0pr for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 21:54:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD53D6118F
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 21:54:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CF2E77FEBA; Fri, 17 Dec 2021 21:48:41 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 22:53:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25bde3375cf81349d0356686889442f154e1e5eb
X-Git-Newrev: cffac91af5756bbca46072979ce23d9916386743
X-Patchwork-Hint: ignore
Message-Id: <20211217214841.CF2E77FEBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iperf: fix build
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

commit: https://git.buildroot.net/buildroot/commit/?id=cffac91af5756bbca46072979ce23d9916386743
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 2.1.5 in
commit ca39eb212e32ca209cb3d6011847f9c94641fa73:

gettcpinfo.c: In function 'gettcpinfo':
gettcpinfo.c:101:42: error: expected declaration or statement at end of input
  101 | inline void gettcpinfo (int sock, struct ReportStruct *sample) {
      |                                          ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/073e070478f0cda34784af96bb3a802c3aac8f72

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../iperf/0002-compat-gettcpinfo.c-fix-build.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/iperf/0002-compat-gettcpinfo.c-fix-build.patch b/package/iperf/0002-compat-gettcpinfo.c-fix-build.patch
new file mode 100644
index 0000000000..786c7d1873
--- /dev/null
+++ b/package/iperf/0002-compat-gettcpinfo.c-fix-build.patch
@@ -0,0 +1,34 @@
+From a3339604bafa99f66e12687efc2c50d2e2df1276 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 12 Dec 2021 20:03:04 +0100
+Subject: [PATCH] compat/gettcpinfo.c: fix build
+
+Fix the following build failure raised since commit
+c8f861a0a07b0606a581f2658c71959ad9417923:
+
+gettcpinfo.c: In function 'gettcpinfo':
+gettcpinfo.c:101:42: error: expected declaration or statement at end of input
+  101 | inline void gettcpinfo (int sock, struct ReportStruct *sample) {
+      |                                          ^~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/073e070478f0cda34784af96bb3a802c3aac8f72
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ compat/gettcpinfo.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/compat/gettcpinfo.c b/compat/gettcpinfo.c
+index 4e11e2a..1d3791a 100644
+--- a/compat/gettcpinfo.c
++++ b/compat/gettcpinfo.c
+@@ -99,4 +99,5 @@ inline void gettcpinfo (SOCKET sock, struct ReportStruct *sample) {
+ };
+ #else
+ inline void gettcpinfo (int sock, struct ReportStruct *sample) {
++};
+ #endif
+-- 
+2.33.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
