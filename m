Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AC5C433FE
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 08:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02CA440C47;
	Wed, 19 Oct 2022 08:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02CA440C47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sphZ8K-7zyDw; Wed, 19 Oct 2022 08:44:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E307B402F3;
	Wed, 19 Oct 2022 08:44:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E307B402F3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 865A71BF2C7
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 08:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5767D60D4C
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 08:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5767D60D4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yne8kiiT2rQn for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 08:44:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFDD560C26
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BFDD560C26
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 08:44:49 +0000 (UTC)
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5:10::ed4])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id D9BFF5C0611;
 Wed, 19 Oct 2022 10:44:45 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 10:44:43 +0200
Message-Id: <fcf0570cac20f4a41a19816c8b5fc56c5106c457.1666168938.git.stefan@agner.ch>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1666169085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=E9oNUayH9oBNEmaBLLaujIxwaAm+bzO+DAnpx1HVj8E=;
 b=ifzEqDaH/ulP9TP4HMy+59etXC+Rypv1bYiOuR4XE9sK6NoByFyiyetfOqX5jjXxZGqGkC
 S0ojZN7P+r9YYYI7kveD8mWmQ5laJoAfQzFlzM5K4n1VwBOvVoFkpfgc1QnQ4OEsdT/P35
 vu8Ml7a/+WKzYQw6cIgLEVC4BrFhteo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=ifzEqDaH
Subject: [Buildroot] [PATCH] package/openvmtools: fix local privilege
 escalation vulnerability
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
Cc: giulio.benetti@benettiengineering.com, stefan@agner.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a patch for CVE-2022-31676 (local privilege escalation
vulnerability).

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 ...uthorization-on-incoming-guestOps-re.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch

diff --git a/package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch b/package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch
new file mode 100644
index 0000000000..cae2e82f08
--- /dev/null
+++ b/package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch
@@ -0,0 +1,36 @@
+From 4f5cfc23dd3357bafc8b699dd5c558f000a534c3 Mon Sep 17 00:00:00 2001
+From: John Wolfe <jwolfe@vmware.com>
+Date: Wed, 10 Aug 2022 06:12:02 -0700
+Subject: [PATCH] Properly check authorization on incoming guestOps requests
+
+Fix public pipe request checks.  Only a SessionRequest type should
+be accepted on the public pipe.
+---
+ open-vm-tools/vgauth/serviceImpl/proto.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/open-vm-tools/vgauth/serviceImpl/proto.c b/open-vm-tools/vgauth/serviceImpl/proto.c
+index dc1dfd7..9e04991 100644
+--- a/open-vm-tools/vgauth/serviceImpl/proto.c
++++ b/open-vm-tools/vgauth/serviceImpl/proto.c
+@@ -1,5 +1,5 @@
+ /*********************************************************
+- * Copyright (C) 2011-2016,2019 VMware, Inc. All rights reserved.
++ * Copyright (c) 2011-2016,2019-2022 VMware, Inc. All rights reserved.
+  *
+  * This program is free software; you can redistribute it and/or modify it
+  * under the terms of the GNU Lesser General Public License as published
+@@ -1201,6 +1201,10 @@ Proto_SecurityCheckRequest(ServiceConnection *conn,
+    VGAuthError err;
+    gboolean isSecure = ServiceNetworkIsConnectionPrivateSuperUser(conn);
+ 
++   if (conn->isPublic && req->reqType != PROTO_REQUEST_SESSION_REQ) {
++      return VGAUTH_E_PERMISSION_DENIED;
++   }
++
+    switch (req->reqType) {
+       /*
+        * This comes over the public connection; alwsys let it through.
+-- 
+2.6.2
+
-- 
2.38.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
