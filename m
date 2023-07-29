Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5240AC0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 22:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAD9681E6B;
	Sat, 29 Jul 2023 22:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAD9681E6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VviPxu6HsNnY; Sat, 29 Jul 2023 22:14:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 379C581B17;
	Sat, 29 Jul 2023 22:14:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 379C581B17
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BDC381BF40A
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 22:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3E7E60F69
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 22:14:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3E7E60F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ac8OvFopOEx7 for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 22:14:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B667560F68
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 22:14:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B667560F68
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A37F583B7F; Sat, 29 Jul 2023 22:14:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 00:14:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d615c17eec5dd22aacd86e3c2bf2dca6ed401bb
X-Git-Newrev: 35835f284932e1732317d21f01254beec2d93b4c
X-Patchwork-Hint: ignore
Message-Id: <20230729221432.A37F583B7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shadow: fix yescrypt-only build
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

commit: https://git.buildroot.net/buildroot/commit/?id=35835f284932e1732317d21f01254beec2d93b4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/afd/afd5d59f94986593cd697148f4cce2bf70e4d81b/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
