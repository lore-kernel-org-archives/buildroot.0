Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F77EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 15:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09EE760C31;
	Sun, 10 Apr 2022 15:09:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6qB_jeybJUoH; Sun, 10 Apr 2022 15:09:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1787460D54;
	Sun, 10 Apr 2022 15:09:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D0AF31BF869
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD13B4017A
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:08:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cYUEkvGyvSfW for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 15:08:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02B1940119
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 15:08:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3A9D083875; Sun, 10 Apr 2022 14:58:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 16:53:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d258f81cd95cf34888565504e6f82717e5e3407
X-Git-Newrev: 80a9e9057daf587242548aa23f8cd7a8d88bfa1f
X-Patchwork-Hint: ignore
Message-Id: <20220410145854.3A9D083875@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-libav: fix build
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

commit: https://git.buildroot.net/buildroot/commit/?id=80a9e9057daf587242548aa23f8cd7a8d88bfa1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without C++ raised since bump to version
1.18.0 in commit 15dc48ca9becafec6ba11b08af18453bc0e40c9e:

The following exception(s) were encountered:
Running "/nvmedata/autobuild/instance-9/output-1/host/bin/or1k-buildroot-linux-musl-g++ --version" gave "[Errno 2] No such file or directory: '/nvmedata/autobuild/instance-9/output-1/host/bin/or1k-buildroot-linux-musl-g++'"

Fixes:
 - http://autobuild.buildroot.org/results/8ac0ba5eaaf7571857b4d8cfabf1488d640dc59a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...v-fix-build-on-systems-without-C-compiler.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/gstreamer1/gst1-libav/0001-gst-libav-fix-build-on-systems-without-C-compiler.patch b/package/gstreamer1/gst1-libav/0001-gst-libav-fix-build-on-systems-without-C-compiler.patch
new file mode 100644
index 0000000000..6b275220f8
--- /dev/null
+++ b/package/gstreamer1/gst1-libav/0001-gst-libav-fix-build-on-systems-without-C-compiler.patch
@@ -0,0 +1,35 @@
+From 1477eb1fad92ac07cd057b3ecdb04edeeef9edba Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 4 Apr 2022 23:32:56 +0200
+Subject: [PATCH] gst-libav: fix build on systems without C++ compiler
+
+Fix the following build failure on systems without C++ compiler:
+
+The following exception(s) were encountered:
+Running "/nvmedata/autobuild/instance-9/output-1/host/bin/or1k-buildroot-linux-musl-g++ --version" gave "[Errno 2] No such file or directory: '/nvmedata/autobuild/instance-9/output-1/host/bin/or1k-buildroot-linux-musl-g++'"
+
+Fixes:
+ - http://autobuild.buildroot.org/results/8ac0ba5eaaf7571857b4d8cfabf1488d640dc59a
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2112>
+
+[Retrieved (and backported) from:
+https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/1477eb1fad92ac07cd057b3ecdb04edeeef9edba]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ subprojects/gst-libav/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index fbfa3049afe..7da94b80d59 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,4 +1,4 @@
+-project('gst-libav', 'c', 'cpp',
++project('gst-libav', 'c',
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
