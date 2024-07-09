Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54FAC2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 16:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67CE040D67;
	Tue,  9 Jul 2024 16:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5WQr1TtCkk7i; Tue,  9 Jul 2024 16:50:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 016C6412F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 016C6412F0;
	Tue,  9 Jul 2024 16:50:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 347621BF97E
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 16:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E63740238
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 16:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JXIQm-QTUQDw for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 16:50:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC59640223
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC59640223
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 16:50:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1DE4842A5; Tue,  9 Jul 2024 16:50:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Jul 2024 18:49:12 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 30252c3e0a00fae990624630e70591a5346bc3e9
X-Git-Newrev: e7f124e9b632837c9f142831e881abd6795286a8
X-Patchwork-Hint: ignore
Message-Id: <20240709165045.E1DE4842A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/openssh: disable
 async-signal-unsafe code in sshsigdie()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e7f124e9b632837c9f142831e881abd6795286a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Import Debian patch[1] for CVE-2024-6387[2].  This disables the unsafe
syslog code path triggered by SIGALARM.

[1] https://salsa.debian.org/ssh-team/openssh/-/blob/master/debian/patches/sshsigdie-async-signal-unsafe.patch
[2] https://marc.info/?l=oss-security&m=171982335024767

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
[Peter: rename, add Upstream tag]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-sshsigdie-async-signal-unsafe.patch       | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/openssh/0002-sshsigdie-async-signal-unsafe.patch b/package/openssh/0002-sshsigdie-async-signal-unsafe.patch
new file mode 100644
index 0000000000..70a890e469
--- /dev/null
+++ b/package/openssh/0002-sshsigdie-async-signal-unsafe.patch
@@ -0,0 +1,41 @@
+From 7f4a743171f9e6b283207d448de6562219774fbf Mon Sep 17 00:00:00 2001
+From: Salvatore Bonaccorso <carnil@debian.org>
+Date: Tue, 25 Jun 2024 12:24:29 +0100
+Subject: Disable async-signal-unsafe code from the sshsigdie() function
+
+Address signal handler race condition: if a client does not authenticate
+within LoginGraceTime seconds (120 by default, 600 in old OpenSSH
+versions), then sshd's SIGALRM handler is called asynchronously, but
+this signal handler calls various functions that are not
+async-signal-safe (for example, syslog()).
+
+This is a regression from CVE-2006-5051 ("Signal handler race condition
+in OpenSSH before 4.4 allows remote attackers to cause a denial of
+service (crash), and possibly execute arbitrary code")
+
+Signed-off-by: Salvatore Bonaccorso <carnil@debian.org>
+Upstream: https://salsa.debian.org/ssh-team/openssh/-/blob/525bb16e45edac4c03b95e106380d70aecbaf27e/debian/patches/sshsigdie-async-signal-unsafe.patch
+Patch-Name: sshsigdie-async-signal-unsafe.patch
+---
+ log.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/log.c b/log.c
+index 6a8b1fc4a..57256660f 100644
+--- a/log.c
++++ b/log.c
+@@ -452,12 +452,14 @@ void
+ sshsigdie(const char *file, const char *func, int line, int showfunc,
+     LogLevel level, const char *suffix, const char *fmt, ...)
+ {
++#if 0
+ 	va_list args;
+ 
+ 	va_start(args, fmt);
+ 	sshlogv(file, func, line, showfunc, SYSLOG_LEVEL_FATAL,
+ 	    suffix, fmt, args);
+ 	va_end(args);
++#endif
+ 	_exit(1);
+ }
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
