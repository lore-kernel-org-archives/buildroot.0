Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68846E67809
	for <buildroot@archiver.kernel.org>; Sat,  2 Nov 2024 20:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1624960748;
	Sat,  2 Nov 2024 20:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pO4Zfs8gUKRH; Sat,  2 Nov 2024 20:28:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 181AE6075E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 181AE6075E;
	Sat,  2 Nov 2024 20:28:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 76C00112A
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 20:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6412F4098B
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 20:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNKXgD-lSEJl for <buildroot@buildroot.org>;
 Sat,  2 Nov 2024 20:28:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D18040BA5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D18040BA5
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 20:28:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23BAC85064; Sat,  2 Nov 2024 20:28:38 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 2 Nov 2024 21:25:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b625b7af0f74deeb8206eb75c43f955fd72b3935
X-Git-Newrev: 4c0356877518af4b278513c4223d1ce5cd7b8b94
X-Patchwork-Hint: ignore
Message-Id: <20241102202838.23BAC85064@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/exfatprogs: add patch to fix
 exfatlabel
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c0356877518af4b278513c4223d1ce5cd7b8b94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is a regression in exfatlabel since exfatprogs 1.2.5.

exfatlabel tool error out when we try to set a new volume serial or
label.

  exfatlabel /dev/sda1 "new label"
  exfatlabel -i /dev/sda1 0x12345678

Error out only if too few argument is given, ignore additional
arguments.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992419

Signed-off-by: Romain Naour <romain.naour@smile.fr>
[Julien: reword the commit log one liner]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...xfatprogs-fix-argument-validation-check-2.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/exfatprogs/0001-exfatprogs-fix-argument-validation-check-2.patch b/package/exfatprogs/0001-exfatprogs-fix-argument-validation-check-2.patch
new file mode 100644
index 0000000000..28c9a71466
--- /dev/null
+++ b/package/exfatprogs/0001-exfatprogs-fix-argument-validation-check-2.patch
@@ -0,0 +1,41 @@
+From 5055bc4e852e18ddbfc618623cdaa2c0572d5f0e Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Sat, 2 Nov 2024 19:27:46 +0100
+Subject: [PATCH] exfatprogs: fix argument validation check (2)
+
+Since commit 7d354e5be83ed3bb981c59b3435ff64da56d185d
+("exfatprogs: fix argument validation check"), exfatlabel tool
+error out when we try to set a new volume serial or label.
+
+  exfatlabel /dev/sda1 "new label"
+  exfatlabel -i /dev/sda1 0x12345678
+
+Error out only if too few argument is given, ignore
+additional arguments.
+
+Fixes:
+https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992419
+
+Upstream: https://github.com/exfatprogs/exfatprogs/pull/279
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ label/label.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/label/label.c b/label/label.c
+index 12d027b..9c8aff3 100644
+--- a/label/label.c
++++ b/label/label.c
+@@ -78,7 +78,7 @@ int main(int argc, char *argv[])
+ 	if (version_only)
+ 		exit(EXIT_FAILURE);
+ 
+-	if (argc - optind != 1)
++	if (argc - optind < 1)
+ 		usage();
+ 
+ 	ui.dev_name = argv[serial_mode + 1];
+-- 
+2.45.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
