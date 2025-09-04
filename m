Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378E1CA1012
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 20:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA32B406D2;
	Thu,  4 Sep 2025 20:16:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sLL-GnUeMBei; Thu,  4 Sep 2025 20:16:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17EFD405E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17EFD405E6;
	Thu,  4 Sep 2025 20:16:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 50044111
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 20:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 416E4405E2
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 20:16:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UGORHFTwXro0 for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 20:16:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D447D405BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D447D405BD
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D447D405BD
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 20:16:35 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 924821501; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 04 Sep 2025 20:16:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uuGNj-003FNt-0D;
 Thu, 04 Sep 2025 22:16:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu,  4 Sep 2025 22:16:29 +0200
Message-Id: <20250904201630.774094-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Q8eO9rCm+HkI6Rpdboj0y39t/GxzYzlMefb4qcnA2DIesfaQf+cL7VGUbvhNamy5pMLdcMG+j/GDePFQfWtm4gMctvNf1UNCZUShd1/5Cy58OIk8WyjjmDIujDVHAaaLbg2DFheZS15k21f+e///Jb41uW0lE/8RRHegcs//ehV6C+TQv44Rrzyu72i72puQ3zqij1CIzmDNSsUQWOLOKxzEv9zMMiPEndxlU3WN4OCam5RWhCF/B+9h2sU538FU9KoxsLyIuVY+gJHNHW79qfI1JkhkL9gpKe+is+dnZOOADevlwOg6Zeiyy9/kfXR2ZmhzajuN2rERcSdBns5GfQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=4I1flc7vbi/d9ZpmCmlMe15mthRaT/GiLd5m/ehy1cc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=Q8eO9rCm
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/sslh: add upstream patch to fix build
 w/ gcc-15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
 ...002-fix-warnings-on-sockaddr-storage.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/sslh/0002-fix-warnings-on-sockaddr-storage.patch

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
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
