Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BBFC3DA61
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 19:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E1314014E;
	Thu, 18 Jul 2024 19:50:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xFG9T_bxeIJR; Thu, 18 Jul 2024 19:50:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E71C34019E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E71C34019E;
	Thu, 18 Jul 2024 19:50:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 984C61BF36D
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 19:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85F9960741
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 19:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZlynoPsXr9Ag for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 19:50:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2E68600BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2E68600BB
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 19:50:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7231886DB3; Thu, 18 Jul 2024 19:50:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Jul 2024 21:49:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c624eee120b6ee0c81e636bd47abe92452610cf7
X-Git-Newrev: 8d0f6ecc5a53c7197a1a1642702ea0fd8e370db6
X-Patchwork-Hint: ignore
Message-Id: <20240718195019.7231886DB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cairo: fix build on toolchains
 without c++ support
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d0f6ecc5a53c7197a1a1642702ea0fd8e370db6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This issue was occurring since the conversion of cairo to
meson-package in commit
1fa58814c09a71444f961b61a9a2c399b9163fc2 ("package/cairo: move to the
meson build system")

Fixes:

  http://autobuild.buildroot.net/results/98b62ab7ed3092f9f9085f723baf7d6267451e5c/

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0003-meson-only-require-cpp-for-windows.patch  | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/cairo/0003-meson-only-require-cpp-for-windows.patch b/package/cairo/0003-meson-only-require-cpp-for-windows.patch
new file mode 100644
index 0000000000..3ce396f66f
--- /dev/null
+++ b/package/cairo/0003-meson-only-require-cpp-for-windows.patch
@@ -0,0 +1,38 @@
+From e93ef3feb69994e3aa4e0ab66ccd66139b097e49 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas.devoogdt@barco.com>
+Date: Thu, 18 Jul 2024 12:16:51 +0200
+Subject: [PATCH] meson: only require cpp for windows
+
+Allow to compile cairo without c++ toolchain.
+
+Fixes:
+ - http://autobuild.buildroot.net/results/98b62ab7ed3092f9f9085f723baf7d6267451e5c/
+
+Upstream: https://gitlab.freedesktop.org/cairo/cairo/-/merge_requests/573
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ meson.build | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 9100152ee..297482b03 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,4 +1,4 @@
+-project('cairo', 'c', 'cpp',
++project('cairo', 'c',
+   meson_version: '>= 0.59.0',
+   version: run_command(find_program('version.py'), check: true).stdout().strip(),
+   default_options: ['warning_level=2'],
+@@ -489,6 +489,8 @@ if host_machine.system() == 'darwin' and not get_option('quartz').disabled()
+ endif
+ 
+ if host_machine.system() == 'windows'
++  add_languages('cpp')
++
+   add_project_arguments('-DWIN32_LEAN_AND_MEAN', '-DNOMINMAX', language: ['c', 'cpp'])
+ 
+   win32_extra_deps = [
+-- 
+2.45.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
