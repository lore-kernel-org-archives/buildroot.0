Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C7CC6FD19
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 19:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95AB960C24;
	Sun, 12 Mar 2023 19:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95AB960C24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 61e-yU0RClob; Sun, 12 Mar 2023 19:09:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C32A260C01;
	Sun, 12 Mar 2023 19:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C32A260C01
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C81191BF41A
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 19:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEDDE81467
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 19:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEDDE81467
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q3WlCnP9dFUC for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 19:09:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4A3281464
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 19:09:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4A3281464
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B37BA86F8C; Sun, 12 Mar 2023 19:09:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 20:04:36 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 6f4a6c053a65f8afe88b1bb58e6c50792962a774
X-Git-Newrev: 1292fef706b8ced55396f241375b3e6f5b9db68e
X-Patchwork-Hint: ignore
Message-Id: <20230312190900.B37BA86F8C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/asterisk: fix
 build with libressl
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

commit: https://git.buildroot.net/buildroot/commit/?id=1292fef706b8ced55396f241375b3e6f5b9db68e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure with libressl by using SSL_is_server
which is available since version 2.7.0 and
https://github.com/libressl-portable/openbsd/commit/d7ec516916c5eaac29b02d7a8ac6570f63b458f7:

iostream.c: In function 'ast_iostream_close':
iostream.c:559:41: error: invalid use of incomplete typedef 'SSL' {aka 'struct ssl_st'}
  559 |                         if (!stream->ssl->server) {
      |                                         ^~

Fixes:
 - http://autobuild.buildroot.org/results/ce4d62d00bb77ba5b303cacf6be7e350581a62f9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c8985cf50cca852cc5cc840a605e01713e758d40)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...6-main-iostream.c-fix-build-with-libressl.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/asterisk/0006-main-iostream.c-fix-build-with-libressl.patch b/package/asterisk/0006-main-iostream.c-fix-build-with-libressl.patch
new file mode 100644
index 0000000000..cdd3aa8cfb
--- /dev/null
+++ b/package/asterisk/0006-main-iostream.c-fix-build-with-libressl.patch
@@ -0,0 +1,38 @@
+From 9569fa20fec49f530170a3042afb99556cf66a2e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 17 Apr 2022 10:52:42 +0200
+Subject: [PATCH] main/iostream.c: fix build with libressl
+
+Fix the following build failure with libressl by using SSL_is_server
+which is available since version 2.7.0 and
+https://github.com/libressl-portable/openbsd/commit/d7ec516916c5eaac29b02d7a8ac6570f63b458f7:
+
+iostream.c: In function 'ast_iostream_close':
+iostream.c:559:41: error: invalid use of incomplete typedef 'SSL' {aka 'struct ssl_st'}
+  559 |                         if (!stream->ssl->server) {
+      |                                         ^~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/ce4d62d00bb77ba5b303cacf6be7e350581a62f9
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ main/iostream.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/main/iostream.c b/main/iostream.c
+index d060b6d6d4..b8ab80ec91 100644
+--- a/main/iostream.c
++++ b/main/iostream.c
+@@ -553,7 +553,7 @@ int ast_iostream_close(struct ast_iostream *stream)
+ 					ERR_error_string(sslerr, err), ssl_error_to_string(sslerr, res));
+ 			}
+ 
+-#if !defined(LIBRESSL_VERSION_NUMBER) && (OPENSSL_VERSION_NUMBER >= 0x10100000L)
++#if !(defined(LIBRESSL_VERSION_NUMBER) && (LIBRESSL_VERSION_NUMBER < 0x2070000L)) && (OPENSSL_VERSION_NUMBER >= 0x10100000L)
+ 			if (!SSL_is_server(stream->ssl)) {
+ #else
+ 			if (!stream->ssl->server) {
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
