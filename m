Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82729E7716D
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 22:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 444C680B6D;
	Wed,  4 Dec 2024 22:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uagmxAebDbEV; Wed,  4 Dec 2024 22:01:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F85D81331
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F85D81331;
	Wed,  4 Dec 2024 22:01:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E874AE8
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 22:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B6F960744
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 22:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ox_OGdqf5vlE for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 22:01:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 368B760697
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 368B760697
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 22:01:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20AC486930; Wed,  4 Dec 2024 22:01:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Dec 2024 22:53:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4a56d3f6d45898c889b68f1ab785dcabcce31bf
X-Git-Newrev: f6fa3324eb3f1966b51965b3ae1b2740d05e38a6
X-Patchwork-Hint: ignore
Message-Id: <20241204220106.20AC486930@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/polkit: disable PIDFD when systemd
 is not available
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f6fa3324eb3f1966b51965b3ae1b2740d05e38a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the Polkit version bump 125, TestPolkitInitd fail due to an
upstream issue related to the new PIDFD support introduced in
Polkit 124 [1].

The PIDFD issue only affect OS without systemd.

Only enable PIDFD support when systemd is available until
upstream fix the issue.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992596

[1] https://github.com/polkit-org/polkit/issues/451

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...sable-PIDFD-when-systemd-is-not-available.patch | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/package/polkit/0001-meson-disable-PIDFD-when-systemd-is-not-available.patch b/package/polkit/0001-meson-disable-PIDFD-when-systemd-is-not-available.patch
new file mode 100644
index 0000000000..621b1feef7
--- /dev/null
+++ b/package/polkit/0001-meson-disable-PIDFD-when-systemd-is-not-available.patch
@@ -0,0 +1,53 @@
+From 51a1c5b5ab616fe0243b40baddb4864199bbe624 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Sat, 2 Nov 2024 23:33:16 +0100
+Subject: [PATCH] meson: disable PIDFD when systemd is not available
+
+Since the Polkit version bump 125, TestPolkitInitd fail due to an
+upstream issue related to the new PIDFD support introduced in
+Polkit 124 [1].
+
+The PIDFD issue only affect OS without systemd.
+
+Only enable PIDFD support when systemd is available until
+upstream fix the issue.
+
+Fixes:
+https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992596
+
+[1] https://github.com/polkit-org/polkit/issues/451
+
+Upstream: Not applicable
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ meson.build | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 302c189..5c247f4 100644
+--- a/meson.build
++++ b/meson.build
+@@ -202,8 +202,6 @@ if enable_logind
+ endif
+ config_data.set('HAVE_LIBSYSTEMD', enable_logind)
+ 
+-config_data.set('HAVE_PIDFD_OPEN', cc.get_define('SYS_pidfd_open', prefix: '#include <sys/syscall.h>') != '')
+-
+ # systemd unit / sysuser / tmpfiles.d file installation directories
+ systemdsystemunitdir = get_option('systemdsystemunitdir')
+ systemd_dep = dependency('systemd', required : false)
+@@ -222,6 +220,10 @@ else
+   tmpfiles_dir = '/usr/lib/tmpfiles.d'
+ endif
+ 
++# PIDFD is broken with sysvinit based OS since 124 release
++# https://github.com/polkit-org/polkit/issues/451
++config_data.set('HAVE_PIDFD_OPEN', systemd_dep.found() and cc.get_define('SYS_pidfd_open', prefix: '#include <sys/syscall.h>') != '')
++
+ # User for running polkitd
+ polkitd_user = get_option('polkitd_user')
+ config_data.set_quoted('POLKITD_USER', polkitd_user)
+-- 
+2.45.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
