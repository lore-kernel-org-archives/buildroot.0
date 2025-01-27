Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4028C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F6F570448;
	Fri, 28 Feb 2025 17:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AfrZijAKjlwr; Fri, 28 Feb 2025 17:06:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 056D76FC2E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 056D76FC2E;
	Fri, 28 Feb 2025 17:06:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 21F621DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0E5F42DA6
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oo6R2mUvvPTA for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB8CC42ED3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB8CC42ED3
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6107867B4; Fri, 28 Feb 2025 16:30:21 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 27 Jan 2025 21:16:13 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 71a7d6ff201522a216910eacc2f40467c8e7ab06
X-Git-Newrev: cef7358addc867c8847b6fc5efb235a57d454a88
X-Patchwork-Hint: ignore
Message-Id: <20250228163021.D6107867B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fontconfig: fix
 compilation on targets without pthread support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cef7358addc867c8847b6fc5efb235a57d454a88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The br-arm-full-nothread fails because meson (wrongly) assumes thread
support when cross-compiling. So add an explicit check on pthread support.

Fixes:
 - https://autobuild.buildroot.org/results/5b0/5b0ae4c858e9debddf9bd9bd86cfacb6951b4c3f/build-end.log

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...uild-explicitly-check-for-pthread-support.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/fontconfig/0001-meson.build-explicitly-check-for-pthread-support.patch b/package/fontconfig/0001-meson.build-explicitly-check-for-pthread-support.patch
new file mode 100644
index 0000000000..ca394ab7d5
--- /dev/null
+++ b/package/fontconfig/0001-meson.build-explicitly-check-for-pthread-support.patch
@@ -0,0 +1,37 @@
+From 3c9de31dda1a1d44fade7a61e66c989178d6c2a4 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Sun, 26 Jan 2025 10:15:39 +0100
+Subject: [PATCH] meson.build: explicitly check for pthread support
+
+Tested using buildroot. The br-arm-full-nothread fails
+because meson assumes thread support when cross-compiling.
+
+Dependency threads found: YES unknown (cached)
+Has header "pthread.h" : NO
+
+Upstream: https://gitlab.freedesktop.org/fontconfig/fontconfig/-/commit/aad470dad519b6fe3459023b82941b4414b71313
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ meson.build | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 4439758..07e242b 100644
+--- a/meson.build
++++ b/meson.build
+@@ -383,8 +383,10 @@ endif
+ 
+ if host_machine.system() != 'windows'
+   thread_dep = dependency('threads')
+-  conf.set('HAVE_PTHREAD', 1)
+-  deps += [thread_dep]
++  if thread_dep.found() and cc.has_header('pthread.h')
++    conf.set('HAVE_PTHREAD', 1)
++    deps += [thread_dep]
++  endif
+ endif
+ 
+ fc_templatedir = get_option('template-dir')
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
