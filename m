Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7081FE8784C
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 17:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D4ED6067A;
	Tue,  3 Feb 2026 17:28:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EVtq8gcuv-jE; Tue,  3 Feb 2026 17:28:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A0D560717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770139727;
	bh=HHkDbsWIOZlx+ZK6u7Vp09I/4azBifv/LfxxeXEsSXQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=q4pdgzaeQ9196bukZy8Q+qv423sWyZ743xPFv5rg6nxN4EXdM+YYJ7YS5XBU+Tlhq
	 +6ohHSwWFI5fVQLRZjb9QQFq6KTulxofR0KsbczbZaIgmlBFGfVdpIhAe0C3nmRirW
	 2gZgLqpF//2iTPTWI3nmBiMmOOzVaYKvIQqFYRXyReIIb9yYlfqLs4iRDjnMghE9XI
	 u7YYlzr140pKHLIegS3q+YOKPAcLuuMustvBFwlxOjdc+dCdNJmvCH2evM5L0fd6pz
	 HzybtzsdfdXw0amdBYGsLxwwurlgxu9sH8uLhHst0Q8a/+WcjKHGXcWNFkpolfXwo4
	 QyWz7ul4Jc1CA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A0D560717;
	Tue,  3 Feb 2026 17:28:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67A2313D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FD2440205
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:28:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0h5IdRcJEQwy for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 17:28:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8656C40025
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8656C40025
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:28:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75B66866FC; Tue,  3 Feb 2026 17:28:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 17:32:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37ef4f862f037bb4bdc0d700931f0b37a26d276e
X-Git-Newrev: eb25a634c1cd779a62907a3a57515b46cf3c41a4
X-Patchwork-Hint: ignore
Message-Id: <20260203172844.75B66866FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/parprouted: fix build with gcc >=
 15.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eb25a634c1cd779a62907a3a57515b46cf3c41a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://autobuild.buildroot.net/results/572669fe1f9a77083a361fee7c8acdf38d7375ae/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/parprouted/0001-gcc-15.patch | 38 ++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/parprouted/0001-gcc-15.patch b/package/parprouted/0001-gcc-15.patch
new file mode 100644
index 0000000000..2090506491
--- /dev/null
+++ b/package/parprouted/0001-gcc-15.patch
@@ -0,0 +1,38 @@
+Description: Fix FTBFS with GCC 15
+Author: Adrian Bunk <bunk@debian.org>
+Bug-Debian: https://bugs.debian.org/1097548
+
+Downloaded from
+https://sources.debian.org/src/parprouted/0.70-6/debian/patches/gcc-15.patch
+
+Upstream: dead (last update 2008)
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- parprouted-0.70.orig/parprouted.c
++++ parprouted-0.70/parprouted.c
+@@ -330,7 +330,7 @@ void parseproc()
+     }
+ }
+ 
+-void cleanup() 
++void cleanup(void *arg)
+ {
+     /* FIXME: I think this is a wrong way to do it ... */
+     
+@@ -346,13 +346,13 @@ void cleanup()
+     exit(1);
+ }
+ 
+-void sighandler()
++void sighandler(int sig)
+ {
+     /* FIXME: I think this is a wrong way to do it ... */
+     perform_shutdown=1;
+ }
+ 
+-void *main_thread()
++void *main_thread(void *arg)
+ {
+     time_t last_refresh;
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
