Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B299C47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 16:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44F28403B8;
	Sun,  7 Jan 2024 16:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44F28403B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2C4tUi5WjBNm; Sun,  7 Jan 2024 16:22:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43BEF403A5;
	Sun,  7 Jan 2024 16:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43BEF403A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1AE861BF38B
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 001DE82532
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 001DE82532
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oe-4lE5CTRMs for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 16:22:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1214B82457
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 16:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1214B82457
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F30F88475D; Sun,  7 Jan 2024 16:21:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Jan 2024 10:26:08 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 3a23349e8cc2f27018367617bedac3daecb27a99
X-Git-Newrev: 8fe4a7c8124feaa17d60c383bd244e7c33ae84ac
X-Patchwork-Hint: ignore
Message-Id: <20240107162159.F30F88475D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=8fe4a7c8124feaa17d60c383bd244e7c33ae84ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
