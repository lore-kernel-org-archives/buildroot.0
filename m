Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0322C433F5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 22:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F388817ED;
	Wed, 26 Jan 2022 22:34:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0sSC6wifBFpR; Wed, 26 Jan 2022 22:34:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A709A82437;
	Wed, 26 Jan 2022 22:34:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DF621BF475
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1ABA461002
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:34:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lC3oDm3t3CIR for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 22:34:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5665C60B32
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 22:34:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D01E182626; Wed, 26 Jan 2022 22:27:09 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 23:33:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49bbf644d4acd3dfe6f3fd0db39e6fed78abf58f
X-Git-Newrev: 90eca683f3272ec246098b5e6ef97b99f5844ea4
X-Patchwork-Hint: ignore
Message-Id: <20220126222709.D01E182626@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer/gst1-plugins-bad: fix
 build with neon
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

commit: https://git.buildroot.net/buildroot/commit/?id=90eca683f3272ec246098b5e6ef97b99f5844ea4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of neon to version
0.32.2 in commit 029a6dc3e3320984c6369747e0b79060f13b2afc:

../output-1/build/gst1-plugins-bad-1.18.5/ext/neon/meson.build:1:0: ERROR: Invalid version of dependency, need 'neon' ['<= 0.31.99'] found '0.32.2'.

Fixes:
 - http://autobuild.buildroot.org/results/eaf1890176431000ea8b371956f0d2d7e9907aea

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-neon-Allow-building-against-neon-0-32-x.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/0001-neon-Allow-building-against-neon-0-32-x.patch b/package/gstreamer1/gst1-plugins-bad/0001-neon-Allow-building-against-neon-0-32-x.patch
new file mode 100644
index 0000000000..e995a8cb91
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-bad/0001-neon-Allow-building-against-neon-0-32-x.patch
@@ -0,0 +1,29 @@
+From b83e85ab677c79b46f520abebd1ee031e3a139c0 Mon Sep 17 00:00:00 2001
+From: Heiko Becker <heirecka@exherbo.org>
+Date: Sun, 26 Sep 2021 21:34:30 +0200
+Subject: [PATCH] neon: Allow building against neon 0.32.x
+
+No API/ABI changes: https://github.com/notroj/neon/blob/0.32.0/NEWS#L3
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1267>
+
+[Retrieved from:
+https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/b83e85ab677c79b46f520abebd1ee031e3a139c0]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ subprojects/gst-plugins-bad/ext/neon/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ext/neon/meson.build b/ext/neon/meson.build
+index bf49be9111..abd9763649 100644
+--- a/ext/neon/meson.build
++++ b/ext/neon/meson.build
+@@ -1,4 +1,4 @@
+-neon_dep = dependency('neon', version: ['>= 0.27', '<= 0.31.99'],
++neon_dep = dependency('neon', version: ['>= 0.27', '<= 0.32.99'],
+                       required : get_option('neon'))
+ 
+ if neon_dep.found()
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
