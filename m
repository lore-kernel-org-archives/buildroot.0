Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB272C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B929424F0;
	Fri, 28 Feb 2025 16:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DIkyV14l6iT7; Fri, 28 Feb 2025 16:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0852A4F675
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0852A4F675;
	Fri, 28 Feb 2025 16:40:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10ED068
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45C3E4194D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WRna_qODDDVR for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0261D41A27
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0261D41A27
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0DC8844AB; Fri, 28 Feb 2025 16:29:41 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Dec 2024 22:19:13 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 310d46ca9646491d295547904d9c8f574dc52424
X-Git-Newrev: a60c38b381bbb46094f57fe1c252df962fab6673
X-Patchwork-Hint: ignore
Message-Id: <20250228162941.F0DC8844AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/apr: add upstream
 security fix for CVE-2023-49582
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

commit: https://git.buildroot.net/buildroot/commit/?id=a60c38b381bbb46094f57fe1c252df962fab6673
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes CVE-2023-49582: Lax permissions set by the Apache Portable Runtime
library on Unix platforms would allow local users read access to named
shared memory segments, potentially revealing sensitive application data.
This issue does not affect non-Unix platforms, or builds with
APR_USE_SHMEM_SHMGET=1 (apr.h) Users are recommended to upgrade to APR
version 1.7.5, which fixes this issue.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/apr/0004-Merge-r1920082-from-1.8.x.patch | 71 ++++++++++++++++++++++++
 package/apr/apr.mk                               |  3 +
 2 files changed, 74 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
