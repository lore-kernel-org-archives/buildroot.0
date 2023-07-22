Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0D7C0015E
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 074DF83638;
	Sat, 22 Jul 2023 21:25:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 074DF83638
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x6THrh7OSHkP; Sat, 22 Jul 2023 21:25:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D34EF83422;
	Sat, 22 Jul 2023 21:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D34EF83422
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A5F71BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 033D1415E5
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 033D1415E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4s8NVSMGCi1z for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:25:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B4F0415E3
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B4F0415E3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8AF43821C5; Sat, 22 Jul 2023 21:25:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Jul 2023 23:24:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 598bfea96d9114ede3d04926f56d24e7b57db8af
X-Git-Newrev: ea3e60229bc5647e587685023de475276e28584d
X-Patchwork-Hint: ignore
Message-Id: <20230722212537.8AF43821C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: enable threads on
 static builds
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea3e60229bc5647e587685023de475276e28584d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Revert upstream commit as proposed on the upstream bugtracker.

Fixes:
http://autobuild.buildroot.net/results/b8e/b8efae5bf6ac3b51e8443951ef1dd88824af3f2b/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../libopenssl/0006-Revert-Fix-static-builds.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/libopenssl/0006-Revert-Fix-static-builds.patch b/package/libopenssl/0006-Revert-Fix-static-builds.patch
new file mode 100644
index 0000000000..2bc0b961eb
--- /dev/null
+++ b/package/libopenssl/0006-Revert-Fix-static-builds.patch
@@ -0,0 +1,43 @@
+From 847a7b744e31b9f57d2a3de495187db1dc0ee6d7 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Fri, 21 Jul 2023 19:30:40 +0200
+Subject: [PATCH] Revert "Fix -static builds"
+
+This reverts commit cfd7225fbb9507b2e443a494459bdaab5236d29d.
+
+Upstream: https://github.com/openssl/openssl/issues/14574#issuecomment-817209126
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Configure | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Configure b/Configure
+index 2c17f4186b..94cab4c3c4 100755
+--- a/Configure
++++ b/Configure
+@@ -1438,10 +1438,6 @@ foreach (keys %useradd) {
+ # At this point, we can forget everything about %user and %useradd,
+ # because it's now all been merged into the corresponding $config entry
+ 
+-if (grep { $_ =~ /(?:^|\s)-static(?:\s|$)/ } @{$config{LDFLAGS}}) {
+-    disable('static', 'pic', 'threads');
+-}
+-
+ # Allow overriding the build file name
+ $config{build_file} = env('BUILDFILE') || $target{build_file} || "Makefile";
+ 
+@@ -1728,6 +1724,10 @@ if ($strict_warnings)
+                 }
+         }
+ 
++if (grep { $_ =~ /(?:^|\s)-static(?:\s|$)/ } @{$config{LDFLAGS}}) {
++    disable('static', 'pic', 'threads');
++}
++
+ $config{CFLAGS} = [ map { $_ eq '--ossl-strict-warnings'
+                               ? @strict_warnings_collection
+                               : ( $_ ) }
+-- 
+2.39.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
