Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDC3C433FE
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 08:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B842F40C41;
	Wed, 19 Oct 2022 08:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B842F40C41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bn7IxJnPg-cA; Wed, 19 Oct 2022 08:56:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFB65402F3;
	Wed, 19 Oct 2022 08:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFB65402F3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6CC6B1BF2C7
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 08:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4597160D4C
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 08:56:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4597160D4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7HLCiY8psNSe for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 08:56:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8228A60C27
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8228A60C27
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 08:56:19 +0000 (UTC)
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5:10::ed4])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 5EEE05C38B1;
 Wed, 19 Oct 2022 10:56:16 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 10:56:16 +0200
Message-Id: <7aeb69a91cab8b3e5fdcfc210c2f5a112490b0a0.1666169750.git.stefan@agner.ch>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1666169776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=/AZN/Xn/5J5fMcoYZvv/0azTwy/UeL3GAPCRqcIgBHE=;
 b=uni5ZxoZdnxiTp+z+ajO2xSY5nr2U93khrLh9H2ayaE1Z000Oz22R4rdH885mUwTaGnAJ/
 dWJlLMpzm9nHFPfaHDpm/f/NQoc1Vzqd9hYDfQhbsiOSSMBTxjWuSu/jtIJNh9JfSWav/1
 IXL5Rz5qQ+a6aw+XEQVEV3BuklceQGM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=uni5ZxoZ
Subject: [Buildroot] [PATCH v2] package/openvmtools: fix local privilege
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
v2: Actually make the patch apply

 ...uthorization-on-incoming-guestOps-re.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch

diff --git a/package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch b/package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch
new file mode 100644
index 0000000000..b2c8995c53
--- /dev/null
+++ b/package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch
@@ -0,0 +1,37 @@
+From bb9f9ffbb151397545f921cee5b6a4933c6eea80 Mon Sep 17 00:00:00 2001
+Message-Id: <bb9f9ffbb151397545f921cee5b6a4933c6eea80.1666169374.git.stefan@agner.ch>
+From: John Wolfe <jwolfe@vmware.com>
+Date: Wed, 10 Aug 2022 06:12:02 -0700
+Subject: [PATCH] Properly check authorization on incoming guestOps requests
+
+Fix public pipe request checks.  Only a SessionRequest type should
+be accepted on the public pipe.
+---
+ vgauth/serviceImpl/proto.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/vgauth/serviceImpl/proto.c b/vgauth/serviceImpl/proto.c
+index db7159ee..c4f85b02 100644
+--- a/vgauth/serviceImpl/proto.c
++++ b/vgauth/serviceImpl/proto.c
+@@ -1,5 +1,5 @@
+ /*********************************************************
+- * Copyright (C) 2011-2016,2019-2021 VMware, Inc. All rights reserved.
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
+2.38.0
+
-- 
2.38.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
