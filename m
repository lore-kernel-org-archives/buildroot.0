Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA319CA101F
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3E4841938;
	Wed, 10 Sep 2025 21:33:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PAWGbNn3ZtfT; Wed, 10 Sep 2025 21:33:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4EDB41933
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4EDB41933;
	Wed, 10 Sep 2025 21:33:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 27C46234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E5E241919
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1TnGypMDUHxS for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:33:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0EC064191B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EC064191B
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0EC064191B
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 7ADDDC6B3BE
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 51331606D4
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DA098102F29D6; 
 Wed, 10 Sep 2025 23:33:15 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Sep 2025 23:32:14 +0200
Message-ID: <20250910213241.1529448-7-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757539996; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=UFnewg7DoDGaNdX10r1On1w5JZuGKn7hf87BwOgpYSE=;
 b=N6SL063Ni0D1Mv86Rs/c7ba3x0KXjTXIOmNLnAg7NFg7EqGciuduV4IlS3d21BgLE7u/Pu
 uhfnAVaiZ/InOGpnmcDWvAOgz3m5YzXiwr55bU5FCFHZO/tXzt8SpJSqFOuGzN6m5RzCMh
 eAgzQnbP8uUUc1EktlXyROMSK8/6lUVQncWbLa+CzzHFXrtcpm20ScqQaIMLdZT4MPMkvU
 OQwNTziR2CwYDJIfUL+cfTs/75f7Fgqtb8WTsEEyK9LjYJCbL69RkAQb3YM5ZOmDpJSed8
 Rm7dVXeFLVH4burCORcmEq7+IV2wF2ETOTk7CtqPCoiAJRmi/Etrj2k/Bzv/wQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=N6SL063N
Subject: [Buildroot] [PATCH 06/23] package/gtkperf: remove package
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

This package requires libgtk2, which we are about to remove.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in            |  1 -
 package/gtkperf/Config.in    | 11 -----------
 package/gtkperf/gtkperf.hash |  3 ---
 package/gtkperf/gtkperf.mk   | 15 ---------------
 4 files changed, 30 deletions(-)
 delete mode 100644 package/gtkperf/Config.in
 delete mode 100644 package/gtkperf/gtkperf.hash
 delete mode 100644 package/gtkperf/gtkperf.mk

diff --git a/package/Config.in b/package/Config.in
index e42ef67d7d..b2c1be89a0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -401,7 +401,6 @@ comment "X applications"
 	source "package/dillo/Config.in"
 	source "package/docker/Config.in"
 	source "package/feh/Config.in"
-	source "package/gtkperf/Config.in"
 	source "package/leafpad/Config.in"
 	source "package/mupdf/Config.in"
 	source "package/nodm/Config.in"
diff --git a/package/gtkperf/Config.in b/package/gtkperf/Config.in
deleted file mode 100644
index a763e305c7..0000000000
--- a/package/gtkperf/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_GTKPERF
-	bool "gtkperf (performance test for GTK2)"
-	depends on BR2_PACKAGE_LIBGTK2
-	help
-	  GtkPerf is an application designed to test GTK+ performance.
-	  The point is to create common testing platform to run
-	  predefined GTK+ widgets
-	  e.g. (opening comboboxes, toggling buttons, scrolling text
-	  yms.) and this way define the speed of device/platform.
-
-	  http://gtkperf.sourceforge.net/
diff --git a/package/gtkperf/gtkperf.hash b/package/gtkperf/gtkperf.hash
deleted file mode 100644
index 72f35a26f2..0000000000
--- a/package/gtkperf/gtkperf.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  9704344e732038eecbd007dd996a56293a6b027b5b76f3f036273a3fae1ab27b  gtkperf_0.40.tar.gz
-sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/gtkperf/gtkperf.mk b/package/gtkperf/gtkperf.mk
deleted file mode 100644
index cc0433984c..0000000000
--- a/package/gtkperf/gtkperf.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# gtkperf
-#
-################################################################################
-
-GTKPERF_VERSION = 0.40
-GTKPERF_SOURCE = gtkperf_$(GTKPERF_VERSION).tar.gz
-GTKPERF_SITE = http://downloads.sourceforge.net/project/gtkperf/gtkperf/$(GTKPERF_VERSION)
-GTKPERF_DEPENDENCIES = libgtk2 $(TARGET_NLS_DEPENDENCIES)
-GTKPERF_LICENSE = GPL-2.0
-GTKPERF_LICENSE_FILES = COPYING
-GTKPERF_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
-
-$(eval $(autotools-package))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
