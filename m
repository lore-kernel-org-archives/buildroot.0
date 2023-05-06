Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF24C77B7F
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 15:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A63508214A;
	Sat,  6 May 2023 15:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A63508214A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8NSbmMlIQyQD; Sat,  6 May 2023 15:09:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8FAE81FEA;
	Sat,  6 May 2023 15:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8FAE81FEA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B52C11BF36C
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CE7F408C1
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:09:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CE7F408C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qc4XVT8yhMQr for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 15:09:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C5F7408AE
 for <buildroot@buildroot.org>; Sat,  6 May 2023 15:09:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C5F7408AE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68ED885DF3; Sat,  6 May 2023 15:09:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 6 May 2023 17:05:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d7e5e2b63d138ac902e21644256d9fcbae686ef
X-Git-Newrev: f2a676dcfff886104e83170c274a2e97e9d32aba
X-Patchwork-Hint: ignore
Message-Id: <20230506150928.68ED885DF3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gptfdisk: fix another runtime
 failure with popt 1.19
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2a676dcfff886104e83170c274a2e97e9d32aba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following runtime failure raised since bump of popt to version
1.19 in commit 895bfba93f6e5535f2132aeea144d2cd87ebc71b:

Segmentation fault (core dumped)

Fix the issue by backporting a fix found in upstream git repository [0].

[0] https://sourceforge.net/p/gptfdisk/code/ci/f5de3401b974ce103ffd93af8f9d43505a04aaf9/

Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...reference-when-duplicating-string-argumen.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch b/package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch
new file mode 100644
index 0000000000..1642343d06
--- /dev/null
+++ b/package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch
@@ -0,0 +1,43 @@
+From f5de3401b974ce103ffd93af8f9d43505a04aaf9 Mon Sep 17 00:00:00 2001
+Message-Id: <f5de3401b974ce103ffd93af8f9d43505a04aaf9.1680094621.git.stefan@agner.ch>
+From: Damian Kurek <starfire24680@gmail.com>
+Date: Thu, 7 Jul 2022 03:39:16 +0000
+Subject: [PATCH] Fix NULL dereference when duplicating string argument
+
+poptGetArg can return NULL if there are no additional arguments, which
+makes strdup dereference NULL on strlen
+
+Signed-off-by: Stefan Agner <stefan@agner.ch>
+---
+ gptcl.cc | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/gptcl.cc b/gptcl.cc
+index 0d578eb..ab95239 100644
+--- a/gptcl.cc
++++ b/gptcl.cc
+@@ -155,10 +155,11 @@ int GPTDataCL::DoOptions(int argc, char* argv[]) {
+    } // while
+ 
+    // Assume first non-option argument is the device filename....
+-   device = strdup((char*) poptGetArg(poptCon));
+-   poptResetContext(poptCon);
++   device = (char*) poptGetArg(poptCon);
+ 
+    if (device != NULL) {
++      device = strdup(device);
++      poptResetContext(poptCon);
+       JustLooking(); // reset as necessary
+       BeQuiet(); // Tell called functions to be less verbose & interactive
+       if (LoadPartitions((string) device)) {
+@@ -498,6 +499,7 @@ int GPTDataCL::DoOptions(int argc, char* argv[]) {
+          cerr << "Error encountered; not saving changes.\n";
+          retval = 4;
+       } // if
++      free(device);
+    } // if (device != NULL)
+    poptFreeContext(poptCon);
+    return retval;
+-- 
+2.40.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
