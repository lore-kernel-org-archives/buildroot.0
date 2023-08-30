Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC09C83F14
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 22:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16BC94185B;
	Wed, 30 Aug 2023 22:32:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16BC94185B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nG90B-ylYZlH; Wed, 30 Aug 2023 22:32:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 546C94187E;
	Wed, 30 Aug 2023 22:32:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 546C94187E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B3C51BF424
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 22:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 215EF41E5E
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 22:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 215EF41E5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rh52csmm8P7W for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 22:31:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3C1341E03
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 22:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3C1341E03
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFC2E866BC; Wed, 30 Aug 2023 22:31:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 00:08:22 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 90bee8d4484b2a773a020b5404ddb0e7e52f8bba
X-Git-Newrev: a4df6181072f40417d6b5a7f9bf10daf91b0f861
X-Patchwork-Hint: ignore
Message-Id: <20230830223118.DFC2E866BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/shadow: fix
 yescrypt-only build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a4df6181072f40417d6b5a7f9bf10daf91b0f861
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fixes:
http://autobuild.buildroot.net/results/afd/afd5d59f94986593cd697148f4cce2bf70e4d81b/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 35835f284932e1732317d21f01254beec2d93b4c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/shadow/0001-Fix-yescrypt-support.patch | 38 ++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/shadow/0001-Fix-yescrypt-support.patch b/package/shadow/0001-Fix-yescrypt-support.patch
new file mode 100644
index 0000000000..19427676ca
--- /dev/null
+++ b/package/shadow/0001-Fix-yescrypt-support.patch
@@ -0,0 +1,38 @@
+From 7a63017b3c873a59e3482322b7824160a8c8ca67 Mon Sep 17 00:00:00 2001
+11;rgb:f6f6/f5f5/f4f4From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 9 Jul 2023 10:55:03 +0200
+Subject: [PATCH] Fix yescrypt support
+
+Fixes build error:
+newusers.c: In function 'update_passwd':
+newusers.c:433:21: error: 'sflg' undeclared (first use in this function); did you mean 'rflg'?
+
+introduced by
+https://github.com/shadow-maint/shadow/commit/5cd04d03f94622c12220d4a6352824af081b8531
+which forgot to define sflg for these configure options:
+
+--without-sha-crypt --without-bcrypt --with-yescrypt
+
+Upstream: https://github.com/shadow-maint/shadow/commit/29da702491eea314b915ea9c7a83c9af80cf5797
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/newusers.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/newusers.c b/src/newusers.c
+index 7cb8434b..08f79798 100644
+--- a/src/newusers.c
++++ b/src/newusers.c
+@@ -60,7 +60,7 @@ static bool rflg = false;	/* create a system account */
+ #ifndef USE_PAM
+ static /*@null@*//*@observer@*/char *crypt_method = NULL;
+ #define cflg (NULL != crypt_method)
+-#if defined(USE_SHA_CRYPT) || defined(USE_BCRYPT)
++#if defined(USE_SHA_CRYPT) || defined(USE_BCRYPT) || defined(USE_YESCRYPT)
+ static bool sflg = false;
+ #endif
+ #ifdef USE_SHA_CRYPT
+-- 
+2.39.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
