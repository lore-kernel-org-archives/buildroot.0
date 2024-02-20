Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95537C48BC3
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 21:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D4AE60ADF;
	Tue, 20 Feb 2024 21:18:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w7ixuQZ1GOMt; Tue, 20 Feb 2024 21:18:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C80060C06
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C80060C06;
	Tue, 20 Feb 2024 21:18:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B61D51BF475
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 21:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B026F81FBD
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 21:18:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M92vTeOPKaxS for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 21:18:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEC4D81F96
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEC4D81F96
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 21:18:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6495879C1; Tue, 20 Feb 2024 21:18:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 20 Feb 2024 22:17:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5c86121d8865d41c40ed17d0ca6b07d36a940a2e
X-Git-Newrev: 59e2a8ed5ab9712c602fe64f0ae5f0ae48c0b6c5
X-Patchwork-Hint: ignore
Message-Id: <20240220211811.A6495879C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/google-breakpad: fix missing
 include error
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
Content-Type: multipart/mixed; boundary="===============7232269324658882683=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7232269324658882683==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=59e2a8ed5ab9712c602fe64f0ae5f0ae48c0b6c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

src/common/module.cc: In member function ‘bool google_breakpad::Module::AddFunction(Function*)’:
src/common/module.cc:194:52: error: ‘find_if’ is not a member of ‘std’; did you mean ‘find’?
  194 |     FunctionSet::iterator existing_function = std::find_if(
      |                                                    ^~~~~~~
      |                                                    find
Makefile:8309: recipe for target 'src/common/tools_mac_dump_syms_dump_syms_mac-module.o' failed

This error is seen on gcc-14.

https://chromium-review.googlesource.com/c/breakpad/breakpad/+/5137658
https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-devtools/breakpad/breakpad/0001-Fixed-missing-include-for-std-find_if.patch

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...001-Fixed-missing-include-for-std-find_if.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/google-breakpad/0001-Fixed-missing-include-for-std-find_if.patch b/package/google-breakpad/0001-Fixed-missing-include-for-std-find_if.patch
new file mode 100644
index 0000000000..141e12b613
--- /dev/null
+++ b/package/google-breakpad/0001-Fixed-missing-include-for-std-find_if.patch
@@ -0,0 +1,26 @@
+From 898a997855168c0e6a689072fefba89246271a5d Mon Sep 17 00:00:00 2001
+From: Nathan Moinvaziri <nathan@nathanm.com>
+Date: Tue, 19 Dec 2023 14:35:05 -0800
+Subject: [PATCH] Fixed missing include for std::find_if.
+
+Throws an error when compiling on Windows.
+
+Change-Id: Ieb34c00cf199aaa1b45a440086c48b8ed363b3c7
+Reviewed-on: https://chromium-review.googlesource.com/c/breakpad/breakpad/+/5137658
+Reviewed-by: Ivan Penkov <ivanpe@chromium.org>
+Upstream: https://github.com/google/breakpad/commit/898a997855168c0e6a689072fefba89246271a5d
+Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
+---
+
+diff --git a/src/common/module.cc b/src/common/module.cc
+index 0eb5aad..b6f5da7 100644
+--- a/src/common/module.cc
++++ b/src/common/module.cc
+@@ -42,6 +42,7 @@
+ #include <stdio.h>
+ #include <string.h>
+ 
++#include <algorithm>
+ #include <functional>
+ #include <iostream>
+ #include <memory>

--===============7232269324658882683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7232269324658882683==--
