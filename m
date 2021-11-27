Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22255C433EF
	for <buildroot@archiver.kernel.org>; Sat, 27 Nov 2021 11:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D934681016;
	Sat, 27 Nov 2021 11:39:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qMygz_8bbJkw; Sat, 27 Nov 2021 11:39:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B70D81024;
	Sat, 27 Nov 2021 11:38:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E21241BF30D
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 11:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D227D6062D
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 11:37:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L1-nX3OTWTNG for <buildroot@lists.busybox.net>;
 Sat, 27 Nov 2021 11:37:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA54360598
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 11:37:49 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id z26so14630016iod.10
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 03:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HgfUksnCXJvCGooKgCEdYPghhOc0RaWrYJbhp0N/464=;
 b=i+h8yKbmOVHRjmHeuOdD68XX1nq3Jh4E+1EODXX4pcacgxfHswhfx35WwdegJDboLa
 g15LRo6frRU09NekgYIm+jLDwkfZIKQFIfUw7o7uS7z9bFYdJL6rXtOV7LXnzCPSWPmK
 6wmpbjjOCJdXdPDqb9ZSBz7dW+wvUWHcYgfWsHL1tJ7MZUaMXopWDQdoQRqqv3Ym212f
 eTSq1mUM+rWcC5YopXSBkl4U4b4w6RpJyu3hBAoyCIf1ERBBr00ISsrpmcutnEy78Ux6
 XlsQivZR/+gJ8gSD+8YKy/9SQTL2AGSW+AD0UDw9Jd6C9p4C1AxaaOb6c1bXnOZx+V7f
 hPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HgfUksnCXJvCGooKgCEdYPghhOc0RaWrYJbhp0N/464=;
 b=QzWWGW34qa9OdXcZ+jdHg7Xi2YTQiHgII7EUOKm37qt5/aV6cQ1EmZIHm6vPR6PoiK
 q6ESd8aonbOHUgr/mhY0BYQ40I8nzT/wgDGIbAMyjotnz7LFbReCJHoCMR6UEAwnxBpf
 dony43MpDaMzr5f9ooaUurGyH146eMMKQMujjiLWeSv1R+p+1Iwpahk1inVTPKYcDuFB
 42HNxx9OYikqmmrZc8w6VTAIK+NeX5WKmG/nKGlxIV3imtAYI58Vs3XpFwj2Qql//Nnc
 OehvY+qhReIO5+MoTMlxjQAzs1905CMKsYBDer4op8+ZCEXql0QHVF7SSiY/NotpJi/T
 PORg==
X-Gm-Message-State: AOAM53359DdEpU2qWdYSyGnkCVtZDkxyOcvenTWMopZLPSS5tjj9gOHc
 BG8AgHHAx2D//QTDEwAq9DXKPnF9+18=
X-Google-Smtp-Source: ABdhPJzSHPwykziQ0TNIp9quCLwyVz5uIAmBpxfLECQBSO/8FXGyhg3iSQa42XNZ0HUe7Xtakzttkg==
X-Received: by 2002:a05:6638:25c8:: with SMTP id
 u8mr52821540jat.23.1638013068967; 
 Sat, 27 Nov 2021 03:37:48 -0800 (PST)
Received: from james-x399.localdomain (71-33-128-47.hlrn.qwest.net.
 [71.33.128.47])
 by smtp.gmail.com with ESMTPSA id g4sm6389435ila.78.2021.11.27.03.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 03:37:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Nov 2021 04:37:35 -0700
Message-Id: <20211127113735.2178776-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211127113735.2178776-1-james.hilliard1@gmail.com>
References: <20211127113735.2178776-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 7/7] package/python-weasyprint: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                               |  1 +
 package/python-weasyprint/Config.in             | 17 +++++++++++++++++
 .../python-weasyprint/python-weasyprint.hash    |  5 +++++
 package/python-weasyprint/python-weasyprint.mk  | 14 ++++++++++++++
 4 files changed, 37 insertions(+)
 create mode 100644 package/python-weasyprint/Config.in
 create mode 100644 package/python-weasyprint/python-weasyprint.hash
 create mode 100644 package/python-weasyprint/python-weasyprint.mk

diff --git a/package/Config.in b/package/Config.in
index f348edb8c3..da7eca7679 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1271,6 +1271,7 @@ menu "External python modules"
 	source "package/python-visitor/Config.in"
 	source "package/python-watchdog/Config.in"
 	source "package/python-wcwidth/Config.in"
+	source "package/python-weasyprint/Config.in"
 	source "package/python-web2py/Config.in"
 	source "package/python-webencodings/Config.in"
 	source "package/python-webob/Config.in"
diff --git a/package/python-weasyprint/Config.in b/package/python-weasyprint/Config.in
new file mode 100644
index 0000000000..3e0d716fb1
--- /dev/null
+++ b/package/python-weasyprint/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_PYTHON_WEASYPRINT
+	bool "python-weasyprint"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	select BR2_PACKAGE_PYTHON_CSSSELECT2 # runtime
+	select BR2_PACKAGE_PYTHON_FONTTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_BROTLI # runtime
+	select BR2_PACKAGE_PYTHON_ZOPFLI # runtime
+	select BR2_PACKAGE_PYTHON_HTML5LIB # runtime
+	select BR2_PACKAGE_PYTHON_PILLOW # runtime
+	select BR2_PACKAGE_PYTHON_PYDYF # runtime
+	select BR2_PACKAGE_PYTHON_PYPHEN # runtime
+	select BR2_PACKAGE_PYTHON_TINYCSS2 # runtime
+	help
+	  The Awesome Document Factory.
+
+	  https://www.courtbouillon.org/weasyprint
diff --git a/package/python-weasyprint/python-weasyprint.hash b/package/python-weasyprint/python-weasyprint.hash
new file mode 100644
index 0000000000..8d231c50ba
--- /dev/null
+++ b/package/python-weasyprint/python-weasyprint.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/weasyprint/json
+md5  a90fd2d5a581a0e218943af3a8b64a31  weasyprint-53.4.tar.gz
+sha256  10ccb17d55c73096bdf1edd3efe58cb855b07e4c307d9bad4ebc9a3f13ff4580  weasyprint-53.4.tar.gz
+# Locally computed sha256 checksums
+sha256  bfd14eccfa6100575460e685556b183399d4bd335904e3c9521b0116d21c54da  LICENSE
diff --git a/package/python-weasyprint/python-weasyprint.mk b/package/python-weasyprint/python-weasyprint.mk
new file mode 100644
index 0000000000..0a944825bb
--- /dev/null
+++ b/package/python-weasyprint/python-weasyprint.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-weasyprint
+#
+################################################################################
+
+PYTHON_WEASYPRINT_VERSION = 53.4
+PYTHON_WEASYPRINT_SOURCE = weasyprint-$(PYTHON_WEASYPRINT_VERSION).tar.gz
+PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/72/25/336e274fde0e48cf9979d44667411fbcfa55d323fd7672068807b6de2f89
+PYTHON_WEASYPRINT_SETUP_TYPE = distutils
+PYTHON_WEASYPRINT_LICENSE = BSD-3-Clause
+PYTHON_WEASYPRINT_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
