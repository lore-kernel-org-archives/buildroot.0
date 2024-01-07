Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F40C47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 16:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EF25400CF;
	Sun,  7 Jan 2024 16:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EF25400CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jJ43zGL3m6-H; Sun,  7 Jan 2024 16:24:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E80F403A5;
	Sun,  7 Jan 2024 16:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E80F403A5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D1AC31BF38B
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B83FC415E9
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B83FC415E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SuuO7pug0OXV for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 16:23:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD8A4415E5
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 16:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD8A4415E5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2B608459B; Sun,  7 Jan 2024 16:23:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Jan 2024 10:28:29 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: a6a93492d09392272f6eed2e9b6770d14a98d40c
X-Git-Newrev: c307cd9595c5889e5593b705e098fdebac44ff2f
X-Patchwork-Hint: ignore
Message-Id: <20240107162341.C2B608459B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 package/giflib/0003-Fix-CVE-2023-39742.patch: New security patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=c307cd9595c5889e5593b705e098fdebac44ff2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[yann.morin.1998@free.fr: extend GIFLIB_IGNORE_CVES]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 74253ffee576ea809f7eeb380647345a2ff910be)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/giflib/0003-Fix-CVE-2023-39742.patch | 36 ++++++++++++++++++++++++++++
 package/giflib/giflib.mk                     |  2 ++
 2 files changed, 38 insertions(+)

diff --git a/package/giflib/0003-Fix-CVE-2023-39742.patch b/package/giflib/0003-Fix-CVE-2023-39742.patch
new file mode 100644
index 0000000000..2ba01ac8a4
--- /dev/null
+++ b/package/giflib/0003-Fix-CVE-2023-39742.patch
@@ -0,0 +1,36 @@
+From 4288b993ee9df6550a367fe06ede3c003dc7bbc6 Mon Sep 17 00:00:00 2001
+From: Sandro Mani <manisandro@gmail.com>
+Date: Tue, 5 Dec 2023 16:35:40 -0700
+Subject: [PATCH] Fix CVE-2023-39742
+
+From: giflib-5.2.1-17.fc39.src.rpm
+Fix segmentation faults due to non correct checking for args
+Fixes: https://nvd.nist.gov/vuln/detail/CVE-2023-39742
+Upstream: https://sourceforge.net/p/giflib/bugs/166/
+
+Signed-off-by: Sandro Mani <manisandro@gmail.com>
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ getarg.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/getarg.c b/getarg.c
+index d569f6c..51fbe0b 100644
+--- a/getarg.c
++++ b/getarg.c
+@@ -307,6 +307,12 @@ GAGetParmeters(void *Parameters[],
+     int i = 0, ScanRes;
+ 
+     while (!(ISSPACE(CtrlStrCopy[i]))) {
++
++        if ((*argv) == argv_end) {
++            GAErrorToken = Option;
++            return CMD_ERR_NumRead;
++        }
++
+         switch (CtrlStrCopy[i + 1]) {
+           case 'd':    /* Get signed integers. */
+               ScanRes = sscanf(*((*argv)++), "%d",
+-- 
+2.43.0
+
diff --git a/package/giflib/giflib.mk b/package/giflib/giflib.mk
index 1207eafa16..d91c77e2ee 100644
--- a/package/giflib/giflib.mk
+++ b/package/giflib/giflib.mk
@@ -13,6 +13,8 @@ GIFLIB_CPE_ID_VENDOR = giflib_project
 
 # 0002-Fix-CVE-2022-28506.patch
 GIFLIB_IGNORE_CVES = CVE-2022-28506
+# 0003-Fix-CVE-2023-39742.patch
+GIFLIB_IGNORE_CVES += CVE-2023-39742
 
 ifeq ($(BR2_STATIC_LIBS),y)
 GIFLIB_BUILD_LIBS = static-lib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
