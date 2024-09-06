Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70156CE7B10
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 13:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC56180C9B;
	Fri,  6 Sep 2024 13:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mP29t9OPXEmW; Fri,  6 Sep 2024 13:39:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2DAB80D58
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2DAB80D58;
	Fri,  6 Sep 2024 13:39:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 44D321BF341
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 13:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EAEE40C13
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 13:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YOEhbeNYUVAY for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 13:39:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B0B5C40C0F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0B5C40C0F
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0B5C40C0F
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 13:39:37 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-53567b4c3f4so1969851e87.2
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 06:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725629975; x=1726234775;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3IhwyGNCCAt5+pK2VorG59gbcINYmqfTLHD4AvBRntI=;
 b=hshovfQEhjc9mYDB/lUXEt6+/axDobNLp8JlSRwgfV1FsH41eL35r9Za2drYFP3Jph
 huUmonEACgW4nVgLH5XLucVWLKiy0CuDzvjrEY1gVv8pL3IVlO1hskez9miktWMlJnVk
 CBKQHobImK7rbIqXJqDssnJzZD9nYB1WG7X5d/8xGXYn/zGbLnEl3CEWUE0voxhApkkb
 4TJBAuljefsVaZg0Wr9CFf6xcIrwr8m4RtYWUxSVgWUAGUtLmHUe5mOZAkdgtTX8RqX0
 m8ptd3tpaUvnikqMM+wkY2DFZDeoOIRO12ch0CgNQLTnMxMnBveuqXqDlFyCuNXmx5EB
 OHBg==
X-Gm-Message-State: AOJu0Yw6n+4YP/cm/r8qaOX2srrnk0r1RX5XRVJtEjgx+5hTJ9QCSyZF
 +UnmNFsA58MLlXDEUANEVtB5fLOHcEZ+EWdv3jrjFLUvkJh9tBGTUKVvPw==
X-Google-Smtp-Source: AGHT+IEUTDt0tdlEFIU3f+8KIZQbH8LFCfYgF4H44IXJCho3/4rRjAJXYHeTkhfy3MR3/AkCvhzIKA==
X-Received: by 2002:a05:6512:3d1b:b0:52e:999b:7c01 with SMTP id
 2adb3069b0e04-536587fcf4dmr1823166e87.48.1725629974408; 
 Fri, 06 Sep 2024 06:39:34 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535407ac33esm2943266e87.102.2024.09.06.06.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 06:39:33 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 15:39:29 +0200
Message-ID: <20240906133931.2095292-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725629975; x=1726234775; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3IhwyGNCCAt5+pK2VorG59gbcINYmqfTLHD4AvBRntI=;
 b=TI+Y6lMI4RLrYLeiZpQXyPGuEPLaER4tMorpAJv9BwuNEg0Uaz/wykfd68biKdnG0j
 K946W50bqRueYirkm4h3fh1YnxYTx67UKNJMjsPkFz1spOEawtgEVyE/O+kQq1Gb34gg
 MaAFg3uAb5bXNo709arwuUzqwGsFSctgqSvsZ1WJtyxZRCvKyY3vNR1pOBHA6UmKbhpD
 otxpzeFaaqvjFfFg3RcGH7rXKGylzfjOPhvzdaTzMgM1xfIzKVOrs4kncUL8HlH/5ZXm
 FYjDr/PCxg+093NYpzLdK+Xu84J61LKZTZF/lSymp5IrB9+vmwATJjk0kef4kD4kiI9t
 sQjA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TI+Y6lMI
Subject: [Buildroot] [PATCH 1/1] package/dlib: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/Config.in      |  1 +
 package/dlib/Config.in | 13 +++++++
 package/dlib/dlib.hash | 12 ++++++
 package/dlib/dlib.mk   | 88 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 114 insertions(+)
 create mode 100644 package/dlib/Config.in
 create mode 100644 package/dlib/dlib.hash
 create mode 100644 package/dlib/dlib.mk

diff --git a/package/Config.in b/package/Config.in
index f33c4780f8..2893849961 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2150,6 +2150,7 @@ menu "Other"
 	source "package/ding-libs/Config.in"
 	source "package/dotconf/Config.in"
 	source "package/double-conversion/Config.in"
+	source "package/dlib/Config.in"
 	source "package/eigen/Config.in"
 	source "package/elfutils/Config.in"
 	source "package/ell/Config.in"
diff --git a/package/dlib/Config.in b/package/dlib/Config.in
new file mode 100644
index 0000000000..3d43bdb41b
--- /dev/null
+++ b/package/dlib/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_DLIB
+	bool "dlib"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Dlib is a modern C++ toolkit containing machine learning
+	  algorithms and tools for creating complex software in C++ to
+	  solve real world problems.
+
+	  http://dlib.net
+
+comment "dlib needs C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dlib/dlib.hash b/package/dlib/dlib.hash
new file mode 100644
index 0000000000..3bb5a540d0
--- /dev/null
+++ b/package/dlib/dlib.hash
@@ -0,0 +1,12 @@
+sha256  22513c353ec9c153300c394050c96ca9d088e02966ac0f639e989e50318c82d6  dlib-19.24.6.tar.gz
+
+# Hashes for license files:
+sha256  50c1c5978d490c7f13062d91c4b89affc83774f87bc4568a714f748b62a5b216  dlib/external/libjpeg/README
+sha256  debfae299fa4118b0a586af4cf7ac8d38aae81ac4e9995c935862aaee6eb0362  dlib/external/libpng/LICENSE
+sha256  83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  dlib/external/pybind11/LICENSE
+sha256  8d8291caf1cee26d23acf3eb67c9f9a2d58f1c681b16a4fbe8cbfb9e3c0b5a9b  dlib/LICENSE.txt
+sha256  908b0b565ae9bf61b7b41447cb0b83564f320375723bcc884ec30e5537a0d5dc  dlib/test/ffmpeg_data/LICENSE.TXT
+sha256  78515536a4b0d896745b6483fccc561987e8e2f2d014dc81d7c2e97c497a0a69  examples/LICENSE_FOR_EXAMPLE_PROGRAMS.txt
+sha256  a0e7b40719ba74630debe9fae1cb847ee436215451123254a690171d09fb036e  examples/video_frames/license.txt
+sha256  8d8291caf1cee26d23acf3eb67c9f9a2d58f1c681b16a4fbe8cbfb9e3c0b5a9b  LICENSE.txt
+sha256  8acb12b218fdb5e071f25eda9ac990d04888388b65095867d9007c278a9f993b  python_examples/LICENSE_FOR_EXAMPLE_PROGRAMS.txt
diff --git a/package/dlib/dlib.mk b/package/dlib/dlib.mk
new file mode 100644
index 0000000000..cc21bdae1c
--- /dev/null
+++ b/package/dlib/dlib.mk
@@ -0,0 +1,88 @@
+################################################################################
+#
+# dlib
+#
+################################################################################
+
+DLIB_VERSION = 19.24.6
+DLIB_SITE = $(call github,davisking,dlib,v$(DLIB_VERSION))
+DLIB_INSTALL_STAGING = NO
+DLIB_CMAKE_BACKEND = ninja
+DLIB_SUPPORTS_IN_SOURCE_BUILD = NO
+
+DLIB_LICENSE = \
+	BSD-3-Clause (kissfft, pybind11) \
+	BSL-1.0 (dlib, tools) \
+	CC0-1.0 (examples) \
+	libpng-2.0 (libpng) \
+	MIT OR CC0-1.0 (JoinPaths.cmake)
+
+DLIB_LICENSE_FILES = \
+	dlib/external/libjpeg/README \
+	dlib/external/libpng/LICENSE \
+	dlib/external/pybind11/LICENSE \
+	dlib/LICENSE.txt \
+	dlib/test/ffmpeg_data/LICENSE.TXT \
+	examples/LICENSE_FOR_EXAMPLE_PROGRAMS.txt \
+	examples/video_frames/license.txt \
+	LICENSE.txt \
+	python_examples/LICENSE_FOR_EXAMPLE_PROGRAMS.txt
+
+DLIB_CONF_OPTS = \
+	-DDLIB_USE_CUDA=OFF \
+	-DLIB_USE_MKL_FFT=OFF
+
+# ffmpeg is optional
+ifeq ($(BR2_PACKAGE_FFMPEG),y)
+DLIB_DEPENDENCIES += ffmpeg
+endif
+
+# gif support is optional
+ifeq ($(BR2_PACKAGE_GIFLIB),y)
+DLIB_DEPENDENCIES += giflib
+endif
+
+# jpeg support is optional
+ifeq ($(BR2_PACKAGE_HAS_JPEG),y)
+
+ifeq ($(BR2_PACKAGE_JPEG_TURBO),y)
+DLIB_DEPENDENCIES += jpeg-turbo
+endif
+
+ifeq ($(BR2_PACKAGE_LIBJPEG),y)
+DLIB_DEPENDENCIES += libjpeg
+endif
+
+endif
+
+# lapack is optional
+ifeq ($(BR2_PACKAGE_LAPACK),y)
+DLIB_DEPENDENCIES += lapack
+endif
+
+# jxl support is optional
+ifeq ($(BR2_PACKAGE_LIBJXL),y)
+DLIB_DEPENDENCIES += libjxl
+endif
+
+# png support is optional
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+DLIB_DEPENDENCIES += libpng
+endif
+
+# openblas is optional
+ifeq ($(BR2_PACKAGE_OPENBLAS),y)
+DLIB_DEPENDENCIES += openblas
+endif
+
+# webp support is optional
+ifeq ($(BR2_PACKAGE_WEBP),y)
+DLIB_DEPENDENCIES += webp
+endif
+
+# libX11 is optional (required for GUI support)
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+DLIB_DEPENDENCIES += xlib_libX11
+endif
+
+$(eval $(cmake-package))
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
