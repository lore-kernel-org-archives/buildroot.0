Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC0DC05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 08:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF44A60A65;
	Mon,  6 Feb 2023 08:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF44A60A65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CPK87Md12plj; Mon,  6 Feb 2023 08:33:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE0DA60A63;
	Mon,  6 Feb 2023 08:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE0DA60A63
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 249AD1BF329
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 08:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A6F860A63
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 08:33:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A6F860A63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zg3bJSqDVzSA for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 08:33:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1717D60A62
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 08:33:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1717D60A62
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 030578390C; Mon,  6 Feb 2023 08:33:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 09:26:47 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 14e35225d8e314c4ded7799843fb80de8e182e28
X-Git-Newrev: a542730884998f5f421617c76b238ab4a67d17b8
X-Patchwork-Hint: ignore
Message-Id: <20230206083307.030578390C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/mariadb: fix
 build with libressl >= 3.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a542730884998f5f421617c76b238ab4a67d17b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

In file included from /tmp/instance-10/output-1/build/mariadb-10.3.36/vio/viosslfactories.c:18:
/tmp/instance-10/output-1/build/mariadb-10.3.36/vio/viosslfactories.c: In function 'get_dh2048':
/tmp/instance-10/output-1/build/mariadb-10.3.36/include/ssl_compat.h:68:45: error: invalid use of incomplete typedef 'DH' {aka 'struct dh_st'}
   68 | #define DH_set0_pqg(D,P,Q,G)            ((D)->p= (P), (D)->g= (G))
      |                                             ^~

Fixes:
 - http://autobuild.buildroot.org/results/524198344aafca58d214537af64c5961c407b0f8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 22e926e9af915303180d35b5c41ea5fbf411d753)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...sl_compat.h-fix-build-with-libressl-3.5.0.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/mariadb/0002-include-ssl_compat.h-fix-build-with-libressl-3.5.0.patch b/package/mariadb/0002-include-ssl_compat.h-fix-build-with-libressl-3.5.0.patch
new file mode 100644
index 0000000000..fd3e6e6607
--- /dev/null
+++ b/package/mariadb/0002-include-ssl_compat.h-fix-build-with-libressl-3.5.0.patch
@@ -0,0 +1,39 @@
+From 79ed770a37c8669390a58a4485dd8f5565fe2497 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 15 Jan 2023 19:12:05 +0100
+Subject: [PATCH] include/ssl_compat.h: fix build with libressl >= 3.5.0
+
+Fix the following build failure with libressl >= 3.5.0:
+
+In file included from /tmp/instance-10/output-1/build/mariadb-10.3.36/vio/viosslfactories.c:18:
+/tmp/instance-10/output-1/build/mariadb-10.3.36/vio/viosslfactories.c: In function 'get_dh2048':
+/tmp/instance-10/output-1/build/mariadb-10.3.36/include/ssl_compat.h:68:45: error: invalid use of incomplete typedef 'DH' {aka 'struct dh_st'}
+   68 | #define DH_set0_pqg(D,P,Q,G)            ((D)->p= (P), (D)->g= (G))
+      |                                             ^~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/524198344aafca58d214537af64c5961c407b0f8
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/MariaDB/server/pull/2435]
+---
+ include/ssl_compat.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/include/ssl_compat.h b/include/ssl_compat.h
+index 664f3aac87c..3678e5fa084 100644
+--- a/include/ssl_compat.h
++++ b/include/ssl_compat.h
+@@ -19,7 +19,8 @@
+ /* OpenSSL version specific definitions */
+ #if defined(OPENSSL_VERSION_NUMBER)
+ 
+-#if OPENSSL_VERSION_NUMBER >= 0x10100000L && !defined(LIBRESSL_VERSION_NUMBER)
++#if OPENSSL_VERSION_NUMBER >= 0x10100000L && \
++	!(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
+ #define HAVE_OPENSSL11 1
+ #define SSL_LIBRARY OpenSSL_version(OPENSSL_VERSION)
+ #define ERR_remove_state(X) ERR_clear_error()
+-- 
+2.39.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
