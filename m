Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DACEC433FE
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 18:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA86841945;
	Thu, 21 Apr 2022 18:02:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xU1Q6TsWjzzv; Thu, 21 Apr 2022 18:02:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 953974192E;
	Thu, 21 Apr 2022 18:02:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 931761BF406
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87F874046B
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:01:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KLXvKOgebULv for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD59A409DD
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D343183FC0; Thu, 21 Apr 2022 17:50:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 19:53:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c173eb47bfc908be3d3fd204a49c71ce3290f5d5
X-Git-Newrev: 33a4b795b23a72a8517afc1ca5ceccaad66d426b
X-Patchwork-Hint: ignore
Message-Id: <20220421175056.D343183FC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-python: fix build
 without C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=33a4b795b23a72a8517afc1ca5ceccaad66d426b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without C++ raised since the addition of
the package in commit ba0d78b90705fa6f564e105437be4817caf2ca6c:

The following exception(s) were encountered:
Running "/home/autobuild/autobuild/instance-0/output-1/host/bin/i686-buildroot-linux-gnu-g++ --version" gave "[Errno 2] No such file or directory: '/home/autobuild/autobuild/instance-0/output-1/host/bin/i686-buildroot-linux-gnu-g++'"

Fixes:
 - http://autobuild.buildroot.org/results/eebf65036f79d21d347714d62afecd0108393308

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...n-fix-build-on-systems-without-C-compiler.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/gstreamer1/gst1-python/0001-gst-python-fix-build-on-systems-without-C-compiler.patch b/package/gstreamer1/gst1-python/0001-gst-python-fix-build-on-systems-without-C-compiler.patch
new file mode 100644
index 0000000000..7d3059d61a
--- /dev/null
+++ b/package/gstreamer1/gst1-python/0001-gst-python-fix-build-on-systems-without-C-compiler.patch
@@ -0,0 +1,35 @@
+From 26c2385faed0bb997368daabd4c64207b3fc01ca Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 15 Apr 2022 18:58:49 +0200
+Subject: [PATCH] gst-python: fix build on systems without C++ compiler
+
+Fix the following build failure on systems without C++ compiler:
+
+The following exception(s) were encountered:
+Running "/home/autobuild/autobuild/instance-0/output-1/host/bin/i686-buildroot-linux-gnu-g++ --version" gave "[Errno 2] No such file or directory: '/home/autobuild/autobuild/instance-0/output-1/host/bin/i686-buildroot-linux-gnu-g++'"
+
+Fixes:
+ - http://autobuild.buildroot.org/results/eebf65036f79d21d347714d62afecd0108393308
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2200>
+
+[Retrieved (and backported) from:
+https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/26c2385faed0bb997368daabd4c64207b3fc01ca]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ subprojects/gst-python/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 1462604b297..c28df16192a 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,4 +1,4 @@
+-project('gst-python', 'c', 'cpp',
++project('gst-python', 'c',
+   version : '1.20.1',
+   meson_version : '>= 0.60',
+   default_options : [ 'warning_level=1',
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
