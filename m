Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED32C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 16:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C396F4059F;
	Mon, 18 Dec 2023 16:45:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C396F4059F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RI3mIJSYCp5Z; Mon, 18 Dec 2023 16:45:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4E27405D1;
	Mon, 18 Dec 2023 16:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4E27405D1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5652B1BF2B3
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 16:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F92160746
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 16:44:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F92160746
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TefJlQAzDmau for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 16:44:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F7DE60E36
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 16:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F7DE60E36
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C6E987BBF; Mon, 18 Dec 2023 16:44:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 17:42:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a93a8319637ebb8be33c126da28242201d6fa70
X-Git-Newrev: 74253ffee576ea809f7eeb380647345a2ff910be
X-Patchwork-Hint: ignore
Message-Id: <20231218164451.6C6E987BBF@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
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

commit: https://git.buildroot.net/buildroot/commit/?id=74253ffee576ea809f7eeb380647345a2ff910be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[yann.morin.1998@free.fr: extend GIFLIB_IGNORE_CVES]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
