Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8619EE7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 16:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 392BB80EB6;
	Fri, 27 Dec 2024 16:06:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tdGOIIxQ1amy; Fri, 27 Dec 2024 16:06:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BF9C80EAB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BF9C80EAB;
	Fri, 27 Dec 2024 16:06:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B56E757
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 16:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06D9040499
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 16:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iic-4dfa7v9v for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 16:06:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.181.117.226;
 helo=mail.actia.se; envelope-from=john.ernberg@actia.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 22B1540400
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22B1540400
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 22B1540400
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 16:06:35 +0000 (UTC)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Dec
 2024 17:06:30 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.039; Fri, 27 Dec 2024 17:06:30 +0100
From: John Ernberg <john.ernberg@actia.se>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Jonas Blixt <jonas.blixt@actia.se>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Jacob Chen <chenhao37@lixiang.com>, "John
 Ernberg" <john.ernberg@actia.se>
Thread-Topic: [PATCH v2] package/pkg-utils: Prevent per-package syncing stale
 deps
Thread-Index: AQHbWHlKGKIGcm93JUua5l2Pj41V5Q==
Date: Fri, 27 Dec 2024 16:06:30 +0000
Message-ID: <20241227160622.1654822-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.47.1
x-originating-ip: [10.12.12.13]
x-esetresult: clean, is OK
x-esetid: 37303A2955B144556C7063
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=actia.se
Subject: [Buildroot] [PATCH v2] package/pkg-utils: Prevent per-package
 syncing stale deps
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Jonas Blixt <jonas.blixt@actia.se>

From: Jonas Blixt <jonas.blixt@actia.se>

This filters out the dependency inputs when syncing the per-package
target directory to only include 'skeleton' and its dependencies, if
they exist. Since other dependencies are not needed in the target dir
for successful building they can be ignored and depend on the ppd-merge
to populate the files from the other packages, unlike the staging dir
which is untouched here.

This solves the problem where stale files from dependencies will
linger in the per-package target directories and may up in the final
target directory after the ppd-merge, overwriting the fresh ones,
causing unecessarly many rebuild steps to ensure that the latest
version of a dependency is included in the final target directory.

Example:

Package A, containing liba
Package B, depends on liba

If liba receives a bug fix that does not require a rebuild of Package B
Pacckage B target directory will still contain the previous version
of liba from Package A. During the final rsync the Package B target
dir will be rsync'ed after Package A's target dir  to the final target
directory which now will contain the stale version of liba.

For our particular configuration the build time was not notably affected:
Before: 12m4
After: 11m43

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Jacob Chen <chenhao37@lixiang.com>
Signed-off-by: Jonas Blixt <jonas.blixt@actia.se>
Signed-off-by: John Ernberg <john.ernberg@actia.se>

---

Changes since v1: https://lore.kernel.org/buildroot/20240801115712.1458767-1-jonas.blixt@actia.se/
 - Rework diff to be a bit more digestiable
 - Rework commit message to attempt to contain a bit more information and clarity

We sent this patch back in August and it didn't get any feedback.

Since this is a bit of a tricky matter I reworked the commit message a
bit to try to clarify the problem further to make review easier.

The issue has been brought up a few times on the list before:
https://lore.kernel.org/buildroot/tencent_7A5A407C574E45921E432385B01446CC4506@qq.com/
https://lore.kernel.org/buildroot/20231110141242.3796161-1-john.ernberg@actia.se/
https://lore.kernel.org/buildroot/20191212130253.2cb543ba@windsurf/
---
 package/pkg-utils.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index a0dbeac18e..65234ea7f6 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -237,10 +237,18 @@ endef
 # argument, so that this function can be used to prepare with
 # different set of dependencies (download, extract, configure, etc.)
 #
+# The per-package sync of target is filtered to only sync skeleton
+# and the skeletons dependencies when they exist. This prevents stale
+# copies of dependencies in the per-package target directory and thus
+# prevents stale files from propagating to the final target directory
+# during rebuilds of packages.
+#
 # $1: space-separated list of packages to rsync from
 define prepare-per-package-directory
 	$(call per-package-rsync,$(1),host,$(HOST_DIR),hardlink)
-	$(call per-package-rsync,$(1),target,$(TARGET_DIR),hardlink)
+	$(call per-package-rsync,\
+		$(filter $(SKELETON_FINAL_RECURSIVE_DEPENDENCIES) skeleton, $(1)),\
+		target,$(TARGET_DIR),hardlink)
 endef
 
 # Ensure files like .la, .pc, .pri, .cmake, and so on, point to the
-- 
2.47.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
