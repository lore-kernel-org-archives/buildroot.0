Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC97EC433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AF654097E;
	Tue,  4 Jan 2022 18:11:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1bnWg_E1qShk; Tue,  4 Jan 2022 18:11:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EAD140491;
	Tue,  4 Jan 2022 18:11:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 37A8A1BF5DB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 867A881AEF
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FZvkXc9PE91b for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:09:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D2DB823F6
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:09:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 67D5282BA6; Tue,  4 Jan 2022 18:02:57 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 4 Jan 2022 18:49:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f384de4f4ec646c28dab6c442dd6bb2f06628725
X-Git-Newrev: 17aa836bd7a2c90da053398ce024b4113cf8b53c
X-Patchwork-Hint: ignore
Message-Id: <20220104180257.67D5282BA6@busybox.osuosl.org>
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

commit: https://git.buildroot.net/buildroot/commit/?id=17aa836bd7a2c90da053398ce024b4113cf8b53c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 4.8 raised since bump to
version 2.86 in commit 5b29096f8fcb0acd8890073a56ba9d620b1f911c:

option.c: In function 'one_opt':
option.c:2445:11: error: 'for' loop initial declarations are only allowed in C99 mode
           for (char *p = arg; *p; p++) {
           ^
option.c:2445:11: note: use option -std=c99 or -std=gnu99 to compile your code
option.c:2453:11: error: 'for' loop initial declarations are only allowed in C99 mode
           for (u8 i = 0; i < sizeof(daemon->umbrella_device); i++, arg+=2) {
           ^

Fixes:
 - http://autobuild.buildroot.org/results/39b34a4e69fc10f4bd9d4ddb0ed8c0aae5741c84

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-src-option.c-fix-build-with-gcc-4.8.patch | 52 ++++++++++++++++++++++
 ...2909d9080ff8743133fbd52427b4b2213171-typo.patch | 36 +++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/package/dnsmasq/0001-src-option.c-fix-build-with-gcc-4.8.patch b/package/dnsmasq/0001-src-option.c-fix-build-with-gcc-4.8.patch
new file mode 100644
index 0000000000..50ecf2f18a
--- /dev/null
+++ b/package/dnsmasq/0001-src-option.c-fix-build-with-gcc-4.8.patch
@@ -0,0 +1,52 @@
+From 46312909d9080ff8743133fbd52427b4b2213171 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 31 Dec 2021 17:29:44 +0100
+Subject: [PATCH] src/option.c: fix build with gcc 4.8
+
+Fix the following build failure with gcc 4.8 raised since version 2.86:
+
+option.c: In function 'one_opt':
+option.c:2445:11: error: 'for' loop initial declarations are only allowed in C99 mode
+           for (char *p = arg; *p; p++) {
+           ^
+option.c:2445:11: note: use option -std=c99 or -std=gnu99 to compile your code
+option.c:2453:11: error: 'for' loop initial declarations are only allowed in C99 mode
+           for (u8 i = 0; i < sizeof(daemon->umbrella_device); i++, arg+=2) {
+           ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/39b34a4e69fc10f4bd9d4ddb0ed8c0aae5741c84
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream commit 46312909d9080ff8743133fbd52427b4b2213171]
+---
+ src/option.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/option.c b/src/option.c
+index ff54def..c57f6d8 100644
+--- a/src/option.c
++++ b/src/option.c
+@@ -2525,7 +2525,8 @@ static int one_opt(int option, char *arg, char *errstr, char *gen_err, int comma
+           arg += 9;
+           if (strlen(arg) != 16)
+               ret_err(gen_err);
+-          for (char *p = arg; *p; p++) {
++          char *p;
++          for (*p = arg; *p; p++) {
+             if (!isxdigit((int)*p))
+               ret_err(gen_err);
+           }
+@@ -2533,7 +2534,8 @@ static int one_opt(int option, char *arg, char *errstr, char *gen_err, int comma
+ 
+           u8 *u = daemon->umbrella_device;
+           char word[3];
+-          for (u8 i = 0; i < sizeof(daemon->umbrella_device); i++, arg+=2) {
++          u8 i;
++          for (i = 0; i < sizeof(daemon->umbrella_device); i++, arg+=2) {
+             memcpy(word, &(arg[0]), 2);
+             *u++ = strtoul(word, NULL, 16);
+           }
+-- 
+2.33.0
+
diff --git a/package/dnsmasq/0002-Fix-46312909d9080ff8743133fbd52427b4b2213171-typo.patch b/package/dnsmasq/0002-Fix-46312909d9080ff8743133fbd52427b4b2213171-typo.patch
new file mode 100644
index 0000000000..8cdf5b3f1b
--- /dev/null
+++ b/package/dnsmasq/0002-Fix-46312909d9080ff8743133fbd52427b4b2213171-typo.patch
@@ -0,0 +1,36 @@
+From 2748fb81e23b71e2c44956e99321816aca91905d Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Sat, 1 Jan 2022 23:03:26 +0000
+Subject: [PATCH] Fix 46312909d9080ff8743133fbd52427b4b2213171 typo.
+
+[Upstream commit 2748fb81e23b71e2c44956e99321816aca91905d]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com> 
+---
+ src/option.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/option.c b/src/option.c
+index c57f6d8..6f56ce8 100644
+--- a/src/option.c
++++ b/src/option.c
+@@ -357,7 +357,7 @@ static const struct myoption opts[] =
+     { "dhcp-ignore-clid", 0, 0,  LOPT_IGNORE_CLID },
+     { "dynamic-host", 1, 0, LOPT_DYNHOST },
+     { "log-debug", 0, 0, LOPT_LOG_DEBUG },
+-	{ "umbrella", 2, 0, LOPT_UMBRELLA },
++    { "umbrella", 2, 0, LOPT_UMBRELLA },
+     { "quiet-tftp", 0, 0, LOPT_QUIET_TFTP },
+     { NULL, 0, 0, 0 }
+   };
+@@ -2526,7 +2526,7 @@ static int one_opt(int option, char *arg, char *errstr, char *gen_err, int comma
+           if (strlen(arg) != 16)
+               ret_err(gen_err);
+           char *p;
+-          for (*p = arg; *p; p++) {
++          for (p = arg; *p; p++) {
+             if (!isxdigit((int)*p))
+               ret_err(gen_err);
+           }
+-- 
+2.33.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
