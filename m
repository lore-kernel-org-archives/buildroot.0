Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECACCD1292
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCF5040BAF;
	Sun,  7 Apr 2024 19:50:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tCHXFfDAZsup; Sun,  7 Apr 2024 19:50:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F05C40B8B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F05C40B8B;
	Sun,  7 Apr 2024 19:50:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB4F11BF473
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A59460A57
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id piuPhNt72gXz for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:49:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDCD660A61
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDCD660A61
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:49:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A757885C08; Sun,  7 Apr 2024 19:49:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 21:46:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 345c38ab11ac821bdaf4b250683fad366631c87b
X-Git-Newrev: 066c3e67d7f117f7810597e1ab36e2346fe8f7c2
X-Patchwork-Hint: ignore
Message-Id: <20240407194943.A757885C08@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: fix build with gcc >= 13
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2065906979944530750=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2065906979944530750==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=066c3e67d7f117f7810597e1ab36e2346fe8f7c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc >= 13:

In file included from ../src/basic/macro.h:446,
                 from ../src/basic/alloc-util.h:10,
                 from ../src/shared/install.c:12:
../src/shared/install.c: In function ‘install_changes_dump’:
../src/shared/install.c:444:64: error: ‘%s’ directive argument is null [-Werror=format-overflow=]
  444 |                         err = log_error_errno(changes[i].type, "Failed to %s unit, unit %s does not exist.",
      |                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/e0d6b7d41fefec539a17a3ef5c89c192ce29fd04

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...er-warning-about-empty-directive-argument.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/systemd/0001-install-fix-compiler-warning-about-empty-directive-argument.patch b/package/systemd/0001-install-fix-compiler-warning-about-empty-directive-argument.patch
new file mode 100644
index 0000000000..9408a6da0e
--- /dev/null
+++ b/package/systemd/0001-install-fix-compiler-warning-about-empty-directive-argument.patch
@@ -0,0 +1,45 @@
+From 8040fa55a1cbc34dede3205a902095ecd26c21e3 Mon Sep 17 00:00:00 2001
+From: Luca Boccassi <bluca@debian.org>
+Date: Sat, 24 Feb 2024 12:05:44 +0000
+Subject: [PATCH] install: fix compiler warning about empty directive argument
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+On ppc64el with gcc 13.2 on Ubuntu 24.04:
+
+3s In file included from ../src/basic/macro.h:386,
+483s                  from ../src/basic/alloc-util.h:10,
+483s                  from ../src/shared/install.c:12:
+483s ../src/shared/install.c: In function ‘install_changes_dump’:
+483s ../src/shared/install.c:432:64: error: ‘%s’ directive argument is null [-Werror=format-overflow=]
+483s   432 |                         err = log_error_errno(changes[i].type, "Failed to %s unit, unit %s does not exist.",
+483s       |                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+483s ../src/shared/install.c:432:75: note: format string is defined here
+483s   432 |                         err = log_error_errno(changes[i].type, "Failed to %s unit, unit %s does not exist.",
+
+Upstream: https://github.com/systemd/systemd/commit/8040fa55a1cbc34dede3205a902095ecd26c21e3
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/shared/install.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/src/shared/install.c b/src/shared/install.c
+index fabf5db7ed2e1..c3a94d1912165 100644
+--- a/src/shared/install.c
++++ b/src/shared/install.c
+@@ -340,9 +340,12 @@ void install_changes_dump(int r, const char *verb, const InstallChange *changes,
+         assert(verb || r >= 0);
+ 
+         for (size_t i = 0; i < n_changes; i++) {
+-                if (changes[i].type < 0)
+-                        assert(verb);
+                 assert(changes[i].path);
++                /* This tries to tell the compiler that it's safe to use 'verb' in a string format if there
++                 * was an error, but the compiler doesn't care and fails anyway, so strna(verb) is used
++                 * too. */
++                assert(verb || changes[i].type >= 0);
++                verb = strna(verb);
+ 
+                 /* When making changes here, make sure to also change install_error() in dbus-manager.c. */
+ 

--===============2065906979944530750==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2065906979944530750==--
