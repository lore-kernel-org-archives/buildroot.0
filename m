Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00D0C83F2C
	for <buildroot@archiver.kernel.org>; Sun,  3 Sep 2023 19:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B85B4094C;
	Sun,  3 Sep 2023 19:35:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B85B4094C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mFgRw5Krto95; Sun,  3 Sep 2023 19:35:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E0B4415BA;
	Sun,  3 Sep 2023 19:35:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E0B4415BA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 176131BF3C8
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 19:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5DBB81BE3
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 19:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5DBB81BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CUEbPQoLGLVg for <buildroot@lists.busybox.net>;
 Sun,  3 Sep 2023 19:34:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 917E881BB0
 for <buildroot@buildroot.org>; Sun,  3 Sep 2023 19:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 917E881BB0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DD158692C; Sun,  3 Sep 2023 19:34:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Sep 2023 21:29:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ec2df1e9a65c41a542a796d5b65b13f0db45742
X-Git-Newrev: fea8852c681c26a785557353caea4a669dcc35be
X-Patchwork-Hint: ignore
Message-Id: <20230903193434.7DD158692C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/poppler: backport patch to fix
 CVE-2023-34872
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

commit: https://git.buildroot.net/buildroot/commit/?id=fea8852c681c26a785557353caea4a669dcc35be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ineItem-open-Fix-crash-on-malformed-files.patch | 45 ++++++++++++++++++++++
 package/poppler/poppler.mk                         |  2 +
 2 files changed, 47 insertions(+)

diff --git a/package/poppler/0001-OutlineItem-open-Fix-crash-on-malformed-files.patch b/package/poppler/0001-OutlineItem-open-Fix-crash-on-malformed-files.patch
new file mode 100644
index 0000000000..478759e0cc
--- /dev/null
+++ b/package/poppler/0001-OutlineItem-open-Fix-crash-on-malformed-files.patch
@@ -0,0 +1,45 @@
+From e5cc11e0b5b867f4705fd28ff1b981c1224be1cd Mon Sep 17 00:00:00 2001
+From: Albert Astals Cid <aacid@kde.org>
+Date: Wed, 17 May 2023 22:42:05 +0200
+Subject: [PATCH] OutlineItem::open: Fix crash on malformed files
+
+Fixes #1399
+
+Upstream: https://gitlab.freedesktop.org/poppler/poppler/-/commit/591235c8b6c65a2eee88991b9ae73490fd9afdfe
+[Thomas: backported to fix CVE-2023-34872]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ poppler/Outline.cc | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/poppler/Outline.cc b/poppler/Outline.cc
+index cbb6cb49..4c68be99 100644
+--- a/poppler/Outline.cc
++++ b/poppler/Outline.cc
+@@ -14,7 +14,7 @@
+ // under GPL version 2 or later
+ //
+ // Copyright (C) 2005 Marco Pesenti Gritti <mpg@redhat.com>
+-// Copyright (C) 2008, 2016-2019, 2021 Albert Astals Cid <aacid@kde.org>
++// Copyright (C) 2008, 2016-2019, 2021, 2023 Albert Astals Cid <aacid@kde.org>
+ // Copyright (C) 2009 Nick Jones <nick.jones@network-box.com>
+ // Copyright (C) 2016 Jason Crain <jason@aquaticape.us>
+ // Copyright (C) 2017 Adrian Johnson <ajohnson@redneon.com>
+@@ -483,8 +483,12 @@ void OutlineItem::open()
+ {
+     if (!kids) {
+         Object itemDict = xref->fetch(ref);
+-        const Object &firstRef = itemDict.dictLookupNF("First");
+-        kids = readItemList(this, &firstRef, xref, doc);
++        if (itemDict.isDict()) {
++            const Object &firstRef = itemDict.dictLookupNF("First");
++            kids = readItemList(this, &firstRef, xref, doc);
++        } else {
++            kids = new std::vector<OutlineItem *>();
++        }
+     }
+ }
+ 
+-- 
+2.41.0
+
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 5524bfc420..4c6017a5f5 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -11,6 +11,8 @@ POPPLER_DEPENDENCIES = fontconfig host-pkgconf
 POPPLER_LICENSE = GPL-2.0+
 POPPLER_LICENSE_FILES = COPYING
 POPPLER_CPE_ID_VENDOR = freedesktop
+# 0001-OutlineItem-open-Fix-crash-on-malformed-files.patch
+POPPLER_IGNORE_CVES += CVE-2023-34872
 POPPLER_INSTALL_STAGING = YES
 
 POPPLER_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
