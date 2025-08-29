Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619F7CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 17:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B1D9418CA;
	Fri, 29 Aug 2025 17:34:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 24I3yZBoTO3w; Fri, 29 Aug 2025 17:34:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 357CC41675
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 357CC41675;
	Fri, 29 Aug 2025 17:34:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A4A4D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70C8441675
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G00GClam1wQc for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 17:34:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A854641482
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A854641482
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:34:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9135887E2B; Fri, 29 Aug 2025 17:34:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 19:24:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0d643a8636420a85512aae69932bba2fbe9e5829
X-Git-Newrev: 08a1e10fbe7538d8775196ae680df002c0271854
X-Patchwork-Hint: ignore
Message-Id: <20250829173452.9135887E2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: fix grub2 compilation
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=08a1e10fbe7538d8775196ae680df002c0271854
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 https://autobuild.buildroot.org/results/7a4/7a4d0f0571cd0cef1c87f3ef207618de72c1c78c/build-end.log

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 ...001-remove-uClibc-specific-gettext_printf.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/uclibc/0001-remove-uClibc-specific-gettext_printf.patch b/package/uclibc/0001-remove-uClibc-specific-gettext_printf.patch
new file mode 100644
index 0000000000..96736da562
--- /dev/null
+++ b/package/uclibc/0001-remove-uClibc-specific-gettext_printf.patch
@@ -0,0 +1,34 @@
+From 9ffed9adb130d45b9f31ca7a305153e86586c877 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Fri, 15 Aug 2025 20:29:52 +0200
+Subject: [PATCH] remove uClibc specific gettext_printf
+
+Other C libraries like musl/glibc does not define it.
+Including stdio.h here breaks Grub2 compilation with
+gcc 14 and above.
+Thanks to Thomas Petazzoni for analyzing the Grub2 build error.
+
+Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=9ffed9adb130d45b9f31ca7a305153e86586c877
+---
+ include/libintl.h | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/include/libintl.h b/include/libintl.h
+index b7123a963..6d8b9f342 100644
+--- a/include/libintl.h
++++ b/include/libintl.h
+@@ -50,9 +50,6 @@ char *bindtextdomain(const char *domainname, const char *dirname);
+ 
+ #endif
+ 
+-#include <stdio.h>
+-#define gettext_printf(args...) printf(args)
+-
+ /* to supply LC_MESSAGES and other stuff GNU expects to be exported when
+    including libintl.h */
+ #include <locale.h>
+-- 
+2.47.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
