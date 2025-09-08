Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34C6CA1013
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A029D42C18;
	Mon,  8 Sep 2025 10:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EH4gJTrHR-wJ; Mon,  8 Sep 2025 10:39:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB71742C16
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB71742C16;
	Mon,  8 Sep 2025 10:39:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E4891D9
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44BA041BDB
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U06xpiX5rJIu for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:39:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E8A642BB1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E8A642BB1
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C8FF83A93; Mon,  8 Sep 2025 10:39:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Sep 2025 12:37:53 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7172f0642c10b79ec3fd250c9311b69e7abc03e4
X-Git-Newrev: 2d5c298d5a35a97429ef40c89fdbae422cb3821c
X-Patchwork-Hint: ignore
Message-Id: <20250908103908.8C8FF83A93@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/iperf3: add patch
 to fix CVE-2025-54350
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2d5c298d5a35a97429ef40c89fdbae422cb3821c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes the following vulnerability:

    In iperf before 3.19.1, iperf_auth.c has a Base64Decode assertion
    failure and application exit upon a malformed authentication attempt.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-54350
  - https://github.com/esnet/iperf/commit/4eab661da0bbaac04493fa40164e928c6df7934a

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 ...lures-on-malformed-authentication-attempt.patch | 35 ++++++++++++++++++++++
 package/iperf3/iperf3.mk                           |  3 ++
 2 files changed, 38 insertions(+)

diff --git a/package/iperf3/0002-Prevent-crash-due-to-assertion-failures-on-malformed-authentication-attempt.patch b/package/iperf3/0002-Prevent-crash-due-to-assertion-failures-on-malformed-authentication-attempt.patch
new file mode 100644
index 0000000000..bcba77be21
--- /dev/null
+++ b/package/iperf3/0002-Prevent-crash-due-to-assertion-failures-on-malformed-authentication-attempt.patch
@@ -0,0 +1,35 @@
+From de932ea16bc959f839d28d370f0602de52c5def1 Mon Sep 17 00:00:00 2001
+From: "Bruce A. Mah" <bmah@es.net>
+Date: Tue, 24 Jun 2025 15:58:21 -0700
+Subject: [PATCH] Prevent crash due to assertion failures on malformed
+ authentication attempt.
+
+Reported by Han Lee (Apple Information Security)
+
+CVE: CVE-2025-54350
+Upstream: https://github.com/esnet/iperf/commit/de932ea16bc959f839d28d370f0602de52c5def1
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/iperf_auth.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/iperf_auth.c b/src/iperf_auth.c
+index 72e85fc9a..b9f2bc0f2 100644
+--- a/src/iperf_auth.c
++++ b/src/iperf_auth.c
+@@ -28,7 +28,6 @@
+ #include "iperf_config.h"
+ 
+ #include <string.h>
+-#include <assert.h>
+ #include <time.h>
+ #include <sys/types.h>
+ /* FreeBSD needs _WITH_GETLINE to enable the getline() declaration */
+@@ -152,7 +151,6 @@ int Base64Decode(const char* b64message, unsigned char** buffer, size_t* length)
+ 
+     BIO_set_flags(bio, BIO_FLAGS_BASE64_NO_NL); //Do not use newlines to flush buffer
+     *length = BIO_read(bio, *buffer, strlen(b64message));
+-    assert(*length == decodeLen); //length should equal decodeLen, else something went horribly wrong
+     BIO_free_all(bio);
+ 
+     return (0); //success
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index c5efb1d784..43f791b082 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -14,6 +14,9 @@ IPERF3_CPE_ID_VENDOR = es
 # 0001-Fix-off-by-one-head-overflow-in-auth.patch
 IPERF3_IGNORE_CVES += CVE-2025-54349
 
+# 0002-Prevent-crash-due-to-assertion-failures-on-malformed-authentication-attempt.patch
+IPERF3_IGNORE_CVES += CVE-2025-54350
+
 IPERF3_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
