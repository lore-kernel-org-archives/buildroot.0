Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA0DC3DA6D
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 20:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B02434088F;
	Tue, 20 May 2025 20:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xc2IVrqNZtlE; Tue, 20 May 2025 20:41:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8EC24080A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8EC24080A;
	Tue, 20 May 2025 20:41:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D303D4
 for <buildroot@buildroot.org>; Tue, 20 May 2025 20:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EF2260738
 for <buildroot@buildroot.org>; Tue, 20 May 2025 20:41:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bo-RE-9zqCTf for <buildroot@buildroot.org>;
 Tue, 20 May 2025 20:41:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.57;
 helo=smtpcmd0757.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1FA5C60ED7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FA5C60ED7
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1FA5C60ED7
 for <buildroot@buildroot.org>; Tue, 20 May 2025 20:41:37 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id HTmIuVKvCt6p9HTmJuuUMb; Tue, 20 May 2025 22:41:35 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 20 May 2025 22:41:34 +0200
Message-Id: <20250520204134.383623-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGbd5FpsJBbw79rOYkz5pTpJM7CJnvL+TeMGKVgv7pPYR30UImvJNE7j+vNtQcOXC4xgdyLZRVG6u2JaTVu4lwGa2La/Z0bCrhIAhnBn9tqdrgE9XXEm
 UE5w2nqDz5X11ODzNyceFO2tMoqFBAecktYREEXczXLIY2LLfLzc7c0getjbYVD6r8w8EqmCQsiZdHtEE/Q5mvskYWmALKAN6X22HBQ6t8Qj8yHnZaKPlwXc
 nB2MLlAxvm5RolWaH9mwRdiWWxXpQFGnF8+iVjkwidU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1747773695; bh=yr50bjG4wkm848jAAmnoJORRPb1rrj+lJCE/3Fm8MYM=;
 h=From:To:Subject:Date:MIME-Version;
 b=gn2mlLL+YClQ7WZr5hEz18kddgXqM/Qi/W+vDgpf3UEkmn0bD3Q2vGLreNOVmKg5u
 HuEI55VyRtcIGTgsDg9/Q7Mp5hU+DP2UWgtT32xjumsww2YxRG8rgdyyjyuwdiidl1
 jqE1x3gMrgqZqPOsNSL/iLuqOqZMEMEoODf1w+EI9zB9n7xQcXDuZ5t4XvqNWAkpM3
 fkjCtAH8hHrSHnuO3LYZwJfxCCu4IW/R/ND+Aezr46CUmO4Ahvp5qX5WVE1EGqaBwR
 50pPUdbMFNsn6z7jbK0gTBRsUJhmCi7iNmFTOarb751lHw08VvjymmX9kjJDm6VM4P
 J8wXCqcIlT2QA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=gn2mlLL+
Subject: [Buildroot] [PATCH] package/libnvme: bump to version 1.14
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

Add local patch to avoid build failure on examples folder that we don't
need. That build failure is due to missing bits/pthreadtypes.h on musl and
since we don't need examples at all let's disable its building by passing
-Dexamples=false.

For release note, see:
https://github.com/linux-nvme/libnvme/releases/tag/v1.14

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0001-Make-examples-build-selectable.patch | 46 +++++++++++++++++++
 package/libnvme/libnvme.hash                  |  2 +-
 package/libnvme/libnvme.mk                    |  3 +-
 3 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 package/libnvme/0001-Make-examples-build-selectable.patch

diff --git a/package/libnvme/0001-Make-examples-build-selectable.patch b/package/libnvme/0001-Make-examples-build-selectable.patch
new file mode 100644
index 0000000000..c4ceb6d95e
--- /dev/null
+++ b/package/libnvme/0001-Make-examples-build-selectable.patch
@@ -0,0 +1,46 @@
+From 6c0b9ad7822d9e9c74b787914cb766d27a358258 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Tue, 20 May 2025 22:34:16 +0200
+Subject: [PATCH] Make examples build selectable
+
+Sometimes we don't need to build examples and increase some dependency we
+don't have(i.e. bits/pthreadtypes.h in musl) so let's add examples option
+true by default.
+
+Upstream:
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ meson.build       | 4 +++-
+ meson_options.txt | 1 +
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 279245ac..4d819178 100644
+--- a/meson.build
++++ b/meson.build
+@@ -282,7 +282,9 @@ subdir('libnvme')
+ if get_option('tests')
+     subdir('test')
+ endif
+-subdir('examples')
++if get_option('examples')
++    subdir('examples')
++endif
+ subdir('doc')
+ 
+ ################################################################################
+diff --git a/meson_options.txt b/meson_options.txt
+index 051b4ae5..48a93dae 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -6,6 +6,7 @@ option('rstdir', type : 'string', value : '', description : 'directory for ReST
+ 
+ option('docs', type : 'combo', choices : ['false', 'html', 'man', 'rst', 'all'], description : 'install documentation')
+ option('docs-build', type : 'boolean', value : false,  description : 'build documentation')
++option('examples', type : 'boolean', value : true, description : 'build examples')
+ option('tests', type : 'boolean', value : true, description : 'build tests')
+ 
+ option('python', type : 'feature', value: 'auto', description : 'Generate libnvme python bindings')
+-- 
+2.39.5
+
diff --git a/package/libnvme/libnvme.hash b/package/libnvme/libnvme.hash
index 9496401c61..ae2c478ebc 100644
--- a/package/libnvme/libnvme.hash
+++ b/package/libnvme/libnvme.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  f083c21f525644a2bcca6d367d96fab813de880cba9f1746a850f3a8692a5980  libnvme-1.13.tar.gz
+sha256  a7230d6d4959f26cf0c0ef6c9bb479bd94a8c0ec738bf6e164d66c3dc6397e66  libnvme-1.14.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
index 8184c9d0a2..b69e9257cf 100644
--- a/package/libnvme/libnvme.mk
+++ b/package/libnvme/libnvme.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-LIBNVME_VERSION = 1.13
+LIBNVME_VERSION = 1.14
 LIBNVME_SITE = $(call github,linux-nvme,libnvme,v$(LIBNVME_VERSION))
 LIBNVME_LICENSE = LGPL-2.1
 LIBNVME_LICENSE_FILES = COPYING
 LIBNVME_INSTALL_STAGING = YES
 
 LIBNVME_CONF_OPTS += \
+	-Dexamples=false \
 	-Dtests=false
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
