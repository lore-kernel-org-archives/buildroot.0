Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0EFC43334
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 14:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F5D1418C2;
	Thu,  2 Jun 2022 14:03:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OPW7x5HORP_4; Thu,  2 Jun 2022 14:03:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2DF1409EC;
	Thu,  2 Jun 2022 14:03:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 005561BF32D
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 14:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F232B8193E
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 14:03:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MQtbxeWa9YKx for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 14:03:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4818D812A8
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 14:03:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2A1FB86A13; Thu,  2 Jun 2022 13:51:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jun 2022 16:03:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5507acd5df2a954b7559788dd03ead85245ad4a4
X-Git-Newrev: ba2098a2d6f7b90beb4ede5fb2c80cc66a79284d
X-Patchwork-Hint: ignore
Message-Id: <20220602135156.2A1FB86A13@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cpulimit: backport a fix for an
 infrequent crash
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba2098a2d6f7b90beb4ede5fb2c80cc66a79284d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport the fix submitted from this pull request:

https://github.com/opsengine/cpulimit/pull/61

to fix an infrequent crash.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../cpulimit/0003-Fix-an-infrequent-crash.patch    | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/cpulimit/0003-Fix-an-infrequent-crash.patch b/package/cpulimit/0003-Fix-an-infrequent-crash.patch
new file mode 100644
index 0000000000..a19fb6e304
--- /dev/null
+++ b/package/cpulimit/0003-Fix-an-infrequent-crash.patch
@@ -0,0 +1,26 @@
+From 512998f967a9dab5e98010e1043985fc855d9f4e Mon Sep 17 00:00:00 2001
+From: Pavel Timofeev <timp87@gmail.com>
+Date: Thu, 14 Jul 2016 13:50:35 +0300
+Subject: [PATCH] Fix an infrequent crash
+
+Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
+[Upstream: https://github.com/opsengine/cpulimit/pull/61]
+---
+ src/process_iterator_linux.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/process_iterator_linux.c b/src/process_iterator_linux.c
+index c8cdd07adcbe..93b44bab1755 100644
+--- a/src/process_iterator_linux.c
++++ b/src/process_iterator_linux.c
+@@ -98,6 +98,7 @@ static int read_process_info(pid_t pid, struct process *p)
+ 	//read command line
+ 	sprintf(exefile,"/proc/%d/cmdline", p->pid);
+ 	fd = fopen(exefile, "r");
++	if (fd==NULL) return -1;
+ 	if (fgets(buffer, sizeof(buffer), fd)==NULL) {
+ 		fclose(fd);
+ 		return -1;
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
