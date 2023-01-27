Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145FCC38142
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 14:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFDC0611F4;
	Fri, 27 Jan 2023 14:13:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFDC0611F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Arw_NSkiLgSv; Fri, 27 Jan 2023 14:13:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDB3B612AC;
	Fri, 27 Jan 2023 14:13:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDB3B612AC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3621C1BF39E
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 14:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BAA0460E5C
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 14:11:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAA0460E5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LAdvPY7idXug for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 14:11:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98203611F4
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98203611F4
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 14:11:07 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id k3so383302ioc.10
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 06:11:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W0+E37xprYMc+R3i6ftgjflThv2FWnhYtgSlLRAIAAE=;
 b=FgH2pvBgAZE1ugVef8fOE01mt9BdDPp/RSAQlaZwDoA6TVdcxLEtTL8mG62iBFakWi
 dshZ895ttiV/jcqnIXJW/4DidZbYrXEzweX+TUa01opT8Nb+WnM+LfJK9fFjI+51JDuY
 yeXJ+Yu0yWB7c0V/nOCYlWp9OCBP/JO1O4XQain2UMtFIp7+S0a2hksw0sWixz5ARB9i
 3E1klxdVsTtvOrsLUgyy56IdpHhRFt0NqCHPjSe7xEeRFDlWtngfoqnTqY26PiNFySpF
 rXZnqkv4sEMClqTDXAUqYBpsM4TBrGiowVYriHqLOTD7ac68oHGEmr2+6vMvO7vUz/JS
 shCQ==
X-Gm-Message-State: AFqh2krX3RpHs4drwUuqPuPZHjrAdfzHbyO+xfSL1My5QJpCJBRh1IBS
 CIJzhRbEqUpxkQcPCBESVvGS23Brb1uRjQ==
X-Google-Smtp-Source: AMrXdXuRRtL3+J1vKYfQDDJ+jCTGSlH5djVRRwyM6vJyIDneVDRAQOyT0Me1voB2Kua9EXpLBE8XQA==
X-Received: by 2002:a6b:e61a:0:b0:704:d0d8:632b with SMTP id
 g26-20020a6be61a000000b00704d0d8632bmr27191701ioh.16.1674828666449; 
 Fri, 27 Jan 2023 06:11:06 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 n2-20020a6bed02000000b006d8b7bcaa6esm1290806iog.4.2023.01.27.06.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 06:11:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 Jan 2023 07:10:54 -0700
Message-Id: <20230127141058.2180747-9-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127141058.2180747-1-james.hilliard1@gmail.com>
References: <20230127141058.2180747-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W0+E37xprYMc+R3i6ftgjflThv2FWnhYtgSlLRAIAAE=;
 b=gtszJZi8FAssiaNJ5xMD1Kc3ha3FpcStMxRIR9WUMhQaDEcxsTIlKIyCFI/Itzxrei
 Xli49NzWLsquefXfWDOeNi8NwHgZCkimitZe8yAcufYI5qZQkxYW94KHMTd/7WGgYgoT
 XbwasDkbhCDrIs/pFhs35l6sWLbD5AcI2b/U9L3aBJXxmT2aRkGBmRoTy2A96+BXJl0D
 25f4AOKcKcFxupYzWHY44Nc31Nkr86Bav2J/72KfOR1yLBAzLP8B8wHH9osdGSTCHx7Z
 kQYPYh+8v+ZsZkkAXmnXTc1n0fpWXzAaHDdvn9wGuZrBj3wK6Xlv4fi6YQD3iuvfk0kp
 RPfg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gtszJZi8
Subject: [Buildroot] [PATCH v4 09/13] package/fp16: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package is required by tensorflow-lite.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/fp16/Config.in |  8 ++++++++
 package/fp16/fp16.hash |  4 ++++
 package/fp16/fp16.mk   | 19 +++++++++++++++++++
 5 files changed, 33 insertions(+)
 create mode 100644 package/fp16/Config.in
 create mode 100644 package/fp16/fp16.hash
 create mode 100644 package/fp16/fp16.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 501bbff35e..fc74c089fe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2703,6 +2703,7 @@ F:	package/ti-gfx/
 
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
+F:	package/fp16/
 F:	package/fxdiv/
 F:	package/gemmlowp/
 F:	package/neon-2-sse/
diff --git a/package/Config.in b/package/Config.in
index a87f360221..d33806a013 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2007,6 +2007,7 @@ menu "Other"
 	source "package/flann/Config.in"
 	source "package/flatbuffers/Config.in"
 	source "package/flatcc/Config.in"
+	source "package/fp16/Config.in"
 	source "package/fxdiv/Config.in"
 	source "package/gconf/Config.in"
 	source "package/gdal/Config.in"
diff --git a/package/fp16/Config.in b/package/fp16/Config.in
new file mode 100644
index 0000000000..e07c6ebb8a
--- /dev/null
+++ b/package/fp16/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_FP16
+	bool "fp16"
+	select BR2_PACKAGE_PSIMD
+	help
+	  Header-only library for conversion to/from half-precision
+	  floating point formats.
+
+	  https://github.com/Maratyszcza/FP16
diff --git a/package/fp16/fp16.hash b/package/fp16/fp16.hash
new file mode 100644
index 0000000000..63634eb2cf
--- /dev/null
+++ b/package/fp16/fp16.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  a91f4770ff9c39f4d72e339c379f566b3bbb359fa66122d85fc0bae3dde7abc7  fp16-0a92994d729ff76a58f692d3028ca1b64b145d91.tar.gz
+# License files, locally calculated
+sha256  17e4f539024be2749ee729d1e2f01d24cef12ece8c9bf18e91a4349be29c80bf  LICENSE
diff --git a/package/fp16/fp16.mk b/package/fp16/fp16.mk
new file mode 100644
index 0000000000..52f48232fa
--- /dev/null
+++ b/package/fp16/fp16.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# fp16
+#
+################################################################################
+
+FP16_VERSION = 0a92994d729ff76a58f692d3028ca1b64b145d91
+FP16_SITE = $(call github,Maratyszcza,FP16,$(FP16_VERSION))
+FP16_LICENSE = MIT
+FP16_LICENSE_FILES = LICENSE
+FP16_INSTALL_STAGING = YES
+FP16_INSTALL_TARGET = NO
+FP16_DEPENDENCIES = psimd
+FP16_CONF_OPTS = \
+	-DFP16_BUILD_TESTS=OFF \
+	-DFP16_BUILD_BENCHMARKS=OFF \
+	-DPSIMD_SOURCE_DIR="$(PSIMD_DIR)"
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
