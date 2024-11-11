Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E17D3ABC2
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 15:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A35C60073;
	Mon, 11 Nov 2024 15:58:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eY9OtObWTEqI; Mon, 11 Nov 2024 15:58:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F430605A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F430605A0;
	Mon, 11 Nov 2024 15:58:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A6366C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 15:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 684656066A
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 15:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3PuhVj5GB_gV for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 15:58:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 832036059A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 832036059A
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 15:58:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D803860AA; Mon, 11 Nov 2024 15:58:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Nov 2024 16:46:50 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: c19c359e5e83aa8011014ce7ad4252a3625a4415
X-Git-Newrev: 2ea3cbc653712585a83e912158b7acbdcaa9f01e
X-Patchwork-Hint: ignore
Message-Id: <20241111155827.3D803860AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/postgresql: fix
 build without BR2_TOOLCHAIN_HAS_THREADS_NPTL
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ea3cbc653712585a83e912158b7acbdcaa9f01e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Since commit: https://git.postgresql.org/gitweb/?p=postgresql.git;a=commit;h=52afe563206e753f4c45c014fee2459ad0855826
postgrsql fails to build with toolchains without threads support:

misc.c: In function 'ecpg_gettext':
misc.c:541:51: error: 'PTHREAD_MUTEX_INITIALIZER' undeclared (first use in this function)
  541 |         static pthread_mutex_t binddomain_mutex = PTHREAD_MUTEX_INITIALIZER;
      |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
misc.c:541:51: note: each undeclared identifier is reported only once for each function it appears in
misc.c:552:24: warning: implicit declaration of function 'pthread_mutex_lock' [-Wimplicit-function-declaration]
  552 |                 (void) pthread_mutex_lock(&binddomain_mutex);
      |                        ^~~~~~~~~~~~~~~~~~
misc.c:569:24: warning: implicit declaration of function 'pthread_mutex_unlock' [-Wimplicit-function-declaration]
  569 |                 (void) pthread_mutex_unlock(&binddomain_mutex);
      |                        ^~~~~~~~~~~~~~~~~~~~

Option "--disable-thread-safety" will be dropped in PG 17, so
this patch is needed only for 16.x branch.

Fixes: 73dd1d6b9666 ("package/postgresql: security bump version to 16.3")
Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 747a41c19c3ab49981beff8166679a9f49acf0d8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Fix-compile-without-threads.patch         | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/package/postgresql/0001-Fix-compile-without-threads.patch b/package/postgresql/0001-Fix-compile-without-threads.patch
new file mode 100644
index 0000000000..a280df540f
--- /dev/null
+++ b/package/postgresql/0001-Fix-compile-without-threads.patch
@@ -0,0 +1,87 @@
+From 6c71182dde4d37fd70ee8015f61935254ae6f9a6 Mon Sep 17 00:00:00 2001
+From: Maxim Kochetkov <fido_max@inbox.ru>
+Date: Thu, 19 Sep 2024 10:04:05 +0300
+Subject: [PATCH] Fix compile without threads
+
+All mutexes should be wrapped by #ifdef ENABLE_THREAD_SAFETY.
+
+Fixes: https://git.postgresql.org/gitweb/?p=postgresql.git;a=commit;h=52afe563206e753f4c45c014fee2459ad0855826
+Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
+Signed-off-by: Maxim Kochetkov <m.kochetkov@yadro.com>
+Upstream: N/A, as --disable-thread-safety will disappear in PostgreSQL 17.
+---
+ src/interfaces/ecpg/ecpglib/misc.c | 6 ++++++
+ src/interfaces/libpq/fe-misc.c     | 6 ++++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/src/interfaces/ecpg/ecpglib/misc.c b/src/interfaces/ecpg/ecpglib/misc.c
+index 4b54322926..5a4d2e847e 100644
+--- a/src/interfaces/ecpg/ecpglib/misc.c
++++ b/src/interfaces/ecpg/ecpglib/misc.c
+@@ -538,7 +538,9 @@ ecpg_gettext(const char *msgid)
+ 	 * might as well do it the same way everywhere.
+ 	 */
+ 	static volatile bool already_bound = false;
++#ifdef ENABLE_THREAD_SAFETY
+ 	static pthread_mutex_t binddomain_mutex = PTHREAD_MUTEX_INITIALIZER;
++#endif
+ 
+ 	if (!already_bound)
+ 	{
+@@ -549,7 +551,9 @@ ecpg_gettext(const char *msgid)
+ 		int			save_errno = errno;
+ #endif
+ 
++#ifdef ENABLE_THREAD_SAFETY
+ 		(void) pthread_mutex_lock(&binddomain_mutex);
++#endif
+ 
+ 		if (!already_bound)
+ 		{
+@@ -566,7 +570,9 @@ ecpg_gettext(const char *msgid)
+ 			already_bound = true;
+ 		}
+ 
++#ifdef ENABLE_THREAD_SAFETY
+ 		(void) pthread_mutex_unlock(&binddomain_mutex);
++#endif
+ 
+ #ifdef WIN32
+ 		SetLastError(save_errno);
+diff --git a/src/interfaces/libpq/fe-misc.c b/src/interfaces/libpq/fe-misc.c
+index 488f7d6e55..2185e0ba7a 100644
+--- a/src/interfaces/libpq/fe-misc.c
++++ b/src/interfaces/libpq/fe-misc.c
+@@ -1232,7 +1232,9 @@ libpq_binddomain(void)
+ 	 * might as well do it the same way everywhere.
+ 	 */
+ 	static volatile bool already_bound = false;
++#ifdef ENABLE_THREAD_SAFETY
+ 	static pthread_mutex_t binddomain_mutex = PTHREAD_MUTEX_INITIALIZER;
++#endif
+ 
+ 	if (!already_bound)
+ 	{
+@@ -1243,7 +1245,9 @@ libpq_binddomain(void)
+ 		int			save_errno = errno;
+ #endif
+ 
++#ifdef ENABLE_THREAD_SAFETY
+ 		(void) pthread_mutex_lock(&binddomain_mutex);
++#endif
+ 
+ 		if (!already_bound)
+ 		{
+@@ -1260,7 +1264,9 @@ libpq_binddomain(void)
+ 			already_bound = true;
+ 		}
+ 
++#ifdef ENABLE_THREAD_SAFETY
+ 		(void) pthread_mutex_unlock(&binddomain_mutex);
++#endif
+ 
+ #ifdef WIN32
+ 		SetLastError(save_errno);
+-- 
+2.45.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
