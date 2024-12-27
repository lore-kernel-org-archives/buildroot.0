Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504E2E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 21:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00918403E3;
	Fri, 27 Dec 2024 21:58:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Q8SVHj2hZ02; Fri, 27 Dec 2024 21:58:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A917F40357
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A917F40357;
	Fri, 27 Dec 2024 21:58:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E82C757
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 21:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FD9A60837
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 21:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mSJ5gXHol58k for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 21:58:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EF44E606CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF44E606CE
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF44E606CE
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 21:58:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 934BE40003;
 Fri, 27 Dec 2024 21:58:13 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Dec 2024 22:58:09 +0100
Message-ID: <20241227215811.2830716-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241227215811.2830716-1-thomas.petazzoni@bootlin.com>
References: <20241227215811.2830716-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735336693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Fr/wovQrK0oQuBWHEK0RoTanML4lSWtFfzkvnhDxII=;
 b=LEixXnAvTIH30aVoWS2IzW1aDISBKVTn71yz3I+OjzJVk0PXqHUur4hUDU5S26g9ehE42s
 f48ROUUR6SSWU4aJnXh6N0uouDU0+QCCvj47/wLoK25UiaR+Z9X1jUQ/nDQVFjXxqpANwg
 S0zAATowIk1pbpoaiAL9E+u2+vsQprdooIbo/m4UVh47C+K2vCUjtTIkxIy5lm7gp8JUmy
 /naV+4HOt/vNMAd4xEWqLdqa9oKMgasB/acZbmIqB1EYLRstB4l1nXbTeVujxeeKKdFUOt
 DSGzb8EegZ5jJIafybiF2aOdPQs7h5/joQeVD+yYEl1bxeVfvHQW3GzntI228A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LEixXnAv
Subject: [Buildroot] [PATCH 2/2] package/monit: bump version to 5.43.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Patch 0002 needs to be slightly refreshed to apply on this new
version.

Version 5.34.3
==============

Fixed: If the ping statement did not explicitly specify an outgoing
address but a previous ping statement did, the same address was shared
by both statements.

Fixed: Monit may crash upon stopping if the ping statement is used in
conjunction with the address option.

Fixed: If a directory is set in the 'allow' option of the 'set httpd'
statement, instead of file or string, Monit hangs on start.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...configure.ac-fixes-missing-config-macro-dir.patch | 12 ++++++------
 package/monit/monit.hash                             |  4 ++--
 package/monit/monit.mk                               |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch b/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch
index 3bee55cb5e..9ed49e5797 100644
--- a/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch
+++ b/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch
@@ -1,4 +1,4 @@
-From 2c06ecdc02de75a9e7e1e30e9c3d7d3a64269b7c Mon Sep 17 00:00:00 2001
+From 99b466f5448951a83a0d763e633906b28c30fc0a Mon Sep 17 00:00:00 2001
 From: Jens Maus <mail@jens-maus.de>
 Date: Fri, 22 Sep 2023 21:32:18 +0200
 Subject: [PATCH] configure.ac: fixes missing config macro dir
@@ -18,12 +18,12 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 3c3d30a2..f4c5ea07 100644
+index b4f2a14c..41a8c1a5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -8,7 +8,7 @@
+@@ -8,7 +8,7 @@ AC_PREREQ([2.53])
  # Example: 5.0_beta2
- AC_INIT([monit], [5.34.2], [monit-general@nongnu.org])
+ AC_INIT([monit], [5.34.3], [monit-general@nongnu.org])
  AC_CONFIG_AUX_DIR(config)
 -AC_CONFIG_MACRO_DIR([m4])
 +AC_CONFIG_MACRO_DIRS([m4 config])
@@ -31,7 +31,7 @@ index 3c3d30a2..f4c5ea07 100644
  AC_CONFIG_SRCDIR([src/monit.c])
  AC_CONFIG_SUBDIRS([libmonit])
 diff --git a/libmonit/configure.ac b/libmonit/configure.ac
-index d4cd0789..5366444a 100644
+index 800ebf83..03101a6b 100644
 --- a/libmonit/configure.ac
 +++ b/libmonit/configure.ac
 @@ -4,7 +4,7 @@ AC_PREREQ([2.53])
@@ -44,5 +44,5 @@ index d4cd0789..5366444a 100644
  AC_CONFIG_SRCDIR([src])
  
 -- 
-2.34.1
+2.47.0
 
diff --git a/package/monit/monit.hash b/package/monit/monit.hash
index 276e0a19d8..2c2956afa3 100644
--- a/package/monit/monit.hash
+++ b/package/monit/monit.hash
@@ -1,4 +1,4 @@
-# From https://mmonit.com/monit/dist/monit-5.34.2.tar.gz.sha256
-sha256  291ca3d898e9b425b6d0c1768728fecd6c1cf4c268c79db15fda26285ad5b832  monit-5.34.2.tar.gz
+# From https://mmonit.com/monit/dist/monit-5.34.3.tar.gz.sha256
+sha256  669d8b95ddec124d1444ba5264f67fdeae8e90e53b2929719f4750fc5ff3ba60  monit-5.34.3.tar.gz
 # Locally computed
 sha256  d5a4f52b1a5e1e7fe14e01a76aac8b08dc6bbea15466058f271456c97aac1ada  COPYING
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index a2d8073c31..7d78597c25 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONIT_VERSION = 5.34.2
+MONIT_VERSION = 5.34.3
 MONIT_SITE = https://mmonit.com/monit/dist
 MONIT_LICENSE = AGPL-3.0 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
