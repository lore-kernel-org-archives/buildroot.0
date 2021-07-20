Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8384AC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:16:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E5D861037
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E5D861037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16159423A3;
	Wed,  4 Aug 2021 00:16:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WUj5a8rLxi57; Wed,  4 Aug 2021 00:16:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73F76423A1;
	Wed,  4 Aug 2021 00:16:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 02C8D1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78C2F40F99
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iSUEEGpxUx-9 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44F8340E51
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9CB1B81469; Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 23:41:54 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 482270e2948043f32eba11399bf405aae1adfb13
X-Git-Newrev: 9ca64820db6766ad51bc835c86948cbe2c87e209
X-Patchwork-Hint: ignore
Message-Id: <20210803211012.9CB1B81469@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/darkhttpd: fix build
 with gcc 4.8
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=9ca64820db6766ad51bc835c86948cbe2c87e209
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following build failure which is raised since bump to version
0.13 in commit 88705a8c248e566f2c9ca71a8ee5353b33e368c2:

darkhttpd.c:966:5: error: 'for' loop initial declarations are only allowed in C99 mode
     for (int i = 0, j = 0; i < input_length;) {
     ^

Fixes:
 - http://autobuild.buildroot.org/results/ffc/ffcb627c44d2b7202d641129b67af2dc7865c618/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...lare-vars-outside-of-for-loop-for-std-c90.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/darkhttpd/0001-Declare-vars-outside-of-for-loop-for-std-c90.patch b/package/darkhttpd/0001-Declare-vars-outside-of-for-loop-for-std-c90.patch
new file mode 100644
index 0000000000..7584bff98e
--- /dev/null
+++ b/package/darkhttpd/0001-Declare-vars-outside-of-for-loop-for-std-c90.patch
@@ -0,0 +1,39 @@
+From 81b491e60affd67f4ec2feccbee1cdf98dc57b81 Mon Sep 17 00:00:00 2001
+From: Emil Mikulic <emikulic@gmail.com>
+Date: Sun, 21 Mar 2021 15:03:14 +1100
+Subject: [PATCH] Declare vars outside of for() loop for -std=c90.
+
+Fixes #2.
+
+[Retrieved from:
+https://github.com/emikulic/darkhttpd/commit/81b491e60affd67f4ec2feccbee1cdf98dc57b81]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ darkhttpd.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/darkhttpd.c b/darkhttpd.c
+index 219a8a3..268628a 100644
+--- a/darkhttpd.c
++++ b/darkhttpd.c
+@@ -966,8 +966,9 @@ static char *base64_encode(char *str) {
+     char *encoded_data = malloc(output_length+1);
+     if (encoded_data == NULL) return NULL;
+ 
+-    for (int i = 0, j = 0; i < input_length;) {
+-
++    int i;
++    int j;
++    for (i = 0, j = 0; i < input_length;) {
+         uint32_t octet_a = i < input_length ? (unsigned char)str[i++] : 0;
+         uint32_t octet_b = i < input_length ? (unsigned char)str[i++] : 0;
+         uint32_t octet_c = i < input_length ? (unsigned char)str[i++] : 0;
+@@ -981,7 +982,7 @@ static char *base64_encode(char *str) {
+     }
+ 
+     const int mod_table[] = {0, 2, 1};
+-    for (int i = 0; i < mod_table[input_length % 3]; i++)
++    for (i = 0; i < mod_table[input_length % 3]; i++)
+         encoded_data[output_length - 1 - i] = '=';
+     encoded_data[output_length] = '\0';
+ 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
