Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620EEC25B7A
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 12:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C3C780D96;
	Fri, 24 May 2024 12:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2G02m7gtbu9g; Fri, 24 May 2024 12:56:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32FB9832C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32FB9832C6;
	Fri, 24 May 2024 12:56:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B3971CF9B7
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 12:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8356A832EB
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 12:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6_EueWh1C7TN for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 12:56:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5C82832DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5C82832DC
 for <buildroot@buildroot.org>; Fri, 24 May 2024 12:56:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4F2E86C90; Fri, 24 May 2024 12:56:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 24 May 2024 14:56:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ee86ada7212b6bb38089fe00bf375fd4cd2a024
X-Git-Newrev: b37792f76880410726578b9080ba9649adf2c997
X-Patchwork-Hint: ignore
Message-Id: <20240524125655.B4F2E86C90@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ustreamer: fix uclibc build
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

commit: https://git.buildroot.net/buildroot/commit/?id=b37792f76880410726578b9080ba9649adf2c997
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following uclibc build failure raised since bump to version 6.11
in commit c6c173dadb7b44ba4af92237d05503b8e83e51dc and
https://github.com/pikvm/ustreamer/commit/2d6716aa4762151f0fb1b900d3cd3295d328cab6:

In file included from libs/base64.h:25,
                 from libs/base64.c:23:
libs/types.h:30:9: error: unknown type name 'ssize_t'
   30 | typedef ssize_t sz;
      |         ^~~~~~~

Fixes: c6c173dadb7b44ba4af92237d05503b8e83e51dc
 - http://autobuild.buildroot.org/results/24498049d7beb4afaaf9f9a0c2fc0bcd26a3ee04

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0001-src-libs-types.h-include-sys-types.h.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/ustreamer/0001-src-libs-types.h-include-sys-types.h.patch b/package/ustreamer/0001-src-libs-types.h-include-sys-types.h.patch
new file mode 100644
index 0000000000..82fe596963
--- /dev/null
+++ b/package/ustreamer/0001-src-libs-types.h-include-sys-types.h.patch
@@ -0,0 +1,36 @@
+From 6c24c9ea610e7cc0e47d1e7124697098d5ef365e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 15 May 2024 19:56:49 +0200
+Subject: [PATCH] src/libs/types.h: include sys/types.h (#273)
+
+Include sys/types.h to avoid the following uclibc build failure since
+version 5.52 and
+https://github.com/pikvm/ustreamer/commit/2d6716aa4762151f0fb1b900d3cd3295d328cab6:
+
+In file included from libs/base64.h:25,
+                 from libs/base64.c:23:
+libs/types.h:30:9: error: unknown type name 'ssize_t'
+   30 | typedef ssize_t sz;
+      |         ^~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/24498049d7beb4afaaf9f9a0c2fc0bcd26a3ee04
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/pikvm/ustreamer/commit/6c24c9ea610e7cc0e47d1e7124697098d5ef365e
+---
+ src/libs/types.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/libs/types.h b/src/libs/types.h
+index 54e42325..b35bbaea 100644
+--- a/src/libs/types.h
++++ b/src/libs/types.h
+@@ -24,6 +24,7 @@
+ #include <stdio.h>
+ #include <stdbool.h>
+ #include <stdint.h>
++#include <sys/types.h>
+ 
+ 
+ typedef long long sll;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
