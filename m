Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793BFC4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 16:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 113D6405A6;
	Sun, 13 Nov 2022 16:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 113D6405A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ijoUS52c1N17; Sun, 13 Nov 2022 16:03:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23F51405A4;
	Sun, 13 Nov 2022 16:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23F51405A4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3737C1BF2FE
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12E5240597
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12E5240597
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k5RYaCE9Ptn6 for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 16:02:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9E58405AD
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 16:02:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9E58405AD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7625836B7; Sun, 13 Nov 2022 16:02:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 17:01:40 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 08d8b8af106dda08715822765612d38e7e550016
X-Git-Newrev: a7555c624da3fc8e524fb2c5d662920a5ee48e6d
X-Patchwork-Hint: ignore
Message-Id: <20221113160246.A7625836B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/openvmtools: fix
 CVE-2022-31676
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a7555c624da3fc8e524fb2c5d662920a5ee48e6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Add a patch for CVE-2022-31676 (local privilege escalation
vulnerability).

Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b123e8887dc29eb2764162c048e8521a4072531a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...eck-authorization-on-incoming-guestOps-re.patch | 40 ++++++++++++++++++++++
 package/openvmtools/openvmtools.mk                 |  3 ++
 2 files changed, 43 insertions(+)

diff --git a/package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch b/package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch
new file mode 100644
index 0000000000..91e379b9a6
--- /dev/null
+++ b/package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch
@@ -0,0 +1,40 @@
+From bb9f9ffbb151397545f921cee5b6a4933c6eea80 Mon Sep 17 00:00:00 2001
+Message-Id: <bb9f9ffbb151397545f921cee5b6a4933c6eea80.1666169374.git.stefan@agner.ch>
+From: John Wolfe <jwolfe@vmware.com>
+Date: Wed, 10 Aug 2022 06:12:02 -0700
+Subject: [PATCH] Properly check authorization on incoming guestOps requests
+
+Fix public pipe request checks.  Only a SessionRequest type should
+be accepted on the public pipe.
+
+Upstream: https://github.com/vmware/open-vm-tools/blob/CVE-2022-31676.patch/1205-Properly-check-authorization-on-incoming-guestOps-re.patch
+Signed-off-by: Stefan Agner <stefan@agner.ch>
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
diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index d536e5e819..3106b9ecd6 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -13,6 +13,9 @@ OPENVMTOOLS_LICENSE_FILES = COPYING
 OPENVMTOOLS_CPE_ID_VENDOR = vmware
 OPENVMTOOLS_CPE_ID_PRODUCT = tools
 
+# 0013-Properly-check-authorization-on-incoming-guestOps-re.patch
+OPENVMTOOLS_IGNORE_CVES += CVE-2022-31676
+
 # configure.ac is patched
 OPENVMTOOLS_AUTORECONF = YES
 OPENVMTOOLS_CONF_OPTS = --with-dnet \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
