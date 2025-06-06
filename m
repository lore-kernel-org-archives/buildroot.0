Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18062C5AD49
	for <buildroot@archiver.kernel.org>; Fri,  6 Jun 2025 07:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF1EF84EE9;
	Fri,  6 Jun 2025 07:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PbbdO9KPwHUQ; Fri,  6 Jun 2025 07:02:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D31D583C53
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D31D583C53;
	Fri,  6 Jun 2025 07:02:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FAE1D3
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 07:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D8EB40C17
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 07:02:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xBREwWPF3Yh0 for <buildroot@buildroot.org>;
 Fri,  6 Jun 2025 07:02:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5732740C09
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5732740C09
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5732740C09
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 07:02:11 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a3798794d3so1387285f8f.1
 for <buildroot@buildroot.org>; Fri, 06 Jun 2025 00:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749193329; x=1749798129;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vEqNqPysU4WuFfIlzq75ErWTA6+rClXif42Xm/NCRtA=;
 b=ooXkBhYgtAbKSwI0M0g4UYk91jhvEuN49D7FlABLNu0o788k/rz+P8c8BuW8rNtY8l
 j4kTzFuos0f5DJLePAiFXu/8lMOMTX7ktC/AQTJdKfkCeQM4Kh0noM3i2otca3tmZ24v
 8h4aKMv+e0M3lPbXXFOzsk6AaEEIlDXCXFU6BJoZ5qyICs3Hmi3PQxJDd+qFCESI+bLH
 yDcPInOUOtnBwxB1We6igZiOWcWMUlDN+0vJT40bNA0wb/S4NQWgBTCiWRxnotIhC0+l
 0DHQ6KZui6tkw0MAtykl0gCauqRh3ZOnKF4NmnYlcduCZBMgXxHpvlvy3kIqGsW3VcEB
 tQow==
X-Gm-Message-State: AOJu0Yw0b6sg9IF2xlshh9RjmtRN6BV56IVz+h0RFZyniXHY1pGpmXQY
 iqPXc4sTKvC+fFiELgJyCAIknESMpS+PgZSlD4FJ/1rTKMnh6CSafmcg+blFG1iD+zo6SJFIyTn
 oqigN
X-Gm-Gg: ASbGnctkHpblEDULY44hRyycjzIbRc3wJQ7rzC8gZKvOn89JaLRMFE5FS7UpCMIDvek
 oDGgshf7PEjPr50qZx6dXx7tJb19PYPfkIOl4Np08J0xqukSpjO4vJDVYHcD4e1lzR9gIeFPKzz
 DWUFKk7H0S2/nVQCvg91JohMuClsZtq/+k7fIGgOTteL6CfTPBgTv4+SniNWLpFoQijBDa0/vvi
 AvwUvF2mQ9Fcl/b8lZyoJbF40dTOEA65U+oWHNY9qg6GO+YbeVWhO0hEFdwszrYOCxDUjdp5y82
 ePmSDVh/iAY8Ua9DLQBm01LgAh9jiI6q+IsWTfUi8vTtgmAPAX+9FipxwaQIsDINEmNbZjgLRd7
 fB/zTc6/RRrQpoE99t3Z3hLLigKcdnWr9ugpEPhCMagZqhELt1fiw9jEr
X-Google-Smtp-Source: AGHT+IF1KcRBOFHvLlzQMZR8zOFs8KRDic15r76/4WuvIxBv59qZjs1KMlOE4P1NbovYp8YtOY64pg==
X-Received: by 2002:a05:6000:178f:b0:3a5:2694:d75f with SMTP id
 ffacd0b85a97d-3a531ce73bbmr1760352f8f.52.1749193329056; 
 Fri, 06 Jun 2025 00:02:09 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53229d96fsm1035353f8f.7.2025.06.06.00.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 00:02:08 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Gilles Talis <gilles.talis@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Fri,  6 Jun 2025 09:01:49 +0200
Message-ID: <20250606070152.396438-3-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606070152.396438-1-elmehdi.younes@smile.fr>
References: <20250606070152.396438-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1749193329; x=1749798129; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vEqNqPysU4WuFfIlzq75ErWTA6+rClXif42Xm/NCRtA=;
 b=xPpuC7N9cH2+29nw2k4UxNg/kVg+BaQ6mIXZNLIzlgDV2gUEzp4rse9aPZO6VxiryA
 8sTQkDqypvHsXzvchu6KyBx04A6W0P0RwbWz7DDlItWZxNZ6T0y5os6ieM/obMpxv/SV
 U2NWpNVwUhhLPEPFQRelVS5wk/BWRtv5hSZUM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=xPpuC7N9
Subject: [Buildroot] [PATCH 2/5] package/opencl-headers: new package
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the "opencl-headers" package to install the OpenCL C API headers,
which are required at build time by consumers such as
opencl-icd-loader.

While Mesa provides these headers internally, they are not installed
by default since clover and opencl-gallium are deprecated and will
be removed starting from mesa 25.2

And since we should install them manually from mesa, it is better
use external headers. This ensures these headers are always
available and up-to-date independently from those provided by Mesa,
folowing the same logic used for "opencl-clhpp".

see:
https://github.com/KhronosGroup/OpenCL-ICD-Loader#dependencies
https://gitlab.freedesktop.org/mesa/mesa/-/tree/main/include/CL
https://github.com/KhronosGroup/OpenCL-Headers
https://gitlab.freedesktop.org/mesa/mesa/-/commit/5844dea31620f36c41ac738e17fefd57084b2dbb#feedf4d0444f717d7227468a9529c2cf9740b6fd

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 package/Config.in                          |  1 +
 package/opencl-headers/Config.in           |  6 +++++
 package/opencl-headers/opencl-headers.hash |  3 +++
 package/opencl-headers/opencl-headers.mk   | 26 ++++++++++++++++++++++
 4 files changed, 36 insertions(+)
 create mode 100644 package/opencl-headers/Config.in
 create mode 100644 package/opencl-headers/opencl-headers.hash
 create mode 100644 package/opencl-headers/opencl-headers.mk

diff --git a/package/Config.in b/package/Config.in
index 6e9846cee5..0f3197b9c4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1788,6 +1788,7 @@ menu "Graphics"
 	source "package/libwpe/Config.in"
 	source "package/menu-cache/Config.in"
 	source "package/opencl-clhpp/Config.in"
+	source "package/opencl-headers/Config.in"
 	source "package/opencv3/Config.in"
 	source "package/opencv4/Config.in"
 	source "package/opencv4-contrib/Config.in"
diff --git a/package/opencl-headers/Config.in b/package/opencl-headers/Config.in
new file mode 100644
index 0000000000..677349f727
--- /dev/null
+++ b/package/opencl-headers/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_OPENCL_HEADERS
+	bool "opencl-headers"
+	help
+	  C language headers for the OpenCL API
+
+	  https://github.com/KhronosGroup/OpenCL-Headers
diff --git a/package/opencl-headers/opencl-headers.hash b/package/opencl-headers/opencl-headers.hash
new file mode 100644
index 0000000000..bd8697e43d
--- /dev/null
+++ b/package/opencl-headers/opencl-headers.hash
@@ -0,0 +1,3 @@
+#Locally generated
+sha256  159f2a550592bae49859fee83d372acd152328fdf95c0dcd8b9409f8fad5db93  OpenCL-Headers-2024.10.24.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencl-headers/opencl-headers.mk b/package/opencl-headers/opencl-headers.mk
new file mode 100644
index 0000000000..388a86e02e
--- /dev/null
+++ b/package/opencl-headers/opencl-headers.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# opencl-headers
+#
+################################################################################
+
+# The opencl-headers, opencl-icd-loader, and opencl-clhpp packages
+# must always be updated together to compatible versions.
+# Version desynchronization may result in build or runtime errors.
+# When updating one of them, make sure to check and update the others.
+
+OPENCL_HEADERS_VERSION = 2024.10.24
+OPENCL_HEADERS_SOURCE = OpenCL-Headers-$(OPENCL_HEADERS_VERSION).tar.gz
+OPENCL_HEADERS_SITE = $(call github,KhronosGroup,OpenCL-Headers,v$(OPENCL_HEADERS_VERSION))
+OPENCL_HEADERS_LICENSE = Apache-2.0
+OPENCL_HEADERS_LICENSE_FILES = LICENSE
+OPENCL_HEADERS_INSTALL_STAGING = YES
+OPENCL_HEADERS_INSTALL_TARGET = NO
+
+define OPENCL_HEADERS_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include/CL
+	$(INSTALL) -D -m 0644 $(@D)/CL/* \
+		$(STAGING_DIR)/usr/include/CL
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
