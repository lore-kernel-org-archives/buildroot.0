Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5725C5B549
	for <buildroot@archiver.kernel.org>; Fri,  6 Jun 2025 07:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AA6E60632;
	Fri,  6 Jun 2025 07:02:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pbXiF0gBBIsE; Fri,  6 Jun 2025 07:02:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2369860A35
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2369860A35;
	Fri,  6 Jun 2025 07:02:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4148B1A4
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 07:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25DE240C8E
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 07:02:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2KQs4dg2rQIX for <buildroot@buildroot.org>;
 Fri,  6 Jun 2025 07:02:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5E7A340C17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E7A340C17
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E7A340C17
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 07:02:13 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a4f78ebec8so1039870f8f.0
 for <buildroot@buildroot.org>; Fri, 06 Jun 2025 00:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749193330; x=1749798130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uzu8vz+TO4AuuHKF0P732MMqMnZ1bqugZLn/MMffkZg=;
 b=U2Wxd7/+k83igKSqrkJI/OYY18rxIUngaNcr6Y3jGzBa9/+JYmGZLEZG87u5huXHQ4
 gD7D6huiol/s7E7vGbMB3JHeJ74UOGgfYA/V1ssnb1Hrx/zev07eR8a7ez2bBkKW1+S1
 RLdAtVtA3YIh/OHAE3azV4aAoPcXIDwgaX6zlwM0sUr+vjKoSiBKCkfvxYoZdsG+c93l
 QfhRp2NRi4o6otWxpwuxi11T0tuftqennDhtQqrDN4YBjv3xxJQrLXeoYglP4yHWzxYj
 dhIeE6/QorPKewvJc0JE04uEolx7jdWIdM/WTW3vc+PnXzmYgD4TbBmNNh9RhumSLRr9
 qiJA==
X-Gm-Message-State: AOJu0Ywvqq4GTPY66DiDRd0F65woX8nxTO0FLAcyRwDuQYJvrmrN5AKV
 DabsZx7BicziIDLSmJJvXcfWoyajfF6g0to1RdTrP8isZ8Xsu3sFDw0gQ9Ig5vb9vkitFPf2LD3
 ba4sa
X-Gm-Gg: ASbGnctv6GVo+E8e5WB0fNIujTYHvUqI5H4/lQQfEWEBLIgbWULMdbKzOfZ2jcFHg2x
 UYCKPWm4OA1iJSxdH9QTF/jhsq76XYxphYog41iXpInfty24RupXeAn/bhRgHzVZL75k/zt2eZP
 DclETrLhh9wLXMtWLcIVMMkY3N0AWuQOf1lbUwy9n0sVZR1QhKrLT+EQf7fcXtjYeV/9kXswpCu
 4yq1Om1OVQepT+YGIaJbo9TuTuD2pXG5PDT1RVD5pHgsPoXZvJn2wiHHGMBDYqgpTLaKcpr9SWZ
 +0OEORNSCZsGEwEFojXTLaROJAPOt9I4pC9Inp0I3QtoAj/EEBLrTlcvhP8ipGWeipbdCDBhGGZ
 8j/WlfIz3v8f4Pz0XLxbwXaOKUWzms42s9/LYZ6sCq73p4k0wxUNMWoKf
X-Google-Smtp-Source: AGHT+IF2zQ7oFJKWab9skmynAHDKT3DcenlWr2qwlnyfnDoFkSBwqIZ8FqH/e1FNElSKkLG03G4A6Q==
X-Received: by 2002:a05:6000:2082:b0:3a4:e8bc:594 with SMTP id
 ffacd0b85a97d-3a5319b9ab5mr1667856f8f.8.1749193330330; 
 Fri, 06 Jun 2025 00:02:10 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53229d96fsm1035353f8f.7.2025.06.06.00.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 00:02:10 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Gilles Talis <gilles.talis@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Fri,  6 Jun 2025 09:01:50 +0200
Message-ID: <20250606070152.396438-4-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606070152.396438-1-elmehdi.younes@smile.fr>
References: <20250606070152.396438-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1749193330; x=1749798130; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uzu8vz+TO4AuuHKF0P732MMqMnZ1bqugZLn/MMffkZg=;
 b=cpQQgv54aGib1HeUrUrlXEcgMQ6tx0v2AK05j3AVoalCOiKYWH0eNT5f5wmBqOF7jz
 gXRYFimirO/HPkTkxj0a5v1Kimzm22nISlwx6UBey3DbSIyYq2i2yqlvk3zq29kZkSNS
 5H7cVOc8RqAS1XMqWwNtKMa8PD3J9pRtqci/4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=cpQQgv54
Subject: [Buildroot] [PATCH 3/5] package/opencl-icd-loader: new package
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

This adds the OpenCL installable client driver (ICD) loader
which provides the 'libOpenCL.so' shared library needed to
run OpenCL programs.

Mesa3D can offer opencl implementations (such as rusticl),
but it does not provide 'libOpenCL.so'.

Without it, programs like 'clinfo' fail to build not
finding 'libOpenCL.so'.

see:
https://github.com/KhronosGroup/OpenCL-ICD-Loader

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 package/Config.in                             |  1 +
 package/opencl-icd-loader/Config.in           | 12 ++++++++++
 .../opencl-icd-loader/opencl-icd-loader.hash  |  3 +++
 .../opencl-icd-loader/opencl-icd-loader.mk    | 22 +++++++++++++++++++
 4 files changed, 38 insertions(+)
 create mode 100644 package/opencl-icd-loader/Config.in
 create mode 100644 package/opencl-icd-loader/opencl-icd-loader.hash
 create mode 100644 package/opencl-icd-loader/opencl-icd-loader.mk

diff --git a/package/Config.in b/package/Config.in
index 0f3197b9c4..116af4e414 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1789,6 +1789,7 @@ menu "Graphics"
 	source "package/menu-cache/Config.in"
 	source "package/opencl-clhpp/Config.in"
 	source "package/opencl-headers/Config.in"
+	source "package/opencl-icd-loader/Config.in"
 	source "package/opencv3/Config.in"
 	source "package/opencv4/Config.in"
 	source "package/opencv4-contrib/Config.in"
diff --git a/package/opencl-icd-loader/Config.in b/package/opencl-icd-loader/Config.in
new file mode 100644
index 0000000000..405dc5401a
--- /dev/null
+++ b/package/opencl-icd-loader/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_OPENCL_ICD_LOADER
+	bool "OpenCL-ICD-Loader"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_HAS_LIBOPENCL
+	select BR2_PACKAGE_OPENCL_HEADERS
+	help
+	  OpenCL defines an Installable Client Driver (ICD) mechanism to
+	  allow developers to build applications against an Installable
+	  Client Driver loader (ICD loader) rather than linking their
+	  applications against a specific OpenCL implementation.
+
+	  https://github.com/KhronosGroup/OpenCL-ICD-Loader
diff --git a/package/opencl-icd-loader/opencl-icd-loader.hash b/package/opencl-icd-loader/opencl-icd-loader.hash
new file mode 100644
index 0000000000..da9f75b63a
--- /dev/null
+++ b/package/opencl-icd-loader/opencl-icd-loader.hash
@@ -0,0 +1,3 @@
+# locally generated
+sha256  95f2f0cda375b13d2760290df044ebea9c6ff954a7d7faa0867422442c9174dc  OpenCL-ICD-Loader-2024.10.24.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/opencl-icd-loader/opencl-icd-loader.mk b/package/opencl-icd-loader/opencl-icd-loader.mk
new file mode 100644
index 0000000000..cb3d7e462d
--- /dev/null
+++ b/package/opencl-icd-loader/opencl-icd-loader.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# opencl-icd-loader
+#
+################################################################################
+
+# The opencl-headers, opencl-icd-loader, and opencl-clhpp packages
+# must always be updated together to compatible versions.
+# Version desynchronization may result in build or runtime errors.
+# When updating one of them, make sure to check and update the others.
+OPENCL_ICD_LOADER_VERSION = 2024.10.24
+OPENCL_ICD_LOADER_SOURCE = OpenCL-ICD-Loader-$(OPENCL_ICD_LOADER_VERSION).tar.gz
+OPENCL_ICD_LOADER_SITE = $(call github,KhronosGroup,OpenCL-ICD-Loader,v$(OPENCL_ICD_LOADER_VERSION))
+OPENCL_ICD_LOADER_LICENSE = Apache-2.0
+OPENCL_ICD_LOADER_LICENSE_FILES = LICENSE
+OPENCL_ICD_LOADER_INSTALL_STAGING = YES
+
+OPENCL_ICD_LOADER_DEPENDENCIES = opencl-headers
+
+OPENCL_ICD_LOADER_CONF_OPTS += -DOPENCL_ICD_LOADER_HEADERS_DIR=$(STAGING_DIR)/usr/include
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
