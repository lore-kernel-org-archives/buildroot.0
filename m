Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDFFC54795
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 16:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8761E81186;
	Mon, 19 May 2025 16:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gVvtFANwhFdW; Mon, 19 May 2025 16:42:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B44D48120F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B44D48120F;
	Mon, 19 May 2025 16:42:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D6CC8205
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC151403C8
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id czMBA3ish8Wd for <buildroot@buildroot.org>;
 Mon, 19 May 2025 16:42:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B27EE405DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B27EE405DE
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:42:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0B808746E; Mon, 19 May 2025 16:42:29 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 18:40:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 45cdb5decb6e9c5f0e908c055b2cd721f0e8c476
X-Git-Newrev: 76dbbe8f419048d83e882f9132a62c16155a0702
X-Patchwork-Hint: ignore
Message-Id: <20250519164229.A0B808746E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mrouted: fix build
 with gcc-15.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=76dbbe8f419048d83e882f9132a62c16155a0702
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mrouted/0001-gcc15.patch | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/mrouted/0001-gcc15.patch b/package/mrouted/0001-gcc15.patch
new file mode 100644
index 0000000000..781f83f5c7
--- /dev/null
+++ b/package/mrouted/0001-gcc15.patch
@@ -0,0 +1,33 @@
+From cdb388c8dc6e661d2a23f1e9b79102bc68e89af5 Mon Sep 17 00:00:00 2001
+From: Philippe Troin <phil+github-commits@fifi.org>
+Date: Wed, 23 Apr 2025 16:04:20 -0700
+Subject: [PATCH] C23 compatibility.
+
+bool is a keyword in C23.
+
+Upstream: https://github.com/troglobit/mrouted/pull/65
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/kern.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/kern.c b/src/kern.c
+index 27f8dd4..04f1c36 100644
+--- a/src/kern.c
++++ b/src/kern.c
+@@ -104,11 +104,11 @@ void k_set_rcvbuf(int bufsize, int minsize)
+  * in the kernel and "panic". The kernel patch for netinet/ip_raw.c
+  * coming with this distribution fixes it.
+  */
+-void k_hdr_include(int bool)
++void k_hdr_include(int flag)
+ {
+ #ifdef IP_HDRINCL
+-    if (setsockopt(igmp_socket, IPPROTO_IP, IP_HDRINCL, &bool, sizeof(bool)) < 0)
+-        logit(LOG_ERR, errno, "Failed setting socket IP_HDRINCL %u", bool);
++    if (setsockopt(igmp_socket, IPPROTO_IP, IP_HDRINCL, &flag, sizeof(flag)) < 0)
++        logit(LOG_ERR, errno, "Failed setting socket IP_HDRINCL %u", flag);
+ #endif
+ }
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
