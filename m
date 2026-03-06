Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15B3FCC062
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C653261088;
	Fri,  6 Mar 2026 19:51:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VeaC0friCq91; Fri,  6 Mar 2026 19:51:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D48B6613C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826659;
	bh=UszKh3t+tukcsbkEz6Vt0XKJz5h9reTAgEkhL09mQck=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ojPAsB/PzapNfgcU6RTPn6d2fMSYyjkQwaREnV4VdSYIFC8W9YQU4F53XAPCy289C
	 RChhE8CPiL1aIDGwweAAPzx3EgJZZAVZ3ExRjnq5rXd+6jMrlHPgyo7bRRKBQdieN6
	 JjtUnsXBRG/FBwNxpcnQp32frWTWnwZeZOZYSI/xwmPLrghyjWI0ZT2eIDHPu59xyn
	 Lr62Dverz+irpRjfP+mqeygZ1vSVXWjkwGW8glAoYhNRaphGqpgfkTNC15Pm4LZ3oW
	 DOwUBfvVceu2QNMhF77ni+TAjDAk3XAmGqDhnjNjqMA4B4PvA8dHWcZJ6RyFJNqdlV
	 /KDhGbz28TuGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D48B6613C1;
	Fri,  6 Mar 2026 19:50:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 23FA225B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 045CE613CB
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1cnL0MZrNb64 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:50:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55C25613D3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55C25613D3
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BB0986823; Fri,  6 Mar 2026 19:50:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 13:49:32 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 0900d725c4e45f47902bedb6ef2cf2b06c141d4f
X-Git-Newrev: 4ec14d6a27403dfacfd64f923a9d875be52b8e4d
X-Patchwork-Hint: ignore
Message-Id: <20260306195050.6BB0986823@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/tinyproxy: add
 patch for CVE-2025-63938
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4ec14d6a27403dfacfd64f923a9d875be52b8e4d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Fixes the following vulnerability:

- CVE-2025-63938:
    Tinyproxy through 1.11.2 contains an integer overflow vulnerability in
    the strip_return_port() function within src/reqs.c.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-63938
  - https://github.com/tinyproxy/tinyproxy/commit/3c0fde94981b025271ffa1788ae425257841bf5a

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit be07b5766ac92efc37b6e2cd49ccb7a43212e949)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
