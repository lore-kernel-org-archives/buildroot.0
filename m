Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39942CA0FF0
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 12:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1C474142A;
	Mon,  1 Sep 2025 12:13:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OUiFhNXxgUcL; Mon,  1 Sep 2025 12:13:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0003B413C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0003B413C6;
	Mon,  1 Sep 2025 12:13:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FA4E186
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 12:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 324AA413C6
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 12:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DLLMn8iDQ_Pk for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 12:13:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66EA6413F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66EA6413F9
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 12:13:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 570B087A80; Mon,  1 Sep 2025 12:13:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 1 Sep 2025 13:16:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 759a08633ea80e90cb91984b5f87d82304e711b9
X-Git-Newrev: a49354e46fcde6884703438089cb878966036763
X-Patchwork-Hint: ignore
Message-Id: <20250901121345.570B087A80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mosquitto: fix build failure with
 recent glibc
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a49354e46fcde6884703438089cb878966036763
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix link-time build failures because glibc>=2.34 no longer ships libanl.so
as it has been consolidated into libc.

See the inner patch message for more details.

Fixes: https://autobuild.buildroot.org/results/16223cd838876abc9b6f941f7dc20d23afa32c3b/

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-Add-configure-time-check-for-lanl.patch   | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/mosquitto/0002-Add-configure-time-check-for-lanl.patch b/package/mosquitto/0002-Add-configure-time-check-for-lanl.patch
new file mode 100644
index 0000000000..b67164123a
--- /dev/null
+++ b/package/mosquitto/0002-Add-configure-time-check-for-lanl.patch
@@ -0,0 +1,47 @@
+From 447a6aa8df882a67ca3df6f5e95be42e1463eaf0 Mon Sep 17 00:00:00 2001
+From: Titouan Christophe <titouan.christophe@mind.be>
+Date: Fri, 29 Aug 2025 19:47:34 +0200
+Subject: [PATCH] Add configure-time check for -lanl
+
+Since glibc 2.34, libanl features have been integrated directly into libc [1].
+For backward compatibility, some toolchains still provide a shim for
+libanl as a separate .so, but new toolchains (for example for new archs
+like loongarch) do not provide it anymore.
+
+In such a case, building mosquitto fails at link time with (see [2])
+    > cannot find -lanl: No such file or directory
+
+To fix this problem while maintaining compatibility with older toolchains,
+check if a simple program that uses libanl can be compiled without -lanl,
+and only add the linker flag otherwise.
+
+[1] https://sourceware.org/pipermail/libc-alpha/2021-August/129718.html
+[2] https://autobuild.buildroot.org/results/16223cd838876abc9b6f941f7dc20d23afa32c3b/build-end.log
+
+Upstream: https://github.com/eclipse-mosquitto/mosquitto/pull/3358
+
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ config.mk | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/config.mk b/config.mk
+index 34d5163f..cc7987c4 100644
+--- a/config.mk
++++ b/config.mk
+@@ -318,8 +318,11 @@ ifeq ($(WITH_EC),yes)
+ endif
+ 
+ ifeq ($(WITH_ADNS),yes)
+-	BROKER_LDADD:=$(BROKER_LDADD) -lanl
+ 	BROKER_CPPFLAGS:=$(BROKER_CPPFLAGS) -DWITH_ADNS
++	NEED_LIBANL := $(shell printf '#include <stdlib.h>\n#include <netdb.h>\nint main(){return getaddrinfo_a(0, NULL, 0, NULL);}'| $(CC) -D_GNU_SOURCE -o /dev/null -x c - 2>/dev/null || echo YES)
++	ifeq ($(NEED_LIBANL),YES)
++		BROKER_LDADD:=$(BROKER_LDADD) -lanl
++	endif
+ endif
+ 
+ ifeq ($(WITH_CONTROL),yes)
+-- 
+2.50.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
