Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18389C3ABC3
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 20:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 872A180F94;
	Mon, 12 May 2025 20:42:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sLPX4HKDeQjK; Mon, 12 May 2025 20:42:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A267E80F64
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A267E80F64;
	Mon, 12 May 2025 20:42:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E8C15150
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72BA440271
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:42:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hja7T5pOJZna for <buildroot@buildroot.org>;
 Mon, 12 May 2025 20:42:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8806A4107E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8806A4107E
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:42:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82E73867E0; Mon, 12 May 2025 20:42:03 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 12 May 2025 22:36:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce9a64b5d15a484762cbd40007650784998b100b
X-Git-Newrev: 6c4da559ccad17acad5e638aba888543cf4245d0
X-Patchwork-Hint: ignore
Message-Id: <20250512204203.82E73867E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/connman: fix CVE-2025-32743
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

commit: https://git.buildroot.net/buildroot/commit/?id=6c4da559ccad17acad5e638aba888543cf4245d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In ConnMan through 1.44, the lookup string in ns_resolv in dnsproxy.c
can be NULL or an empty string when the TC (Truncated) bit is set in
a DNS response. This allows attackers to cause a denial of service
(application crash) or possibly execute arbitrary code, because those
lookup values lead to incorrect length calculations and incorrect
memcpy operations.

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-32743

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Julien: add link to cve]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...x-NULL-empty-lookup-causing-potential-cra.patch | 46 ++++++++++++++++++++++
 package/connman/connman.mk                         |  3 ++
 2 files changed, 49 insertions(+)

diff --git a/package/connman/0001-dnsproxy-Fix-NULL-empty-lookup-causing-potential-cra.patch b/package/connman/0001-dnsproxy-Fix-NULL-empty-lookup-causing-potential-cra.patch
new file mode 100644
index 0000000000..9c1274e43c
--- /dev/null
+++ b/package/connman/0001-dnsproxy-Fix-NULL-empty-lookup-causing-potential-cra.patch
@@ -0,0 +1,46 @@
+From d90b911f6760959bdf1393c39fe8d1118315490f Mon Sep 17 00:00:00 2001
+From: Praveen Kumar <praveen.kumar@windriver.com>
+Date: Thu, 24 Apr 2025 11:39:29 +0000
+Subject: [PATCH] dnsproxy: Fix NULL/empty lookup causing potential crash
+
+In ConnMan through 1.44, the lookup string in ns_resolv in dnsproxy.c
+can be NULL or an empty string when the TC (Truncated) bit is set in
+a DNS response. This allows attackers to cause a denial of service
+(application crash) or possibly execute arbitrary code, because those
+lookup values lead to incorrect length calculations and incorrect
+memcpy operations.
+
+This patch includes a check to make sure loookup value is valid before
+using it. This helps avoid unexpected value when the input is empty or
+incorrect.
+
+Fixes: CVE-2025-32743
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=d90b911f6760959bdf1393c39fe8d1118315490f
+---
+ src/dnsproxy.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/dnsproxy.c b/src/dnsproxy.c
+index f28a5d7551a4..7ee26d9ff886 100644
+--- a/src/dnsproxy.c
++++ b/src/dnsproxy.c
+@@ -1685,8 +1685,13 @@ static int ns_resolv(struct server_data *server, struct request_data *req,
+ 				gpointer request, gpointer name)
+ {
+ 	int sk = -1;
++	int err;
+ 	const char *lookup = (const char *)name;
+-	int err = ns_try_resolv_from_cache(req, request, lookup);
++
++	if (!lookup || strlen(lookup) == 0)
++		return -EINVAL;
++
++	err = ns_try_resolv_from_cache(req, request, lookup);
+ 
+ 	if (err > 0)
+ 		/* cache hit */
+-- 
+2.43.0
+
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 2c5be8252c..5d515c2963 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -13,6 +13,9 @@ CONNMAN_LICENSE = GPL-2.0
 CONNMAN_LICENSE_FILES = COPYING
 CONNMAN_CPE_ID_VENDOR = intel
 
+# 0001-dnsproxy-Fix-NULL-empty-lookup-causing-potential-cra.patch
+CONNMAN_IGNORE_CVES += CVE-2025-32743
+
 CONNMAN_CONF_OPTS = --with-dbusconfdir=/etc
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
