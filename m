Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589FBC7114B
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2114D409DA;
	Thu, 12 Jun 2025 20:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zUXGAhM4wjMg; Thu, 12 Jun 2025 20:13:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F89C40AC8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F89C40AC8;
	Thu, 12 Jun 2025 20:13:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 05E181BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66F0D4091A
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PdOw5X-1WWKw for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:12:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF1814091F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF1814091F
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED78D83554; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 14:40:54 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4c69a6ab6ce9787471dade2b37f1baf4971af5bb
X-Git-Newrev: ed5585a03cd633e6e4e630b6010b508bac01fce3
X-Patchwork-Hint: ignore
Message-Id: <20250612201229.ED78D83554@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/yasm: fix build
 with host GCC 15
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ed5585a03cd633e6e4e630b6010b508bac01fce3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fix the following autobuild error that started appearing with host GCC15
configs.

```
/usr/bin/gcc -DHAVE_CONFIG_H -I.   -I/workdir/instance-0/output-1/host/include  -O2 -I/workdir/instance-0/output-1/host/include  -c -o modules/arch/x86/x86arch.o modules/arch/x86/x86arch.c
In file included from modules/arch/x86/x86arch.h:30,
                 from modules/arch/x86/x86arch.c:31:
./libyasm/bitvect.h:86:32: error: cannot use keyword 'false' as enumeration constant
   86 |         typedef enum boolean { false = FALSE, true = TRUE } boolean;
      |                                ^~~~~
./libyasm/bitvect.h:86:32: note: 'false' is a keyword with '-std=c23' onwards
```

This is due to the change in the default C language version in GCC15.

Fixes: https://autobuild.buildroot.org/results/d1d/d1d9a6e73c2ec278941dd90c6b07cce01b372feb/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit aa9ee1770140946bb9344e7c70e3be3d03481d0a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../yasm/0002-bitvect-fix-build-with-gcc-15.patch  | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/yasm/0002-bitvect-fix-build-with-gcc-15.patch b/package/yasm/0002-bitvect-fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..684c8be042
--- /dev/null
+++ b/package/yasm/0002-bitvect-fix-build-with-gcc-15.patch
@@ -0,0 +1,38 @@
+From 64ef740eb262f329e55eebadf2ce276b146d44e9 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Tue, 22 Apr 2025 19:06:24 +0200
+Subject: [PATCH] bitvect: fix build with gcc-15
+
+* fixes:
+libyasm/bitvect.h:86:32: error: cannot use keyword 'false' as enumeration constant
+   86 |         typedef enum boolean { false = FALSE, true = TRUE } boolean;
+      |                                ^~~~~
+../git/libyasm/bitvect.h:86:32: note: 'false' is a keyword with '-std=c23' onwards
+
+as suggested in:
+https://github.com/yasm/yasm/issues/283#issuecomment-2661108816
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream: https://github.com/yasm/yasm/pull/287
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ libyasm/bitvect.h | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/libyasm/bitvect.h b/libyasm/bitvect.h
+index 3aee3a531..a13470ada 100644
+--- a/libyasm/bitvect.h
++++ b/libyasm/bitvect.h
+@@ -83,7 +83,11 @@ typedef  Z_longword         *Z_longwordptr;
+     #ifdef MACOS_TRADITIONAL
+         #define boolean Boolean
+     #else
+-        typedef enum boolean { false = FALSE, true = TRUE } boolean;
++        #if __STDC_VERSION__ < 202311L
++             typedef enum boolean { false = FALSE, true = TRUE } boolean;
++        #else
++             typedef bool boolean;
++        #endif
+     #endif
+ #endif
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
