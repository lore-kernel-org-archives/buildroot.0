Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE63FD9E0A
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E59BF6072E;
	Thu, 26 Feb 2026 20:13:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jQXM_pDXMYu0; Thu, 26 Feb 2026 20:13:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C8C160709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772136797;
	bh=iD84M5zHULHUd51YvKqBUUtqkhd/+vLFiZgEZxRPDpU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Nb7khmPjlUXJjDa/h8fzfbZ4O7AK37KNtPulZeyJPwHF6mkzL6bWbqilficpnsE1s
	 r1rQS9YFsGRtLx0VQWCRFXedBHByZtL+lPkGiR3ZNUoCOLtwLe1oyJ/x9PpuMmlM90
	 cXfCVG8q0aCyR76ocQ5vNtuK2dTUKaUETqgwRVf8fiHCJ78KYJu7Iz284Zts+DBiof
	 b8F/+AzNsl+oTIz2mNz1QbI2rNrD+kHM0bcWlEEEbNuIc15ObL79SKcPsrN4SdkyxM
	 fDsf67H3b0qgld7PQAkQizem4xGRvbTfCWFYzVlU0R9AhzsZ3DbPM40SWUUk3yQCRJ
	 HXR3NcIxAkG/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C8C160709;
	Thu, 26 Feb 2026 20:13:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 55E831F3
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 469D1401E7
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:13:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mBCGxoc-YQ1J for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:13:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F37B3401D8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F37B3401D8
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:13:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4CA887400; Thu, 26 Feb 2026 20:13:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 21:10:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c305f32baebb0addb85bbc9aad4df05456566d9
X-Git-Newrev: be07b5766ac92efc37b6e2cd49ccb7a43212e949
X-Patchwork-Hint: ignore
Message-Id: <20260226201314.D4CA887400@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tinyproxy: add patch for
 CVE-2025-63938
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/be07b5766ac92efc37b6e2cd49ccb7a43212e949
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following vulnerability:

- CVE-2025-63938:
    Tinyproxy through 1.11.2 contains an integer overflow vulnerability in
    the strip_return_port() function within src/reqs.c.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-63938
  - https://github.com/tinyproxy/tinyproxy/commit/3c0fde94981b025271ffa1788ae425257841bf5a

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...nteger-overflow-in-port-number-processing.patch | 41 ++++++++++++++++++++++
 package/tinyproxy/tinyproxy.mk                     |  3 ++
 2 files changed, 44 insertions(+)

diff --git a/package/tinyproxy/0001-reqs-fix-integer-overflow-in-port-number-processing.patch b/package/tinyproxy/0001-reqs-fix-integer-overflow-in-port-number-processing.patch
new file mode 100644
index 0000000000..3b14a58fb6
--- /dev/null
+++ b/package/tinyproxy/0001-reqs-fix-integer-overflow-in-port-number-processing.patch
@@ -0,0 +1,41 @@
+From 3c0fde94981b025271ffa1788ae425257841bf5a Mon Sep 17 00:00:00 2001
+From: rofl0r <rofl0r@users.noreply.github.com>
+Date: Fri, 17 Oct 2025 22:57:39 +0000
+Subject: [PATCH] reqs: fix integer overflow in port number processing
+
+closes #586
+
+CVE: CVE-2025-63938
+Upstream: https://github.com/tinyproxy/tinyproxy/commit/3c0fde94981b025271ffa1788ae425257841bf5a
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/reqs.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/reqs.c b/src/reqs.c
+index 52135a03..a562c68a 100644
+--- a/src/reqs.c
++++ b/src/reqs.c
+@@ -174,7 +174,7 @@ static int strip_return_port (char *host)
+ {
+         char *ptr1;
+         char *ptr2;
+-        int port;
++        unsigned port;
+ 
+         ptr1 = strrchr (host, ':');
+         if (ptr1 == NULL)
+@@ -186,8 +186,11 @@ static int strip_return_port (char *host)
+                 return 0;
+ 
+         *ptr1++ = '\0';
+-        if (sscanf (ptr1, "%d", &port) != 1)    /* one conversion required */
+-                return 0;
++
++        port = atoi(ptr1);
++        /* check that port string is in the valid range 1-0xffff) */
++        if(strlen(ptr1) > 5 || (port & 0xffff0000)) return 0;
++
+         return port;
+ }
+ 
diff --git a/package/tinyproxy/tinyproxy.mk b/package/tinyproxy/tinyproxy.mk
index 6656a752a6..c5e975d8ab 100644
--- a/package/tinyproxy/tinyproxy.mk
+++ b/package/tinyproxy/tinyproxy.mk
@@ -11,4 +11,7 @@ TINYPROXY_LICENSE = GPL-2.0+
 TINYPROXY_LICENSE_FILES = COPYING
 TINYPROXY_CPE_ID_VALID = YES
 
+# 0001-reqs-fix-integer-overflow-in-port-number-processing.patch
+TINYPROXY_IGNORE_CVES += CVE-2025-63938
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
