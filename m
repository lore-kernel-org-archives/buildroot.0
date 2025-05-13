Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB0DC3ABC3
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 16:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A72D82131;
	Tue, 13 May 2025 16:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-SVTanSLRgU; Tue, 13 May 2025 16:58:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81BBE820D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81BBE820D4;
	Tue, 13 May 2025 16:58:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3116412A
 for <buildroot@buildroot.org>; Tue, 13 May 2025 16:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2261960876
 for <buildroot@buildroot.org>; Tue, 13 May 2025 16:58:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gzuC4u9-xHAP for <buildroot@buildroot.org>;
 Tue, 13 May 2025 16:58:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31F8260890
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31F8260890
 for <buildroot@buildroot.org>; Tue, 13 May 2025 16:58:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27EF28680F; Tue, 13 May 2025 16:58:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 May 2025 18:49:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 915a351e2fadb334b5b1eb0e5387b7a5264168a9
X-Git-Newrev: a8cfe9986c9de8f575dc94e242c0ccc26e03b19d
X-Patchwork-Hint: ignore
Message-Id: <20250513165826.27EF28680F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/connman: fix CVE-2025-32366
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8cfe9986c9de8f575dc94e242c0ccc26e03b19d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In ConnMan through 1.44, parse_rr in dnsproxy.c has a memcpy length
that depends on an RR RDLENGTH value (i.e., *rdlen=ntohs(rr->rdlen)
and memcpy(response+offset,*end,*rdlen)). Here, rdlen may be larger
than the amount of remaining packet data in the current state of
parsing. As a result, values of stack memory locations may be sent
over the network in a response.

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-32366

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...roxy-Address-CVE-2025-32366-vulnerability.patch | 41 ++++++++++++++++++++++
 package/connman/connman.mk                         |  3 ++
 2 files changed, 44 insertions(+)

diff --git a/package/connman/0002-dnsproxy-Address-CVE-2025-32366-vulnerability.patch b/package/connman/0002-dnsproxy-Address-CVE-2025-32366-vulnerability.patch
new file mode 100644
index 0000000000..9651b2dfe4
--- /dev/null
+++ b/package/connman/0002-dnsproxy-Address-CVE-2025-32366-vulnerability.patch
@@ -0,0 +1,41 @@
+From 8d3be0285f1d4667bfe85dba555c663eb3d704b4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?=EC=8B=A0=EC=9C=A4=EC=A0=9C=28=ED=95=99=EB=B6=80=EC=83=9D-?=
+ =?UTF-8?q?=EC=86=8C=ED=94=84=ED=8A=B8=EC=9B=A8=EC=96=B4=EC=A0=84=EA=B3=B5?=
+ =?UTF-8?q?=29?= <ioerts@kookmin.ac.kr>
+Date: Mon, 12 May 2025 10:48:18 +0200
+Subject: [PATCH] dnsproxy: Address CVE-2025-32366 vulnerability
+
+In Connman parse_rr in dnsproxy.c has a memcpy length
+that depends on an RR RDLENGTH value (i.e., *rdlen=ntohs(rr->rdlen)
+and memcpy(response+offset,*end,*rdlen)). Here, rdlen may be larger
+than the amount of remaining packet data in the current state of
+parsing. As a result, values of stack memory locations may be sent
+over the network in a response.
+
+This patch adds a check to ensure that (*end + *rdlen) does not exceed
+the valid range. If the condition is violated, the function returns
+-EINVAL.
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=8d3be0285f1d4667bfe85dba555c663eb3d704b4
+---
+ src/dnsproxy.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/dnsproxy.c b/src/dnsproxy.c
+index 7ee26d9ff886..1dd2f7f5d47e 100644
+--- a/src/dnsproxy.c
++++ b/src/dnsproxy.c
+@@ -998,6 +998,9 @@ static int parse_rr(const unsigned char *buf, const unsigned char *start,
+ 	if ((offset + *rdlen) > *response_size)
+ 		return -ENOBUFS;
+ 
++	if ((*end + *rdlen) > max)
++		return -EINVAL;
++
+ 	memcpy(response + offset, *end, *rdlen);
+ 
+ 	*end += *rdlen;
+-- 
+2.43.0
+
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 5d515c2963..c9637eadf5 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -16,6 +16,9 @@ CONNMAN_CPE_ID_VENDOR = intel
 # 0001-dnsproxy-Fix-NULL-empty-lookup-causing-potential-cra.patch
 CONNMAN_IGNORE_CVES += CVE-2025-32743
 
+# 0002-dnsproxy-Address-CVE-2025-32366-vulnerability.patch
+CONNMAN_IGNORE_CVES += CVE-2025-32366
+
 CONNMAN_CONF_OPTS = --with-dbusconfdir=/etc
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
