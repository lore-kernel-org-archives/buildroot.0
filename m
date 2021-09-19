Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8266C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:24:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 602EE61268
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 602EE61268
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E6434045E;
	Sun, 19 Sep 2021 12:24:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X3PbwSZTX8ZE; Sun, 19 Sep 2021 12:24:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CBA54044E;
	Sun, 19 Sep 2021 12:24:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 241DC1BF2F3
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1463F8406C
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:23:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8dtNXkr6ua3C for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 12:23:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75D2A80F4F
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 12:23:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F0C278B7A6; Sun, 19 Sep 2021 12:21:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 13:58:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 251f3e3a3f16ea91565ddcafd063d4ad1b86549b
X-Git-Newrev: 70839f4d519ff0db5a0240c80a757386027735d7
X-Patchwork-Hint: ignore
Message-Id: <20210919122147.F0C278B7A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpgme: fix build with glibc >=
 2.34
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=70839f4d519ff0db5a0240c80a757386027735d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with glibc >= 2.34:

posix-io.c: In function '_gpgme_io_spawn':
posix-io.c:577:23: error: void value not ignored as it ought to be
  577 |             while ((i = closefrom (fd)) && errno == EINTR)
      |                       ^

Fixes:
 - http://autobuild.buildroot.org/results/b11094ddd35263071b7dd453a6590c5b684026ff

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...001-core-Support-closefrom-also-for-glibc.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/libgpgme/0001-core-Support-closefrom-also-for-glibc.patch b/package/libgpgme/0001-core-Support-closefrom-also-for-glibc.patch
new file mode 100644
index 0000000000..b8db949cef
--- /dev/null
+++ b/package/libgpgme/0001-core-Support-closefrom-also-for-glibc.patch
@@ -0,0 +1,36 @@
+From 4b64774b6d13ffa4f59dddf947a97d61bcfa2f2e Mon Sep 17 00:00:00 2001
+From: Jiri Kucera <sanczes@gmail.com>
+Date: Sun, 25 Jul 2021 11:35:54 +0200
+Subject: [PATCH] core: Support closefrom also for glibc.
+
+* src/posix-io.c (_gpgme_io_spawn): Use glibc's closefrom.
+--
+
+Since 2.34, glibc introduces closefrom (the implementation
+follows *BSD standard).
+
+Signed-off-by: Werner Koch <wk@gnupg.org>
+
+[Retrieved from:
+https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=commit;h=4b64774b6d13ffa4f59dddf947a97d61bcfa2f2e]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/posix-io.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/posix-io.c b/src/posix-io.c
+index e712ef28..2a3a81fc 100644
+--- a/src/posix-io.c
++++ b/src/posix-io.c
+@@ -570,7 +570,7 @@ _gpgme_io_spawn (const char *path, char *const argv[], unsigned int flags,
+               if (fd_list[i].fd > fd)
+                 fd = fd_list[i].fd;
+             fd++;
+-#if defined(__sun) || defined(__FreeBSD__)
++#if defined(__sun) || defined(__FreeBSD__) || defined(__GLIBC__)
+             closefrom (fd);
+             max_fds = fd;
+ #else /*!__sun */
+-- 
+2.11.0
+
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
