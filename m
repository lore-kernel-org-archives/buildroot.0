Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183E0CD5BA4
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 19:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB443418CB;
	Wed, 20 May 2026 19:43:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXta0l5O0_No; Wed, 20 May 2026 19:43:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEE9E418C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779306185;
	bh=jjVW6fXIuA9crsjtxy6HBVcbJlMekit7U25HO9o+vsU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZA9+LD+zLSo8+lyYn6DY1vuJzCrFvfst9iFDd0RlJImqLQscxFmVZjrOy3AXm1uPi
	 ioGfeeuszPLXmOkedNhFPQ+Z/6v1YmJoQACHHT+9CtqvxrzQGStlFFG1/hS0Wa2hKR
	 yhZs312TsjRf+FRBA0U3Cu8UN9P9iIg0U85AEmlS03tcLM3q1KlFriUtN+f7P+f2QF
	 O6eEBLZU1briOVgCYlGmxH7hAv6FbPynK+K5SLyqFZAj6asxdH1sMXQsThlq5YxpU+
	 U6hEaYKedvsd6inBXQFQCPlCooobcsn4Xn2pC4fwG56XB9pjvRH0OK/BAZyPA5i0Lr
	 ojHo5/l8890Hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEE9E418C7;
	Wed, 20 May 2026 19:43:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B5FEE265
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C00582F8B
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x6IJOy2afzJY for <buildroot@buildroot.org>;
 Wed, 20 May 2026 19:43:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B736081A6F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B736081A6F
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:43:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7415B86942; Wed, 20 May 2026 19:42:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 May 2026 21:41:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8215cb491becdd8df95412cde556ae80169ccdf3
X-Git-Newrev: 88a83019df0f7006f8add38df0e6990ead672ad5
X-Patchwork-Hint: ignore
Message-Id: <20260520194254.7415B86942@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cog: fix build with Weston 15
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/88a83019df0f7006f8add38df0e6990ead672ad5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The current cog release only supports weston protocols up to weston 14

When weston was bumped to version 15 in
2e6b2b82d5301977cf2f59adfd633d8774830f69 it broke building cog.

Backport a patch adding weston 15 support to cog.

Fixes: No usable weston-protocols dependency found

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 .../0001-Add-support-for-weston-15-protocols.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/cog/0001-Add-support-for-weston-15-protocols.patch b/package/cog/0001-Add-support-for-weston-15-protocols.patch
new file mode 100644
index 0000000000..c737ae6a66
--- /dev/null
+++ b/package/cog/0001-Add-support-for-weston-15-protocols.patch
@@ -0,0 +1,29 @@
+From b59d3a3c0feceecb10f0376ac2695d9466c9ecf6 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 1 Oct 2024 10:24:56 -0600
+Subject: [PATCH] Add support for weston 15 protocols
+
+Weston 14 was released recently and the weston development branch is
+now using libweston-15-protocols.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/Igalia/cog/commit/b59d3a3c0feceecb10f0376ac2695d9466c9ecf6
+---
+ platform/wayland/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/platform/wayland/meson.build b/platform/wayland/meson.build
+index 74215f0..dad47a6 100644
+--- a/platform/wayland/meson.build
++++ b/platform/wayland/meson.build
+@@ -49,6 +49,7 @@ wayland_protocols_path = wayland_protocols_dep.get_variable(pkgconfig: 'pkgdatad
+ 
+ if wayland_platform_weston_protocols.length() > 0
+     foreach weston_dep_name : [
++            'libweston-15-protocols',
+             'libweston-14-protocols',
+             'libweston-13-protocols',
+             'libweston-12-protocols',
+-- 
+2.53.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
