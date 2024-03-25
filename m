Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F623C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 07:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5392C81815;
	Mon, 25 Mar 2024 07:34:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BElUQ26YnZr5; Mon, 25 Mar 2024 07:34:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0432B818A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0432B818A7;
	Mon, 25 Mar 2024 07:34:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D8771BF954
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 07:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 185A3606F3
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 07:34:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G7t1ttWCFbWD for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 07:34:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39CCF60845
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39CCF60845
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 07:34:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2326283CE3; Mon, 25 Mar 2024 07:34:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 08:31:34 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 44f3a0c6dc8aa4ea6879983a960af85b7b317051
X-Git-Newrev: f53e8f3abf757d1d7b58f22a159fadc6d593f8a4
X-Patchwork-Hint: ignore
Message-Id: <20240325073406.2326283CE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/spice: fix
 libressl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=f53e8f3abf757d1d7b58f22a159fadc6d593f8a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fix the following build failure raised since bump of libressl to version
3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

red-stream.cpp: In function 'RedStreamSslStatus red_stream_ssl_accept(RedStream*)':
red-stream.cpp:526:22: error: invalid use of incomplete type 'SSL' {aka 'struct ssl_st'}
  526 |     stream->priv->ssl->s3->flags |= SSL3_FLAGS_NO_RENEGOTIATE_CIPHERS;
      |                      ^~
In file included from /home/buildroot/autobuild/instance-1/output-1/host/i686-buildroot-linux-gnu/sysroot/usr/include/openssl/err.h:120,
                 from red-stream.cpp:33:
/home/buildroot/autobuild/instance-1/output-1/host/i686-buildroot-linux-gnu/sysroot/usr/include/openssl/ossl_typ.h:173:16: note: forward declaration of 'SSL' {aka 'struct ssl_st'}
  173 | typedef struct ssl_st SSL;
      |                ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/273eadf9e49af55e0932a8293ca65762fb43114f
 - http://autobuild.buildroot.org/results/97601f321efc532de0c2ea6aa618ce11fad9e851

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4e5ea3163094e4c8cf185959b983ce95c97944e4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...add-SSL_OP_NO_RENEGOTIATION-fallback-path.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/spice/0001-server-add-SSL_OP_NO_RENEGOTIATION-fallback-path.patch b/package/spice/0001-server-add-SSL_OP_NO_RENEGOTIATION-fallback-path.patch
new file mode 100644
index 0000000000..edb8b2ed17
--- /dev/null
+++ b/package/spice/0001-server-add-SSL_OP_NO_RENEGOTIATION-fallback-path.patch
@@ -0,0 +1,43 @@
+From 5e580eefac44d0c709afcf93eb5fca2fb353166a Mon Sep 17 00:00:00 2001
+From: orbea <orbea@riseup.net>
+Date: Fri, 26 May 2023 13:38:34 -0700
+Subject: [PATCH] server: add SSL_OP_NO_RENEGOTIATION fallback path
+
+With LibreSSL SSL_OP_NO_CLIENT_RENEGOTIATION is opaque which is not
+compatible with the OpenSSL 1.0.2 and earlier code path in
+red-stream.cpp while SSL_OP_NO_RENEGOTIATION is not yet defined for the
+newer OpenSSL code path in reds.cpp.
+
+So with OpenSSL 1.1.0 and later if SSL_OP_NO_RENEGOTIATION is undefined
+and SSL_OP_NO_CLIENT_RENEGOTIATION is defined then define the former as
+the latter. This will allow the build to succeed with LibreSSL 3.7.2 and
+in the future when newer LibreSSL versions add SSL_OP_NO_RENEGOTIATION
+that code path will then be used automatically.
+
+Signed-off-by: orbea <orbea@riseup.net>
+Acked-by: Frediano Ziglio <freddy77@gmail.com>
+
+Upstream: https://gitlab.freedesktop.org/spice/spice/-/commit/5e580eefac44d0c709afcf93eb5fca2fb353166a
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ server/red-stream.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/server/red-stream.h b/server/red-stream.h
+index 716e93317..8e57c5e5e 100644
+--- a/server/red-stream.h
++++ b/server/red-stream.h
+@@ -25,6 +25,10 @@
+ 
+ SPICE_BEGIN_DECLS
+ 
++#if OPENSSL_VERSION_NUMBER >= 0x10100000L && !defined(SSL_OP_NO_RENEGOTIATION) && defined(SSL_OP_NO_CLIENT_RENEGOTIATION)
++#define SSL_OP_NO_RENEGOTIATION SSL_OP_NO_CLIENT_RENEGOTIATION
++#endif
++
+ typedef void (*AsyncReadDone)(void *opaque);
+ typedef void (*AsyncReadError)(void *opaque, int err);
+ 
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
