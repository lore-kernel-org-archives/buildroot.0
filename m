Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0A9CA101F
	for <buildroot@archiver.kernel.org>; Sun,  7 Sep 2025 16:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92C0B420F2;
	Sun,  7 Sep 2025 16:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PzjZ4wQaUP47; Sun,  7 Sep 2025 16:04:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B785741B47
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B785741B47;
	Sun,  7 Sep 2025 16:04:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 724E99E4
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 16:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63A9A41B47
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 16:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pTHBKM_O4KDp for <buildroot@buildroot.org>;
 Sun,  7 Sep 2025 16:04:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8083D411FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8083D411FB
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8083D411FB
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 16:04:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D2C1D1A0E06
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 16:04:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AEF2A6061A
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 16:04:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1EFD4102F2849; 
 Sun,  7 Sep 2025 18:04:40 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  7 Sep 2025 18:04:23 +0200
Message-ID: <20250907160424.3546872-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250907160424.3546872-1-thomas.petazzoni@bootlin.com>
References: <20250907160424.3546872-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757261080; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=fcKepnE37xtm9OvU8y2yB/C1HWw4S6VjvwXRiyum+uA=;
 b=mUJ9vrUEcex0xYfJL1ce+HUVrcsfWc/dyXazOjD508hK6aRmIOuqsGKa1wvh6Wm0qm7VA3
 YTXVgDwWknAd2D0HGdP74W1JpE/NKj1z9CqKeTDIC7L4wRz3X7WLycc7zlUXsJY9ASIC40
 1rrLD5EhSC9zwDjljKGe5qW2JOjJx8O4BGpg2OT4ZBJEC2+PLLEDCWjQC/SaG11A4jq/si
 zpXNb50+J95sS5wKBhNncLexGvMAYjUEWCovo3CVAd3KZVetGYdwNeF23R0Povv+7EUiYS
 pWkFUtx8XhOOJo+WCBg+sGFaAR4V+J8/pCis8ILoTLApVNmu7yD2PLgyxeI6oA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=mUJ9vrUE
Subject: [Buildroot] [PATCH 2/2] package/c-icap-modules: fix build with GCC
 15.x
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

Add a patch fixing prototype issues with GCC 15.x. The patch cannot be
submitted upstream because the problematic code has completely changed
in newer releases.

No autobuilder failures because they were hidden by 'c-icap' not
building with GCC 15.x.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ule-function-prototypes-for-GCC-15.x.patch | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 package/c-icap-modules/0001-Fix-module-function-prototypes-for-GCC-15.x.patch

diff --git a/package/c-icap-modules/0001-Fix-module-function-prototypes-for-GCC-15.x.patch b/package/c-icap-modules/0001-Fix-module-function-prototypes-for-GCC-15.x.patch
new file mode 100644
index 0000000000..c0886d3c0e
--- /dev/null
+++ b/package/c-icap-modules/0001-Fix-module-function-prototypes-for-GCC-15.x.patch
@@ -0,0 +1,59 @@
+From 5cc2e2764588fc5025e1ba7e07361d50659bb06a Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 7 Sep 2025 17:58:00 +0200
+Subject: [PATCH] Fix module function prototypes for GCC 15.x
+
+Upstream: N/A, upstream has completely changed how modules work
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ services/virus_scan/clamav_mod.c | 4 ++--
+ services/virus_scan/clamd_mod.c  | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/services/virus_scan/clamav_mod.c b/services/virus_scan/clamav_mod.c
+index a138006..ee26ce6 100644
+--- a/services/virus_scan/clamav_mod.c
++++ b/services/virus_scan/clamav_mod.c
+@@ -75,7 +75,7 @@ static struct ci_conf_entry clamav_conf_variables[] = {
+ 
+ int clamav_init(struct ci_server_conf *server_conf);
+ int clamav_post_init(struct ci_server_conf *server_conf);
+-void clamav_release();
++void clamav_release(struct ci_server_conf *server_conf);
+ 
+ CI_DECLARE_MOD_DATA common_module_t module = {
+     "clamav_mod",
+@@ -273,7 +273,7 @@ int clamav_post_init(struct ci_server_conf *server_conf)
+      return CI_OK;
+ }
+ 
+-void clamav_release()
++void clamav_release(struct ci_server_conf *server_conf)
+ {
+     clamav_destroy_virusdb();
+     if (CLAMAV_TMP)
+diff --git a/services/virus_scan/clamd_mod.c b/services/virus_scan/clamd_mod.c
+index c0d2909..c522a9c 100644
+--- a/services/virus_scan/clamd_mod.c
++++ b/services/virus_scan/clamd_mod.c
+@@ -34,7 +34,7 @@ static struct ci_conf_entry clamd_conf_variables[] = {
+ 
+ int clamd_init(struct ci_server_conf *server_conf);
+ int clamd_post_init(struct ci_server_conf *server_conf);
+-void clamd_release();
++void clamd_release(struct ci_server_conf *server_conf);
+ 
+ CI_DECLARE_MOD_DATA common_module_t module = {
+     "clamd_mod",
+@@ -301,7 +301,7 @@ int clamd_post_init(struct ci_server_conf *server_conf)
+     return CI_OK;
+ }
+ 
+-void clamd_release()
++void clamd_release(struct ci_server_conf *server_conf)
+ {
+ }
+ 
+-- 
+2.51.0
+
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
