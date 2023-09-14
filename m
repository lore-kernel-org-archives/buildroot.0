Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BF3EDE99E
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 09:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A6FC61249;
	Thu, 14 Sep 2023 09:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A6FC61249
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IjSzgO3-x458; Thu, 14 Sep 2023 09:54:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2458A6124B;
	Thu, 14 Sep 2023 09:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2458A6124B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0E78F1BF990
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 09:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3B1561206
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 09:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3B1561206
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id evmiHNZuz35o for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 09:52:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7C516120E
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 09:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7C516120E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5EA886F2C; Thu, 14 Sep 2023 09:52:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 11:46:19 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 290790630be42173f28dae47e78dce5dd6685e7d
X-Git-Newrev: b5a1c431051d779de36d6c5ba2f880515e8a0bae
X-Patchwork-Hint: ignore
Message-Id: <20230914095229.A5EA886F2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/poppler: backport
 patch to fix CVE-2023-34872
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5a1c431051d779de36d6c5ba2f880515e8a0bae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fea8852c681c26a785557353caea4a669dcc35be)
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
