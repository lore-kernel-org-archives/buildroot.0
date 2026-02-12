Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA93EF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F9B242172;
	Fri, 13 Feb 2026 19:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VFUd3CJI7aGz; Fri, 13 Feb 2026 19:39:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3467642181
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011551;
	bh=VrQrTL4f2q+Qh+cx5ZzMV9fSQV94X5n6aLB2j8x1sJM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bPx7CHHjO82NLUHZkR9bR49pJcLt6vJWfkrg0HLh0O63GddR0Q9Ur9iTjZDgBqbDx
	 YTYi1eRMcSMj0l/yQ+rKID6fZQQeWZJuaQHCrBU4zdaccHtXY/z2cVbqpcorOrz4+5
	 NplgWTMve7lLX/5BqqqziVBZjQFpAduEdwDkX8kCDq//EmqWjOZOCSpLYm/EFwlmWU
	 apfNXGnbvgWFrg1mMc4p901SpdVBmdwsnWGYkO5+vrY2cArlSjfzCrsqjXCwtca57Y
	 /aE62DA5zNZiMpObNjIShYr8COMB1V/Obj5IlvguRRur/HjPoYH8tg/wUN6tYN06ZI
	 XUdONQFx52AAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3467642181;
	Fri, 13 Feb 2026 19:39:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4864169
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 482054026C
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dYI_fpv9EFTC for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17ED9412D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17ED9412D7
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D52185DA7; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 15:03:43 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 11067d8311175b59330cbd15a539b4fe482dc3fa
X-Git-Newrev: b261c641139439bad02a5d7f67f282db3e35df77
X-Patchwork-Hint: ignore
Message-Id: <20260213193704.0D52185DA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/parprouted: fix
 build with gcc >= 15.x
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b261c641139439bad02a5d7f67f282db3e35df77
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Fixes:

  https://autobuild.buildroot.net/results/572669fe1f9a77083a361fee7c8acdf38d7375ae/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit eb25a634c1cd779a62907a3a57515b46cf3c41a4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
