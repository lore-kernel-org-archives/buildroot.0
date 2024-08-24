Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E33C52D6F
	for <buildroot@archiver.kernel.org>; Sat, 24 Aug 2024 07:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E38F740355;
	Sat, 24 Aug 2024 07:19:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Syw3SLL055P; Sat, 24 Aug 2024 07:19:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C47084038D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C47084038D;
	Sat, 24 Aug 2024 07:19:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3052D1BF2FE
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 07:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F90781EB1
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 07:19:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tU-WuuJiGNlK for <buildroot@lists.busybox.net>;
 Sat, 24 Aug 2024 07:19:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43D8281EAE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43D8281EAE
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 07:19:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2EC7986314; Sat, 24 Aug 2024 07:19:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Aug 2024 09:14:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b331217a50e975e89e28741a05d1f7b60c62496a
X-Git-Newrev: d0d23b47393e0133b76437a274f724c16a7d7e2d
X-Patchwork-Hint: ignore
Message-Id: <20240824071904.2EC7986314@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcuefile: fix build failure due
 to implicit declaration
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

commit: https://git.buildroot.net/buildroot/commit/?id=d0d23b47393e0133b76437a274f724c16a7d7e2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
- http://autobuild.buildroot.org/results/28f1e34166e836bf3b984f228bb09842840de82a

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../libcuefile/0002-libcuefile-fedora-c99.patch    | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/libcuefile/0002-libcuefile-fedora-c99.patch b/package/libcuefile/0002-libcuefile-fedora-c99.patch
new file mode 100644
index 0000000000..3f76dd315c
--- /dev/null
+++ b/package/libcuefile/0002-libcuefile-fedora-c99.patch
@@ -0,0 +1,27 @@
+From 7dd8752f5aa2dccbaccb4c28a23f659df3bc0d19 Mon Sep 17 00:00:00 2001
+From: DJ Delorie <dj@redhat.com>
+Date: Thu, 27 Apr 2023 17:24:58 -0400
+Subject: [PATCH] Fix C99 compatibility issue
+
+Related to:
+
+  <https://fedoraproject.org/wiki/Changes/PortingToModernC>
+  <https://fedoraproject.org/wiki/Toolchain/PortingToModernC>
+
+See Also https://bugzilla.redhat.com/show_bug.cgi?id=2190307
+Signed-off-by: DJ Delorie <dj@redhat.com>
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://src.fedoraproject.org/rpms/libcuefile/blob/7dd8752f5aa2dccbaccb4c28a23f659df3bc0d19/f/libcuefile-fedora-c99.patch
+---
+diff -rup a/src/cue_parse.c b/src/cue_parse.c
+--- a/src/cue_parse.c	2011-06-18 07:28:43.000000000 -0400
++++ b/src/cue_parse.c	2023-04-27 16:10:13.314263314 -0400
+@@ -1513,6 +1513,8 @@ void yyerror (char *s)
+ 	fprintf(stderr, "%d: %s\n", cue_lineno, s);
+ }
+ 
++void cue_delete_buffer(void);
++
+ Cd *cue_parse (FILE *fp)
+ {
+ 	cue_yyin = fp;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
