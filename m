Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA56CA1013
	for <buildroot@archiver.kernel.org>; Fri,  5 Sep 2025 11:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08422814BC;
	Fri,  5 Sep 2025 11:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uJpsq-FurYBT; Fri,  5 Sep 2025 11:30:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 189D481307
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 189D481307;
	Fri,  5 Sep 2025 11:30:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A13101E04
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 11:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F63181307
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 11:30:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZwaSyCdDQECC for <buildroot@buildroot.org>;
 Fri,  5 Sep 2025 11:30:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCE0D812C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCE0D812C0
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 11:30:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B7BF38357B; Fri,  5 Sep 2025 11:30:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Sep 2025 13:18:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 717138c83c857d1dd119750f1af6eda033d9206f
X-Git-Newrev: dc50e439b306687e3fcee1f9d012e4d9989d3985
X-Patchwork-Hint: ignore
Message-Id: <20250905113015.B7BF38357B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sslh: add upstream patch to fix
 build w/ gcc-15
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc50e439b306687e3fcee1f9d012e4d9989d3985
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream patch to fix a build issue related to struct
sockaddr_storage:

udp-listener.c: In function 'cnx_cmp':
udp-listener.c:39:30: error: initialization of 'struct sockaddr *' from incompatible pointer type 'struct sockaddr_storage *' [-Wincompatible-pointer-types]
   39 |     struct sockaddr* addr1 = &cnx1->client_addr;
      |                              ^
udp-listener.c:42:30: error: initialization of 'struct sockaddr *' from incompatible pointer type 'struct sockaddr_storage *' [-Wincompatible-pointer-types]
   42 |     struct sockaddr* addr2 = &cnx2->client_addr;
      |                              ^
udp-listener.c: In function 'hash_make_key':
udp-listener.c:55:29: error: initialization of 'struct sockaddr *' from incompatible pointer type 'struct sockaddr_storage *' [-Wincompatible-pointer-types]
   55 |     struct sockaddr* addr = &new->client_addr;
      |                             ^
udp-listener.c: In function 'udp_s2c_forward':
udp-listener.c:330:18: error: passing argument 5 of 'sendto' from incompatible pointer type [-Wincompatible-pointer-types]
  330 |                  &cnx->client_addr, cnx->addrlen);
      |                  ^~~~~~~~~~~~~~~~~
      |                  |
      |                  struct sockaddr_storage *

Fixes:

  https://autobuild.buildroot.net/results/0cbbb75c4aab19b9d5f42695359ac6fe97e5989b/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-fix-warnings-on-sockaddr-storage.patch    | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/sslh/0002-fix-warnings-on-sockaddr-storage.patch b/package/sslh/0002-fix-warnings-on-sockaddr-storage.patch
new file mode 100644
index 0000000000..4df920f718
--- /dev/null
+++ b/package/sslh/0002-fix-warnings-on-sockaddr-storage.patch
@@ -0,0 +1,56 @@
+From 402ca5219b5dcf7a502cd3f75906423527837a7a Mon Sep 17 00:00:00 2001
+From: Yves Rutschle <git1@rutschle.net>
+Date: Thu, 4 Jan 2024 23:22:44 +0100
+Subject: [PATCH] fix warnings on sockaddr storage
+
+Upstream: https://github.com/yrutschle/sslh/commit/402ca5219b5dcf7a502cd3f75906423527837a7a
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ udp-listener.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/udp-listener.c b/udp-listener.c
+index 570e480..bc7a3f4 100644
+--- a/udp-listener.c
++++ b/udp-listener.c
+@@ -36,10 +36,10 @@
+ 
+ static int cnx_cmp(struct connection* cnx1, struct connection* cnx2)
+ {
+-    struct sockaddr* addr1 = &cnx1->client_addr;
++    struct sockaddr_storage* addr1 = &cnx1->client_addr;
+     socklen_t addrlen1 = cnx1->addrlen;
+ 
+-    struct sockaddr* addr2 = &cnx2->client_addr;
++    struct sockaddr_storage* addr2 = &cnx2->client_addr;
+     socklen_t addrlen2 = cnx2->addrlen;
+ 
+     if (addrlen1 != addrlen2) return -1;
+@@ -52,13 +52,13 @@ static int cnx_cmp(struct connection* cnx1, struct connection* cnx2)
+  * lowest bytes of remote port */
+ static int hash_make_key(hash_item new)
+ {
+-    struct sockaddr* addr = &new->client_addr;
++    struct sockaddr_storage* addr = &new->client_addr;
+     //socklen_t addrlen = new->addrlen;
+     struct sockaddr_in* addr4;
+     struct sockaddr_in6* addr6;
+     int out;
+ 
+-    switch (addr->sa_family) {
++    switch (((struct sockaddr*)addr)->sa_family) {
+     case AF_INET:
+         addr4 = (struct sockaddr_in*)addr;
+         out = addr4->sin_port;
+@@ -327,7 +327,7 @@ void udp_s2c_forward(struct connection* cnx)
+     if ((res == -1) && ((errno == EAGAIN) || (errno == EWOULDBLOCK))) return;
+     CHECK_RES_DIE(res, "udp_listener/recvfrom");
+     res = sendto(cnx->local_endpoint, data, res, 0,
+-                 &cnx->client_addr, cnx->addrlen);
++                 (struct sockaddr*)&cnx->client_addr, cnx->addrlen);
+     mark_active(cnx);
+ }
+ 
+-- 
+2.39.5
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
