Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A20C3ABC0
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 17:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54F5960ADD;
	Wed,  7 May 2025 17:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7mBKm9ZLNxER; Wed,  7 May 2025 17:07:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68FE7611C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68FE7611C4;
	Wed,  7 May 2025 17:07:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13792950
 for <buildroot@buildroot.org>; Wed,  7 May 2025 17:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 055BF40D27
 for <buildroot@buildroot.org>; Wed,  7 May 2025 17:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id prPSriovSWYY for <buildroot@buildroot.org>;
 Wed,  7 May 2025 17:07:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1849940D2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1849940D2C
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1849940D2C
 for <buildroot@buildroot.org>; Wed,  7 May 2025 17:07:56 +0000 (UTC)
Received: from charybdis.office.fixme.cloud (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 1E28AE0022C;
 Wed,  7 May 2025 19:07:54 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Date: Wed,  7 May 2025 19:07:41 +0200
Message-ID: <20250507170752.24643-1-fl@n621.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1746637674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=+6gwUsyM2mkUyU8a/cMqmYtFHFck+xuiiy+QadU9d3w=;
 b=wLRu+BsdSv9Rr8Dv0gcPHxrUKcoVXDg+KMmLZvn/2Cho9JmsKlb0zQTeB9AsGhlM7E7hS3
 EouAmzQtXWOz2dfBRz2M+nBB90QBEqOreF8CvY4jkyhhenQIEm37V5qPgtpvGlXogW9HXy
 ND7pV/D+XndjcE+lRjHc4Xc0n7a9vRw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=wLRu+Bsd
Subject: [Buildroot] [PATCH 1/1] package/cpio: fix build with GCC 15
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
Cc: Florian Larysch <fl@n621.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On systems running GCC 15, host-cpio will fail to build with errors like

  copyout.c:646:12: error: too many arguments to function 'xstat'; expected 0, have 2

and

  main.c:407:13: error: assignment to 'int (*)(void)' from incompatible pointer type 'int (*)(const char * restrict,  struct stat * restrict)' [-Wincompatible-pointer-types]

This was reported[1] and fixed upstream, but there is no new release
yet. Import the upstream patch for now.

[1] https://lists.gnu.org/archive/html/bug-cpio/2025-05/msg00000.html

Signed-off-by: Florian Larysch <fl@n621.de>
---
 package/cpio/0001-Fix-c23-conformity.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/cpio/0001-Fix-c23-conformity.patch

diff --git a/package/cpio/0001-Fix-c23-conformity.patch b/package/cpio/0001-Fix-c23-conformity.patch
new file mode 100644
index 0000000000..63d598ad1c
--- /dev/null
+++ b/package/cpio/0001-Fix-c23-conformity.patch
@@ -0,0 +1,47 @@
+From f42137f5ab9cf07d1e62edc05e0212688d3ebaa2 Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Tue, 6 May 2025 21:02:43 +0300
+Subject: [PATCH] Fix c23 conformity
+
+Upstream: https://git.savannah.gnu.org/gitweb/?p=cpio.git;a=commit;h=f42137f5ab9cf07d1e62edc05e0212688d3ebaa2
+
+---
+ src/extern.h | 4 ++--
+ src/global.c | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/extern.h b/src/extern.h
+index bf3d5b3..455119b 100644
+--- a/src/extern.h
++++ b/src/extern.h
+@@ -96,8 +96,8 @@ extern char input_is_special;
+ extern char output_is_special;
+ extern char input_is_seekable;
+ extern char output_is_seekable;
+-extern int (*xstat) ();
+-extern void (*copy_function) ();
++extern int (*xstat) (const char *, struct stat *);
++extern void (*copy_function) (void);
+ extern char *change_directory_option;
+ 
+ #define STRINGIFY_BIGINT(i, b) umaxtostr (i, b)
+diff --git a/src/global.c b/src/global.c
+index 66686f2..5c6ab16 100644
+--- a/src/global.c
++++ b/src/global.c
+@@ -184,10 +184,10 @@ bool to_stdout_option = false;
+ 
+ /* A pointer to either lstat or stat, depending on whether
+    dereferencing of symlinks is done for input files.  */
+-int (*xstat) ();
++int (*xstat) (const char *, struct stat *);
+ 
+ /* Which copy operation to perform. (-i, -o, -p) */
+-void (*copy_function) () = 0;
++void (*copy_function) (void) = 0;
+ 
+ char *change_directory_option;
+ 
+-- 
+2.49.0
+
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
