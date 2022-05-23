Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E00C433F5
	for <buildroot@archiver.kernel.org>; Mon, 23 May 2022 11:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21B7C83FEC;
	Mon, 23 May 2022 11:02:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8W8YvG5xR_Aj; Mon, 23 May 2022 11:02:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 193C883FC3;
	Mon, 23 May 2022 11:02:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CFE091BF30A
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 11:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC9A4607F9
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 11:02:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0BD5l7iOy2QY for <buildroot@lists.busybox.net>;
 Mon, 23 May 2022 11:02:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E70646070A
 for <buildroot@buildroot.org>; Mon, 23 May 2022 11:02:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F23FA86382; Mon, 23 May 2022 10:50:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 23 May 2022 12:56:50 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 00ce9b0e5588fe30814e10463f03dc1e6887de31
X-Git-Newrev: cafc0925c1d28db9dcdf93af380606e7dc49c278
X-Patchwork-Hint: ignore
Message-Id: <20220523105058.F23FA86382@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 package/shadowsocks-libev: fix maybe-uninitialized errors
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

commit: https://git.buildroot.net/buildroot/commit/?id=cafc0925c1d28db9dcdf93af380606e7dc49c278
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure:

local.c: In function 'create_and_bind':
local.c:218:12: error: 'listen_sock' may be used uninitialized in this function [-Werror=maybe-uninitialized]
  218 |     return listen_sock;
      |            ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/27471a878ff52a972ac087d534e44fb0c50808f6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit eb952597c373ef11ea396df473c145a41adc742f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-fix-maybe-uninitialized-errors.patch      | 93 ++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch b/package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch
new file mode 100644
index 0000000000..5275323e65
--- /dev/null
+++ b/package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch
@@ -0,0 +1,93 @@
+From 0c23224e926463b1097414979367655a27fa6d60 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 7 Apr 2022 18:27:58 +0200
+Subject: [PATCH] fix maybe-uninitialized errors
+
+Set {listen,server}_sock to -1 when needed as already done in
+src/manager.c by commit ecf1fcc84594b09ed2d61e3677cd8e62bd897ccb to
+avoid the following build failure:
+
+local.c: In function 'create_and_bind':
+local.c:218:12: error: 'listen_sock' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+  218 |     return listen_sock;
+      |            ^~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/27471a878ff52a972ac087d534e44fb0c50808f6
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/shadowsocks/shadowsocks-libev/commit/0c23224e926463b1097414979367655a27fa6d60]
+---
+ src/local.c    | 2 +-
+ src/redir.c    | 2 +-
+ src/server.c   | 2 +-
+ src/tunnel.c   | 2 +-
+ src/udprelay.c | 2 +-
+ 5 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/local.c b/src/local.c
+index b1ab040bb..47d634ce5 100644
+--- a/src/local.c
++++ b/src/local.c
+@@ -168,7 +168,7 @@ create_and_bind(const char *addr, const char *port)
+ {
+     struct addrinfo hints;
+     struct addrinfo *result, *rp;
+-    int s, listen_sock;
++    int s, listen_sock = -1;
+ 
+     memset(&hints, 0, sizeof(struct addrinfo));
+     hints.ai_family   = AF_UNSPEC;   /* Return IPv4 and IPv6 choices */
+diff --git a/src/redir.c b/src/redir.c
+index 4a5a489f0..e60bd4870 100644
+--- a/src/redir.c
++++ b/src/redir.c
+@@ -147,7 +147,7 @@ create_and_bind(const char *addr, const char *port)
+ {
+     struct addrinfo hints;
+     struct addrinfo *result, *rp;
+-    int s, listen_sock;
++    int s, listen_sock = -1;
+ 
+     memset(&hints, 0, sizeof(struct addrinfo));
+     hints.ai_family   = AF_UNSPEC;   /* Return IPv4 and IPv6 choices */
+diff --git a/src/server.c b/src/server.c
+index e9cdc2619..073e38b22 100644
+--- a/src/server.c
++++ b/src/server.c
+@@ -550,7 +550,7 @@ create_and_bind(const char *host, const char *port, int mptcp)
+ {
+     struct addrinfo hints;
+     struct addrinfo *result, *rp, *ipv4v6bindall;
+-    int s, listen_sock;
++    int s, listen_sock = -1;
+ 
+     memset(&hints, 0, sizeof(struct addrinfo));
+     hints.ai_family   = AF_UNSPEC;               /* Return IPv4 and IPv6 choices */
+diff --git a/src/tunnel.c b/src/tunnel.c
+index e0886bdb9..6641fe62a 100644
+--- a/src/tunnel.c
++++ b/src/tunnel.c
+@@ -129,7 +129,7 @@ create_and_bind(const char *addr, const char *port)
+ {
+     struct addrinfo hints;
+     struct addrinfo *result, *rp;
+-    int s, listen_sock;
++    int s, listen_sock = -1;
+ 
+     memset(&hints, 0, sizeof(struct addrinfo));
+     hints.ai_family   = AF_UNSPEC;   /* Return IPv4 and IPv6 choices */
+diff --git a/src/udprelay.c b/src/udprelay.c
+index 23a042497..580ad4bd8 100644
+--- a/src/udprelay.c
++++ b/src/udprelay.c
+@@ -446,7 +446,7 @@ create_server_socket(const char *host, const char *port)
+ {
+     struct addrinfo hints;
+     struct addrinfo *result, *rp, *ipv4v6bindall;
+-    int s, server_sock;
++    int s, server_sock = -1;
+ 
+     memset(&hints, 0, sizeof(struct addrinfo));
+     hints.ai_family   = AF_UNSPEC;               /* Return IPv4 and IPv6 choices */
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
