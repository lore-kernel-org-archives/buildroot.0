Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F457EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 21:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4FDF416C7;
	Wed, 12 Jul 2023 21:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4FDF416C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k37hGTn_K1PZ; Wed, 12 Jul 2023 21:41:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C1F6416C4;
	Wed, 12 Jul 2023 21:41:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C1F6416C4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 92CF71BF3A8
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C45783BFC
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:41:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C45783BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9aG924NFAJ6w for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 21:41:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D4C283BFB
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 21:41:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D4C283BFB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A4E786F4D; Wed, 12 Jul 2023 21:41:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 23:41:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da2a418ff980dd8deffd8e73050d2333ae4ecfd0
X-Git-Newrev: 5444dd5e0f0a672d164f9d7362a949c103620a6d
X-Patchwork-Hint: ignore
Message-Id: <20230712214137.7A4E786F4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: install keyboard maps only
 if necessary
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5444dd5e0f0a672d164f9d7362a949c103620a6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

They are required only for system emulation, so pull a patch already
reviewed upstream that makes the installation conditional:

    https://patchwork.kernel.org/project/qemu-devel/patch/20230327172147.196607-1-casantos@redhat.com/

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...n-install-keyboard-maps-only-if-necessary.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/qemu/0003-meson-install-keyboard-maps-only-if-necessary.patch b/package/qemu/0003-meson-install-keyboard-maps-only-if-necessary.patch
new file mode 100644
index 0000000000..8ba7f3cf15
--- /dev/null
+++ b/package/qemu/0003-meson-install-keyboard-maps-only-if-necessary.patch
@@ -0,0 +1,38 @@
+From 9d9b74f806f5dbca53df6630c1a0591eaedd4500 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@redhat.com>
+Date: Sun, 1 Jan 2023 21:00:57 -0300
+Subject: [PATCH] meson: install keyboard maps only if necessary
+
+They are required only for system emulation (i.e. have_system is true).
+
+Upstream: https://patchwork.kernel.org/project/qemu-devel/patch/20230327172147.196607-1-casantos@redhat.com/
+Signed-off-by: Carlos Santos <casantos@redhat.com>
+Signed-off-by: Carlos Santos <unixmania@gmail.com>
+---
+ pc-bios/keymaps/meson.build | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
+index 158a3b410c..bff3083313 100644
+--- a/pc-bios/keymaps/meson.build
++++ b/pc-bios/keymaps/meson.build
+@@ -47,7 +47,7 @@ if native_qemu_keymap.found()
+                        build_by_default: true,
+                        output: km,
+                        command: [native_qemu_keymap, '-f', '@OUTPUT@', args.split()],
+-                       install: true,
++                       install: have_system,
+                        install_dir: qemu_datadir / 'keymaps')
+   endforeach
+ 
+@@ -56,4 +56,6 @@ else
+   install_data(keymaps.keys(), install_dir: qemu_datadir / 'keymaps')
+ endif
+ 
+-install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
++if have_system
++  install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
++endif
+-- 
+2.31.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
