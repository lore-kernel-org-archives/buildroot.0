Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4C4C001DB
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 21:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C3B581F80;
	Sat,  2 Sep 2023 21:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C3B581F80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nl0HsJwPigmP; Sat,  2 Sep 2023 21:40:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0C4081F78;
	Sat,  2 Sep 2023 21:40:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0C4081F78
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C110E1BF3A4
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 21:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A3C24017A
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 21:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A3C24017A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LPAtLAvXd3Rt for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 21:40:38 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A84440144
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 21:40:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A84440144
Received: by mail.gandi.net (Postfix) with ESMTPA id 211111BF204;
 Sat,  2 Sep 2023 21:40:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat,  2 Sep 2023 23:40:31 +0200
Message-ID: <20230902214032.3570167-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693690834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0pbzIyULKzg5Wa8qC+DjGMf5Z5s/z22UC2KHG+4kYHc=;
 b=kqxe6Cxs7DpwFQ5ct9ZJpYLt3Ky7DFBeyepu2tvPCcRuOjsD93HnlfRuFAQWqTHfH49Hil
 2Y8wqPv6IgOrTCcqSTQon62w/7ewU3ZwZEKLSbLXSGb+bTtonL6EM/GrdhwDIxy5KE5DtO
 J582s7WbzGkrua+Rz9eYLspdv55HREZAomlSfkH1sR5ZNfe0l1yInia9oqk9HEKdsk7dQ3
 cPijoL9Jgfr1uapL+xPdWo/4iOaT4VbJ1kX/2b3dsWCnbtlOTvddrFqFjPznIeB+hOb8zP
 YBpPSySwohf7HPb7TLX66N8x119Zmqg54Fz4+oEYngeIiIiwyzmM72z8Dpgwgg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kqxe6Cxs
Subject: [Buildroot] [PATCH 1/2] package/poppler: backport patch to fix
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...em-open-Fix-crash-on-malformed-files.patch | 45 +++++++++++++++++++
 package/poppler/poppler.mk                    |  2 +
 2 files changed, 47 insertions(+)
 create mode 100644 package/poppler/0001-OutlineItem-open-Fix-crash-on-malformed-files.patch

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
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
