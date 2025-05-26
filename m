Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7C3C5B552
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DB1441774;
	Sat, 31 May 2025 16:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bA0D11AwYA6e; Sat, 31 May 2025 16:55:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5889F41784
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5889F41784;
	Sat, 31 May 2025 16:55:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DD86127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6D9283C63
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BfJUZ9aKbiw9 for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:55:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66DD483BAF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66DD483BAF
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6554687708; Sat, 31 May 2025 16:55:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 May 2025 17:37:08 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d953365412aa80f7651656b1f36d4f7326e4975a
X-Git-Newrev: 6efa33dac1c081eb7e542469c94add1b9d916136
X-Patchwork-Hint: ignore
Message-Id: <20250531165509.6554687708@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/connman: fix
 CVE-2025-32366
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6efa33dac1c081eb7e542469c94add1b9d916136
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
(cherry picked from commit a8cfe9986c9de8f575dc94e242c0ccc26e03b19d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
