Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F06CAC583
	for <buildroot@archiver.kernel.org>; Tue,  9 Sep 2025 13:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90738411E5;
	Tue,  9 Sep 2025 13:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G6vUwK3Kqe0l; Tue,  9 Sep 2025 13:00:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25666411D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25666411D1;
	Tue,  9 Sep 2025 13:00:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 19E78186
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 12:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C725E613EB
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 12:59:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AxgfLsge23_y for <buildroot@buildroot.org>;
 Tue,  9 Sep 2025 12:59:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4DF54610A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DF54610A5
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DF54610A5
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 12:59:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0D6E6C8F452
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 12:59:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B7B8A60630;
 Tue,  9 Sep 2025 12:59:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2DAA7102F27D7; 
 Tue,  9 Sep 2025 14:59:53 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue,  9 Sep 2025 14:08:08 +0200
Message-ID: <20250909120822.1069595-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909120822.1069595-1-thomas.petazzoni@bootlin.com>
References: <20250909120822.1069595-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757422793; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=OTyuQDBR3/ZChl8Yd1b4Hh4JDAYdqlXdL3l7Unb1Fpk=;
 b=pBN/yBEHGC4ydsvVnOoB7YyN0UWxlizwibF/h9N/bp0DcJ8/ROLpCs/Qk/Yk2D0syj2jZe
 8aSMXX+WMGOS/ZPUWgmVj5fvSQ/h1GCJt5sp29tCPAASnPOSSPgLNTU046RX0J44QKImjQ
 oWIAYhhc+r9fjm5tCCEJFqMT8+poOwQkGE72Oxi1tM4Gft+4V1LansnxFAsSprTqgC70/5
 olXZXJQyO88i+A/EF+kh65KvHYoz7k2vXqZMRTrnqProXYywpRCGOr373QRM3pry2vbZHl
 G/ga98wxLFhpe4uJshMkpDytFeO3L9cBJYQ9ho4HSl11UGtimdoxIyQ5mxjxLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=pBN/yBEH
Subject: [Buildroot] [PATCH 03/11] package/policycoreutils: fix build with
 musl due to getpass()
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

policycoreutils uses getpass(), which with musl is only defined with
some feature macro defined, such as _GNU_SOURCE. So let's pick-up an
upstream fix to address this issue.

There are no autobuilder failures, the issue was most likely hidden by
other failures with musl affecting the SELinux stack.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...oreutils-run_init-define-_GNU_SOURCE.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/policycoreutils/0003-policycoreutils-run_init-define-_GNU_SOURCE.patch

diff --git a/package/policycoreutils/0003-policycoreutils-run_init-define-_GNU_SOURCE.patch b/package/policycoreutils/0003-policycoreutils-run_init-define-_GNU_SOURCE.patch
new file mode 100644
index 0000000000..bef6909b0a
--- /dev/null
+++ b/package/policycoreutils/0003-policycoreutils-run_init-define-_GNU_SOURCE.patch
@@ -0,0 +1,37 @@
+From f338b2e7d2bbf70cb811eb1331162e33deb4ce6c Mon Sep 17 00:00:00 2001
+From: Robert Marko <robimarko@gmail.com>
+Date: Thu, 1 May 2025 21:59:13 +0200
+Subject: [PATCH] policycoreutils: run_init: define _GNU_SOURCE
+
+Trying to compile run_init with musl will fail with:
+run_init.c: In function 'authenticate_via_shadow_passwd':
+run_init.c:206:40: error: implicit declaration of function 'getpass' [-Wimplicit-function-declaration]
+  206 |         if (!(unencrypted_password_s = getpass(PASSWORD_PROMPT))) {
+
+This is because getpass in musl is guarded only for _GNU_SOURCE, so
+define _GNU_SOURCE for run_init.
+
+Signed-off-by: Robert Marko <robimarko@gmail.com>
+Acked-by: James Carter <jwcart2@gmail.com>
+Upstream: 50bafc3d9c08cf26c3b0f61e29157a0ea8efbf4a
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ policycoreutils/run_init/run_init.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/policycoreutils/run_init/run_init.c b/policycoreutils/run_init/run_init.c
+index ce499781..4531a8ba 100644
+--- a/policycoreutils/run_init/run_init.c
++++ b/policycoreutils/run_init/run_init.c
+@@ -37,6 +37,8 @@
+  *
+  *************************************************************************/
+ 
++#define _GNU_SOURCE
++
+ #include <stdio.h>
+ #include <stdlib.h>		/* for malloc(), realloc(), free() */
+ #include <pwd.h>		/* for getpwuid() */
+-- 
+2.51.0
+
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
