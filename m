Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7AAECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 21:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE89040148;
	Sun, 30 Oct 2022 21:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE89040148
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fjcgcdSXMue1; Sun, 30 Oct 2022 21:23:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0FB3400FB;
	Sun, 30 Oct 2022 21:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0FB3400FB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 848B11BF956
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5ED2640179
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ED2640179
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aaLxAU7SjAKz for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 21:23:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BB3940177
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 21:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BB3940177
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECBE887692; Sun, 30 Oct 2022 21:23:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 22:21:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 267188242e4edcfbca272168e62c2e9bc70864ce
X-Git-Newrev: b123e8887dc29eb2764162c048e8521a4072531a
X-Patchwork-Hint: ignore
Message-Id: <20221030212300.ECBE887692@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openvmtools: fix CVE-2022-31676
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b123e8887dc29eb2764162c048e8521a4072531a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch for CVE-2022-31676 (local privilege escalation
vulnerability).

Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
