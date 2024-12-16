Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC78E7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 12:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4F9280B71;
	Mon, 16 Dec 2024 12:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0WvrQoMWqhQK; Mon, 16 Dec 2024 12:22:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9769280B6E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9769280B6E;
	Mon, 16 Dec 2024 12:22:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9910DC5
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 12:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7162B40B03
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 12:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xO_oOAi2gvVX for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 12:22:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7240E40592
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7240E40592
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7240E40592
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 12:22:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD8FA1C0002;
 Mon, 16 Dec 2024 12:22:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tNA7F-000zzW-0L;
 Mon, 16 Dec 2024 13:22:25 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 16 Dec 2024 13:22:08 +0100
Message-Id: <20241216122209.238083-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/apr: add upstream security fix for
 CVE-2023-49582
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
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2023-49582: Lax permissions set by the Apache Portable Runtime
library on Unix platforms would allow local users read access to named
shared memory segments, potentially revealing sensitive application data.
This issue does not affect non-Unix platforms, or builds with
APR_USE_SHMEM_SHMGET=1 (apr.h) Users are recommended to upgrade to APR
version 1.7.5, which fixes this issue.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
NOTICE: Add patch rather than bumping to 1.7.5 as the patches (0002-/0003-)
we have reverted to fix apr-build do not apply to 1.7.5 and to make
backporting to LTS easier.

 .../apr/0004-Merge-r1920082-from-1.8.x.patch  | 71 +++++++++++++++++++
 package/apr/apr.mk                            |  3 +
 2 files changed, 74 insertions(+)
 create mode 100644 package/apr/0004-Merge-r1920082-from-1.8.x.patch

diff --git a/package/apr/0004-Merge-r1920082-from-1.8.x.patch b/package/apr/0004-Merge-r1920082-from-1.8.x.patch
new file mode 100644
index 0000000000..5d198def34
--- /dev/null
+++ b/package/apr/0004-Merge-r1920082-from-1.8.x.patch
@@ -0,0 +1,71 @@
+From 36ea6d5a2bfc480dd8032cc8651e6793552bc2aa Mon Sep 17 00:00:00 2001
+From: Eric Covener <covener@apache.org>
+Date: Tue, 20 Aug 2024 21:50:42 +0000
+Subject: [PATCH] Merge r1920082 from 1.8.x:
+
+use 0600 perms for named shared mem consistently
+
+
+
+
+git-svn-id: https://svn.apache.org/repos/asf/apr/apr/branches/1.7.x@1920083 13f79535-47bb-0310-9956-ffa450edef68
+Upstream: https://github.com/apache/apr/commit/36ea6d5a2bfc480dd8032cc8651e6793552bc2aa
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ shmem/unix/shm.c | 18 +++++++-----------
+ 1 file changed, 7 insertions(+), 11 deletions(-)
+
+diff --git a/shmem/unix/shm.c b/shmem/unix/shm.c
+index 096884d99..ea9b94277 100644
+--- a/shmem/unix/shm.c
++++ b/shmem/unix/shm.c
+@@ -287,10 +287,9 @@ APR_DECLARE(apr_status_t) apr_shm_create(apr_shm_t **m,
+         status = APR_SUCCESS;
+     
+ #if APR_USE_SHMEM_MMAP_TMP
+-        /* FIXME: Is APR_OS_DEFAULT sufficient? */
+-        status = apr_file_open(&file, filename, 
+-                               APR_READ | APR_WRITE | APR_CREATE | APR_EXCL,
+-                               APR_OS_DEFAULT, pool);
++        status = apr_file_open(&file, filename,
++                               APR_FOPEN_READ | APR_FOPEN_WRITE | APR_FOPEN_CREATE | APR_FOPEN_EXCL,
++                               APR_FPROT_UREAD | APR_FPROT_UWRITE, pool);
+         if (status != APR_SUCCESS) {
+             return status;
+         }
+@@ -319,8 +318,7 @@ APR_DECLARE(apr_status_t) apr_shm_create(apr_shm_t **m,
+         }
+ #endif /* APR_USE_SHMEM_MMAP_TMP */
+ #if APR_USE_SHMEM_MMAP_SHM
+-        /* FIXME: SysV uses 0600... should we? */
+-        tmpfd = shm_open(shm_name, O_RDWR | O_CREAT | O_EXCL, 0644);
++        tmpfd = shm_open(shm_name, O_RDWR | O_CREAT | O_EXCL, 0600);
+         if (tmpfd == -1) {
+             return errno;
+         }
+@@ -361,10 +359,9 @@ APR_DECLARE(apr_status_t) apr_shm_create(apr_shm_t **m,
+ #elif APR_USE_SHMEM_SHMGET
+         new_m->realsize = reqsize;
+ 
+-        /* FIXME: APR_OS_DEFAULT is too permissive, switch to 600 I think. */
+-        status = apr_file_open(&file, filename, 
++        status = apr_file_open(&file, filename,
+                                APR_FOPEN_WRITE | APR_FOPEN_CREATE | APR_FOPEN_EXCL,
+-                               APR_OS_DEFAULT, pool);
++                               APR_FPROT_UREAD | APR_FPROT_UWRITE, pool);
+         if (status != APR_SUCCESS) {
+             return status;
+         }
+@@ -555,8 +552,7 @@ APR_DECLARE(apr_status_t) apr_shm_attach(apr_shm_t **m,
+ #if APR_USE_SHMEM_MMAP_SHM
+         const char *shm_name = make_shm_open_safe_name(filename, pool);
+ 
+-        /* FIXME: SysV uses 0600... should we? */
+-        tmpfd = shm_open(shm_name, O_RDWR, 0644);
++        tmpfd = shm_open(shm_name, O_RDWR, 0600);
+         if (tmpfd == -1) {
+             return errno;
+         }
+-- 
+2.39.5
+
diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index d4526a4172..5a41891cef 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -16,6 +16,9 @@ APR_INSTALL_STAGING = YES
 # so we need to autoreconf:
 APR_AUTORECONF = YES
 
+# 0004-Merge-r1920082-from-1.8.x.patch
+APR_IGNORE_CVES += CVE-2023-49582
+
 APR_CONF_OPTS = --disable-sctp
 
 # avoid apr_hints.m4 by setting apr_preload_done=yes and set
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
