Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936A1CA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 18:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DCC58436C;
	Sun, 24 Aug 2025 18:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z8lIMY8nq1K6; Sun, 24 Aug 2025 18:55:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FD4284348
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FD4284348;
	Sun, 24 Aug 2025 18:55:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EC6921D9
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 18:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8A3584347
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 18:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eea7QlnWGwIF for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 18:55:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DB2884327
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DB2884327
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 18:55:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C9C987AB4; Sun, 24 Aug 2025 18:55:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Aug 2025 19:24:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4d8147a9532cbe2abf25d69f58e0c73b82136fb
X-Git-Newrev: 358b4116c762caff26f22ecbfff874692d7c77ee
X-Patchwork-Hint: ignore
Message-Id: <20250824185555.2C9C987AB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xvisor: Use '-std=gnu11' to fix
 build with GCC 15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=358b4116c762caff26f22ecbfff874692d7c77ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] "update to Bootlin toolchains 2025.08-1",
the TestXvisor fails when building xvisor with gcc 15.1.0.

GCC 15 changed the default C standard version to C23 [2], resulting in
errors from the xvisor definitions of bool from core/include/vmm_types.h,
which is a reserved keyword under C23.

Since CFLAGS are hardcoded in the main Makefile, add '-std=gnu11' to
'cflags' to resolve the error.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/947dbc92a20c5acea7882166cae7893e6ea661e1
[2] https://gcc.gnu.org/gcc-15/porting_to.html

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11042295047

Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...le-Use-std-gnu11-to-fix-build-with-GCC-15.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/xvisor/0003-Makefile-Use-std-gnu11-to-fix-build-with-GCC-15.patch b/package/xvisor/0003-Makefile-Use-std-gnu11-to-fix-build-with-GCC-15.patch
new file mode 100644
index 0000000000..f78e6efb9c
--- /dev/null
+++ b/package/xvisor/0003-Makefile-Use-std-gnu11-to-fix-build-with-GCC-15.patch
@@ -0,0 +1,40 @@
+From 53a53af30ce1704b7de806a51d822472fbcc57de Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Sun, 24 Aug 2025 18:26:52 +0200
+Subject: [PATCH] Makefile: Use '-std=gnu11' to fix build with GCC 15
+
+GCC 15 changed the default C standard version to C23 [1], resulting in
+errors from the xvisor definitions of bool from core/include/vmm_types.h,
+which is a reserved keyword under C23.
+
+Since CFLAGS are hardcoded in the main Makefile, add '-std=gnu11' to
+'cflags' to resolve the error.
+
+[1] https://gcc.gnu.org/gcc-15/porting_to.html
+
+Upstream: https://github.com/xvisor/xvisor/pull/200
+
+Fixes:
+https://gitlab.com/buildroot.org/buildroot/-/jobs/11042295047
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 1984408c..8731ece0 100644
+--- a/Makefile
++++ b/Makefile
+@@ -166,7 +166,7 @@ cppflags+=-I$(libs_dir)/include
+ cppflags+=$(cpu-cppflags)
+ cppflags+=$(board-cppflags)
+ cppflags+=$(libs-cppflags-y)
+-cflags=-g -Wall -nostdlib --sysroot=$(drivers_dir)/include -fno-builtin -fno-stack-protector -D__VMM__
++cflags=-std=gnu11 -g -Wall -nostdlib --sysroot=$(drivers_dir)/include -fno-builtin -fno-stack-protector -D__VMM__
+ cflags+=$(board-cflags)
+ cflags+=$(cpu-cflags)
+ cflags+=$(libs-cflags-y)
+-- 
+2.50.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
