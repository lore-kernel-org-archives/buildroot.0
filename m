Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D12C41513
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 17:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F648610E9;
	Tue, 25 Jul 2023 17:35:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F648610E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5LDBy_L3rRuZ; Tue, 25 Jul 2023 17:35:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39DD661107;
	Tue, 25 Jul 2023 17:34:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39DD661107
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DD521BF317
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 17:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04052610F2
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 17:33:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04052610F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WPcPD0cGKO2k for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 17:33:58 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC1FD610F0
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 17:33:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC1FD610F0
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3110ab7110aso5403939f8f.3
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 10:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690306436; x=1690911236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8PCb8wjZHk9QQ7WVW5VgiHE/91KqKDY8R0u4+Izz5VU=;
 b=PORnZ3hNJdh1a9mxZRYXCbhYHXZD0o/UjIlysdvI418dUN0PK7Hpk9al/FWP3LDCpS
 Zx6nb8Ktv2LyG6ZbJ3x7HEaw77mPHdfsn6fM9CayhBkby5lWgzTZjAwoj6JYlFIsD5X/
 dwYqtMKjgIv0mZOJBtNqdya3Jr7eF/h+0L3Sbx4389sfEJtVAPUzLaLv/UWAi/FEG7TE
 KEo+F/A8Sw4uEiutbRmKmHs6QNsVmgEKEc8wpTB6uakt/gqajNeJ7zFa2z5aYSnfr+IK
 rVb1q+gjKLImOr2v3/+9lRCsCKxaGtFGNNxpqyxrJpPuzGs9z90WX3Q/yEbM2ruVndJ8
 n7pQ==
X-Gm-Message-State: ABy/qLYGNcP9DZdWnOgTIFquI4mxM4FBvsebFt/+/Gw+HyTGCrmJliL5
 AOOGtZ8MLMIl/OoHCI3SZGi8XjiWiaIG0o/hDe8=
X-Google-Smtp-Source: APBJJlFano7nH6xVm24s0qswhxbvk7O1Rx6p491LOgkAfgCuqpdRZHgBha6ny8hRpvMHR62Gpy1ZZQ==
X-Received: by 2002:adf:ed90:0:b0:315:7d2f:fc36 with SMTP id
 c16-20020adfed90000000b003157d2ffc36mr11323553wro.20.1690306435854; 
 Tue, 25 Jul 2023 10:33:55 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:e537:2825:8aee:d1db])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a5d61c4000000b00316eb7770b8sm11721541wrv.5.2023.07.25.10.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 10:33:55 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 19:30:59 +0200
Message-Id: <20230725173102.543874-8-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230725173102.543874-1-sebastian.weyer@smile.fr>
References: <20230725173102.543874-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1690306436; x=1690911236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8PCb8wjZHk9QQ7WVW5VgiHE/91KqKDY8R0u4+Izz5VU=;
 b=HFlnANS03dEy3vckSoAloB9t9v9wBEGBdsYc/sH+YufKIamDp/TgZKi1kDMfvXJcNl
 1HQtfeLR3sjdig7pGykLVt2Igxn/AWlJZq7fRomW7jZSdjo7fJfJ0rX2HHb+hH3PCwYc
 8j6tA1SKFSKbuH+xEFr2Hc27Kpa6hEqDjuK7zHLrYKQzkbHuR1gMjRTVyPFHHiOarKFe
 1xMkDTtLwU8E7SoZkNn4Rstie9JdDdNRvixg896r8JUW4/+OMg/TuyHzXThJZM5qNcCO
 Mbh/TtzybgagptqVBo3BFEpP66+Ln6L8+vGM5HfBEwu0pLs2EFarzTQmSZAc1OM8+OZT
 fGcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=HFlnANS0
Subject: [Buildroot] [PATCH v2 7/9] package/opencl-headers: new package
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============2603276732580453734=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2603276732580453734==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

These headers provide the C language API bindings. It is a complement to
the C++ bindings already available in opencl-clhpp. This package is
required to build opencl-icd-loader:

https://github.com/KhronosGroup/OpenCL-ICD-Loader#dependencies

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/opencl-headers/Config.in           |  7 ++++
 package/opencl-headers/opencl-headers.hash |  3 ++
 package/opencl-headers/opencl-headers.mk   | 42 ++++++++++++++++++++++
 5 files changed, 54 insertions(+)
 create mode 100644 package/opencl-headers/Config.in
 create mode 100644 package/opencl-headers/opencl-headers.hash
 create mode 100644 package/opencl-headers/opencl-headers.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c9ac202de6..38f46b4ac3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2603,6 +2603,7 @@ N:	Sam Voss <sam.voss@gmail.com>
 F:	package/ripgrep/
 
 N:	Sebastian Weyer <sebastian.weyer@smile.fr>
+F:	package/opencl-headers
 F:	package/rust-bindgen
 
 N:	Sébastien Szymanski <sebastien.szymanski@armadeus.com>
diff --git a/package/Config.in b/package/Config.in
index f7b369b42a..fc73cd1727 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1638,6 +1638,7 @@ menu "Graphics"
 	source "package/libwpe/Config.in"
 	source "package/menu-cache/Config.in"
 	source "package/opencl-clhpp/Config.in"
+	source "package/opencl-headers/Config.in"
 	source "package/opencv3/Config.in"
 	source "package/opencv4/Config.in"
 	source "package/opencv4-contrib/Config.in"
diff --git a/package/opencl-headers/Config.in b/package/opencl-headers/Config.in
new file mode 100644
index 0000000000..092d8a2a4d
--- /dev/null
+++ b/package/opencl-headers/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_OPENCL_HEADERS
+	bool "opencl-headers"
+	depends on BR2_PACKAGE_HAS_LIBOPENCL
+	help
+	  C language headers for the OpenCL API
+
+	  https://github.com/KhronosGroup/OpenCL-Headers
diff --git a/package/opencl-headers/opencl-headers.hash b/package/opencl-headers/opencl-headers.hash
new file mode 100644
index 0000000000..f3d7ef8411
--- /dev/null
+++ b/package/opencl-headers/opencl-headers.hash
@@ -0,0 +1,3 @@
+#Locally generated
+sha256  0ce992f4167f958f68a37918dec6325be18f848dee29a4521c633aae3304915d  OpenCL-Headers-2023.04.17.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencl-headers/opencl-headers.mk b/package/opencl-headers/opencl-headers.mk
new file mode 100644
index 0000000000..1cad98a3d0
--- /dev/null
+++ b/package/opencl-headers/opencl-headers.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# opencl-headers
+#
+################################################################################
+
+OPENCL_HEADERS_VERSION = 2023.04.17
+OPENCL_HEADERS_SOURCE = OpenCL-Headers-$(OPENCL_HEADERS_VERSION).tar.gz
+OPENCL_HEADERS_SITE = $(call github,KhronosGroup,OpenCL-Headers,v$(OPENCL_HEADERS_VERSION))
+OPENCL_HEADERS_LICENSE = Apache-2.0
+OPENCL_HEADERS_LICENSE_FILES = LICENSE
+OPENCL_HEADERS_INSTALL_STAGING = YES
+
+OPENCL_HEADERS_INSTALL_TARGET = NO
+
+OPENCL_HEADERS_FILES = cl_d3d10.h \
+					   cl_d3d11.h \
+					   cl_dx9_media_sharing.h \
+					   cl_dx9_media_sharing_intel.h \
+					   cl_egl.h \
+					   cl_ext.h \
+					   cl_ext_intel.h \
+					   cl_gl_ext.h \
+					   cl_gl.h \
+					   cl.h \
+					   cl_half.h \
+					   cl_icd.h \
+					   cl_layer.h \
+					   cl_platform.h \
+					   cl_va_api_media_sharing_intel.h \
+					   cl_version.h \
+					   opencl.h
+
+
+define OPENCL_HEADERS_INSTALL_STAGING_CMDS
+	$(foreach header,$(OPENCL_HEADERS_FILES), \
+		$(INSTALL) -D -m 0644 $(@D)/CL/$(header) \
+			$(STAGING_DIR)/usr/include/CL/$(header)
+	)
+endef
+
+$(eval $(generic-package))
-- 
2.34.1


--===============2603276732580453734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2603276732580453734==--
