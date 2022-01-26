Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDDFC433EF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 21:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D043084D96;
	Wed, 26 Jan 2022 21:21:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m-Rk-ctPIZjm; Wed, 26 Jan 2022 21:21:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14D6584D94;
	Wed, 26 Jan 2022 21:20:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 999521BF48B
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87DBA60FCE
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:20:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1uK8GjSQp1vs for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 21:20:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABEB960FC9
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 21:20:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 49F3B82815; Wed, 26 Jan 2022 21:14:03 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 22:18:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 18a863063735e2c658fa6947a4e540e9dda6c431
X-Git-Newrev: 334a69f12ebc8fd23818f33d4dfb17f8864d95e9
X-Patchwork-Hint: ignore
Message-Id: <20220126211403.49F3B82815@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gvfs: fix build with meson >= 0.61
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

commit: https://git.buildroot.net/buildroot/commit/?id=334a69f12ebc8fd23818f33d4dfb17f8864d95e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of meson to version
0.61.0 in commit a8dc871139f83c8b4a0cdcdaf2ded18ee463d65f:

../output-1/build/gvfs-1.48.1/daemon/meson.build:368:7: ERROR: Function does not take positional arguments.

Fixes:
 - http://autobuild.buildroot.org/results/6231649fac82a70b215186c3396b879a28a96f60

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...Remove-incorrect-i18n.merge_file-argument.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/gvfs/0001-build-Remove-incorrect-i18n.merge_file-argument.patch b/package/gvfs/0001-build-Remove-incorrect-i18n.merge_file-argument.patch
new file mode 100644
index 0000000000..a85a1a374e
--- /dev/null
+++ b/package/gvfs/0001-build-Remove-incorrect-i18n.merge_file-argument.patch
@@ -0,0 +1,33 @@
+From 17a067b9b823a0d54e061eae45ff8e2c7e4a88d0 Mon Sep 17 00:00:00 2001
+From: Ondrej Holy <oholy@redhat.com>
+Date: Fri, 21 Jan 2022 08:32:31 +0100
+Subject: [PATCH] build: Remove incorrect i18n.merge_file argument
+
+The positional argument was being silently ignored until meson 0.60.0 where
+it fails with "ERROR: Function does not take positional arguments".
+
+Related: https://github.com/mesonbuild/meson/issues/9441
+Fixes: https://gitlab.gnome.org/GNOME/gvfs/-/issues/599
+
+[Retrieved (and backported) from:
+https://gitlab.gnome.org/GNOME/gvfs/-/commit/17a067b9b823a0d54e061eae45ff8e2c7e4a88d0]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ daemon/meson.build | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/daemon/meson.build b/daemon/meson.build
+index 5f9559aa..e20ada29 100644
+--- a/daemon/meson.build
++++ b/daemon/meson.build
+@@ -360,7 +360,6 @@ if enable_admin
+   )
+ 
+   i18n.merge_file(
+-    policy,
+     input: policy_in,
+     output: '@BASENAME@',
+     po_dir: po_dir,
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
