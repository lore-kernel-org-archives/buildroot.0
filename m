Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B00ACDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 13:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75BB240875;
	Fri, 13 Oct 2023 13:56:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75BB240875
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1oIgGUU3pE1j; Fri, 13 Oct 2023 13:56:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6518441FE0;
	Fri, 13 Oct 2023 13:56:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6518441FE0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63F0F1BF995
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 13:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B47A40412
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 13:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B47A40412
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6MWs8vh1w9sC for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 13:56:12 +0000 (UTC)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF06440201
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 13:56:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF06440201
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9b95622c620so375755866b.0
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 06:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697205369; x=1697810169;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qGPOkIkp4BDq6rye83eGvqleu69WYpANtfrKqeuqOfo=;
 b=VkaZ2Q0gnGiBsNKt5TY11lodps6LZj6n3Tb34hZy5eWlmE5WUzBY9qG7QwxBB4IySd
 79TKyffLCId2RdHKU5+2xP8wbI5I1Z5QMMTNIvXGJfzSveugHq6nH4E1qflfecSQ9kpM
 QxqdgToqq7tZTz6lYalMFWfE6SkaS9RQ5XG2nVDBPBG1zoXiEnkBxAnuBYNWdjIOoV1r
 jwSV4hlfh1zieLQmNKb2pDPGJRkZFTYEMecnTR1UGqOYGHzsN87Ux9RzdmZ2HoZZyGzG
 r0SQvTmtopl7g4KNRGAMP4FKPzXdOnevY+rz0jw8b6M69hzekX4FxdAE5nZsYeU49KGN
 FOtg==
X-Gm-Message-State: AOJu0YweYsSeqW3t6seCXmeqSjp/W7g7sWjtaqGYdnvlN79d1hTVEw+k
 7Vg1QvlogYsulvXrOshx2mIOHZcbe3tF0PeIvJnKmQ==
X-Google-Smtp-Source: AGHT+IESrf3gxCiTw0bzc/yGv0AnPENuOgylsaJM9KmEEaJJvUxae76Z/MUDY2nmfJ/jBUFKPC5nhg==
X-Received: by 2002:a17:906:1d4:b0:9bd:7f40:caa5 with SMTP id
 20-20020a17090601d400b009bd7f40caa5mr6233173ejj.77.1697205369565; 
 Fri, 13 Oct 2023 06:56:09 -0700 (PDT)
Received: from fedora.amarulasolutions.com
 ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 e27-20020a170906045b00b009b655c43710sm12406706eja.24.2023.10.13.06.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 06:56:09 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 15:56:05 +0200
Message-ID: <20231013135606.3382121-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697205369; x=1697810169;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qGPOkIkp4BDq6rye83eGvqleu69WYpANtfrKqeuqOfo=;
 b=B+xd5qpory4WfjWCYXJFnvYYwsjYviiW2FqcZeRIvupk3l+ABO6uOvvLjMMnipyMd6
 LBMhRK1f8OFRteDGPst/Is2A0SgGZJdMGiExk7lAtI1E6B/hgq4j7kq7Y5TYSl9hpIff
 HDK6zT3ApT3n/AZH7QmbZwBe2s3cglXd+VAsc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=B+xd5qpo
Subject: [Buildroot] [PATCH 1/2] package/qt6/qt6base: Add GUI support option
 for the host
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is needed for the qsb binary.from host-qt6shadertools which
allows building qml applications.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/Config.in.host             |  1 +
 package/qt6/qt6base/Config.in.host | 17 +++++++++++++++++
 package/qt6/qt6base/qt6base.mk     | 15 ++++++++++++++-
 3 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 package/qt6/qt6base/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index c80842c33a..15d42a7694 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -93,6 +93,7 @@ menu "Host utilities"
 	source "package/python3/Config.in.host"
 	source "package/qemu/Config.in.host"
 	source "package/qoriq-rcw/Config.in.host"
+	source "package/qt6/qt6base/Config.in.host"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
 	source "package/riscv-isa-sim/Config.in.host"
diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
new file mode 100644
index 0000000000..1305a3341c
--- /dev/null
+++ b/package/qt6/qt6base/Config.in.host
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_HOST_QT6BASE
+	bool "host QT6Base"
+	depends on BR2_HOST_GCC_AT_LEAST_8
+	help
+	  This option enables the host Qt6 framework. 
+
+	  http://qt.io
+
+if BR2_PACKAGE_HOST_QT6BASE
+
+config BR2_PACKAGE_HOST_QT6BASE_GUI
+  bool "GUI support"
+  help
+    Enable GUI support. Needed for the qsb package from
+    the host-qt6shadertools packages
+
+endif
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index c32089f551..0b512ad6cb 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -82,7 +82,6 @@ HOST_QT6BASE_DEPENDENCIES = \
 	host-pcre2 \
 	host-zlib
 HOST_QT6BASE_CONF_OPTS = \
-	-DFEATURE_gui=OFF \
 	-DFEATURE_concurrent=OFF \
 	-DFEATURE_xml=ON \
 	-DFEATURE_sql=OFF \
@@ -96,6 +95,20 @@ HOST_QT6BASE_CONF_OPTS = \
 	-DFEATURE_system_pcre2=ON \
 	-DFEATURE_system_zlib=ON
 
+# This is needed to build the qsb binary.from host-qt6shadertools
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_GUI),y)
+HOST_QT6BASE_CONF_OPTS += \
+	-DFEATURE_gui=ON \
+	-DFEATURE_vulkan=OFF \
+	-DINPUT_opengl=no \
+	-DFEATURE_linuxfb=ON \
+	-DFEATURE_eglfs=OFF \
+	-DFEATURE_opengl=OFF \
+	-DINPUT_opengl=no
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
+endif
+
 # Conditional blocks below are ordered by alphabetic ordering of the
 # BR2_PACKAGE_* option.
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
