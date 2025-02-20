Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D334CC021B4
	for <buildroot@archiver.kernel.org>; Thu, 20 Feb 2025 21:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 997EB413E3;
	Thu, 20 Feb 2025 21:48:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lxGszY2rr1e4; Thu, 20 Feb 2025 21:48:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77518413EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77518413EA;
	Thu, 20 Feb 2025 21:48:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6125CF2D
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 21:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45E4E83122
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 21:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1W6EYgfrcach for <buildroot@buildroot.org>;
 Thu, 20 Feb 2025 21:48:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7279E8318C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7279E8318C
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 21:48:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F1B98798E; Thu, 20 Feb 2025 21:48:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 20 Feb 2025 21:37:29 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 79b215ac2a2e619f9fcf6a28a19c4ff444c692bf
X-Git-Newrev: 7c69185b2029050d8f333a184c80b6654b84ada3
X-Patchwork-Hint: ignore
Message-Id: <20250220214824.5F1B98798E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] Revert "package/openssh:
 disable async-signal-unsafe code in sshsigdie()"
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c69185b2029050d8f333a184c80b6654b84ada3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

This reverts commit ecc0c1fb1244971b2dad96ef2ef886daa80c72fd.

We will instead bump to openssh 9.8.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-sshsigdie-async-signal-unsafe.patch       | 41 ----------------------
 1 file changed, 41 deletions(-)

diff --git a/package/openssh/0002-sshsigdie-async-signal-unsafe.patch b/package/openssh/0002-sshsigdie-async-signal-unsafe.patch
deleted file mode 100644
index 70a890e469..0000000000
--- a/package/openssh/0002-sshsigdie-async-signal-unsafe.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 7f4a743171f9e6b283207d448de6562219774fbf Mon Sep 17 00:00:00 2001
-From: Salvatore Bonaccorso <carnil@debian.org>
-Date: Tue, 25 Jun 2024 12:24:29 +0100
-Subject: Disable async-signal-unsafe code from the sshsigdie() function
-
-Address signal handler race condition: if a client does not authenticate
-within LoginGraceTime seconds (120 by default, 600 in old OpenSSH
-versions), then sshd's SIGALRM handler is called asynchronously, but
-this signal handler calls various functions that are not
-async-signal-safe (for example, syslog()).
-
-This is a regression from CVE-2006-5051 ("Signal handler race condition
-in OpenSSH before 4.4 allows remote attackers to cause a denial of
-service (crash), and possibly execute arbitrary code")
-
-Signed-off-by: Salvatore Bonaccorso <carnil@debian.org>
-Upstream: https://salsa.debian.org/ssh-team/openssh/-/blob/525bb16e45edac4c03b95e106380d70aecbaf27e/debian/patches/sshsigdie-async-signal-unsafe.patch
-Patch-Name: sshsigdie-async-signal-unsafe.patch
----
- log.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/log.c b/log.c
-index 6a8b1fc4a..57256660f 100644
---- a/log.c
-+++ b/log.c
-@@ -452,12 +452,14 @@ void
- sshsigdie(const char *file, const char *func, int line, int showfunc,
-     LogLevel level, const char *suffix, const char *fmt, ...)
- {
-+#if 0
- 	va_list args;
- 
- 	va_start(args, fmt);
- 	sshlogv(file, func, line, showfunc, SYSLOG_LEVEL_FATAL,
- 	    suffix, fmt, args);
- 	va_end(args);
-+#endif
- 	_exit(1);
- }
- 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
