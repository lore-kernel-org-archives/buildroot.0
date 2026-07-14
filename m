Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5CCC44501
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 08:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC5ED408F9;
	Tue, 14 Jul 2026 08:42:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VFFkvwk1-SQI; Tue, 14 Jul 2026 08:42:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2B7640712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784018535;
	bh=OTB6xwRVGga21GLsiK7jkGi9cjj5xZMLsF7ckmtocm8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IL6XB3qz9XxCHxT3Cioque4AKSjjcWDmJRUOhdiXV7G/hWr4/3q0DEWNR0JSMztgi
	 g/Y2YJ1yblQX5KyWal5xW5hT3VtD5BVrFBZM9d2cZKGYy7IgyiToc3QD2VTNb7Bk8V
	 EQ2H91rU8p4CGjLs7+kAs6kyvzK31GCKKJWYiXVy46GF2D152gwNLVMuoyrAI4CLv9
	 +dtwJL977mU5yHC91JyRC46q/Yeaq46AbeNF8PZekpwcVb9dCpQvS7XcN69wzT4lkZ
	 rnvIcG0ELEZ96hcKa7ShxAJ42a4IhUYsEq12WNY8eWk7J+5bvl869K2yZfoQK+8GKI
	 RuvQ/tGinPH4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2B7640712;
	Tue, 14 Jul 2026 08:42:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 34E5C128
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 08:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A81C80EBB
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 08:42:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xWEVX6ulUdfP for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 08:42:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D47780EB9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D47780EB9
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 08:42:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3B7888833; Tue, 14 Jul 2026 08:41:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Jul 2026 10:38:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e12744652e4e727fe7ff9c1de44309348ef63ed
X-Git-Newrev: 781d14e63a838d7b90c4fe75f091bebf1d5d58a6
X-Patchwork-Hint: ignore
Message-Id: <20260714084138.B3B7888833@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/igt-gpu-tools: fix musl build
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2844256462277427189=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2844256462277427189==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/781d14e63a838d7b90c4fe75f091bebf1d5d58a6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit f9a91bf60e35617157b950eea05fc6f6144d650c bumped the
package to version 2.3 that includes upstream commit
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/6a8b33e353627187f1b530f33c4bd3f5282883f0
which makes use of PATH_MAX causing build errors on musl.

Fixes:
https://autobuild.buildroot.net/results/42a/42a6e9d9652c1eb97c8c49aed75d210bf2afc066/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ..._gpu_frequency-include-limits.h-to-fix-mu.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/igt-gpu-tools/0001-tools-intel_gpu_frequency-include-limits.h-to-fix-mu.patch b/package/igt-gpu-tools/0001-tools-intel_gpu_frequency-include-limits.h-to-fix-mu.patch
new file mode 100644
index 0000000000..1d818dcc22
--- /dev/null
+++ b/package/igt-gpu-tools/0001-tools-intel_gpu_frequency-include-limits.h-to-fix-mu.patch
@@ -0,0 +1,36 @@
+From 48a177958a9ecff8f7cee379affb2f35984b58a9 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Fri, 10 Jul 2026 20:34:01 +0200
+Subject: [PATCH] tools/intel_gpu_frequency: include limits.h to fix musl build
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes build error seen with musl-based toolchains:
+
+../tools/intel_gpu_frequency.c:90:19: error:
+ ‘PATH_MAX’ undeclared (first use in this function)
+   90 |         char path[PATH_MAX];
+
+Upstream: https://patchwork.freedesktop.org/patch/739159/?series=170207&rev=1
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ tools/intel_gpu_frequency.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
+index 6316c2e58..7df7f331d 100644
+--- a/tools/intel_gpu_frequency.c
++++ b/tools/intel_gpu_frequency.c
+@@ -25,6 +25,7 @@
+ #include <dirent.h>
+ #include <fcntl.h>
+ #include <getopt.h>
++#include <limits.h>
+ #include <stdio.h>
+ #include <time.h>
+ #include <unistd.h>
+-- 
+2.47.3
+

--===============2844256462277427189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2844256462277427189==--
