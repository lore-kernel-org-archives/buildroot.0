Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F99C433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Mar 2022 21:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 508DC60C20;
	Thu,  3 Mar 2022 21:28:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zIl5junr-kmx; Thu,  3 Mar 2022 21:28:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7861760BD9;
	Thu,  3 Mar 2022 21:28:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F1B7C1BF385
 for <buildroot@lists.busybox.net>; Thu,  3 Mar 2022 21:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE7558131A
 for <buildroot@lists.busybox.net>; Thu,  3 Mar 2022 21:28:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q_GAEkdJV5cK for <buildroot@lists.busybox.net>;
 Thu,  3 Mar 2022 21:28:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 408D381350
 for <buildroot@buildroot.org>; Thu,  3 Mar 2022 21:28:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 865F083901; Thu,  3 Mar 2022 21:20:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 3 Mar 2022 22:26:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3739f0bf135e1cfe9034dc2797bdef3a2c981ecf
X-Git-Newrev: 610f52f3bea153a3293e67b95f7c4f31e74d2ffd
X-Patchwork-Hint: ignore
Message-Id: <20220303212029.865F083901@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dnsmasq: fix build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=610f52f3bea153a3293e67b95f7c4f31e74d2ffd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 4.8 raised since bump to
version 2.86 in commit 5b29096f8fcb0acd8890073a56ba9d620b1f911c:

pattern.c: In function 'is_valid_dns_name':
pattern.c:134:3: error: 'for' loop initial declarations are only allowed in C99 mode
   for (const char *c = value;; c++)
   ^
pattern.c:134:3: note: use option -std=c99 or -std=gnu99 to compile your code
pattern.c: In function 'is_valid_dns_name_pattern':
pattern.c:249:3: error: 'for' loop initial declarations are only allowed in C99 mode
   for (const char *c = value;; c++)
   ^

Fixes:
 - http://autobuild.buildroot.org/results/eb0c34ff58eaf103f51c7171ecd97a3bdb887601

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0004-src-pattern.c-fix-build-with-gcc-4.8.patch | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/package/dnsmasq/0004-src-pattern.c-fix-build-with-gcc-4.8.patch b/package/dnsmasq/0004-src-pattern.c-fix-build-with-gcc-4.8.patch
new file mode 100644
index 0000000000..90bb02b23a
--- /dev/null
+++ b/package/dnsmasq/0004-src-pattern.c-fix-build-with-gcc-4.8.patch
@@ -0,0 +1,57 @@
+From 0c89dd2fa0fe50b00bca638dbbacfbd361526e0a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 2 Jan 2022 21:57:52 +0100
+Subject: [PATCH] src/pattern.c: fix build with gcc 4.8
+
+Fix the following build failure:
+
+pattern.c: In function 'is_valid_dns_name':
+pattern.c:134:3: error: 'for' loop initial declarations are only allowed in C99 mode
+   for (const char *c = value;; c++)
+   ^
+pattern.c:134:3: note: use option -std=c99 or -std=gnu99 to compile your code
+pattern.c: In function 'is_valid_dns_name_pattern':
+pattern.c:249:3: error: 'for' loop initial declarations are only allowed in C99 mode
+   for (const char *c = value;; c++)
+   ^
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=b2690415bfa1bc105e61b75f642fb5c1aaf0fae8]
+---
+ src/pattern.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/pattern.c b/src/pattern.c
+index 03e23b9..928d259 100644
+--- a/src/pattern.c
++++ b/src/pattern.c
+@@ -129,9 +129,9 @@ int is_valid_dns_name(const char *value)
+   
+   size_t num_bytes = 0;
+   size_t num_labels = 0;
+-  const char *label = NULL;
++  const char *c, *label = NULL;
+   int is_label_numeric = 1;
+-  for (const char *c = value;; c++)
++  for (c = value;; c++)
+     {
+       if (*c &&
+ 	  *c != '-' && *c != '.' &&
+@@ -242,11 +242,11 @@ int is_valid_dns_name_pattern(const char *value)
+   
+   size_t num_bytes = 0;
+   size_t num_labels = 0;
+-  const char *label = NULL;
++  const char *c, *label = NULL;
+   int is_label_numeric = 1;
+   size_t num_wildcards = 0;
+   int previous_label_has_wildcard = 1;
+-  for (const char *c = value;; c++)
++  for (c = value;; c++)
+     {
+       if (*c &&
+ 	  *c != '*' && /* Wildcard. */
+-- 
+2.20.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
