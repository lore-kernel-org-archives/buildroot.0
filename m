Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50485EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 14:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F10A060E3E;
	Sat,  1 Jul 2023 14:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F10A060E3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zPIGY5dN1sHK; Sat,  1 Jul 2023 14:13:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1742560ABD;
	Sat,  1 Jul 2023 14:13:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1742560ABD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CFC231BF349
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7A0E4161D
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:13:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7A0E4161D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2e2Y7ucJkbH2 for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 14:13:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6ED8341610
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 14:13:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ED8341610
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FC2185DD5; Sat,  1 Jul 2023 14:13:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Jul 2023 16:09:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bca9d7e58a23fc8c4a27be7971ace1fc84526d22
X-Git-Newrev: 2d9ccbcd109e69e341864c975f593cedb2ec6ae8
X-Patchwork-Hint: ignore
Message-Id: <20230701141350.4FC2185DD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/audit: update musl fix
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2d9ccbcd109e69e341864c975f593cedb2ec6ae8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream proposed a different fix:
https://github.com/linux-audit/audit-userspace/pull/311#issuecomment-1609953611

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-Define-__attribute_malloc__-when-needed.patch | 35 +++++++++++++++++++
 ...ttribute_malloc__-with-__attribute__-__ma.patch | 39 ----------------------
 2 files changed, 35 insertions(+), 39 deletions(-)

diff --git a/package/audit/0001-Define-__attribute_malloc__-when-needed.patch b/package/audit/0001-Define-__attribute_malloc__-when-needed.patch
new file mode 100644
index 0000000000..3dd5359bfc
--- /dev/null
+++ b/package/audit/0001-Define-__attribute_malloc__-when-needed.patch
@@ -0,0 +1,35 @@
+From cf93d8579d5cec0b1ba585bd661776f03c2743ba Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 27 Jun 2023 20:19:13 +0200
+Subject: [PATCH] Define __attribute_malloc__ when needed
+
+attribute_malloc is not available on musl
+
+auparse.h: In function 'auparse_init':
+auparse.h:54:2: error: expected declaration specifiers before '__attribute_malloc__'
+   54 |  __attribute_malloc__ __attr_dealloc (auparse_destroy, 1);
+
+Upstream: https://github.com/linux-audit/audit-userspace/pull/311
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ auparse/auparse.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/auparse/auparse.h b/auparse/auparse.h
+index 95cf256d..5cb7402e 100644
+--- a/auparse/auparse.h
++++ b/auparse/auparse.h
+@@ -32,6 +32,9 @@
+ # define __attr_dealloc(dealloc, argno)
+ # define __attr_dealloc_free
+ #endif
++#ifndef __attribute_malloc__
++#  define __attribute_malloc__
++#endif
+ 
+ #ifdef __cplusplus
+ extern "C" {
+-- 
+2.39.2
+
diff --git a/package/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch b/package/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
deleted file mode 100644
index 1a276ca2df..0000000000
--- a/package/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 79c8d6a2755c9dfa00a5e86378e89a94eef0504d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 9 Aug 2022 23:57:03 -0700
-Subject: [PATCH] Replace __attribute_malloc__ with 
- __attribute__((__malloc__))
-
-__attribute_malloc__ is not available on musl
-
-Fixes
-| ../../git/auparse/auparse.h:54:2: error: expected function body after function declarator
-|         __attribute_malloc__ __attr_dealloc (auparse_destroy, 1);
-|         ^
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream: https://github.com/linux-audit/audit-userspace/pull/311
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
-
- auparse/auparse.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/auparse/auparse.h b/auparse/auparse.h
-index 95cf256d..c7dbe5ff 100644
---- a/auparse/auparse.h
-+++ b/auparse/auparse.h
-@@ -51,7 +51,7 @@ typedef void (*auparse_callback_ptr)(auparse_state_t *au,
- void auparse_destroy(auparse_state_t *au);
- void auparse_destroy_ext(auparse_state_t *au, auparse_destroy_what_t what);
- auparse_state_t *auparse_init(ausource_t source, const void *b)
--	__attribute_malloc__ __attr_dealloc (auparse_destroy, 1);
-+	__attribute__((__malloc__)) __attr_dealloc (auparse_destroy, 1);
- int auparse_new_buffer(auparse_state_t *au, const char *data, size_t data_len)
- 	__attr_access ((__read_only__, 2, 3));
- int auparse_feed(auparse_state_t *au, const char *data, size_t data_len)
--- 
-2.37.1
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
