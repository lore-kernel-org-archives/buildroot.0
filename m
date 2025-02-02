Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BBCC02194
	for <buildroot@archiver.kernel.org>; Sun,  2 Feb 2025 18:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E4C280F4E;
	Sun,  2 Feb 2025 18:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hgSuPkYOj30U; Sun,  2 Feb 2025 18:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1890880F53
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1890880F53;
	Sun,  2 Feb 2025 18:39:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 32EC41A0
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 18:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 216AF80F49
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 18:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qzPhtw1z3JT3 for <buildroot@buildroot.org>;
 Sun,  2 Feb 2025 18:39:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.85.215.56;
 helo=mx1.ipacct.bg; envelope-from=bbonev@ipacct.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 304EE80F4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 304EE80F4E
Received: from mx1.ipacct.bg (mx1.bul.net [195.85.215.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 304EE80F4E
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 18:39:52 +0000 (UTC)
Received: from mx1.ipacct.bg (localhost [127.0.0.1])
 by mx1.ipacct.bg (Postfix) with ESMTP id C7E2D601F8
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 20:39:48 +0200 (EET)
Received: by mx1.ipacct.bg (Postfix, from userid 1001)
 id 67D3B602A3; Sun,  2 Feb 2025 20:39:48 +0200 (EET)
Received: from purple.bonev.com (purple.bonev.com [195.85.215.215])
 by mx1.ipacct.bg (Postfix) with ESMTP id CB227601F8
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 20:39:46 +0200 (EET)
Received: (qmail 24716 invoked by uid 64020); 2 Feb 2025 20:39:46 +0200
Received: from unknown (HELO localhost.localdomain) (195.85.215.8)
 by purple.bonev.com with SMTP; 2 Feb 2025 20:39:46 +0200
To: buildroot@buildroot.org
Cc: Boian Bonev <bbonev@ipacct.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  2 Feb 2025 20:39:40 +0200
Message-Id: <20250202183943.1164-1-bbonev@ipacct.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ipacct.com; s=default; t=1738521588;
 bh=tDOrZBFgMhhjyn5QbSaFldZ2YQmcZxw9i+9msyecGRM=;
 h=From:To:Cc:Subject:Date:From;
 b=epuLJmDVyAcB84PQmLNf1PXubENQZhDeDGmkUwl8gvlDe7QGNuI8XWKJcjISOsM1o
 Km0UFNdhDrewTrkxbep8WKFREF6liyY69JMR+1gkHRSFOBPZzK/dlf8CQffSsYJ1F4
 B1D7n/7zfi54Plb0CEj4l/2EoFSKx3Cm1ac6JN0yaiedex/UyD3a8aL7JqxSYuWhuj
 Vh/vz2dDXR8rAHJ51i81XOghkiyWOP88iILfrsEfgQrkrsItRMXYF/zx8bKQOw0sro
 m1wseS/jO1sqnN+hQV+gIGtrv02P+76+bAm3E24qxcK4QXpFm6QLRFWcrpw3mvQqyj
 zwYIlLqRrKpiQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ipacct.com; s=default; t=1738521588;
 bh=tDOrZBFgMhhjyn5QbSaFldZ2YQmcZxw9i+9msyecGRM=;
 h=From:To:Cc:Subject:Date:From;
 b=epuLJmDVyAcB84PQmLNf1PXubENQZhDeDGmkUwl8gvlDe7QGNuI8XWKJcjISOsM1o
 Km0UFNdhDrewTrkxbep8WKFREF6liyY69JMR+1gkHRSFOBPZzK/dlf8CQffSsYJ1F4
 B1D7n/7zfi54Plb0CEj4l/2EoFSKx3Cm1ac6JN0yaiedex/UyD3a8aL7JqxSYuWhuj
 Vh/vz2dDXR8rAHJ51i81XOghkiyWOP88iILfrsEfgQrkrsItRMXYF/zx8bKQOw0sro
 m1wseS/jO1sqnN+hQV+gIGtrv02P+76+bAm3E24qxcK4QXpFm6QLRFWcrpw3mvQqyj
 zwYIlLqRrKpiQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ipacct.com; s=default; t=1738521586;
 bh=tDOrZBFgMhhjyn5QbSaFldZ2YQmcZxw9i+9msyecGRM=;
 h=From:To:Cc:Subject:Date:From;
 b=C3NI0jxZcZUeRHFR0CSku0s0aZ3ytYWK87rjINilQbQIKZ3E9g7uNjtXCjSWgAm/I
 eXWS4bGuAOR6KyLuG2SivTqDiViXbJyEnhL1GCiYsa24XJ+lB6pIysEtCGtH8LnAbR
 nohcGjZDuA3jdrxenbYRP9kwqvjvEuQWxxRTBaSI42/UNUpdk43ZbcHqHKi7jOLxAN
 N5UrZfw+V4euc4TcCyS+eqAb65yik0rIPi9ExjT91hWgiR2HXo+IUKFZI0bXr9c7rb
 EgAP1G+wmIjCGS1bxrxFousuO7tQ59ZWFfbmjnBFxlJNrfiqZyg9Dk0mruI6anywJG
 Ymp2SJKKQc2ZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ipacct.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=ipacct.com header.i=@ipacct.com
 header.a=rsa-sha256 header.s=default header.b=epuLJmDV; 
 dkim=pass (2048-bit key) header.d=ipacct.com header.i=@ipacct.com
 header.a=rsa-sha256 header.s=default header.b=epuLJmDV; 
 dkim=pass (2048-bit key) header.d=ipacct.com header.i=@ipacct.com
 header.a=rsa-sha256 header.s=default header.b=C3NI0jxZ
Subject: [Buildroot] [PATCH] Add iotop-c package
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
From: Boian Bonev via buildroot <buildroot@buildroot.org>
Reply-To: Boian Bonev <bbonev@ipacct.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Reimplementation of iotop in C

Signed-off-by: Boian Bonev <bbonev@ipacct.com>
---
 package/Config.in            |  1 +
 package/iotop-c/Config.in    |  7 +++++++
 package/iotop-c/iotop-c.hash |  3 +++
 package/iotop-c/iotop-c.mk   | 24 ++++++++++++++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/iotop-c/Config.in
 create mode 100644 package/iotop-c/iotop-c.hash
 create mode 100644 package/iotop-c/iotop-c.mk

diff --git a/package/Config.in b/package/Config.in
index e9c789cff2..4a323d0908 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2840,6 +2840,7 @@ menu "System tools"
 	source "package/ibm-sw-tpm2/Config.in"
 	source "package/initscripts/Config.in"
 	source "package/iotop/Config.in"
+	source "package/iotop-c/Config.in"
 	source "package/iprutils/Config.in"
 	source "package/irqbalance/Config.in"
 	source "package/jailhouse/Config.in"
diff --git a/package/iotop-c/Config.in b/package/iotop-c/Config.in
new file mode 100644
index 0000000000..f5e95f5098
--- /dev/null
+++ b/package/iotop-c/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_IOTOP_C
+	bool "iotop-c"
+	select BR2_PACKAGE_NCURSES
+	help
+	  iotop does for I/O usage what top does for CPU usage.
+
+	  https://github.com/Tomas-M/iotop
diff --git a/package/iotop-c/iotop-c.hash b/package/iotop-c/iotop-c.hash
new file mode 100644
index 0000000000..5f3b14c272
--- /dev/null
+++ b/package/iotop-c/iotop-c.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  45d90cea6e9b726739e59a63bc2d09296d3539666fb4ca6c30229998e2a113a9  iotop-1.27.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/iotop-c/iotop-c.mk b/package/iotop-c/iotop-c.mk
new file mode 100644
index 0000000000..e8ed5163e6
--- /dev/null
+++ b/package/iotop-c/iotop-c.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# iotop-c
+#
+################################################################################
+
+IOTOP_C_VERSION = 1.27
+IOTOP_C_SOURCE = iotop-$(IOTOP_C_VERSION).tar.xz
+IOTOP_C_SITE = https://github.com/Tomas-M/iotop/releases/download/v$(IOTOP_C_VERSION)
+IOTOP_C_LICENSE = GPL-2.0+
+IOTOP_C_LICENSE_FILES = COPYING
+IOTOP_C_DEPENDENCIES = ncurses
+
+define IOTOP_C_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(TARGET_CONFIGURE_OPTS) \
+		NCLD=-lncurses
+endef
+
+define IOTOP_C_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
+endef
+
+$(eval $(generic-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
